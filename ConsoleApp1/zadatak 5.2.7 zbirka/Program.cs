using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._2._7_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 0;

            Console.Write("Unesite cijeli broj:");
            try
            {
                a = int.Parse(Console.ReadLine());

                if (a % 4 == 0 && a >= 100)
                {
                    Console.WriteLine("Uneseni broj je dobar.");
                }
                else
                {
                    Console.WriteLine("Uneseni broj NIJE dobar.");
                }
            }
            catch (FormatException e)
            {
                Console.WriteLine("Provjeri je li unešen broj? " + e.ToString());
            }

            Console.ReadLine();
        }
    }
}
