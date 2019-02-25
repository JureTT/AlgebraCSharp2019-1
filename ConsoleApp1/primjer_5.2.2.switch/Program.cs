using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._2._2.@switch
{
    class Program
    {
        static void Main(string[] args)
        {
            float a, b = 0;
            string operacija = "";

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

            Console.ReadKey();
        }
    }
}
