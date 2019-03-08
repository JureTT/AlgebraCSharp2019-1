using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._1._2_zbirka_zadaca
{
    class Automobil
    {
        public string MarkaAutomobila = "";
        public double KS = 0;
        public double OsnovnaCijena = 0;

        public double IznosPoreza()
        {
            double porez;
            if (this.KS < 50)
            {
                porez = this.OsnovnaCijena * 0.05;
            }
            else if (this.KS < 150)
            {
                porez = this.OsnovnaCijena * 0.10;
            }
            else
            {
                porez = this.OsnovnaCijena * 0.15;
            }
            return porez;
        }
        public double UkupnaCijena()
        {
            double Cijena = this.OsnovnaCijena + this.IznosPoreza();
            return Cijena;
        }
    }
}
