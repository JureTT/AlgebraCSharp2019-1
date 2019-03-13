using System;

namespace primjer_8._3._1_prirucnik
{
    public abstract class Osoba
    {
        private string ime = "";
        public string prezime = "";
        public DateTime datumNastanka;

        public string Ime
        {
            get => ime;
            set => ime = ToUpper.FirstCharToUpper(value);
        }

        public Osoba()
        {
            this.datumNastanka = DateTime.Now;
            Console.WriteLine("Pozvana metoda Osoba:Osoba()");
        }
        protected Osoba(string ime, string prezime  )
        {
            this.ime = ime;
            this.prezime = prezime;
        }
    }
}