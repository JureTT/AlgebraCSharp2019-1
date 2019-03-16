using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._2._3_exception
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("Unesite cijeli broj:");
                int a = int.Parse(Console.ReadLine());
                if (a > 0)
                {
                    Console.WriteLine("Uneseni broj je pozitivan.");
                }
                else if (a > 0)
                {
                    Console.WriteLine("Uneseni broj NIJE pozitivan.");
                }
                else
                {
                    Console.WriteLine("Uneseni broj je jednak nuli.");
                }

            }
            catch (FormatException fex)         // hvata grešku formata
            {
                Console.WriteLine("GREŠKA, nije unešen numerički znak: "
                    + fex.Message
                    + "\n"
                    + fex.ToString());
            }
            catch (Exception ex)                // hvata općenito grešku
            {
                Console.WriteLine("GREŠKA, generička: " + ex.Message + ex.ToString());
            }
            finally
            {
                Console.ReadKey();
            }

        }
    }
}
