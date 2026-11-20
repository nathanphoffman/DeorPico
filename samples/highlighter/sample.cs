// C# sample
using System;
using System.Collections.Generic;

#nullable enable
#region Modern syntax

/* block comment */
namespace Samples
{
    public class Greeter
    {
        private readonly string _name;
        public int Count { get; set; } = 42;

        public Greeter(string name) => _name = name;

        public string Greet(bool loud)
        {
            var message = $"Hello, {_name}!";
            char mark = '!';
            double ratio = 3.14;
            if (loud && Count > 0)
                return message.ToUpper() + mark;
            return null;
        }
    }

    [Serializable]
    public record Person(string Name, int Age);

    public record struct Point(int X, int Y);

    public class Settings
    {
        public required string Title { get; init; }
        public nint Handle = 0xFF_AA;
        public int Flags = 0b1010_0001;
        public double Big = 1.5e10;
        public ulong Mask = 100UL;

        public string Describe(object value) => value switch
        {
            int number and > 0 => "positive",
            not null => "other",
            _ => "none",
        };

        public void Strings(int[] items)
        {
            string path = @"C:\temp\file.txt";
            string both = $@"C:\{Title}\x";
            string raw = """
                {"json": "raw string"}
                """;
            char tab = '\t';
            int first = items[0];
        }
    }
}
#endregion
