using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._2._4._3
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite ime škole koju pohađate:");
            string skola = Console.ReadLine();

            if (!(skola == "Algebra"))
            {
                Console.WriteLine("Upišite seminar u Algebri.");
                Console.ReadLine();
            }
        }
    }
}
