namespace BuisnessLayer
{
    public class Ispit
    {
        private string naziv = "Matematika";

        public string Naziv { get => naziv; set => naziv = value; }
        
        public Ispit(string predmet)
        {
            this.naziv = predmet;
        }
    }
}