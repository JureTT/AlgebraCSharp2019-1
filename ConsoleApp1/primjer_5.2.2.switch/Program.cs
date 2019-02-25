using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._2._2.@switch
{
    class Program
    {
        static double SafeDivision(double x, double y)
        {
            if (y == 0)
            {
                throw new System.DivideByZeroException();
            }
            return x / y;
        }
        static void Main(string[] args)
        {
            float a = 0, b = 0;
            string operacija = "";

            try
            {
                Console.WriteLine("Unesi 1. prirodan broj:");
                a = float.Parse(Console.ReadLine());

                Console.WriteLine("Unesi 2. prirodan broj:");
                b = float.Parse(Console.ReadLine());

                Console.WriteLine("Unesi željenu operaciju ( + - * / ):");
                operacija = Console.ReadLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine("1. graška: " + ex.ToString());
            }
            finally
            { }

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
                    try
                    {
                        Console.WriteLine("Kvocijent je: {0} / {1} = {2}", a, b, SafeDivision(a, b));
                    }
                    catch (Exception ex2)
                    {
                        Console.WriteLine("2. greška: " + ex2.ToString());
                    }
                    break;
                default:
                    Console.WriteLine("Nisi unio valjani znak za neku od mogućih operacija");
                    break;
            }

            Console.ReadKey();

       }

    }
}
