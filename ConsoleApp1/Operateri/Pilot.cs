using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BuisnessLayer;

namespace Operateri
{
    public class Pilot : Vozac
    {
        public Pilot( string ime, string prezime) : base(ime, prezime)
        {
        }

        public bool Kategorija_x { get; set; }

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
