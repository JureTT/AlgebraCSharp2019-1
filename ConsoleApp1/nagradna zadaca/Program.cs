using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace nagradna_zadaca
{
    class Program
    {
        public static class Slucajan
        {
            public static Random slucaj = new Random();
            public static double Broj()
            {
                double broj = slucaj.Next(200000, 600000);
                return broj;
            }
        }
        static void Main(string[] args)
        {
            Console.WriteLine("###Program za evidneciju učenika i njihovih podataka.###\n");

            Ucenik u1 = new Ucenik("Niko", "Nitković");
            Ucenik u2 = new Ucenik("Neko", "Nekić", 1234657981324);
            Ucenik u3 = new Ucenik("Svako", "Svakić", 9876543210987, 1200.23);
                        
            List<Ucenik> ucenici = new List<Ucenik>() { u1, u2, u3 };

            Console.WriteLine("U programu su evidentirana tri učenika, unesite za svakog od njih broj telefona.");
            ucenici.ForEach(Ucenik =>UnesiTelefon(Ucenik));

            foreach (var djak in ucenici)
            {
                Console.WriteLine(djak.ToString());
            }

            ucenici.ForEach(Ucenik => Naplata(Ucenik));
            Console.WriteLine("\nNaplata školarine je obavljena, svi računi su umanjeni za odgovarajući iznos.\n");

            foreach (var djak in ucenici)
            {
                Console.WriteLine(djak.ToString());
            }

            ucenici.ForEach(Ucenik => Ucenik.ToString());

            Console.ReadKey();
        }
        private static void Naplata(Ucenik djak)
        {
            djak.Racun -= 900;
        }
        private static void UnesiTelefon(Ucenik djak)
        {
            bool provjeraUnosa = false;
            while (!provjeraUnosa)
            {
                Console.Write("Unesite broj telefona:");
                try
                {
                    djak.telefon = long.Parse(Console.ReadLine());
                    provjeraUnosa = true;
                }

                catch (FormatException ex)
                {
                    Console.WriteLine("Greška: " + ex.Message);
                }

                catch (Exception ex)
                {
                    Console.WriteLine("Greška: " + ex.Message);
                }
            }
        }

    }
}
