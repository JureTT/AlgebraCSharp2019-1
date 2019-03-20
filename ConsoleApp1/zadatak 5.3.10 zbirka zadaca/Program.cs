using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._10_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za provjeru savršenih brojeva.");

            int a = 0;
            bool greska = true;
            while (greska == true)
            {
                try
                {
                    Console.WriteLine("Unesi jedan broj:");
                    a = int.Parse(Console.ReadLine());
                    greska = false;
                }
                catch (Exception exp)
                {
                    Console.WriteLine(exp.Message);
                    greska = true;
                }
            }

            int savrs = 0;
            for (int i = 1; i < a; i++)
            {
                if(a % i == 0)
                {
                    savrs += i;
                }
            }

            if (savrs == a)
            {
                Console.WriteLine("Zbroj svih djelitelja ovoga broja je {0}, prema tome broj je savršen.", savrs);
            }
            else
            {
                Console.WriteLine("Zbroj svih djelitelja ovoga broja je {0}, prema tome broj nije savršen.", savrs);
            }

            Console.ReadKey();
        }
    }
}
