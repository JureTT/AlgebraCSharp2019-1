namespace primjer_8._1._2_prirucnik
{
    internal class Nastavnik
    {
        private string ime = "Antonije Marcus";
        private int oib;

        // read only
        public string Ime { get => ime; }

        // write only
        public int Oib { set => oib = value; }
        public int PartialOib { get => int.Parse(oib.ToString().Substring(0,3)); }

        public Nastavnik()
        {
        }
        public static string Opis()
        {
            return "Nastavnik je osoba koja predaje u obrazovnima ustanovama";
        }
        /// <summary>
        /// Ovo dohvaća koeficijent za izračun plaće
        /// </summary>
        /// <returns>float</returns>
        public static float Koeficijent()
        {
            return 1.5f;
        }
        public override string ToString()
        {
            return "Moje ime je " +
                this.Ime +
                ", a moj OIB je " +
                this.PartialOib +
                "*********.";
        }
    }
}