using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2.zadatak
{
    class Program
    {
        static void Main(string[] args)
        {
            List<string> rijeciA = new List<string>();
            List<string> rijeciB = new List<string>();
            List<string> rijeciC = new List<string>();
            List<string> ostale = new List<string>();

            string uvjet = "";
            while (uvjet != "kraj")
            {
                Console.WriteLine("Unesite jednu riječ:");
                string rijec = Console.ReadLine();
                uvjet = rijec.ToLower();
                Char[] pojam = uvjet.ToCharArray();
                if (pojam[0] == 'a')
                {
                    rijeciA.Add(rijec);
                }
                else if (pojam[0] == 'b')
                {
                    rijeciB.Add(rijec);
                }
                else if (pojam[0] == 'c')
                {
                    rijeciC.Add(rijec);
                }
                else
                {
                    ostale.Add(rijec);
                }
            }

            Console.Write("\nRijeci koje pocinju sa A: ");
            foreach (var item in rijeciA)
            {
                Console.Write(item + ", ");
            }
            Console.Write("\nRijeci koje pocinju sa B: ");
            foreach (var item in rijeciB)
            {
                Console.Write(item + ", ");
            }
            Console.Write("\nRijeci koje pocinju sa C: ");
            foreach (var item in rijeciC)
            {
                Console.Write(item + ", ");
            }
            Console.Write("\nRijeci koje pocinju sa ostalima slovima: ");
            foreach (var item in ostale)
            {
                Console.Write(item + ", ");
            }


            Console.ReadKey();
        }
    }
}
