namespace RouteBuilder.Core.Models.Node
{
    using RouteBuilder.Core.Enums;

    public class BattleNode : RouteNode
    {
        public override NodeType Type => NodeType.Battle;

        public string Enemy { get; set; }

        public short AP { get; set; }
    }
}
