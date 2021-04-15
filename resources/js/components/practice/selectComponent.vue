<template>
    <div>
        <select class="my-select_select"
                :class="{'invalid-input': errorMessage}"
                :value="value"
                @change="handleChange"
                ref="childRefs"
        >
            <option value="">{{ placeholder }}</option>
            <template v-if="optionsType==='string'">
                <option v-for="(option,i) in options" :key="i" :value="option">{{option}}</option>
            </template>
            <template v-else>
                <option v-for="(option,i) in options" :key="i" :value="option[valueProperty]">
                    {{option[displayProperty]}}
                </option>
            </template>

        </select>
        <br>
        <p class="error-message">{{ errorMessage }}</p>
    </div>
</template>

<script>
export default {
    name: "selectComponent",
    props: {
        options: {
            type: Array,
            default: () => []
        },
        placeholder: {
            type: String,
            default: 'Select One'
        },
        displayProperty: {
            type: String,
            default: 'title'
        },
        valueProperty: {
            type: String,
            default: 'shortcut'
        },
        value: {
            default: ''
        },
        required: {
            default: false
        },
    },
    data() {
        return {
            validated: false
        }
    },

    computed: {
        optionsType() {
            let ot = 'string';
            if (this.options.length > 0 && typeof this.options[0] !== 'string') {
                ot = 'object'
            }
            return ot;
        },
        errorMessage() {
            if (!this.validated) {
                return '';
            }
            if ((this.required || this.required === '') && !this.value) {
                return `This field is required`;
            }
            return '';
        }
    },
    mounted() {
    },
    methods: {
        handleChange(e) {
            console.log(e.target.value)
            this.startValidation()
            this.$emit('input', e.target.value)
            this.$emit('triggerInputValidation')

        },
        validation() {
            this.startValidation()
            if (this.errorMessage === '') {
                return false
            }
            this.focus();
            return true;
        },
        startValidation() {
            this.validated = true
        },
        focus() {
            this.$refs.childRefs.focus();
        }
    },
}
</script>

<style scoped>
.my-select_select {
    background: #fff;
    padding: 6px 12px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #fff;
    border-radius: 4px;
    box-sizing: border-box;
}

.my-select_select:focus {
    outline: none;
}

.my-select_select--error {
    border: 1px solid red;
}

p.error-message {
    color: red;
    margin: 0;
    padding: 0;
}

.invalid-input {
    border: 1px solid red !important;
}
</style>
