using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_8._3._1_prirucnik
{
    class Pilot : Vozac
    {
        public Pilot( string ime, string prezime) : base(ime, prezime)
        {
        }

        public bool Kategorija_x { get; internal set; }

        public override string ToString()
        {
            if (this.Kategorija_x)
            {
                return base.ToString() + " X";
            }
            else
            {
                return base.ToString();
            }
        }
    }
}
