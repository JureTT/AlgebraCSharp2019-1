using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._2._2_zbirka_zadaca
{
    class Broj
    {
        public int vrijednost = 0;
                               
        public string Provjera1()
        {
            string provjera = "savršen";
            int testint = 0;
            for (int i = 1; i < this.vrijednost; i++)
            {
                if (this.vrijednost % i == 0)
                {
                    testint += i;
                }
            }
            if (testint != vrijednost)
            {
                provjera = "nesavršen";
            }
            return provjera;
        }
        public static string Provjera2(int broj)
        {
            string provjera = "prost";
            for (int i = 2; i < broj; i++)
            {
                if (broj % i == 0)
                {
                    provjera = "složen";
                    return provjera;
                }
            }
            return provjera;
        }
    }
}
