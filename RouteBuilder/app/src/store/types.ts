export interface RootState {
    version : string;
}

export interface GameState {
    routeId : number,
    segments : Map<number, Segment>
}

export interface Segment {
    name : string,
    subname? : string,
    id : number,
    characters: Character[],
    order : number,
    nodes : Map<number, GameNode>
}

export interface GameNode {
    type : NodeType,
    id : number,
    order : number,
    note? : string
}

export enum NodeType {
    Note = 0,
    Battle = 1,
    Equip = 2,
    Item = 3
}

export enum Character {
    Zidane,
    Vivi,
    Steiner,
    Dagger,
    Freya,
    Quina,
    Eiko,
    Amarant
}

export enum ItemSlot {
    Weapon,
    Head,
    Chest,
    Hands,
    Accessory
}

export enum ItemSource {
    Buy,
    Drop,
    Steal,
    Pickup
}

export interface Battle extends GameNode {
    enemy : string,
    ap : number,
    dead? : Character[]
}

export interface Item extends GameNode {
    item : string
    slot : ItemSlot,
    source : ItemSource
    cost? : Number
}

export interface NodeMutation {
    segmentId : number,
    nodeId : number,
    node : GameNode
}