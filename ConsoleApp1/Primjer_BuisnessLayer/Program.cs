using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BuisnessLayer;
using Operateri;

namespace Primjer_BuisnessLayer
{
    class Program
    {
        static void Main(string[] args)
        {
            Ucenik uc1 = new Ucenik();  // Osoba() i Ucenik() zašto? zato jer su na oba mjesta pozvani defaultni konstruktori
            Ucenik uc2 = new Ucenik("Anicanjko");  // Osoba ()
            Ucenik uc3 = new Ucenik("Pericanjko", "Perić");  // Osoba ()

            uc3.PrijaviIspit(new Ispit("Engleski"));

            // generic list
            List<Ucenik> ucenici = new List<Ucenik> { uc1, uc2, uc3 };

            foreach (var item in ucenici)
            {
                Console.WriteLine(item);
            }

            // collection base lista (kao Arraylist)
            Studenti studenti = new Studenti();
            studenti.Add(uc1);
            studenti.Add(uc2);
            studenti.Add("Lauranija", "Crofft");

            Console.WriteLine("\nIspis klase studenti koja nasljedjuje CollectionBase");
            foreach (var item in studenti)
            {
                Console.WriteLine("\n  ----> " + item.ToString());
            }

            // DODAJ vozače
            Vozac vo1 = new Vozac("Lukas", "Krilić");  //Osoba()
            vo1.Kategorija_a = true;
            vo1.Kategorija_b = true;

            var a1 = new Automobil();
            a1.MarkaAutomobila = "Ford";

            var a2 = new Automobil();
            a2.MarkaAutomobila = "Mazda";

            vo1.Automobili.Add(a1);
            vo1.Automobili.Add(a2);

            Vozac vo2 = new Vozac("Nikola", "Bulić");   // Osoba()
            vo2.Kategorija_b = true;
            vo2.Kategorija_d = true;

            List<Vozac> vozaci = new List<Vozac> { vo1, vo2 };

            foreach (var item in vozaci)
            {
                Console.WriteLine(item);
            }

            Pilot pi1 = new Pilot("Rokolino", "Roks");    // Osoba()
            pi1.Kategorija_b = true;
            pi1.Kategorija_d = true;
            pi1.Kategorija_x = true;

            List<Pilot> piloti = new List<Pilot> { pi1 };

            foreach (var item in piloti)
            {
                Console.WriteLine(item);
            }

            Console.ReadKey();
        }
    }
}
