using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_5._3._4_prirucnik__faktorijel_
{
    class Program
    {
        static void Main(string[] args)
        {
            // 5! = 120  (5*4*3*2*1)
            try
            {
                Console.WriteLine("Molim unesi cijeli pozitivni broj:");
                int a = int.Parse(Console.ReadLine());
                if (a <= 0)
                {
                    throw new NegativeNumberException("NEGATIVAN BROJ!");
                }

                if (a >= 20)
                {
                    throw new VeciOdDvajstException("BROJ > 19!");
                }

                int fact = 1;

                for (int i = a; i > 0; i--)
                {
                    fact *= i;
                }

                Console.WriteLine(fact);
            }
            catch (NegativeNumberException ex)
            {
                Console.WriteLine("Dozvoljeni borjevi su u intervalu [1,19]" + ex.ToString());
            }
            catch (VeciOdDvajstException exp)
            {
                Console.WriteLine("Broj je prevelik, rezultat je veći od dimenzije 'int' (2 147 483 647)." + exp.ToString());
            }
            catch (Exception exep)
            {
                Console.WriteLine(exep.ToString());
            }

             Console.ReadLine();

            
        }
    }
    public class NegativeNumberException : Exception
    {
        public NegativeNumberException()
        {
        }

        public NegativeNumberException(string message)
            : base (message)
        {
        }

        public NegativeNumberException(string message, Exception inner)
            : base (message, inner)
        {
        }
    }
    public class VeciOdDvajstException : Exception
    {
        public VeciOdDvajstException()
        {
        }

        public VeciOdDvajstException(string message)
            : base(message)
        {
        }

        public VeciOdDvajstException(string message, Exception inner)
            : base (message, inner)
        {
        }
    }
}
