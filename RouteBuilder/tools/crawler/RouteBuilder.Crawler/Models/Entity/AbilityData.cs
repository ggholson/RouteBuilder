namespace RouteBuilder.Crawler.Models.Entity
{
    using RouteBuilder.Core.Attributes;

    internal class AbilityData
    {
        public string Name { get; set; }

        public string Effect { get; set; }

        public string Source { get; set; }

        [Header("User (AP)")]
        public string CharacterMap { get; set; }

        [Header("Magic Stones")]
        public string Stones { get; set; }
    }
}
