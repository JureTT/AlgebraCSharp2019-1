using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._11_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Savršeni brojevi iz intervala [1, 1000] su:");
           
            for (int i = 1; i <= 1000; i++)
            {
                int savrs = 0;
                for (int j = 1; j < i; j++)
                {
                    if (i % j == 0)
                    {
                        savrs += j;
                    }

                }
                if (i == savrs)
                {
                    Console.Write("{0} ", i.ToString());
                }
            }

            Console.ReadLine();
        }
    }
}
