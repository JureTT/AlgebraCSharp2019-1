using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._2._4_zbrika
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite cijeli broj:");
            int a = int.Parse(Console.ReadLine());

            if (a < 0)
            {
                a = -a;
            }

            if (a < 10)
            {
                Console.WriteLine("Uneseni broj je jednoznamenkast.");
            }
            else if (a < 100)
            {
                Console.WriteLine("Uneseni broj je dvoznamenkast.");
            }
            else if (a < 1000)
            {
                Console.WriteLine("Uneseni broj je troznamenkast.");
            }
            else
            {
                Console.WriteLine("Uneseni broj je višeznamenkast.");
            }
            Console.ReadLine();
        }
    }
}
