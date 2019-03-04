using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._12.zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program ispisuje zbroj i prosjek 5 unešenih brojeva.");

            int zbroj = 0;
            double prosjek = 0;
            for (int i = 1; i <= 5; i++)
            {
                Console.WriteLine("Unesite {0}. prirodan broj:", i);
                int a = int.Parse(Console.ReadLine());
                zbroj += a;
            }

            prosjek = (double)zbroj / 5;

            Console.WriteLine("Zbroj svih unešenih brojeva je {0}, a njihov prosjek je {1}.", zbroj, prosjek);
            Console.ReadKey();
        }
    }
}
