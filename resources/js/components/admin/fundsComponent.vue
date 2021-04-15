<template>
    <div class="container-fluid">
        <div class="row justify-content-around">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">{{ pageTitle }}</h3>
                        <div class="card-tools" style="position: absolute;right: 1rem;top: .5rem;">
                            <button type="button" class="btn btn-info" @click="create">
                                Add New
                                <i class="fas fa-plus"></i>
                            </button>
                            <button type="button" class="btn btn-primary" @click="reload">
                                Reload
                                <i class="fas fa-sync"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <strong>Search By : </strong>
                                        </div>
                                        <div class="col-md-9">
                                            <select v-model="queryFiled" class="form-control" id="fileds">
                                                <option value="title">Fund Title </option>
                                                <option value="details">Details</option>
                                                <option value="status">Active / Deactive</option>
                                                <option value="locked">Locked / Un Locked</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <input v-model="query" type="text" class="form-control" placeholder="Search">
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>#sl</th>
                                    <th>Title</th>
                                    <th>Fund Details</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Locked</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr
                                    v-show="dataRows.length"
                                    v-for="(singleRow, index) in dataRows"
                                    :key="singleRow.id"
                                >
                                    <th scope="row">{{ index + 1 }}</th>
                                    <td >{{ singleRow.name }}<br>id:{{ singleRow.id }}</td>
                                    <td style="max-width:400px">{{ singleRow.details }}</td>
                                    <td style="max-width:100px;font-size: 10px">{{ singleRow.time }}</td>
                                    <td class='text-success' :class="{ 'text-danger':singleRow.publication_status == 0 }" >{{ singleRow.publication_status==0?'Inactive':'Active' }}</td>
                                    <td class='text-success' :class="{ 'text-danger':singleRow.locke_status == 0 }" >{{ singleRow.locke_status==0?'Not locked':'Locked'  }}</td>
                                    <td class="text-center" style="min-width:150px">
                                        <button type="button" class="btn btn-info btn-sm m-1" @click="show(singleRow)" title="View">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary btn-sm m-1"
                                                @click="edit(singleRow)" title='Edit'>
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-danger btn-sm"
                                            @click="destroy(singleRow)"
                                            title="Delete"
                                        >
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr v-show="!dataRows.length">
                                    <td colspan="8">
                                        <div class="alert alert-danger" role="alert">Sorry!! No data found.</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="card-footer">
                        <pagination
                            v-if="pagination.last_page > 1"
                            :pagination="pagination"
                            :offset="10"
                            @paginate="query === '' ? getData() : searchData()"
                        ></pagination>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div
            class="modal fade"
            id="addEditFormModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="customerModalLongTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5
                            class="modal-title"
                            id="customerModalLongTitle"
                        >{{ editMode ? "Edit" : "Add New" }} {{ formTitle }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editMode ? update() : store()" @keydown="form.onKeydown($event)">
                        <div class="modal-body">
                            <alert-error :form="form"></alert-error>
                            <div class="form-group">
                                <label>{{ nameFieldTitle}}</label>
                                <input
                                    v-model="form.name"
                                    type="text"
                                    name="name"
                                    class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('name') }"
                                >
                                <has-error :form="form" field="name"></has-error>
                            </div>
                            <div class="form-group">
                                <label>{{ detailsFieldTitle}}</label>
                                <textarea
                                    cols="5"
                                    rows="5"
                                    v-model="form.details"
                                    type="text"
                                    name="details"
                                    class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('details') }"
                                ></textarea>
                                <has-error :form="form" field="details"></has-error>
                            </div>
                            <div class="form-group">
                                <div class="form-check-inline">
                                    <label class="form-check-label">Active <input type="checkbox" class="form-check-input"  v-model="form.publication_status"  ></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-check-inline">
                                    <label class="form-check-label">Lock <input type="checkbox" class="form-check-input"  v-model="form.locke_status"  ></label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button :disabled="form.busy" type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div
            class="modal fade"
            id="showModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="showModalLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="showModalLabel">{{ showPageTitle }}</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <strong>Fund Name : {{ form.name }}</strong>
                        <br>
                        <strong>Fund Details : {{ form.details }}</strong>
                        <br>
                        <strong>Status : {{ form.publication_status==0?' Inactive':' Active'  }}</strong>
                        <br>
                        <strong>Locked : {{ form.locke_status==0?' No':' Yes'  }}</strong>
                        <br>
                        <strong>Created At : {{ form.time }}</strong>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <vue-progress-bar></vue-progress-bar>
        <vue-snotify></vue-snotify>
    </div>
</template>

