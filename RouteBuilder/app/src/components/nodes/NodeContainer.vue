<template>
    <div :class="'node-container ' + getClass()">
        <battle-node v-if="node.type === nodeType.Battle" :node="node" :chars="chars"></battle-node>
        <item-node v-if="node.type === nodeType.Item" :node="node"></item-node>
    </div>
</template>

<script lang="ts">
    import { Component, Vue, Prop } from 'vue-property-decorator';
    import { NodeType, Character, GameNode } from "../../store/types";
    import BattleNode from "./BattleNode.vue";
    import ItemNode from "./ItemNode.vue";

    @Component({
        components: { BattleNode, ItemNode }
    })
    export default class NodeContainer extends Vue {
        @Prop() node! : GameNode;
        @Prop(Array) chars! : Character[];

        protected nodeType = NodeType;

        public getClass() : string {
            switch (this.node.type) {
                case NodeType.Note:
                    return "note-node-container";
                case NodeType.Battle:
                    return "battle-node-container";
                case 2:
                    return "equip-node-container";
                case 3:
                    return "item-node-container";
            }

            return "";
        }
    }
</script>

<style scoped lang="scss">
    .node-container {
        margin-top: 15px;
    }

    .battle-node-container + .battle-node-container {
        margin-top: 0;
    }

    .item-node-container + .item-node-container {
        margin-top: 0;
    }
</style>