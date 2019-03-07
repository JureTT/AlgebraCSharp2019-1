using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_8._1._2_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Što je nastavnik?");
            Console.WriteLine(Nastavnik.Opis());
            Console.WriteLine("Koji je koeficijent plaće nastavnika?");
            Console.WriteLine(Nastavnik.Koeficijent());

            Nastavnik n1 = new Nastavnik();
            // ne mozemo postaviti READ ONLY property
            //n1.Ime = "Claudije";

            // ispis može
            Console.WriteLine(n1.Ime);

            // OIB možemo postaviti
            n1.Oib = 12345;

            // ne dozvoljava čitanje oiba
            //Console.WriteLine("Njegov OIB je " + n1.Oib);

            // Ispiši dio OIB-a
            Console.WriteLine("Njegov OIB je " + n1.PartialOib + "*********.");

            // instanciraj novi objekt klasse učenik
            Ucenik uc1 = new Ucenik();

            // inicijalizacija objekta
            Console.WriteLine("Unesi ime učenika:");
            uc1.Ime = Console.ReadLine();

            Console.WriteLine("Unesi prezime:");
            uc1.prezime = Console.ReadLine();
            Console.WriteLine("Unesi ocjenu iz matematike:");
            uc1.OcjenaIzMatematike = int.Parse(Console.ReadLine());
            Console.WriteLine("Unesi ocjenu iz engleskog:");
            uc1.OcjenaIzEngleskog = int.Parse(Console.ReadLine());
            Console.WriteLine("Unesi ocjenu iz biologije:");
            uc1.OcjenaIzBiologije = int.Parse(Console.ReadLine());

            Console.WriteLine("Prosjek je " + uc1.Prosjek() + ".");

            // instanciraj novi objekt klasse učenik
            Ucenik uc2 = new Ucenik("Perica");

            Console.WriteLine("Ime učenika je " + uc1.Ime + " i " + uc2.Ime);

            List<Ucenik> ucenici = new List<Ucenik> { uc1, uc2};
            ucenici.Add(uc1);
            ucenici.Add(uc2);

            foreach (var item in ucenici)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine("\nNastavnici:");

            List<Nastavnik> nastavnici = new List<Nastavnik>();
            nastavnici.Add(n1);

            foreach (var item in nastavnici)
            {
                Console.WriteLine(item);
            }


            Console.ReadKey();
        }
    }
}
