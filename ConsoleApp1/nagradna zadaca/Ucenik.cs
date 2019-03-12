using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace nagradna_zadaca
{
    class Ucenik
    {
        // Polja:
        private string ime;
        private string prezime;
        private long oib;
        private double racun;
        public long telefon;
        
        // Svojstva:
        public string Ime { get => ime; }
        public string Prezime { get => prezime; }
        public long OIB
        { 
            set { oib = value; }
        }
        public double Racun
        {
            get { return racun; }
            set { racun = value; }
        }

        // Metode:
        public override string ToString()
        {
            return "Pozdrav, moje ime je " + this.Ime + " " + this.Prezime + " imam " + this.Racun + " kn na računu." +
                "\n Ako vam treba posuditi novaca možete me dobiti na ovaj " + this.telefon + " broj telefona.";
        }
       
        // Konstruktori(Kreatori):
        public Ucenik(string ime, string prezime)
        {          
            this.racun = Program.Slucajan.Broj() / 100;
            this.ime = ime;
            this.prezime = prezime;
        }
        public Ucenik(string ime, string prezime, long oib) : this(ime, prezime)
        {
            this.OIB = oib;
        }
        public Ucenik(string ime, string prezime, long oib, double racun) : this(ime, prezime, oib)
        {
            this.Racun = racun;
        }
    }    
}
