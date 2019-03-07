using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._11_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za sortiranje parnih i neparnih brojeva pomoću funkcija i arraylista.");

            ArrayList brojevi = new ArrayList();

            int x = -1;  //  -- prvi broj ostane vani

            while (x != 0)
            {
                x = Unos();                
                brojevi.Add(x);
            }

            ArrayList parni = Parni(brojevi);
            ArrayList neparni = Neparni(brojevi);

            Console.Write("Ovo je lista parnih brojeva: ");
            Ispis(parni);
            Console.Write(", a ovo je lista neparnih brojeva: ");
            Ispis(neparni);

            Console.ReadKey();

        }
        static void Ispis(ArrayList brojevi)
        {
            foreach (int broj in brojevi)
            {
                Console.Write(" {0}", broj);
            }

        }
        static ArrayList Parni(ArrayList brojevi)
        {
            ArrayList parni = new ArrayList();
            foreach (int broj in brojevi)
            {
                if (broj % 2 == 0)
                {
                    parni.Add(broj);
                }
            }
            return parni;
        }
        static ArrayList Neparni(ArrayList brojevi)
        {
            ArrayList neparni = new ArrayList();
            foreach (int broj in brojevi)
            {
                if (broj % 2 != 0)
                {
                    neparni.Add(broj);
                }
            }
            return neparni;
        }
        static int Unos()
        {
            Console.WriteLine("Unesite jedan broj:");
            int a = int.Parse(Console.ReadLine());
            return a;
        }
    }
}
