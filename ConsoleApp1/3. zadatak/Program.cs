using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3.zadatak
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Molimo unesite podatke za vaš automobil.");
            Automobil auto = new Automobil();
            Console.WriteLine("Unesite naziv:");
            auto.Naziv = Console.ReadLine();
            Console.WriteLine("Unesite godinu proizvodnje:");
            auto.GodinaPRoizvodnje = int.Parse(Console.ReadLine());
            Console.WriteLine("Unesite osnovnu cijenu:");
            auto.OsnovnaCijena = double.Parse(Console.ReadLine());

            Console.WriteLine("Vaše vozilo se zove {0}, proizvedeno je godine {1} i staro je {2} godina,\n te ukupno košta {3} na osnovnu cijenu od {4} kuna.", auto.Naziv,
                 auto.GodinaPRoizvodnje, auto.Starost(), auto.UkupnaCijena(), auto.OsnovnaCijena);

            Console.ReadKey();

        }
    }
}
