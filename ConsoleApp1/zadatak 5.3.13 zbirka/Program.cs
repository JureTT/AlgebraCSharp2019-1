using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._13_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Usporedba cijelih brojeva.");

            int manji = int.MaxValue;
            int veci = int.MinValue;
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine("Unesi cijeli broj:");
                int a = int.Parse(Console.ReadLine());
                if (a > veci)
                {
                    veci = a;
                }
                if (a < manji)
                {
                    manji = a;
                }
                
            }
            Console.WriteLine("Od unesenih brojeva najmanji je {0}, a najveci je {1}.", manji, veci);

            Console.ReadLine();
        }
    }
}
