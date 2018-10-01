namespace RouteBuilder.Core.Models.Node
{
    using RouteBuilder.Core.Enums;

    public class ItemNode : RouteNode
    {
        public override NodeType Type => NodeType.Item;

        public string Item { get; set; }

        public GearSlot Slot { get; set; }

        public ItemSource Source { get; set; }

        public int Cost { get; set; }
    }
}
