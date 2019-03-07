using System;

namespace primjer_8._1._2_prirucnik
{
    internal class Ucenik
    {
        public string ime = "";
        public string prezime = "";
        public DateTime datumNastanka;
        public int OcjenaIzMatematike = 0;
        public int OcjenaIzEngleskog = 0;
        public int OcjenaIzBiologije = 0;

        public Ucenik()
        {
            this.datumNastanka = DateTime.Now;
        }
        public Ucenik(string v)
        {
            this.ime = v;
        }
        public Ucenik(string v, string prez)
        {
            this.ime = v;
            this.prezime = prez;
        }  

        internal double Prosjek()
        {
            double prosjek = 0;
            prosjek = (double)(OcjenaIzBiologije + OcjenaIzEngleskog + OcjenaIzMatematike) / 3;

            return prosjek;
        }

        public override string ToString()
        {
            return "Moje ime je " + this.ime + " a moj prosjek je: " + this.Prosjek();
        }
    }
}