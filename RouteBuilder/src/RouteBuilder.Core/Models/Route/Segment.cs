namespace RouteBuilder.Core.Models.Route
{
    using RouteBuilder.Core.Enums;

    public class Segment
    {
        public int SegmentId { get; set; }

        public string Name { get; set; }

        public string Subname { get; set; }

        public Character[] Characters { get; set; }

        public double Position { get; set; }
    }
}
