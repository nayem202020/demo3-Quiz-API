<template>
    <div class="text-input-wrapper">
        <input
            :type="type||'text'"
            class="my-input"
            :class="{'invalid-input': errorMessage}"
            :placeholder="placeholder"
            :value="value"
            @input="handleChange($event.target.value)"
            ref="childRefs"
            :disabled="disabled"
        >
        <br>
        <p class="error-message">{{ errorMessage }}</p>
    </div>
</template>

<script>
export default {
    name: "inputComponent",
    props: ['value', 'placeholder', 'minLength','required','type','disabled'],
    data() {
        return {
            validated: false
        }
    },
    computed: {
        errorMessage() {
            if (!this.validated) {
                return '';
            }
            if (this.required && !this.value) {
                return `This field is required`;
            }
            if (this.minLength && this.value.length < this.minLength) {
                return `This field must be at least ${this.minLength} charecter long`;
            }
            return '';
        }
    },
    methods: {
        handleChange(ev) {
            this.startValidation();
            this.$emit('input', ev),
            this.$emit('triggerInputValidation')
        },
        startValidation(){
            this.validated = true
        },
        focus(){
            this.$refs.childRefs.focus();
        }
    }
}
</script>

<style scoped>
.text-input-wrapper {
    width: 333px;
}

.my-input {
    width: 100%;
    padding: 12px 20px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.my-input:focus {
    outline: none;
}

.invalid-input {
    border: 1px solid red !important;
}

p.error-message {
    color: red;
    margin: 0;
    padding: 0;
}
</style>
