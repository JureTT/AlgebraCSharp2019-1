using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lediste_Vreliste
{
    class Program
    {
        static void Main(string[] args)
        {
            int vreliste = 100;
            int lediste = 0;

            Console.WriteLine("Vrelište vode je na " + vreliste + "° C (celzijevih stupnjeva), " +
                "a ledište vode je na " + lediste + "° C (celzijevih stupnjeva).");
            Console.ReadKey();
        }
    }
}
