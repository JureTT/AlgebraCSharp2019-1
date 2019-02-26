using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cikličke_petlje_primjeri
{
    class Program
    {
        static void Main(string[] args)
        {
            //Ispis svih brojeva 0,1,2,...,99
            Console.WriteLine("Ispis svih brojeva 0,1,2,...,99");
            for (int i = 0; i < 100; i++)
            {
                Console.Write("{0} ", i);
            }

            //Ispis svih brojeva 16,18,20,...,88
            Console.WriteLine("\n\nIspis svih brojeva 16,18,20,...,88");
            for (int i = 16; i < 89; i+=2)
            {
                Console.Write("{0} ", i);
            }

            //Ispis svih brojeva 135,130,125,...,55
            Console.WriteLine("\n\nIspis svih brojeva 135,130,125,...,55");
            for (int i = 135; i > 54; i -= 5)
            {
                Console.Write("{0} ", i);
            }

            //Ispis svih brojeva 0,1,2,...,99 -> OSIM BROJA 80
            Console.WriteLine("\n\nIspis svih brojeva 0,1,2,...,99 -> OSIM BROJA 80");
            for (int i = 0; i < 99; i++)
            {
                if (i == 80)
                {
                    continue;
                }
                Console.Write("{0} ", i);

            }

            //Ispis svih brojeva 0,1,2,...,9999 -> koji su djeljivi 17
            Console.WriteLine("\n\nIspis svih brojeva 0,1,2,...,9999 -> koji su djeljivi sa 17");
            for (int i = 0; i <= 9999; i++)
            {
                if (i % 17 == 0  && i % 13 == 0)
                {
                    Console.Write("{0} ", i);
                }                

            }

            Console.ReadLine();
        }
    }
}
