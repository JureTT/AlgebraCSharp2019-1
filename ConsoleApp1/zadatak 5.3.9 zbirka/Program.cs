using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._9_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesi jedan cijeli broj:");
            int a = int.Parse(Console.ReadLine());

            Console.WriteLine("Brojevi koji sa kojima je uneseni broj djeljiv su:");
            for (int i = 1; i <= a; i++)
            {
                if (a % i == 0)
                {
                    Console.Write("{0} ", i);
                }
            }

            Console.ReadLine();
        }
    }
}
