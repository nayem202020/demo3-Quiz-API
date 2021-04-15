<template>
    <div>
        <h2>Please Select The option</h2>
        <multi-select-attribute
            :options="days"
            value-property="shortcut"
            display-property="title"
            v-model="selectedDays"
            width="350px"
        >
        </multi-select-attribute>
        <br>
        <hr class="" style="margin-top: 150px">
        <h3>Selected Days: <strong>{{ selectedDays }}</strong></h3>
        <h5>Days: {{ days }}</h5>
    </div>
</template>

<script>
import multiSelectAttribute from "./multiSelectComponent";

export default {
    name: "multiSelectComponent",
    components: {multiSelectAttribute},
    data() {
        return {
            days: [
                {title: 'Saturday', shortcut: 'sat'},
                {title: 'Sunday', shortcut: 'sun'},
                {title: 'Monday', shortcut: 'mon'},
                {title: 'Tuesday', shortcut: 'tue'},
                {title: 'Wednesday', shortcut: 'wed'},
                {title: 'Thusday', shortcut: 'thu'},
                {title: 'Friday', shortcut: 'fri'},

            ],
            selectedDays: [],
        }
    }
}
</script>

<style scoped>
</style>
