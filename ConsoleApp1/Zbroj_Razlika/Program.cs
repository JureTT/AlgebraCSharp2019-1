using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zbroj_Razlika
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 0, b = 0;

            Console.WriteLine("Unesi 1. broj:");
            a = int.Parse(Console.ReadLine());

            Console.WriteLine("Unesi 2. broj:");
            b = int.Parse(Console.ReadLine());

            Console.WriteLine("Zbroj je: {0}", (a + b));

            Console.WriteLine("Razlika je: {0}", (a - b));

            Console.WriteLine("Razlika je: {1}, a zbroj je: {0}", a + b, a - b);

            Console.WriteLine("Umnožak je: {0}", (a * b));

            Console.WriteLine("Kvocijent je: {0}", ((decimal)a / (decimal)b));

            Console.WriteLine("Umnožak je: {0}, a kvocijent je {1}", a * b, (decimal)a / (decimal)b);

            Console.ReadLine();
        }
    }
}
