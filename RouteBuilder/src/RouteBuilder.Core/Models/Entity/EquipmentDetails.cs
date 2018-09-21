namespace RouteBuilder.Core.Models.Entity
{
    public class EquipmentDetails : Equipment
    {
        public short Strength { get; set; }

        public short Magic { get; set; }

        public short Speed { get; set; }

        public short Spirit { get; set; }

        public short ElementalBoost { get; set; }

        public short ElementalResistance { get; set; }

        public short Cost { get; set; }

        public short Value { get; set; }
    }
}