<script>
export default {
    name: "fundsComponent",
    created() {
    },
    mounted() {
        this.getData();
    },
    data() {
        return {
            snotifyDeleteSuccessMsg: "Data Successfully Deleted",
            snotifyUpdateSuccessMsg: "Data Successfully Updated",
            snotifyStoreSuccessMsg: "Data Successfully Saved",
            snotifySuccessTitle: "Success",
            showPageTitle: "Fund Details",
            getDataUrl: "/api/fund_list?page=",
            addFormUlr: "api/fund_list",
            updateFormUlr: "api/fund_update/",
            deleteFormUlr: "api/fund_delete/",
            searchUrl: "api/fund_search/",
            pageTitle: 'Fund List',
            formTitle: 'Fund',
            nameFieldTitle: 'Fund Title',
            detailsFieldTitle: 'Fund Details',
            editMode: false,
            dataRows: [],
            query: "",
            queryFiled: "title",
            reloadeDefaultQueryField: "title",
            pagination: {
                current_page: 1,
            },
            form: new Form({
                id: "",
                name: "General Fund",
                details: "Fund details ",
                publication_status: 1,
                locke_status: 0,
                time:'',
            }),
        }
    },
    watch: {
        query: function (newQ, old) {
            this.pagination.current_page = 1
            if (newQ === "") {
                this.getData();
            } else {
                this.searchData();
            }
        }
    },
    computed: {},
    methods: {
        show(d) {
            this.form.reset();
            this.form.fill(d);
            $("#showModal").modal("show");
            console.log(d);
        },
        destroy(d) {
            this.$snotify.clear();
            this.$snotify.confirm(
                "You will not be able to recover this data!",
                "Are you sure?",
                {
                    showProgressBar: false,
                    closeOnClick: false,
                    pauseOnHover: true,
                    buttons: [
                        {
                            text: "Yes",
                            action: toast => {
                                this.$snotify.remove(toast.id);
                                this.$Progress.start();
                                axios.get(this.deleteFormUlr+d.id)
                                    .then(response => {
                                        this.$Progress.finish();
                                        this.$snotify.success(
                                            this.snotifyDeleteSuccessMsg,
                                            "Success"
                                        );
                                        this.getData();
                                    }).catch(e => {
                                    this.$Progress.fail();
                                    console.log(e);
                                });
                            },
                            bold: true
                        },
                        {
                            text: "No",
                            action: toast => {
                                this.$snotify.remove(toast.id);
                            },
                            bold: true
                        }
                    ]
                }
            );
        },
        edit(d) {
            this.editMode = true;
            this.form.reset();
            this.form.clear();
            this.form.fill(d);
            $("#addEditFormModal").modal("show");
        },
        update() {
            this.$Progress.start();
            this.form.busy = true;
            this.form
                .post(this.updateFormUlr + this.form.id)
                .then(response => {
                    console.log(response);
                    this.getData();
                    $("#addEditFormModal").modal("hide");
                    if (this.form.successful) {
                        this.$Progress.finish();
                        this.$snotify.success(this.snotifyUpdateSuccessMsg, this.snotifySuccessTitle);
                    } else {
                        this.$Progress.fail();
                        this.$snotify.error(
                            "Something went wrong try again later.",
                            "Error"
                        );
                    }
                })
                .catch(e => {
                    this.$Progress.fail();
                    console.log(e);
                });
        },
        store() {
            this.$Progress.start();
            this.form.busy = true;
            this.form.post(this.addFormUlr)
                .then(response => {
                    //console.log(response);
                    this.getData();
                    $("#addEditFormModal").modal("hide");
                    if (this.form.successful) {
                        this.$Progress.finish();
                        this.$snotify.success(this.snotifyStoreSuccessMsg, this.snotifySuccessTitle);
                    } else {
                        this.$Progress.fail();
                        this.$snotify.error(
                            "Something went wrong try again later.",
                            "Error"
                        );
                    }
                })
                .catch(e => {
                    this.$Progress.fail();
                    console.log(e);
                });
        },
        create() {
            this.editMode = false;
            this.form.reset();
            this.form.clear();
            $("#addEditFormModal").modal("show");
        },
        reload() {
            this.pagination.current_page = 1
            this.getData();
            this.query = "";
            this.queryFiled = this.reloadeDefaultQueryField;
            this.$snotify.success("Data Successfully Refresh", "Success");
        },
        getData() {
            //console.log(this.queryFiled);
            //console.log(this.query);
            this.$Progress.start();
            axios.get(this.getDataUrl + this.pagination.current_page)
                .then((res) => {
                    //console.log(res);
                    this.dataRows = res.data.data
                    this.pagination = res.data.meta;
                    this.$Progress.finish();
                }).catch((e) => {
                this.$Progress.fail();
                console.log(e)
            })
        },
        searchData() {
            this.$Progress.start();
            axios.get(this.searchUrl + this.queryFiled + "/" + this.query + "?page=" + this.pagination.current_page)
                .then(res => {
                    //console.log(res.data.data);
                    this.dataRows = res.data.data
                    this.pagination = res.data.meta;
                    this.$Progress.finish();
                })
                .catch(e => {
                    console.log(e);
                    this.$Progress.fail();
                });
        },
    },
}
</script>

<style scoped>

</style>
