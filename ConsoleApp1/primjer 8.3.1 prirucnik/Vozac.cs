using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using zadatak_8._1._2_zbirka_zadaca;

namespace primjer_8._3._1_prirucnik
{
    class Vozac:Osoba
    {
        bool kategorija_a = false;
        bool kategorija_b = false;
        bool kategorija_c = false;
        bool kategorija_d = false;
        bool kategorija_e = false;
        bool kategorija_f = false;
        private List<Automobil> automobili = new List<Automobil>();

        public bool Kategorija_a { get => kategorija_a; set => kategorija_a = value; }
        public bool Kategorija_b { get => kategorija_b; set => kategorija_b = value; }
        public bool Kategorija_c { get => kategorija_c; set => kategorija_c = value; }
        public bool Kategorija_d { get => kategorija_d; set => kategorija_d = value; }
        public bool Kategorija_e { get => kategorija_e; set => kategorija_e = value; }
        public bool Kategorija_f { get => kategorija_f; set => kategorija_f = value; }
        public List<Automobil> Automobili { get => automobili; set => automobili = value; }
    
    public Vozac(string ime, string prezime) : base(ime, prezime)
    {
    }
        public override string ToString()
        {
            string opis = "Ja sam vozač i moje ime je " + this.Ime;

            if (Automobili.Count != 0)   
            {
                opis += "\n Imam sljedeće automobile:";
                foreach (var item in Automobili)
                {
                    opis += " " + item.MarkaAutomobila;
                }
            }

            opis += ", imam položene kategorije:";

            if (this.Kategorija_a)
            {
                opis += " A";
            }
            if (this.Kategorija_b)
            {
                opis += " B";
            }
            if (this.Kategorija_c)
            {
                opis += " C";
            }
            if (this.Kategorija_d)
            {
                opis += " D";
            }
            if (this.Kategorija_e)
            {
                opis += " E";
            }
            if (this.Kategorija_f)
            {
                opis += " F";
            }
            return opis;
        }
    }
}
