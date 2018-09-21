namespace RouteBuilder.Tests.Extensions
{
    using Shouldly;

    public static class ShouldlyPolyfills
    {
        public static void ShouldBe(this short arg1, short arg2)
        {
            int val1 = arg1;
            int val2 = arg2;

            val1.ShouldBe(val2);
        }
    }
}
