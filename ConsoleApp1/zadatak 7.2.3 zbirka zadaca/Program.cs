using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._3_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {            
            Console.WriteLine("Program za preračunanje konjskih snaga u kilowate.");

            Console.WriteLine("Unesite snagu vozila u KS:");
            float konja = float.Parse(Console.ReadLine());

            float kilowata = Kilowati(konja);
            Console.WriteLine("Snaga vašeg vozila je {0} kW.", kilowata);

            Console.ReadKey();
        }
        static float Kilowati(float konja)
        {
            float kilowata = konja * (float)(0.73549875);
            return kilowata;
           
        }
    }
}
