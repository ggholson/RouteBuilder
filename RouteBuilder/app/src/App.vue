<template>
    <div id="app">
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <a class="navbar-brand logo" href="#"><img src="./assets/FF9_Logo_full.png"/></a>
            <div class="navbar-nav navbar-right my-2">
                <router-link class="nav-item nav-link" to="/">Home</router-link>
                <router-link class="nav-item nav-link" to="/testbed">TestBed</router-link>
            </div>
        </nav>
        <router-view class="below-nav" />
    </div>
</template>

<style lang="scss">
    @import '../node_modules/bootstrap/scss/bootstrap.scss';
    @import 'css/app.scss';

    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }
    .logo img {
        height: 40px;
    }
    .below-nav {
        margin-top: 80px;
    }
</style>
