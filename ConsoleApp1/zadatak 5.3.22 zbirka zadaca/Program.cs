using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._22_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za izvršavanje osnovnih računski operacija.");
            float a = 0, b = 0;
            string operacija = "";
            string odluka = "da";

            while (odluka == "da")
            {
                Console.WriteLine("Unesi 1. prirodan broj:");
                a = float.Parse(Console.ReadLine());

                Console.WriteLine("Unesi 2. prirodan broj:");
                b = float.Parse(Console.ReadLine());

                Console.WriteLine("Unesi željenu operaciju ( + - * / ):");
                operacija = Console.ReadLine();

                switch (operacija)
                {
                    case "+":
                    case "plus":
                        Console.WriteLine("Zbroj je: {0} + {1} = {2}", a, b, (a + b));
                        break;
                    case "-":
                        Console.WriteLine("Razlika je: {0} - {1} = {2}", a, b, (a - b));
                        break;
                    case "*":
                    case "x":
                        Console.WriteLine("Umnožak je: {0} * {1} = {2}", a, b, (a * b));
                        break;
                    case "/":
                        Console.WriteLine("Kvocijent je: {0} / {1} = {2}", a, b, (a / b));
                        break;
                    default:
                        Console.WriteLine("Nisi unio valjani znak za neku od mogućih operacija");
                        break;
                }

                Console.WriteLine("Želite li računati ponovo (da/ne)?");
                odluka = Console.ReadLine();

                while (odluka != "da" && odluka != "ne")
                {
                    if (odluka == "d" || odluka == "D" || odluka == "DA" || odluka == "Da" || odluka == "dA")
                    {
                        odluka = "da";
                    }
                    else if (odluka == "n" || odluka == "N" || odluka == "NE" || odluka == "Ne" || odluka == "nE")
                    {
                        odluka = "ne";
                    }
                    else
                    {
                        Console.WriteLine("Neispravan unos pokušajte ponovo:");
                        odluka = Console.ReadLine();
                    }
                }
            }

            Console.ReadKey();

        }
    }
}

