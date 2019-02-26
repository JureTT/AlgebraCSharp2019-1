using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadaci_5._2._5_zbrika
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite cijeli broj:");
            int a = int.Parse(Console.ReadLine());

            if (a >= 100 && a <= 200)
            {
                Console.WriteLine("Uneseni broj se nalazi u intervalu od 100 do 200.");
            }
            else
            {
                Console.WriteLine("Uneseni broj NIJE u interval u od 100 do 200.");
            }
            Console.ReadLine();
        }
    }
}
