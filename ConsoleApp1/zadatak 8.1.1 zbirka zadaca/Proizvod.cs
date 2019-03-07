using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._1._1_zbirka_zadaca
{
    class Proizvod
    {
        public string Naziv = "";
        public double Cijena = 0;
        public double Marza = 0;
        public double Porez = 0;

        public Proizvod(string naziv)
        {
            Naziv = naziv;
        }
        public double MPC()
        {
            double MPC = Cijena + Porez + Marza;
            return MPC;
        }
    }
}
