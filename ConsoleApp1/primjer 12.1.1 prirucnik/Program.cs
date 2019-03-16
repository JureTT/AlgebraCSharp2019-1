using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_12._1._1_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime datum1 = new DateTime(2019, 2, 22);
            DateTime datum2 = new DateTime(2019, 3, 28);
            DateTime datum3 = new DateTime(2019, 3, 28);

            if (datum1 < datum2)
            {
                Console.WriteLine(datum1.ToString() + " je manji od datuma " + datum2.ToString());
            }
            else
            {
                Console.WriteLine(datum1.ToString() + " je veći od datuma " + datum2.ToString());
            }

            Console.WriteLine("Trenutno je " + DateTime.Now);

            Console.WriteLine("Danas je " + DateTime.Today);

            //  (uvjet) ? true :false
            Console.WriteLine((DateTime.IsLeapYear(2020)) ? "Ovo je prijestupna godina." : "Ovo je normalna godina.");


            Console.WriteLine();
        }
    }
}
