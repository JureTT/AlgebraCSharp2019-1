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
            // instanciraj novi objekt klasse učenik
            Ucenik uc1 = new Ucenik();

            // inicijalizacija objekta
            Console.WriteLine("Unesi ime učenika:");
            uc1.ime = Console.ReadLine();

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

            Console.WriteLine("Ime učenika je " + uc1.ime + " i " + uc2.ime);

            List<Ucenik> ucenici = new List<Ucenik> { uc1, uc2};
            ucenici.Add(uc1);
            ucenici.Add(uc2);

            foreach (var item in ucenici)
            {
                Console.WriteLine(item);
            }
            
            Console.ReadKey();
        }
    }
}
