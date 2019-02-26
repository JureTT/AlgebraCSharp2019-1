using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Primjeri_petlja_while
{
    class Program
    {
        static void Main(string[] args)
        {
            string ime = "";

            while (ime != "kraj")
            {
                Console.WriteLine("Unesi ime:");
                ime = Console.ReadLine();
                if (ime != "kraj")
                {
                    Console.WriteLine("{0}", ime);
                }
            }
            //Console.ReadLine();
        }
    }
}
