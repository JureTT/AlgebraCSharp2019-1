using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._1._2_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za kreiranje automobila i računanje njihove cijene.");

            Automobil auto = new Automobil();

            Console.WriteLine("Kako bi odredili konačnu cijenu automobila potrebno je unjeti sljedeće:");
            Console.Write("Marku automobila: ");
            auto.MarkaAutomobila = Console.ReadLine();
            Console.Write("Konjske snage: ");
            auto.KS = double.Parse(Console.ReadLine());
            Console.Write("Osnovnu cijenu: ");
            auto.OsnovnaCijena = double.Parse(Console.ReadLine());

            Console.WriteLine("Prodajna ukupna cijena automobila marke {0} je {1} kn, a porez {2} kn.", 
                auto.MarkaAutomobila,
                auto.UkupnaCijena(),
                auto.IznosPoreza());

            Console.ReadKey();
        }
    }
}
