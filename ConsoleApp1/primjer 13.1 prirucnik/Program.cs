using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_13._1_prirucnik
{
    public enum Ocjene
    {
        Nedovoljan = 1,
        Dovoljan,
        Dobar,
        Vrlo_dobar,
        Odlican
    }
    public enum Katovi
    {
        Prizemelje = 0,
        Prvi,
        Drugi,
        Treci,
        Cetvrti
    }
    class Program
    {        
        static void Main(string[] args)
        {
            Firma algebra = new Firma("Algebra d.o.o.");
            algebra.Kat = Katovi.Treci;
            Console.WriteLine(algebra);

            Console.ReadKey();
        }
    }
    public class Firma
    {
        private Katovi kat;
        private string naziv;

        public Firma(string ime)
        {
            this.naziv = ime;
        }

        public Katovi Kat { get => kat; set => kat = value; }
        public string Naziv { get => naziv; set => naziv = value; }

        public override string ToString()
        {
            string kojiKat = "";
            switch ((int)kat)
            {
                case 0:
                    kojiKat = "nultom";
                    break;
                case 1:
                    kojiKat = "prvom";
                    break;
                case 2:
                    kojiKat = "drugom";
                    break;
                case 3:
                    kojiKat = "trećem";
                    break;
                case 4:
                    kojiKat = "četvrtom";
                    break;
                default:
                    kojiKat = "nepzonatom";
                    break;
            }
            return "I naše ime je " + this.Naziv + " i nalazimo se na " + kojiKat + " katu.";
        }

    }
}
