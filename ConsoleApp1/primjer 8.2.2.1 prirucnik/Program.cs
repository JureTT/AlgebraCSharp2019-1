using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_8._2._2._1_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = 1;
            Console.WriteLine("x = {0}", x);

            Povecaj1(x);
            Console.WriteLine("x = {0}", x);

            Povecaj2(ref x);
            Console.WriteLine("x = {0}", x);
            
            Console.ReadKey();
        }
        private static void Povecaj1(int a)
        {
            a++;
        }
        private static void Povecaj2(ref int a)
        {
            a++;
        }
    }
}
