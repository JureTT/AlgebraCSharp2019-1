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
            Console.WriteLine("Program za računanje površine jednakokračnog trokuta.");

            Console.WriteLine("Unesite duljinu osnovice trokuta (cm):");
            float osnovica = float.Parse(Console.ReadLine());

            Console.WriteLine("Unesite visinu trokuta (cm):");
            float visina = float.Parse(Console.ReadLine());

            float povrsina = Povrsina(osnovica, visina);
            Console.WriteLine("Za unesenu osnovicu i visinu trokuta izračunali smo da je njegova površina {0} cm2.", povrsina);

            Console.WriteLine("Unesite povrsinu trokuta (cm2):");
            float povrsina2 = float.Parse(Console.ReadLine());

            Console.WriteLine("Unesite duljinu kraka trokuta (cm):");
            float visina2 = float.Parse(Console.ReadLine());

            float osnovica2 = Stranica(povrsina2, visina2);
            Console.WriteLine("Za unesenu površinu i visinu trokuta izračunali smo da je njegova osnovica {0} cm.", osnovica2);

            Console.WriteLine("Unesite povrsinu trokuta (cm2):");
            float povrsina3 = float.Parse(Console.ReadLine());

            Console.WriteLine("Unesite duljinu osnovice trokuta (cm):");
            float osnovica3 = float.Parse(Console.ReadLine());

            float visina3 = Stranica(povrsina3, osnovica3);
            Console.WriteLine("Za unesenu površinu i osnovicu trokuta izračunali smo da je njegova visina {0} cm2.", visina3);

            Console.ReadKey();
        }
        static float Povrsina(float osnovica, float visina)
        {
            float povrsina = (osnovica * visina) / 2;
            return povrsina;
        }
        static float Stranica(float povrsina, float strana)
        {
            float stranica = (povrsina * 2) / strana;
            return stranica;
        }
    }
}
