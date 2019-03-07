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
            Console.WriteLine("Program za računanje opsega i površine kruga.");

            Console.WriteLine("Unesite vrijednost polumjera kruga (cm):");
            float polumjer = float.Parse(Console.ReadLine());

            float opseg = Opseg(polumjer);
            float povrsina = Povrsina(polumjer);
            Console.WriteLine("Za unesenu vrijedonst polumjera kruga izračunali smo" +
                " da je njegova površina {0} cm2; a njegov opseg {1} cm.", povrsina, opseg);

            Console.WriteLine("Unesite vrijednost opsega kruga (cm):");
            float opseg2 = float.Parse(Console.ReadLine());

            float radijusOps = RadijusOps(opseg2);
            float povrsinaRad = Povrsina(radijusOps);
            Console.WriteLine("Za unesenu vrijedonst opsega kruga izračunali smo" +
                " da je njegov polumjer {0} cm; a njegova površina {1} cm2.", radijusOps, povrsinaRad);

            Console.WriteLine("Unesite vrijednost površine kruga (cm2):");
            float povrsina2 = float.Parse(Console.ReadLine());

            float radijusPov = RadijusPov(povrsina2);
            float opsegRad = Opseg(radijusPov);
            Console.WriteLine("Za unesenu vrijedonst površine kruga izračunali smo" +
                " da je njegov polumjer {0} cm; a njegov opseg {1} cm.", radijusPov, opsegRad);

            
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
        static float RadijusOps(float opseg)
        {
            float radijus = opseg / (float)Math.PI /2;
            return radijus;
        }
        static float RadijusPov(float povrsina)
        {
            float radijus = (float)Math.Sqrt(povrsina / (float)Math.PI);
            return radijus;
        }
    }
}
