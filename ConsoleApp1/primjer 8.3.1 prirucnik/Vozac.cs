using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_8._3._1_prirucnik
{
    class Vozac : Osoba
    {
        bool kategorija_a = false;
        bool kategorija_b = false;
        bool kategorija_c = false;
        bool kategorija_d = false;
        bool kategorija_e = false;
        bool kategorija_f = false;

        public bool Kategorija_a { get => kategorija_a; set => kategorija_a = value; }
        public bool Kategorija_b { get => kategorija_b; set => kategorija_b = value; }
        public bool Kategorija_c { get => kategorija_c; set => kategorija_c = value; }
        public bool Kategorija_d { get => kategorija_d; set => kategorija_d = value; }
        public bool Kategorija_e { get => kategorija_e; set => kategorija_e = value; }
        public bool Kategorija_f { get => kategorija_f; set => kategorija_f = value; }
        public List<Automobili> Automobili { get => Automobili; set => Automobili = value }
    }
    public Vozac(string v1, string v2) : base(v1,v2)
    {
    }
    public override string ToString()
    {
        string opis = "Ja sam vozač i moje ime je" + this.Ime + ", imam položene kategorije:";
        if (this.kategorija_a)
        {
            opis += " A";
        }
        if (this.kategorija_b)
        {
            opis += " B";
        }
        if (this.kategorija_c)
        {
            opis += " C";
        }
        if (this.kategorija_d)
        {
            opis += " D";
        }
        if (this.kategorija_e)
        {
            opis += " E";
        }
        if (this.kategorija_F)
        {
            opis += " F";
        }
        return opis;
    }
}
