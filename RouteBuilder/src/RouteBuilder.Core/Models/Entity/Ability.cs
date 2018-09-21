namespace RouteBuilder.Core.Models.Entity
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using RouteBuilder.Core.Enums;
    
    [Table("Ability", Schema = "Game")]
    public class Ability
    {
        [Key]
        public short AbilityId { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public AbilityType AbilityTypeId { get; set; }

        public short Cost { get; set; }
    }
}
