using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._2._8_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite neku godinu:");
            try
            {
                int a = int.Parse(Console.ReadLine());

                if (a % 4 == 0 && (!(a % 100 == 0)) || (a % 400 == 0))
                {
                    Console.WriteLine("Unesena godina je prijestupna.");
                }
                else
                {
                    Console.WriteLine("Unesena godina NIJE prijestupna.");
                }
            }
            catch
            {
                Console.BackgroundColor = ConsoleColor.Red;
                Console.WriteLine("Greška!");
            }

            Console.ReadLine();
        }
    }
}
