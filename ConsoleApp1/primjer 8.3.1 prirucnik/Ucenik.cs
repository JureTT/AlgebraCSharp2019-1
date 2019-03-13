using primjer_8._1._2_prirucnik;
using System;

namespace primjer_8._3._1_prirucnik
{
    internal class Ucenik : Osoba
    {
        //private string ime = "";
        //public string prezime = "";
        //public DateTime datumNastanka;
        public int OcjenaIzMatematike = 0;
        public int OcjenaIzEngleskog = 0;
        public int OcjenaIzBiologije = 0;

        public Ucenik()
        {
            this.datumNastanka = DateTime.Now;
            Console.WriteLine("Pozvana metoda Ucenik:Ucenik()");
        }
        public Ucenik(string ime) : base()
        {
            this.ime = ime;
        }
        public Ucenik(string ime, string prezime) : this(ime)
        {
            this.prezime = prezime;
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