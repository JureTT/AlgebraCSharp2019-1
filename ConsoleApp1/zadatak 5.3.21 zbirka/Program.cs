using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._21_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za računanje prosjeka.");

            Console.WriteLine("Unesite broj predmeta:");
            int a = int.Parse(Console.ReadLine());

            bool uspjeh = true;
            int c = 0;
            for (int i = 1; i <= a; i++)
            {
                int b = 0;
                while (b < 1 || b > 5)
                {
                    Console.WriteLine("Unesite završnu ocjenu za {0}. predmet:", i);
                    b = int.Parse(Console.ReadLine());
                    if (b < 1 || b > 5)
                    {
                        Console.WriteLine("Netočan unos, molimo pokušajte ponovo.");
                    }
                    if (b == 1)
                    {
                        uspjeh = false;
                    }
                }
                if (!uspjeh)  // uspjeh == false
                {
                    break;
                }
                c += b;
            }

            double prosjek = (double)c / (double)a;
            if (uspjeh == false)
            {
                Console.WriteLine("Uspjeh je nedovoljan, učenik ima zaključenu jedinicu.");
            }
            else
            {
                Console.WriteLine("Prosječna ocjena učenika je {0}.", prosjek);
            }

            //while (a != 0)
            //{
            //    Console.WriteLine("Unesi jedan broj:");
            //    a = int.Parse(Console.ReadLine());
            //    suma += a;
            //}
            //Console.Write("{0} ", suma);

            Console.ReadLine();
        }
    }
}
