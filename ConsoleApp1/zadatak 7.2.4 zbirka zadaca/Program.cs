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

            Console.WriteLine("Unesite temperaturu u °F:");
            float fahrenheit2 = float.Parse(Console.ReadLine());

            float celzij2 = Celzij(fahrenheit2);
            Console.WriteLine("Temperatura koju ste unjeli je {0} °C.", celzij2);

            Console.ReadKey();
        }
        static float Fahrenheit(float celzij)
        {
            float fahrenheit = (float)9 / (float)5 * celzij + 32;
            return fahrenheit;

        }
        static float Celzij(float fahrenheit)
        {
            float celzij = (fahrenheit - 32) / ((float)9 / 5);    //dovoljan je samo jedan kast float-a
            return celzij;

        }
    }
}
