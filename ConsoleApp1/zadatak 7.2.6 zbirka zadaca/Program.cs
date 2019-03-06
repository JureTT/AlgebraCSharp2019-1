﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_7._2._6_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za provjeru da li je unesieni prirodan broj složen ili prost.");

            Console.WriteLine("Unesite prirodan broj:");
            int broj = int.Parse(Console.ReadLine());

             string provjera = Provjera(broj);
            Console.WriteLine("Broj koji ste unjeli je {0}.", provjera);

            Console.ReadKey();
        }
        static string Provjera(int broj)
        {
            string provjera = "prost";
            for (int i = 2; i < broj; i++)
            {
                if (broj % i == 0 )
                {
                    provjera = "složen";
                    return provjera;
                }
            }
            return provjera;
        }
    }
}