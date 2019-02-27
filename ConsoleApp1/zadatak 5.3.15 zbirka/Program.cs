using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._15_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program ispisuje brojeve unatrag iz intervala [1, 10].");

            for (int i = 10; i >= 1; i--)
            {
                Console.Write("{0} ", i);

            }

            Console.ReadLine();
        }
    }
}
