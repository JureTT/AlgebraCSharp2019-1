using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._5_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za računanje udaljenosi između dvije točke.");

            Console.WriteLine("Unesite kordinate točke A(x,y).");
            Console.WriteLine("Prvo za x unutar A(x,y):");
            float xA = float.Parse(Console.ReadLine());
            Console.WriteLine("Potom za y unutar A({0},y):", xA);
            float yA = float.Parse(Console.ReadLine());

            Console.WriteLine("Kordinate točke A({0},{1}) su unešene." +
                "\nSada unesite kordinate točke B(x,y).", xA, yA);
            Console.WriteLine("Prvo za x unutar B(x,y):");
            float xB = float.Parse(Console.ReadLine());
            Console.WriteLine("Potom za y unutar B({0},y):", xB);
            float yB = float.Parse(Console.ReadLine());

            Console.WriteLine("Kordinate za obje točke A({0},{1}) i B({2},{3}) su uspješno unešene.", xA, yA, xB, yB);
            
            float udaljenost = Udaljenost( xA, yA, xB, yB);
            Console.WriteLine("Udaljenost između unešenih točaka iznosi {0} cm.", udaljenost);

            Console.ReadKey();
        }
        static float Udaljenost(float x1, float y1, float x2, float y2)
        {
            float udaljenost = (float)Math.Sqrt((float)Math.Pow((x2 - x1), 2) + (float)Math.Pow((y2 - y1), 2));
            return udaljenost;

        }
    }
}
