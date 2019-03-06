using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._4_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za preračunanje temperature u Celzijevim stupnjevima u Fahrenheitove stupnjeve.");

            Console.WriteLine("Unesite temperaturu u °C:");
            float celzij = float.Parse(Console.ReadLine());

            float fahrenheit = Fahrenheit(celzij);
            Console.WriteLine("Temperatura koju ste unjeli je {0} °F.", fahrenheit);

            Console.ReadKey();
        }
        static float Fahrenheit(float celzij)
        {
            float fahrenheit = (float)9 / (float)5 * celzij + 32;
            return fahrenheit;

        }
    }
}
