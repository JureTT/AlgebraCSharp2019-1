using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_10._1._1_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Upiši neki tekst");
            string upisano = Console.ReadLine();

            //  kreiranje handle-a
            FileStream fs1 = new FileStream("Proba.txt", FileMode.Create);

            StreamWriter sw1 = new StreamWriter(fs1);

            sw1.WriteLine(upisano);

            sw1.Flush();

            sw1.Close();
            fs1.Close();

            // čitanje iz datoteke

            FileStream fs2 = new FileStream("Proba.txt", FileMode.Open);
            StreamReader sr1 = new StreamReader(fs2);

            string procitano = sr1.ReadToEnd();
            Console.WriteLine("Ispis iz datoteke Proba.txt");
            Console.WriteLine(procitano);

            Console.ReadKey();
        }
    }
}
