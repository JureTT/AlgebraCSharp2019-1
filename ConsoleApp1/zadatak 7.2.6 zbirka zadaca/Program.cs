using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._6_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za provjeru da li je unesieni prirodan broj složen ili prost.");

            bool izbor = true;
            while (izbor != false)
            {
                Console.WriteLine("Unesite prirodan broj:");
                int broj = int.Parse(Console.ReadLine());

                string provjera = Provjera(broj);
                Console.WriteLine("Broj koji ste unjeli je {0}.", provjera);

                Console.WriteLine("Dali želite ponovo provjeriti neki broj(da/ne)?");
                string odluka = Console.ReadLine();
                while (izbor == true)
                {                    
                    if (odluka == "d" || odluka == "D" || odluka == "DA" || odluka == "Da" || odluka == "dA")
                    {
                        izbor = true;
                        break;
                    }
                    else if (odluka == "n" || odluka == "N" || odluka == "NE" || odluka == "Ne" || odluka == "nE")
                    {
                        izbor = false;
                        break;
                    }
                    else
                    {
                        try
                        {
                            Console.WriteLine("Neispravan unos pokušajte ponovo.");
                            Console.WriteLine("Dali želite ponovo provjeriti neki broj(da/ne)?");
                            odluka = Console.ReadLine();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.ToString());
                        }
                        
                    }
                }
            }

            Console.ReadKey();
        }
        static string Provjera(int broj)
        {
            string provjera = "prost";
            for (int i = 2; i < broj; i++)
            {
                if (broj % i == 0 )
                {
                    provjera = "složen";
                    return provjera;
                }
            }
            return provjera;
        }
    }
}
