<template>
    <div>
        <h2>Please Input text</h2>
        <input-component
            v-model="userName"
            placeholder="Enter User Name"
            :min-length="textLength"
            ref="userName"
            @triggerInputValidation="triggerInputValidation"
            required='true'

        />
        <br>
        <input-component
            v-model="password"
            placeholder="Enter password"
            :min-length="passLength"
            ref="password"
            @triggerInputValidation="triggerInputValidation"
            required="true"
            type="password"
        />
        <br><br>

        <buttonComponent
            @click="handleSubmit"
            text="Submit"
            :loading="formSubmitting"
        />
        <br><br><br>
        <hr>
        <p v-if="formSubmitButton">user name: {{ userName }}</p>
        <p v-if="formSubmitButton">Password: {{ password }}</p>
    </div>
</template>

<script>
import inputComponent from "./inputComponent";
import buttonComponent from "./buttonComponent";

export default {
    name: "inputPage",
    components: {inputComponent,buttonComponent},
    data() {
        return {
            userName: 'Hasan',
            password: '',
            textLength: 4,
            passLength: 3,
            formSubmitButton: false,
            formSubmitting: false,
        }
    },
    methods: {
        handleSubmit() {
            this.formSubmitButton = false;
            if (this.userName === '' || this.userName.length < this.textLength) {
                this.$refs.userName.startValidation();
            }
            if (this.$refs.userName.errorMessage) {
                this.$refs.userName.focus();
                return;
            }
            if (this.password === '' || this.password.length < this.passLength) {
                this.$refs.password.startValidation();
            }
            if (this.$refs.password.errorMessage) {
                this.$refs.password.focus();
                return;
            }

            this.formSubmitting=true;
            setTimeout(()=>{
                this.formSubmitButton = true;
                this.formSubmitting=false;
            },3000)

        },
        triggerInputValidation() {
            if (this.userName.length < this.textLength || this.password.length < this.passLength) {
                this.formSubmitButton = false;
            }
        }
    }
}
</script>

<style scoped>
</style>
