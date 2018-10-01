namespace RouteBuilder.Core.Models.Node
{
    using RouteBuilder.Core.Enums;

    public abstract class RouteNode
    {
        public int RouteId { get; set; }

        public int RouteNodeId { get; set; }

        public abstract NodeType Type { get; }

        public int SegmentId { get; set; }

        public double Order { get; set; }

        public string Note { get; set; }
    }
}
