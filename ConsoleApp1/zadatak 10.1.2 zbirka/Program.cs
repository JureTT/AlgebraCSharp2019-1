using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_10._1._2_zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Upis brojeva djeljivih sa 3 i 7 u datoteke/fajlove.");

            string brojevi = "";
            string brojevi2 = "";
            for (int i = 0; i <= 100; i++)
            {
                if ( i % 3 == 0 || i % 7 == 0)
                {
                    brojevi += i + "    \n";
                    brojevi2 += i + ",  ";
                }

            }

            //  kreiranje handle-a
            FileStream fs1 = new FileStream("3or7uNoviRed.txt", FileMode.Create);
            StreamWriter sw1 = new StreamWriter(fs1);
            sw1.WriteLine(brojevi);

            FileStream fs2 = new FileStream("3or7saZarezima.txt", FileMode.Create);
            StreamWriter sw2 = new StreamWriter(fs2);
            sw2.WriteLine(brojevi2);

            sw1.Flush();
            sw1.Close();
            fs1.Close();

            sw2.Flush();
            sw2.Close();
            fs2.Close();


            // pogledat profesorovo riješenje zadatka

            Console.ReadKey();
        }
    }
}
