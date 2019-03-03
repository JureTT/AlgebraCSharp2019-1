using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._20_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za brojanje parnih i neparnih brojeva");

            Console.WriteLine("Unesite jedan prirodan broj:");
            int a = int.Parse(Console.ReadLine());

            int parni = 0;
            int neparni = 0;
            while (a != 0)
            {
                if (a % 2 == 0)
                {
                    parni++;
                }
                else 
                {
                    neparni++;
                }
                Console.WriteLine("Unesite jedan prirodan broj:");
                a = int.Parse(Console.ReadLine());
            }

            Console.WriteLine("Unešeno je {0} parnih i {1} neparnih brojeva.", parni, neparni);

            Console.ReadKey();
        }
    }
}
