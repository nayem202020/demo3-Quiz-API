<template>
    <div>
        <h2>Please Select The option</h2>
        <switch-component :switch-value="switchValue" @triggerChangeSwitchValue="switchValue=!switchValue">
        </switch-component>
        <p>value:  {{ switchValue }}</p>
        <switch-component v-model="switchValue" />

    </div>
</template>

<script>
import switchComponent from "./switchComponent";
export default {
    name: "multiSelectComponent",
    components: {switchComponent},
    data() {
        return {
           switchValue: true,
        }
    },
    methods:{}
}
</script>

<style scoped>
</style>
