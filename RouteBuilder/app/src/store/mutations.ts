import { MutationTree } from 'vuex';
import {Character, GameState, NodeMutation} from './types';

export const mutations: MutationTree<GameState> = {
    setAlive(state, payload : NodeMutation) {
        const node =
            state.segments.filter(s => s.id === payload.segmentId)[0]
                .nodes.filter(n => n.id === payload.nodeId)[0];
    },
    profileError(state) {
        state.error = true;
        state.user = undefined;
    }
};