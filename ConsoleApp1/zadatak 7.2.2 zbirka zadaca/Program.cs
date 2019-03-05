using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._2_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Pogram za računanje površine jednakokračnog trokuta.");

            Console.WriteLine("Unesite duljinu osnovice trokuta (cm):");
            float osnovica = float.Parse(Console.ReadLine());

            Console.WriteLine("Unesite duljinu kraka trokuta (cm):");
            float krak = float.Parse(Console.ReadLine());

            float povrsina = Povrsina(osnovica, krak);
            Console.WriteLine("Za unesene vrijedonsti duljina stranica trokuta izračunali smo da je njegova površina {0} cm2.", povrsina);

            Console.ReadKey();
        }
        static float Povrsina(float osnovica, float krak)
        {
            float povrsina = (osnovica * krak) / 2;
            return povrsina;
        }
    }
}
