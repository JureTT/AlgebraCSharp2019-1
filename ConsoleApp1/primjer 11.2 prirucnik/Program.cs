using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BuisnessLayer;

namespace primjer_11._2_prirucnik
{
    class Program
    {
        static void Main(string[] args) 
        {
            Ucenik uc1 = new Ucenik("Maja", "Majić");
            Ucenik uc2 = new Ucenik("Ana", "Anić");
            Ucenik uc3 = new Ucenik("Maja", "Katić");
            Ucenik uc4 = new Ucenik("Maja", "Polih");

            List<Osoba> osobe = new List<Osoba>();
            osobe.Add(uc1);
            osobe.Add(uc2);
            osobe.Add(uc3);
            osobe.Add(uc4);

            List<Osoba> samoMaje = new List<Osoba>();

            string trazenoIme = "Maja";
            int brojacMaja = 0;
            foreach (var item in osobe)
            {
                if (item.Ime == trazenoIme)
                {
                    brojacMaja++;
                    // samoMaje.Add(item);  // može ručno ali ne želim
                    Console.WriteLine(item.Ime);
                }
            }

            Console.WriteLine(trazenoIme + " se pojavljuje " + brojacMaja + " puta");

            try
            {
                // from <alias> in <collection>
                Osoba trazenaOsoba = (
                    from os
                    in osobe
                    where os.Ime == trazenoIme
                    select os).First();         // traži prvog iz dohvaćenog niza podataka           

                Console.WriteLine("Našao sam osobu " + trazenaOsoba.Ime + " " + trazenaOsoba.prezime);

                samoMaje = (
                    from os
                    in osobe
                    where os.Ime == trazenoIme
                    // select os).SingleOrDefault();
                    select os).Take(2).ToList();      // traži prva 2 člana iz dohvaćenog niza podataka

            }
            catch (InvalidOperationException ioe)
            {
                Console.WriteLine(ioe);
            }
            finally
            {
                foreach (var item in samoMaje)
                {
                    Console.WriteLine("Moje ime je " + item.Ime + " " + item.prezime);
                }
            }

            Console.ReadKey();
        }
    }
}
