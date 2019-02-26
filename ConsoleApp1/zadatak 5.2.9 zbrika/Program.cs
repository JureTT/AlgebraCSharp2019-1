using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._2._9_zbrika
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite neki broj:");
            try
            {
                int a = int.Parse(Console.ReadLine());

                if (a % 2 == 0)
                {
                    Console.WriteLine("Unesen broj je paran.");
                }
                else
                {
                    Console.WriteLine("Unesen broj je neparan.");
                }
                if (a % 3 == 0)
                {
                    Console.WriteLine("Unesen broj je dijeljiv sa 3.");
                }
                else
                {
                    Console.WriteLine("Unesen broj NIJE dijeljiv sa 3, ostatak je {0}.", a % 3);
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
