<template>
    <div>
        <h2>Please Select The option</h2>
        <select-attribute
            :options="languages"
            v-model="selectedLanguage"
            placeholder="-- Select Language --"
            ref="languages"
            required="true"
            @triggerInputValidation="triggerInputValidation"
        >
        </select-attribute>
        <br>
        <hr class="" style="margin-top: 50px">
        <h5>Selected Language: <strong>{{ selectedLanguage }}</strong></h5>
        <hr>
        <h2>Please Select The option</h2>
        <select-attribute
            :options="days"
            v-model="selectedDay"
            placeholder="-- Select Day --"
            ref="days"
            @triggerInputValidation="triggerInputValidation"

        >
        </select-attribute>
        <br>
        <hr class="" style="margin-top: 50px">
        <h5>Selected Day: <strong>{{ selectedDay }}</strong></h5>

        <hr>
        <h2>Please Select The option</h2>
        <select-attribute
            :options="countrys"
            v-model="selectedCountry"
            placeholder="-- Select Country --"
            displayProperty="n"
            valueProperty="v"
            ref="country"
            @triggerInputValidation="triggerInputValidation"
            required

        >
        </select-attribute>
        <br>
        <hr class="" style="margin-top: 50px">
        <h5>Selected Country: <strong>{{ selectedCountry }}</strong></h5>
        <br>
        <buttonComponent
            @click="handleSubmit"
            text="Submit"
            :loading="formSubmitting"
        />
        <hr>
        <p v-if="formSubmitButton">Selected Day:: {{ selectedDay }}</p>
        <p v-if="formSubmitButton">Selected Day:: {{ selectedLanguage }}</p>
        <p v-if="formSubmitButton">Selected Day:: {{ selectedCountry }}</p>
    </div>
</template>

<script>
import SelectAttribute from "./selectComponent";
import buttonComponent from "./buttonComponent";

export default {
    name: "multiSelectComponent",
    components: {SelectAttribute,buttonComponent},
    data() {
        return {
            selectedLanguage:'',
            selectedCountry:'',
            selectedDay:'',
            formSubmitButton: false,
            formSubmitting: false,
            languages: ['Bangla','English','Arabic'],
            days: [
                {title: 'Saturday', shortcut: 'sat'},
                {title: 'Sunday', shortcut: 'sun'},
                {title: 'Monday', shortcut: 'mon'},
                {title: 'Tuesday', shortcut: 'tue'},
                {title: 'Wednesday', shortcut: 'wed'},
                {title: 'Thusday', shortcut: 'thu'},
                {title: 'Friday', shortcut: 'fri'},

            ],
            countrys: [
                {n: 'Bangladesh', v: 'ban'},
                {n: 'India', v: 'ind'},
                {n: 'Pakistan', v: 'pak'},
                {n: 'Arabia', v: 'ara'},

            ],

        }
    },
    methods: {
        handleSubmit() {
            this.formSubmitButton = false;
            if (this.$refs.country.validation()) {
                return;
            }
            if (this.$refs.languages.validation()) {
                return;
            }
            if (this.$refs.days.validation()) {
                return;
            }
            this.formSubmitting = true;
            setTimeout(() => {
                this.formSubmitButton = true;
                this.formSubmitting = false;
            }, 3000)
        },
        triggerInputValidation() {
            if (!this.selectedLanguage || !this.selectedDay|| !this.selectedCountry) {
                this.formSubmitButton = false;
            }
        }
    }
}
</script>

<style scoped>
</style>
