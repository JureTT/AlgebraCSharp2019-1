using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_7._2._2
{
    class Program
    {
        static void Main(string[] args)
        {
            Pozdrav("Pero");
            Pozdrav("Pero","Perić");
            Pozdrav(prezime:"Perić", ime:"Ime");    // ako se želi drugim redosljedom unjeti varijable,
                                                    // moraju se imenovati varijable i dodati im se vrijednosti dvotočkom 

            Console.ReadLine();
        }

        static void Pozdrav(string ime)
        {
            Console.WriteLine("Dobar dan, " + ime + "!");
        }

        static void Pozdrav(string ime, string prezime)
        {
            Console.WriteLine("Dobar dan, " + ime + " " + prezime + "!");
        }
    }
}
