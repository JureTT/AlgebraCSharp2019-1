using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._7_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ispis brojeva koji su djeljivi sa 7 i nedjeljivi sa 3 u intervalu [1, 100].");
            
            for (int i = 1; i <= 100; i++)
            {
                if (i % 7 == 0 && i % 3 != 0)
                {
                    Console.Write("{0} ", i);
                }
            }

            Console.ReadLine();
        }
    }
}
