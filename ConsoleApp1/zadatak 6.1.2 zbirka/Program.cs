using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_6._1._2_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            int broj;
            int[] niz = new int[5];

            for (int i = 0; i < 5; i++)
            {
                broj = int.Parse(Console.ReadLine());
                niz[i] = broj;
            }

            for (int i = 0; i < niz.Length; i++)
            {
                if (niz[i] == niz.Max())
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.Write(" " + niz.Max());
                    Console.ForegroundColor = ConsoleColor.White;
                }
                else
                {
                    Console.Write(" " + niz[i]);
                }
            }

            Console.ReadKey();
        }
    }
}
