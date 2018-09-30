<template>
    <div class="segment">
        <div class="row segment-row">
            <div class="header-col">
                <span class="segment-title">{{segment.name}}</span>
                <span v-if="segment.subname" class="segment-subtitle">({{segment.subname}})</span>
            </div>
            <div class="col-11">
                <node-container v-for="node in segment.nodes" :key="node.id" :node="node" :chars="segment.characters"></node-container>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import { Segment } from "../../store/types";
    import NodeContainer from "./NodeContainer.vue"

    @Component({
        props: {
            segment : Segment
        },
        components: { NodeContainer }
    })
    export default class GameSegment extends Vue {

    }
</script>

<style scoped lang="scss">
    .segment-row {
        min-height: 200px;
    }

    .segment-title {
        font-weight: bold;
        font-size: 1rem;
        display: block;
        vertical-align: middle;
    }

    .segment-subtitle {
        display: block;
        font-style: italic;
    }

    .header-col {
        transform: rotate(180deg);
        writing-mode: vertical-rl;

        & .segment-title {
            margin-right: 15px;
        }
    }
</style>