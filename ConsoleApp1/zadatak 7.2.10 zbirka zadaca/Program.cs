using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._10_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za izračun ukupne cijene prema ulaznoj cijeni.");

            Console.WriteLine("Unesite ulaznu cijenu:");
            float ulazna = float.Parse(Console.ReadLine());

            float ukupna = Racun(ulazna);
            Console.WriteLine("Ukupna cijena prema unesenoj ulaznoj cijeni je {0}.", ukupna);

            Console.ReadKey();
        }
        static float Racun(float ulazna)
        {
            float ukupna = 0;
            if (ulazna < 100)
            {
                ukupna = ulazna + (float)5.5 + (ulazna * (float)0.02) + (ulazna * (float)0.22); 
            }
            else if (ulazna < 250)
            {
                ukupna = ulazna + (float)9.5 + (ulazna * (float)0.03) + (ulazna * (float)0.22);
            }
            else if (ulazna < 500)
            {
                ukupna = ulazna + (float)15 + (ulazna * (float)0.04) + (ulazna * (float)0.22);
            }
            else if (ulazna < 1000)
            {
                ukupna = ulazna + (float)25 + (ulazna * (float)0.05) + (ulazna * (float)0.22);
            }
            else
            {
                ukupna = ulazna + (float)50 + (ulazna * (float)0.1) + (ulazna * (float)0.22);
            }
            return ukupna;
        }
    }
}
