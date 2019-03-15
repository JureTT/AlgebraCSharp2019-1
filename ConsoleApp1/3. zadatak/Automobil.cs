using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3.zadatak
{
    class Automobil
    {
        private string naziv;
        private int godinaPRoizvodnje;
        private double osnovnaCijena;

        public string Naziv { get => naziv; set => naziv = value; }
        public int GodinaPRoizvodnje { get => godinaPRoizvodnje; set => godinaPRoizvodnje = value; }
        public double OsnovnaCijena { get => osnovnaCijena; set => osnovnaCijena = value; }

        public int Starost()
        {
            int godine = DateTime.Now.Year - GodinaPRoizvodnje;
            return godine;
        }
        public double UkupnaCijena()
        {
            double cijena = 0;
            if (this. OsnovnaCijena <= 70000)
            {
                cijena = OsnovnaCijena * 1.3;
            }
            else if (this.OsnovnaCijena < 100000)
            {
                cijena = OsnovnaCijena * 1.4;
            }
            else
            {
                cijena = OsnovnaCijena * 1.5;
            }
            return cijena;
        }
    }
}
