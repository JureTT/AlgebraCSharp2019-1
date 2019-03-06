using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._8_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za računanje faktorijela unešenog broja.");

            Console.WriteLine("Unesite prirodan broj:");
            float broj = float.Parse(Console.ReadLine());

            float faktorijel = Faktorijel(broj);
            Console.WriteLine("Faktorijel unešenog broja je {0}.", faktorijel);

            Console.ReadKey();
        }
        static float Faktorijel(float broj)
        {

            float faktorijel = 1;
            for (int i = 1; i <= broj; i++)
            {
                faktorijel *= i;
            }
            return faktorijel;
        }
    }
}
