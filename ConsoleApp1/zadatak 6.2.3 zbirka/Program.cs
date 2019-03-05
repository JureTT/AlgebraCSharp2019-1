using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_6._2._3_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Unesi nekoliko brojeva i za kraj unesi 0.");

            int a = 1;
            List<int> listaBrojeva = new List<int>();

            while (a != 0)
            {
                Console.WriteLine("Unesi broj:");
                a = int.Parse(Console.ReadLine());
                listaBrojeva.Add(a);
            }

            listaBrojeva.Sort();

            Console.WriteLine("Uneseni brojevi su sortirani po veličini");
            foreach (int item in listaBrojeva)
            {
                Console.WriteLine(item);
            }

            Console.ReadKey();
        }
    }
}
