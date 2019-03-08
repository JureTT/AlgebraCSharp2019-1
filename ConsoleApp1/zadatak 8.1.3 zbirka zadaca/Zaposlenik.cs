using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._1._3_zbirka_zadaca
{
    class Zaposlenik
    {
        private string ime;
        private string prezime;
        private string jmbg;
        private int brojBodova;
        private double vrijednostBoda;
        private double porez;

        public string Ime
        {
            get => ime;
            set => ime = value;
        }
        public string Prezime
        {
            get => prezime;
            set => prezime = value;
        }
        public string JMBG
        {
            get => jmbg;
            set => jmbg = value;
        }
        public int BrojBodova
        {
            get => brojBodova;
            set => brojBodova = value;
        }
        public double VrijednostBoda
        {
            get => vrijednostBoda;
            set => vrijednostBoda = value;            
        }
        public double Porez
        {
            //get => porez = (NetoIzracun() < 3000) ? (NetoIzracun() * 0.06) : ((NetoIzracun() < 6000) ? (NetoIzracun() * 0.12) : (NetoIzracun() * 0.2));
            get => porez = PorezIzracun();
        }
        public double PorezIzracun()
        {
            double oder = 0;
            if (NetoIzracun() < 3000)
            {
                oder = NetoIzracun() * 0.06;
            }
            else if (NetoIzracun() < 6000)
            {
                oder = NetoIzracun() * 0.12;
            }
            else
            {
                oder = NetoIzracun() * 0.2;
            }
            return oder;
        }
        public double NetoIzracun()
        {
            double netoPlaca = this.BrojBodova * this.VrijednostBoda;
            return netoPlaca;
        }
        public double BrutoIzracun()
        {
            double brutoPlaca = this.NetoIzracun() + this.Porez;
            return brutoPlaca;
        }
        public Zaposlenik()
        {

        }
        public Zaposlenik(string ime, string prezime)
        {
            this.Ime = ime;
            this.Prezime = prezime;
        }
        public Zaposlenik(string ime, string prezime, string jmbg)
        {
            this.Ime = ime;
            this.Prezime = prezime;
            this.JMBG = jmbg;
        }
        public Zaposlenik(string ime, string prezime, string jmbg, int bodovi, double vrijednost) : this(ime, prezime, jmbg)    //   'fall through' metode
        {
            this.BrojBodova = bodovi;
            this.VrijednostBoda = vrijednost;
        }
    }
}
