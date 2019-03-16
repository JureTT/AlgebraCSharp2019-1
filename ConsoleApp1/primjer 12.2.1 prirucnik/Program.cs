using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_12._2._1_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime datum1 = new DateTime(2019, 2, 22);
            DateTime datum2 = new DateTime(2019, 3, 28);
            TimeSpan interval = datum2 - datum1;

            Console.WriteLine("Intervali ime {0} i {1} je {2}.", datum1, datum2, interval);
            Console.WriteLine("U minutama...." + interval.TotalMinutes);
            Console.WriteLine("U satima...." + interval.TotalHours);
            Console.WriteLine("U danima...." + interval);

            Console.ReadKey();
        }
    }
}
