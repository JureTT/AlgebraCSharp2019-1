using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._1._1_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za kreiranje proizvoda i računanje njihove cijene.");

            Proizvod lopta = new Proizvod("Tricolore");

            Console.WriteLine("Prodjemo loptu model {0}, i za njenu maloprodajnu cijenu potrebno je odrediti sljedeće:", lopta.Naziv);
            Console.Write("Veleprodajna cijena: ");
            lopta.Cijena = double.Parse(Console.ReadLine());
            Console.Write("Iznos marže: ");
            lopta.Marza = double.Parse(Console.ReadLine());
            Console.Write("Iznos poreza: ");
            lopta.Porez = double.Parse(Console.ReadLine());

            Console.WriteLine("Maloprodajna cijena za loptu modela {0} je {1} kn.", lopta.Naziv, lopta.MPC());

            Console.ReadKey();
        }
    }
}
