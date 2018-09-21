namespace RouteBuilder.Core.Models.Entity
{
    using RouteBuilder.Core.Enums;

    public class Equipment
    {
        public short EquipmentId { get; set; }

        public GearSlot GearSlotId { get; set; }

        public string Name { get; set; }
    }
}
