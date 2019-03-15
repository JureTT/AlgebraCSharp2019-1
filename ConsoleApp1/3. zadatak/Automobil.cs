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
    }
}
