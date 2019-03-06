using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._9_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za verbalnu potvrdu prosjeka.");

            Console.WriteLine("Unesite prosječnu ocjenu:");
            float prosjek = float.Parse(Console.ReadLine());

            string ocjena = Opisna(prosjek);
            Console.WriteLine("Vaš uspjeh prema prosječnoj ocjeni je {0}.", ocjena);

            Console.ReadKey();
        }
        static string Opisna(float prosjek)
        {
            string ocjena ="";

            if (prosjek < 2)
            {
                ocjena = "nedovoljan";
            }
            else if (prosjek < 2.5)
            {
                ocjena = "dovoljan";
            }
            else if (prosjek < 3.5)
            {
                ocjena = "dobar";
            }
            else if(prosjek < 4.5)
            {
                ocjena = "vrlo dobar";
            }
            else
            {
                ocjena = "odličan";
            }
                //switch (prosjek)
                //{
                //    case prosjek<2:
                //        ocjena = "nedovoljan";
                //                    }
             return ocjena;
        }
    }
}
