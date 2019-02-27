using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._17_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            // u zbirci je drugacije riješeno pogledati zbirku
            Console.WriteLine("Ispis prvih 10 potencija broja 2.");

            int potencija = 1;
            for (int i = 1; i <= 10; i++)
            {
                potencija *= 2;
                Console.Write("{0} ", potencija);
            }

            Console.ReadLine();
        }
    }
}
