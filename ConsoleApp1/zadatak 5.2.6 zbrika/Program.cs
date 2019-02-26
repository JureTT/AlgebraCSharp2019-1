using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._2._6_zbrika
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite cijeli broj:");
            int a = int.Parse(Console.ReadLine());

            if (a % 3 == 0 || a % 5 == 0)
            {
                Console.WriteLine("Uneseni broj je dobar.");
            }
            else
            {
                Console.WriteLine("Uneseni broj NIJE dobar.");
            }
            Console.ReadLine();
        }
    }
}
