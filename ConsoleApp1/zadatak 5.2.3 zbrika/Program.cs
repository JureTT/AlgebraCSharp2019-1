using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._2._3_zbrika
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite cijeli broj:");
            int a = int.Parse(Console.ReadLine());

            if (a >= 100)
            {
                Console.WriteLine("Uneseni broj je velik.");
            }
            else
            {
                Console.WriteLine("Uneseni broj NIJE velik.");
            }
            Console.ReadLine();
        }
    }
}
