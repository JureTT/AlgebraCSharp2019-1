using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatci_9._1._1___9._1._7_zbirka__manipulacija_
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("9.1.1 Znak u rečenici");
            string rijec = "Danas je suncan dan";
            char slovo = 'n';

            int brojac = 0;
            for (int i = 0; i < rijec.Length; i++)
            {
                if (rijec[i] == slovo)
                {
                    brojac++;
                }
            }
            Console.WriteLine("Znak {0} pojavljuje se u tekstu '{1}' {2} puta", slovo, rijec, brojac);

            Console.WriteLine("9.1.2 Riječ u rečenici");
            string recenica = "Danas je suncan dan, zato vam Dobar dan!";
            string rijec1 = "dan";

            string[] nizrijeci = recenica.Split(' ', ',', '!');

            int brojac1 = 0;
            for (int i = 0; i < nizrijeci.Count(); i++)
            {
                if (nizrijeci[i].ToLower() == rijec1.ToLower())
                {
                    brojac1++;
                }
            }
            Console.WriteLine("Riječ {0} pojavljuje se u tekstu '{1}' {2} puta", rijec1, recenica, brojac1);

            Console.WriteLine("9.1.3 Riječ u novi red");
            
            //nastavalja se na prethodni zadatak
            for (int i = 0; i < nizrijeci.Count(); i++)
            {
                Console.WriteLine(nizrijeci[i]); 
            }

            Console.WriteLine("9.1.4 Brojač riječi u novi red");
            
            Console.WriteLine("Rečenica '{0}' ima {1} riječi", recenica, nizrijeci.Count(x => x != " "));


            Console.ReadKey();
        }
    }
}
