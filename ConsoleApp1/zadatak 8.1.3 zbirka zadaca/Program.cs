using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._1._3_zbirka_zadaca
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Program za izračun plaće.");

            Zaposlenik z = new Zaposlenik("Jure", "Perić", "1005983300036", 550, 5);
            Zaposlenik z1 = new Zaposlenik("Marko", "Marić", "1204975351451");
            Zaposlenik z2 = new Zaposlenik("Miro", "Mišić");
            Zaposlenik z3 = new Zaposlenik();

            List<Zaposlenik> platna = new List<Zaposlenik>();
            platna.Add(z);
            platna.Add(z1);
            platna.Add(z2);
            platna.Add(z3);

            // drugi način
            List<Zaposlenik> platna2 = new List<Zaposlenik>();
            {
                new Zaposlenik("Jure", "Perić", "1005983300036", 550, 5);
                new Zaposlenik("Marko", "Marić", "1204975351451");
                new Zaposlenik("Miro", "Mišić");
                new Zaposlenik();
            }

            Console.WriteLine("Unestite potrebne podatke kako bi se popunila platna lista za vas i vaše kolege.");
            UnosMetoda(platna[1]);
            UnosMetoda(platna[2]);
            UnosMetoda(platna[3]);

            foreach(Zaposlenik rad in platna)
            {
                Console.WriteLine("Zaposlenik {0} {1}, JMBG: {2}, sa {3} bodova i vrijednosti boda {4} kn," +
                    "\n ima {5} kn bruto plaću, od čega je {6} kn neto plaća i {7} kn porez na plaću.", 
                    rad.Ime,    
                    rad.Prezime,    
                    rad.JMBG,    
                    rad.BrojBodova,    
                    rad.VrijednostBoda,
                    rad.BrutoIzracun(),    
                    rad.NetoIzracun(),    
                    rad.PorezIzracun());
            }


            Console.ReadKey();
        }
        static Zaposlenik UnosMetoda(Zaposlenik radnik)
        {
            Zaposlenik z = radnik;
            if (z.Ime == null)
            {
                Console.Write("Unesite ime: ");
                z.Ime = Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Uneseno ime je {0}.", z.Ime);
            }
            if (z.Prezime == null)
            {
                Console.Write("Unesite prezime: ");
                z.Prezime = Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Uneseno prezime je {0}.", z.Prezime);
            }
            if (z.JMBG == null)
            {
                Console.Write("Unesite JMBG: ");
                z.JMBG = Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Unesen JMBG je {0}.", z.JMBG);
            }
            if (z.BrojBodova == 0)
            {
                Console.Write("Unesite broj bodova: ");
                z.BrojBodova = int.Parse(Console.ReadLine());
            }
            else
            {
                Console.WriteLine("Unesen broj brodova je {0}.", z.BrojBodova);
            }
            if (z.VrijednostBoda == 0)
            {
                Console.Write("Unesite vrijednost boda: ");
                z.VrijednostBoda = double.Parse(Console.ReadLine());
            }
            else
            {
                Console.WriteLine("Unesena vrijednost boda je {0}.", z.VrijednostBoda);
            }
            return z;
        }
    }
}
