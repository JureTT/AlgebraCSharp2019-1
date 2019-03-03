using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._8_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program koji ispisuje koliko ima brojeva djeljivih sa 7 i nedjeljivih sa 3 u intevalu [1, 1000].");

            int count = 0;
            for (int i = 1; i < 1000; i++)
            {
                if (i % 7 == 0 && i % 3 != 0)
                {
                    count++;
                    //Console.Write("{0}  ", i);
                }
            }

            Console.WriteLine("\nU intervalu od [1, 1000] ima {0} brojeva djeljivih sa 7 i nedjeljivih sa 3.", count);
            Console.ReadKey();
        }
    }
}
