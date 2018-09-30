import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';
import TestBed from './views/TestBed.vue';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home,
        },
        {
            path: '/default',
            name: 'default',
            component: Home,
        },
        {
            path: '/testbed',
            name: 'testbed',
            component: TestBed
        },
    ],
});
