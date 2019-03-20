using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._8_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program koji ispisuje koliko ima brojeva djeljivih sa 7 i nedjeljivih sa 3 u intevalu [1, 1000].");

            int count = 0;
            for (int i = 1; i < 1000; i++)
            {
                if (i % 7 == 0 && i % 3 != 0)
                {
                    count++;
                    //Console.Write("{0}  ", i);
                }
            }

            Console.WriteLine("\nU intervalu od [1, 1000] ima {0} brojeva djeljivih sa 7 i nedjeljivih sa 3.", count);

            int broj = 0;
            bool greska = true;
            while (greska == true)
            {
                try
                {
                    Console.WriteLine("Unesi broj za koji želiš saznati da li je djeljiv sa 7, a ne i sa 3:");
                    broj = int.Parse(Console.ReadLine());
                    greska = false;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                    greska = true;
                }
            }

            if (broj % 7 == 0 && broj % 3 != 0)
            {
                Console.WriteLine("Broj je djeljiv sa 7, ali ne i sa 3");
            }
            else
            {
                Console.WriteLine("Broj nezadovoljava zadane kriterije.");
            }


            Console.ReadKey();
        }
    }
}
