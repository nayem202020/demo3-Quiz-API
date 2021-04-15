<template>
    <div class="container-fluid">
        <div class="row justify-content-around">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">{{ pageTitle }}</h3>
                        <div class="card-tools" style="position: absolute;right: 1rem;top: .5rem;">
                            <router-link to="/add_quize">
                                <button type="button" class="btn btn-info">
                                    Add New
                                    <i class="fas fa-plus"></i>
                                </button>
                            </router-link>
                            <a href='http://demo3.10takarfoundation.org/api/list_quiz' target="_blank">
                            <button type="button" class="btn btn-primary">
                                Quiz List Api
                                <i class="fas fa-share-alt"></i>
                            </button>
                            </a>
                            <button type="button" class="btn btn-primary" @click="reload">
                                Reload
                                <i class="fas fa-sync"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>#sl</th>
                                    <th>Quiz Title</th>
                                    <th>Time</th>
                                    <th>Total Mark</th>
                                    <th>API</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-show="dataRows.length"
                                    v-for="(singleRow,index,key) in dataRows"
                                    :key=index+1>
                                    <th scope="row">{{ index+1 }}</th>
                                    <td>{{ singleRow.title }}</td>
                                    <td>{{ singleRow.time }}</td>
                                    <td>{{ singleRow.total_mark }}</td>
                                    <td><a :href="'http://demo3.10takarfoundation.org/api/single_quiz/'+singleRow.id" target="_blank">http://demo3.10takarfoundation.org/api/single_quiz/{{singleRow.id}}</a></td>
                                    <td class="text-center" style="min-width:150px">
                                        <button
                                            type="button"
                                            class="btn btn-danger btn-sm"
                                            @click="destroy(singleRow)"
                                            title="Delete">
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
                </div>
            </div>
        </div>
        <vue-progress-bar></vue-progress-bar>
        <vue-snotify></vue-snotify>
    </div>
</template>

<script>
export default {
    name: "quizesComponent",
    created() {
    },
    mounted() {
        this.getData();
    },
    data() {
        return {
            snotifyDeleteSuccessMsg: "Bank Successfully Deleted",
            snotifyTitle: "Success",
            getDataUrl: "/api/list_quiz",
            pageTitle: 'Quiz List',
            dataRows: [],
        }
    },
    watch: {},
    computed: {},
    methods: {
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
        reload() {
            this.getData();
            this.$snotify.success("Data Successfully Refresh", "Success");
        },
        getData() {
            //console.log(this.queryFiled);
            //console.log(this.query);
            this.$Progress.start();
            axios.get(this.getDataUrl)
                .then((res) => {
                    console.log(res.data);
                    this.dataRows = res.data
                    this.$Progress.finish();
                }).catch((e) => {
                this.$Progress.fail();
                console.log(e)
            })
        },

    },
}
</script>

<style scoped>
tr>th{
    text-align: center;
}

</style>
