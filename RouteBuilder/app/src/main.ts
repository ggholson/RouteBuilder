import Vue from 'vue';
import App from './App.vue';
import store from './store'
import router from './router';
import BootstrapVue from 'bootstrap-vue';

Vue.config.productionTip = false;
Vue.use(BootstrapVue);

new Vue({
  router: router,
    store: store,
  render: (h) => h(App),
}).$mount('#app');
