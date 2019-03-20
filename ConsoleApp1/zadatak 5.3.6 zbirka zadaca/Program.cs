using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._6_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program ispisuje sve prijestupne godine od 1900. do 2007.");

            for (int i = 1500; i < 2019; i++)
            {
                if (i % 4 == 0 && (!(i % 100 == 0) || (i % 400 == 0)))
                {
                    Console.Write("{0}  ", i.ToString());
                }
            }

            int godina = 0;
            bool katch = true;
            while (katch == true)
            {
                try
                {
                    Console.WriteLine("\nUnesi godinu za koju bi htio provjeriti dal je prijestupna:");
                    godina = int.Parse(Console.ReadLine());
                    katch = false;
                }
                catch // da li dodati Exception?
                {
                    Console.WriteLine("Greška pri unosu, molimo pokušajte ponovo");
                    katch = true;
                }
                
            }


            if (godina % 4 == 0 && (!(godina % 100 == 0) || (godina % 400 == 0)))
            {
                Console.WriteLine("Unešena godina je prijstupna.");
            }
            else
            {
                Console.WriteLine("Unešena godina nije prijestupna.");
            }

            Console.ReadKey();
        }
    }
}
