using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace probica_exception
{
    class Program
    {
        static void Main(string[] args)
        {
            object o2 = null;
            try
            {
                int i2 = (int)o2;
            }
            catch (ArgumentException ex) when (ex.ParamName == null)
            {
                Console.WriteLine(ex.ToString());
            }
            catch (InvalidCastException e)
            {
                Console.WriteLine(e.ToString());
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            try
            {
                Console.WriteLine("Unesite broj:");
                int a = int.Parse(Console.ReadLine());
                Console.WriteLine("Unešen je broj {0}", a);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Dogodila se greška u programu!");
                Console.WriteLine("Opis greške: " + ex.Message);
                Console.WriteLine("Opis greške: " + ex.ToString());
            }
            finally
            {
                Console.WriteLine("Pritisnite neku tipku za kraj.");
            }

            Console.ReadKey();
        }
    }
}
