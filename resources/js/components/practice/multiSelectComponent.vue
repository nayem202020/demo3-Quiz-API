<template>
    <div class="my-multiselect"
         @click="handleClick"
         @blur="focused=false"
         tabindex="-1"
         ref="parent"
         :style="{width: width}"
    >
        <template v-if="this.value.length<1 ">
            {{ placeholder }}
        </template>

        <div class="my-multiselect_selected"
             v-for="(option,i) in formattedOptions"
             :key="i"
             v-show="option.checked"
        >
            {{ option[displayProperty] }} <span class="my-multiselect_remove"
                                                @click="preventClose($event); handleOptionClick(i);"> &times; </span>
        </div>

        <div class="my-multiselect_options"
             v-show="focused"
             :style="{top: optionsTop}"
             @click="preventClose"
        >
            <div class="my-multiselect_option"
                 v-for="(option,i) in formattedOptions"
                 :key="i"
                 :class="{'my-multiselect_option--checked':option.checked}"
                 @click="handleOptionClick(i)"
            >
                <div class="my-multiselect_checkbox">
                </div>
                <div class="my-multiselect_text">
                    {{ option[displayProperty] }}
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "multiSelectComponent",
    data() {
        return {
            focused: false,
            optionsTop: "50px"
        }
    },

    computed: {
        formattedOptions() {
            let fo = this.options.map(option => {

                let check = this.value.some(v => v === option[this.valueProperty]);

                return {...option, checked: check};
            });
            return fo;
        }
    },
    mounted() {
        this.fixTop();
    },
    methods: {
        preventClose(e) {
            e.stopPropagation();
        },
        fixTop() {
            this.optionsTop = this.$refs.parent.clientHeight + 2 + "px";
        },
        handleClick() {
            this.focused = !this.focused;
        },
        handleOptionClick(i) {
            // console.log(this.options[i])
            let clickValue = this.options[i][this.valueProperty];
            let newValue = [...this.value];
            let existIndex = this.value.findIndex(v => v === clickValue);
            if (existIndex === -1) {
                newValue.push(clickValue);
            } else {
                newValue.splice(existIndex, 1)
            }
            this.$emit('input', newValue);
            setTimeout(this.fixTop, 100);
        }
    },
    props: {
        width: {
            type: String,
            default: "333px"
        },
        options: {
            type: Array,
            default: () => []
        },
        value: {
            default: () => []
        },
        placeholder: {
            type: String,
            default: "Click here to select"
        },
        displayProperty: {
            type: String,
            default: "name"
        },
        valueProperty: {
            type: String,
            default: "value"
        }
    }
}
</script>

<style scoped>
.my-multiselect {
    background: #fff;
    padding: 6px 12px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    min-height: 33px;
    min-width: 222px;
    max-width: 500px;
    position: relative;
    display: flex;
    flex-wrap: wrap;
}

.my-multiselect:focus {
    outline: deeppink;
}

.my-multiselect_placeholder {
    color: #929292;
}

.my-multiselect_selected {
    border: 1px solid #e0e0e0;
    padding: 4px 8px;
    padding-right: 0;
    margin: 3px 3px;
}

.my-multiselect_remove {
    cursor: pointer;
    padding-right: 7px;
}

.my-multiselect_remove:hover {
    color: red;
    font-weight: bold;
}

.my-multiselect_options {
    position: absolute;
    top: 34px;
    right: 0;
    left: 0;
    display: flex;
    background: #fff;
    flex-direction: column;
    box-shadow: 0 3px 3px 2px #e3e3e3;
    padding: 5px 0;
    min-height: 55px;
    max-height: 188px;
    overflow-y: auto;
}

.my-multiselect_option {
    padding: 6px 11px;
    cursor: pointer;
    display: flex;
    align-items: center;
}

.my-multiselect_option--checked {
    color: #1f7bb8;
    font-weight: bold;
}

.my-multiselect_checkbox {
    width: 22px;
    height: 22px;
    border: 1px solid #969696;
    margin-right: 7px;
    position: relative;
}

.my-multiselect_option--checked .my-multiselect_checkbox {
    border: 1px solid #1f7bb8;
    background: #1f7bb8;
}

.my-multiselect_option--checked .my-multiselect_checkbox:after {
    width: 11px;
    height: 6px;
    border-left: 2px solid #fff;
    border-bottom: 2px solid #fff;
    content: '';
    z-index: 999;
    position: absolute;
    transform: rotate(-45deg);
    left: 3px;
    top: 4px;
}
</style>
