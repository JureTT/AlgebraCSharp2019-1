using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.zadatak
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesi jedan prirodan broj:");
            int broj = int.Parse(Console.ReadLine());

            List<int> brojevi = new List<int>();

            while (broj > 0)
            {
                brojevi.Add(broj % 10);
                broj /= 10;
            }

            Console.WriteLine("Ispis znamenki napoako:");
            for (int i = 0; i < brojevi.Count; i++)
            {
                Console.Write(brojevi[i]);
            }

            Console.ReadKey();
        }
    }
}
