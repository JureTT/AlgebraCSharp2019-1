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
            catch (FormatException fex)
            {
                Console.WriteLine("GREŠKA, pogrešan format: \n" 
                    + fex.Message 
                    + "\n"
                    + fex.ToString());
            }
            catch(Exception ex)
            {
                Console.WriteLine("GREŠKA, generička: " + ex.Message);
            }
            Console.ReadKey();

        }
    }
}
