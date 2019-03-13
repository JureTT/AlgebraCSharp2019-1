using System;

namespace primjer_8._3._1_prirucnik
{
    public abstract class Osoba
    {
        public string ime = "";
        public string prezime = "";
        public DateTime datumNastanka;
        public Osoba()
        {
            this.datumNastanka = DateTime.Now;
            Console.WriteLine("Pozvana metoda Osoba:Osoba()");
        }
        protected Osoba(string v1, string v2)
        {
            this.ime = v1;
            this.prezime = v2;
        }
    }
}