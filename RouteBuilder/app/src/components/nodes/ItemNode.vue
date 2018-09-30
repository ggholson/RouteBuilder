<template>
    <div class="row inner-row battle-row">
        <div class="label-col">
            <span class="item-label">Item: </span>
            <span :class="'source-text ' + source[node.source]">{{source[node.source]}} </span>
            <span class="enemy-text">{{node.item}}</span>
        </div>
        <div class="col-10">
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import { Item, ItemSource, ItemSlot } from "../../store/types";

    @Component({
        props: {
            node : Item
        }
    })
    export default class ItemNode extends Vue {
        protected source = ItemSource;
        protected slot = ItemSlot;
    }
</script>

<style scoped lang="scss">
    .item-label {
        font-weight: bold;
    }

    .source-text {
        font-weight: bold;

        &.Steal {
            font-style: italic;
            color: teal;
        }
        &.Pickup {
            color: darkorange;
        }
    }
</style>