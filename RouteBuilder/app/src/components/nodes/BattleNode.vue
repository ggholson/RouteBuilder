<template>
    <div class="row inner-row battle-row">
        <div class="label-col">
            <span class="battle-label">Battle: </span>
            <span class="enemy-text">{{node.enemy}}</span>
        </div>
        <div class="char-col" v-for="character in getCharacters()">
            {{getApValue(character)}}
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Vue, Prop } from 'vue-property-decorator';
    import { Battle, Character } from "../../store/types";
    import { GetNumericValues } from "../../helpers";

    @Component
    export default class BattleNode extends Vue {
        @Prop() node! : Battle;
        @Prop() chars! : Character[];

        public getCharacters() : Number[] {
            const values =  GetNumericValues(Character)
            return Object.values(values);
        }

        public getApValue(char : Character) : string {
            if (this.chars.indexOf(char) >= 0){
                if (this.node.dead && this.node.dead.indexOf(char) >= 0) {
                    return "0";
                }
                else {
                    return this.node.ap.toString();
                }
            }

            return "";
        }
    }
</script>

<style scoped lang="scss">
    .label-col {
        margin-left: 0;
    }

    .battle-label {
        font-weight: bold;
    }
</style>