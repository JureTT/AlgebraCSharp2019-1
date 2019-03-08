using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._2._1_zbirka_zadaca
{
    class Matika
    {

        public static double Zbroj(double broj1, double broj2)
        {
            double zbroj = broj1 + broj2;
            return zbroj;
        }
        public static double Kub(double broj)
        {
            double kub = Math.Pow(broj, 3);    // potencija
            return kub;
        }
        public static double Udaljenost(double x1, double x2, double y1, double y2)
        {
            double duljina = Math.Sqrt(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));    // drugi korjen
            return duljina;
        }
        public static double ToFahren(double celzij)
        {
            double fahren = (double)(9 / 5) * celzij + 32;
            return fahren;
        }
    }
}
