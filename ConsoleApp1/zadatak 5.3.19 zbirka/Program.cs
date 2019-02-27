using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._19_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za zbrajanje brojeva.");

            int suma = 0;
            int a = -10000;
            while (a != 0)
            {
                Console.WriteLine("Unesi jedan broj:");
                a = int.Parse(Console.ReadLine());
                suma += a; 
            }
            Console.Write("{0} ", suma);
            
            Console.ReadLine();
        }
    }
}
