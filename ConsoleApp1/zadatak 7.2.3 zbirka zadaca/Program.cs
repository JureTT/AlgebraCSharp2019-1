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
            Console.WriteLine("Program za preračunanje konjskih snaga u kilowate i obrnuto.");

            Console.WriteLine("Unesite snagu vozila u KS:");
            float konja = float.Parse(Console.ReadLine());

            float kilowata = Kilowati(konja);
            Console.WriteLine("Snaga vašeg vozila je {0} kW.", kilowata);

            Console.WriteLine("Unesite snagu vozila u kW:");
            float kilowata2 = float.Parse(Console.ReadLine());

            float konja2 = KonjSnaga(kilowata2);
            Console.WriteLine("Snaga vašeg vozila je {0} KS.", konja2);

            Console.ReadKey();
        }
        static float Kilowati(float konja)
        {
            float kilowata = konja * (float)(0.73549875);
            return kilowata;
        }
        static float KonjSnaga(float kilowata)
        {
            float konja = kilowata * (float)(1.359621617);
            return konja;
        }
    }
}
