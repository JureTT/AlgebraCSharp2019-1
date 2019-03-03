using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._6_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program ispisuje sve prijestupne godine od 1900. do 2007.");

            for (int i = 1500; i < 2019; i++)
            {
                if (i % 4 == 0 && (!(i % 100 == 0) || (i % 400 == 0)))
                {
                    Console.Write("{0}  ", i.ToString());
                }
            }

            Console.ReadKey();
        }
    }
}
