using primjer_8._1._2_prirucnik;
using System;

namespace primjer_8._3._1_prirucnik
{
    internal class Ucenik : Osoba, IUcenik
    {
        //private string ime = "";
        //public string prezime = "";
        //public DateTime datumNastanka;
        public int OcjenaIzMatematike = 0;
        public int OcjenaIzEngleskog = 0;
        public int OcjenaIzBiologije = 0;
        private Ispit prijavljeniIspit;

        // ovaj kostruktor radi samo kod direktnog poziva
        // Ucenik u99 = new Ucenik();
        public Ucenik()
        {
            this.datumNastanka = DateTime.Now;
            Console.WriteLine("Pozvana metoda Ucenik: Ucenik()");
        }
        public Ucenik(string ime) : base()
        {
            this.Ime = ime;
        }
        public Ucenik(string ime, string prezime) : this(ime)
        {
            this.prezime = prezime;
        } 
        
        public void PrijaviIspit(Ispit ispit)
        {
            this.prijavljeniIspit = ispit;
            Console.WriteLine("Uspješno ste prijavili ispit " + this.prijavljeniIspit.Naziv);
        }

        public double Prosjek()
        {
            double prosjek = 0;
            prosjek = (double)(OcjenaIzBiologije + OcjenaIzEngleskog + OcjenaIzMatematike) / 3;

            return prosjek;
        }

        public override string ToString()
        {
            return "Moje ime je " + this.Ime + " a moj prosjek je: " + this.Prosjek() + " ja sam tipa: " + this.GetType();
        }
    }
}