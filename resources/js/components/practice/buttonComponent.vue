<template>
    <button
        class="button-wrapper"
        :class="{'disable-button': disabled,'loading-button': loading}"
        @click="handleClick"
    >
        <img v-if="loading" class="loading-image" src="img_practice/1.gif" alt="">
        <template v-if="!loading">
            {{ text }}
        </template>
    </button>
</template>

<script>
export default {
    name: "buttonComponent",
    props: ['text', 'loading', 'disabled'],
    data() {
        return {
            validated: false
        }
    },
    methods: {
        handleClick() {
            this.$emit('click')
        },
    }
}
</script>

<style scoped>


.button-wrapper {
    padding: 9px 16px;
    background: blue;
    color: white;
    border: 1px solid green;
    border-radius: 5px;
    min-width: 111px;
    display: inline-block;
    margin: 5px 0;
    cursor: pointer;
}

.loading-image {
    display: inline;
    width: 80px;
    height: 20px;
}

.disable-button {
    opacity: 0.5;
    cursor: not-allowed;
}

.loading-button {
    cursor: wait;
    background: #b53535;
}

</style>
