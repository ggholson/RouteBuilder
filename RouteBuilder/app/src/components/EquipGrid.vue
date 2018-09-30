<template>
    <div class="container-fluid grid-container">
        <div class="row header-row">
            <div class="header-col"></div>
            <div class="col-11">
                <div class="row inner-row">
                    <div class="label-col"></div>
                    <div v-for="header in getHeaders()" class="char-col">{{header}}</div>
                </div>
            </div>
        </div>
        <div class="segment-container">
            <game-segment v-for="segment in this.game_state.segments" :key="segment.id" :segment="segment" />
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Prop, Vue } from 'vue-property-decorator';
    import { State, Action, Getter } from 'vuex-class';
    import { Character, GameState } from '../store/types'
    import { GetStringValues } from "../helpers";
    import GameSegment from './nodes/GameSegment.vue';

    @Component({
        components: { GameSegment }
    })
    export default class EquipGrid extends Vue {
        @State('game_state') game_state : GameState;

        getHeaders() : string[] {
            return GetStringValues(Character);
        }
    }
</script>

<style scoped lang="scss">
    .inner-row {
        width: 100%;
    }
</style>