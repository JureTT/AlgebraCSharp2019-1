using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_10._1._2_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Mapa u kojoj se izvršava naš program: ");
            Console.WriteLine(Environment.CurrentDirectory);

            Console.Write("Postoji li file Proba.txt u izvršnoj mapi: ");
            // Path klasa
            string mojaPutanja = Path.Combine(Environment.CurrentDirectory, "Proba.txt");
            // Fila klasa
            Console.WriteLine(File.Exists(mojaPutanja));

            // Directory klasa
            if (!Directory.Exists("Proba"))
            {
                // Ako ne postoji folder Proba, kreiram ga
                Directory.CreateDirectory("Proba");
            }

            // ispisujem sve foldere na C-u
            Console.WriteLine("Direktoriji na C: ");
            string[] sDirs = Directory.GetDirectories(@"C:\");
            foreach(string sDir in sDirs)
            {
                Console.WriteLine(sDir);
            }

            // ispisujem sve fileove na C-u
            Console.WriteLine("Datoteke na C:");
            string[] sFiles = Directory.GetFiles(@"C:\");
            foreach(string sFile in sFiles)
            {
                Console.WriteLine(Path.GetFileName(sFile));
            }

            Console.ReadKey();
        }
    }
}
