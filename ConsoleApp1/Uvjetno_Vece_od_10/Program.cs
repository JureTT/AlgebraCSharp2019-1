using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Uvjetno_Vece_od_10
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesite prirodan broj:");
            int a = int.Parse(Console.ReadLine());
            if( a > 10 )
            {
                Console.WriteLine("Uneseni broj je veći od 10.");
            }
            else
            {
                Console.WriteLine("Uneseni broj NIJE veći od 10.");
            }
            Console.ReadKey();

        }
    }
}
