namespace RouteBuilder.Core.Models.Route
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Route", Schema = "Route")]
    public class Route
    {
        [Key]
        public short RouteId { get; set; }

        public string Name { get; set; }
    }
}
