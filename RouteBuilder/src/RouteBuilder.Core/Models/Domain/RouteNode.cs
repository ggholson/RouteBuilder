namespace RouteBuilder.Core.Models.Domain
{
    using RouteBuilder.Core.Enums;

    public class RouteNode
    {
        public int RouteId { get; set; }

        public int RouteNodeId { get; set; }

        public NodeType NodeType { get; set; }

        public int SegmentId { get; set; }

        public double Order { get; set; }
    }
}
