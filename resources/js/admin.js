require('./bootstrap');
require('admin-lte');
window.Vue = require('vue');

Vue.component('admin', require('./components/layouts/admin.vue').default);
Vue.component('pagination', require('./components/partial/PaginationComponent').default);


// **vue-router**//
import VueRouter from 'vue-router'
Vue.use(VueRouter)
import {projectRoutes} from './routes'
const router = new VueRouter({
    routes: projectRoutes,
    mode: 'history'
})

//**snotify**//

import Snotify, { SnotifyPosition } from 'vue-snotify'
const snotifyOptions = {
    toast: {
        position: SnotifyPosition.rightTop
    }
}
Vue.use(Snotify, snotifyOptions)


//**v-form**//
import {Form, HasError, AlertError} from 'vform'
window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

//**progress bar**//
import VueProgressBar from 'vue-progressbar'
const VueProgressBarOptions = {
    color: '#50d38a',
    failedColor: '#87111d',
    thickness: '5px',
    transition: {
        speed: '0.2s',
        opacity: '0.6s',
        termination: 300
    },
    autoRevert: true,
    location: 'top',
    inverse: false
};
Vue.use(VueProgressBar, VueProgressBarOptions);

const app = new Vue({
    el: '#app',
    router,
});
