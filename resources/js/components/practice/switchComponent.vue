<template>
    <div class="switch-component-wrapper" @click="changeSwitchValue">
        <div class="switch-wrapper" :class="{ 'on': value, 'off': !value }">
            <div class="circle"></div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'switchComponent',
    props:['switchValue','value'],
    methods:{
        changeSwitchValue(){
            //this.$emit('triggerChangeSwitchValue');
            this.$emit('input',!this.value);
        }
    }
}
</script>
<style>
.switch-component-wrapper {
    display: flex;
    margin-top: 50px;
    margin-left: 100px;
}

.switch-wrapper {
    width: 44px;
    min-height: 22px;
    display: flex;
    cursor: pointer;
    border-radius: 22px;
    align-items: center;
    padding: 2px;
    transition: all 0.5s;
}

.on {
    background: green;
    justify-content: flex-start ;
}

.off {
    background: gray;
    justify-content: flex-end;
}

.circle {
    width: 18px;
    height: 18px;
    border-radius: 18px;
    background: #fff;
}

</style>
