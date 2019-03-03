using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._16_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program koji ispisuje potencija broja 2 manje od 1000.");

            int a = 1;
            for (int i = 0; i < 1000; i++)
            {
                if (a > 1000)
                {
                    break;
                }
                Console.WriteLine("{0}. potencija broja 2 je :  {1}", i, a);
                a = a * 2;
            }

            Console.ReadKey();
        }
    }
}
