using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Primjer_6._1._1
{
    class Program
    {
        static void Main(string[] args)
        {
            //deklaracija
            int?[] niz = new int?[3];       // upitnik ?  je dodan kako bi vrijedosti u nizu, int-ovi, mogli biti null

            // inicijalizacija
            niz[0] = 55;
            niz[2] = null;   //  --- null exception (obični) 
            niz[1] = 22;
            //niz[2] = 77;
            try
            {
                for (int i = 0; i < niz.Length; i++)
                {
                    if (niz[i] == null) 
                    {
                        throw new Exception("Niz sadrži ne inicijaliziranu vrijednost na indexu: " + i);
                    }
                    Console.WriteLine((i + 1) + ".: " + niz[i] + " " + niz[5]); // + niz[5]);     ---   out of range exception
                }
            }
            catch(IndexOutOfRangeException ioorex)
            {
                Console.WriteLine("Pokušali ste dohvatiti nepostojeći član niza. \n" + ioorex.ToString());
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            Console.ReadKey();
        }
    }
}
