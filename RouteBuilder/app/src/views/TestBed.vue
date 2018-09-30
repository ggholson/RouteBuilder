<template>
    <div>
        <equip-grid></equip-grid>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import EquipGrid from '@/components/EquipGrid.vue';
    import { GameState } from "../store/types";
    import { State } from "vuex-class";

    @Component({
        components: { EquipGrid },
    })
    export default class TestBed extends Vue {
        @State(state => state) game_state! : GameState;
    }
</script>

<style scoped>

</style>