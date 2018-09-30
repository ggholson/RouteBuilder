import { Module } from 'vuex';
// import { getters } from './getters';
// import { actions } from './actions';
// import { mutations } from './mutations';
import {RootState, GameState, Battle, Item, NodeType, ItemSource, ItemSlot, Character, GameNode, Segment} from '../types';

export const state : GameState = {
    routeId: -1,
    segments: [
        {
            id: 1,
            name: 'Alexandria Castle',
            characters: [ 0 ],
            order: 0,
            nodes: [
                <Item> {
                    type: 3,
                    id: 5,
                    order: 0,
                    item: "Mage Masher",
                    slot: ItemSlot.Weapon,
                    source: ItemSource.Steal
                },
                <Item> {
                    type: 3,
                    id: 6,
                    order: 1,
                    item: "Moonstone",
                    slot: ItemSlot.Accessory,
                    source: ItemSource.Pickup
                },
                <Battle> {
                    type: 1,
                    id: 1,
                    order: 2,
                    enemy: "1 Random Battle",
                    ap: 1
                }
            ]
        },
        {
            id: 2,
            name: 'Evil Forest',
            subname: 'Before Prison Cage',
            characters: [ 0 ],
            order: 1,
            nodes: [
                <Battle> {
                    type: 1,
                    id: 2,
                    order: 1,
                    enemy: "1 Random Battle",
                    ap: 1
                }
            ]
        },
        {
            id: 3,
            name: 'Evil Forest',
            subname: 'After Prison Cage',
            characters: [ 0, 1, 2 ],
            order: 2,
            nodes: [
                <Battle> {
                    type: 1,
                    id: 3,
                    order: 1,
                    enemy: "Prison Cage 2",
                    ap: 3
                },
                <Battle> {
                    type: 1,
                    id: 4,
                    order: 2,
                    enemy: "Plant Brain",
                    dead: [ Character.Zidane ],
                    ap: 5
                }
            ]
        },
    ]
};

const namespaced: boolean = true;

export const game_state: Module<GameState, RootState> = {
    namespaced,
    state
};

