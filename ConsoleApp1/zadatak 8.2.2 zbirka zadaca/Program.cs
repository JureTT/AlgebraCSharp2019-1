using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._2._2_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za provjeru savršenosti i složenosti brojeva.");

            Console.WriteLine("Unesi jedan prirodan broj: ");
            int a = int.Parse(Console.ReadLine());

            Console.Write("Unešeni broj je {0}. ", Broj.Provjera2(a));

            Broj brojka = new Broj();
            brojka.vrijednost = a;

            Console.WriteLine("Broj je također i {0}.", brojka.Provjera1());

            Console.ReadKey();
        }
    }
}
