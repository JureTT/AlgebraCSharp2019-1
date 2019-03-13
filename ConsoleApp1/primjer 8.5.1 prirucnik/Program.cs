using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_8._5._1_prirucnik
{
    class Program
    {
        static void Main(string[] args)
        {
            Osoba osoba = new Osoba();
            osoba.NaPromjenuImena += new Osoba.NaPromjenuImenaDelegat(osoba_NaPromjenuImena);
            osoba.Ime = "Pero";

            osoba.NaPromjenuImena -= new Osoba.NaPromjenuImenaDelegat(osoba_NaPromjenuImena);

            Console.ReadKey();
        }
        static void osoba_NaPromjenuImena(object sender, EventArgs e)
        {
            Console.WriteLine("Osoba je promjenila podatke: {0}", ((Osoba)sender).Ime);
        }
    }
}
