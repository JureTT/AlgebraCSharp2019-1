using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._1_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Pogram za računanje opsega i površine kruga.");

            Console.WriteLine("Unesite vrijednost polumjera kruga (cm):");
            float polumjer = float.Parse(Console.ReadLine());

            float opseg = Opseg(polumjer);
            float povrsina = Povrsina(polumjer);
            Console.WriteLine("Za unesenu vrijedonst polumjera kruga izračunali smo" +
                " da je njegova površina {0} cm2; a njegov opseg {1} cm.", povrsina, opseg);

            Console.ReadKey();
        }
        static float Opseg(float radijus)
        {
            float opseg = 2 * radijus * (float)Math.PI;
            return opseg;
        }
        static float Povrsina(float radijus)
        {
            float povrsina = radijus * radijus * (float)Math.PI;
            return povrsina;
        }
    }
}
