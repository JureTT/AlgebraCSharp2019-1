using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._2._1_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za izvođenje matematičkih izračuna.");

            // zbroj
            Console.WriteLine("Unesi prvi broj:");
            double a = double.Parse(Console.ReadLine());
            Console.WriteLine("Unesi drugi broj:");
            double b = double.Parse(Console.ReadLine());
            Console.WriteLine("Njihov zbroj je: {0}", Matika.Zbroj(a, b).ToString());

            // kub
            Console.WriteLine("Unesi broj koji želiš kubirati:");
            double c = double.Parse(Console.ReadLine());
            Console.WriteLine("Njihov zbroj je: {0}", Matika.Kub(c).ToString());

            // duljina između točaka
            Console.WriteLine("Unesite kordinate točke A(x,y).");
            Console.WriteLine("Prvo za x unutar A(x,y):");
            double xA = double.Parse(Console.ReadLine());
            Console.WriteLine("Potom za y unutar A({0},y):", xA);
            double yA = double.Parse(Console.ReadLine());

            Console.WriteLine("Kordinate točke A({0},{1}) su unešene." +
                "\nSada unesite kordinate točke B(x,y).", xA, yA);
            Console.WriteLine("Prvo za x unutar B(x,y):");
            double xB = double.Parse(Console.ReadLine());
            Console.WriteLine("Potom za y unutar B({0},y):", xB);
            double yB = double.Parse(Console.ReadLine());

            Console.WriteLine("Kordinate za obje točke A({0},{1}) i B({2},{3}) su uspješno unešene.", xA, yA, xB, yB);
            Console.WriteLine("Udaljenost između unešenih točaka iznosi {0} cm.", Matika.Udaljenost(xA, xB, yA, yB).ToString());

            // tempreatura - stupnjevi
            Console.Write("Unesite trenutnu sobnu temperaturu u °C: ");
            double celzij = double.Parse(Console.ReadLine());
            Console.Write("Preračunata sobna temperatura iznosi {0} °F.", Matika.ToFahren(celzij).ToString());


            Console.ReadKey();
        }
    }
}
