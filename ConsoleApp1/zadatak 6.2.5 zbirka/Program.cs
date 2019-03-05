using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_6._2._5_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesi jedan broj:");
            int broj = int.Parse(Console.ReadLine());
            List<int> prosti = new List<int>();

            int fak = 2;
            while(fak <= broj)
            {
                if (broj % fak == 0)
                {
                    prosti.Add(fak);
                    broj = broj / fak;
                }
                else
                {
                    fak++;
                }
            }
            foreach (int item in prosti)
            {
                Console.Write(item);

            }
            Console.ReadKey();
        }
    }
}
