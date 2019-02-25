using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._2._5
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite cijeli broj:");
            int a = int.Parse(Console.ReadLine());

            if (a % 2 == 0)
            {
                Console.WriteLine("Uneseni broj je paran.");
            }
            else
            {
                Console.WriteLine("Uneseni broj je neparan.");
            }
            Console.ReadLine();
        }
}
}
