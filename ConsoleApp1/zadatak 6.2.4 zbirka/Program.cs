using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_6._2._4_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesi neki više znamenkasti broj:");
            int a = int.Parse(Console.ReadLine());

            ////  drugi način
            //string broj = Console.ReadLine();            
            //string brojkice = new string(broj.Reverse().ToArray());
            //Console.WriteLine(brojkice);

            List<int> listaBrojeva = new List<int>();

            while (a != 0)
            {
                listaBrojeva.Add(a % 10);
                a /= 10;
            }
            
            Console.WriteLine("Znamenke unesenog broja obrnuto ispisane su:");
            foreach (int item in listaBrojeva)
            {
                Console.Write(item);
            }

            Console.ReadKey();
        }
    }
}
