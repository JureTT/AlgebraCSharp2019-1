using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_12._2._2_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesite podatak tipa DateTime:");
            DateTime d1 = DateTime.Parse(Console.ReadLine());

            Console.WriteLine("Datum:");
            Console.WriteLine(d1);
            Console.WriteLine(d1.ToLongDateString());
            Console.WriteLine(d1.ToShortDateString());

            Console.WriteLine("Vrijeme:");
            Console.WriteLine(d1.ToShortTimeString());

            Console.WriteLine("Dan u tjednu:");
            Console.WriteLine(d1.DayOfWeek);
            Console.WriteLine((int)d1.DayOfWeek);

            Console.WriteLine("Sada je točno:");
            d1 = DateTime.Now;
            Console.WriteLine(d1.ToString("MMMM, dddd yyyy HH:mm:ss fff"));

            DateTime dNG = new DateTime(2020, 1, 1);

            TimeSpan ts = dNG.Subtract(d1);

            Console.WriteLine("Do Nove godine ima:");
            Console.WriteLine("dana:" + ts.Days);
            Console.WriteLine("i sati:" + ts.Hours);
            Console.WriteLine("To je ukupno sati:" + ts.TotalHours);
            Console.WriteLine("Ili {0} dana {1} sati {2} minuta {3} sekundi.", ts.Days, ts.Hours, ts.Minutes, ts.Seconds);

            Console.WriteLine("Danas je izdana potvrda na 6 mjeseci.");
            DateTime datumIzdavanja = DateTime.Now;
            DateTime datumIsteka = datumIzdavanja.AddMonths(6);
            Console.WriteLine("Datum isteka: " + datumIsteka);

            Console.ReadKey();
        }
    }
}
