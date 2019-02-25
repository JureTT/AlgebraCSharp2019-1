using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._2._4._2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite ime:");
            string ime = Console.ReadLine();

            if (ime == "Tomislav" || ime == "Hrvoje" || ime == "Mislav")
            {
                Console.WriteLine("Dobar dan direktore.");
            }
            else
            {
                Console.WriteLine("Bok.");
            }
            Console.ReadLine();
        }
    }
}
