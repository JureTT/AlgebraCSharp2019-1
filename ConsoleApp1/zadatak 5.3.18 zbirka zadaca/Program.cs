using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._18_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za provjeru unosa ocjene u intervalu [1, 5].");

            Console.WriteLine("Unesite dobivenu ocjenu: ");
            int a = int.Parse(Console.ReadLine()); ;
            while(a < 1 || a > 5)
            {
                Console.WriteLine("Ocjena nije unutar zadanog intervala, pokušajte ponovo.");
                a = int.Parse(Console.ReadLine());
            }

            Console.WriteLine("Ocjena zadovoljava zadane kriterije.");

            Console.ReadKey();
        }
    }
}
