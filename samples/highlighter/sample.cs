// C# sample
using System;
using System.Collections.Generic;

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
}
