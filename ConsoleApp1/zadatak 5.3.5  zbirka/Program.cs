using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_5._3._5__zbirka
{
    class Program
    {
        static void Main(string[] args)
        {
            // 5! = 120  (5*4*3*2*1)
            try
            {
                Console.WriteLine("Molim unesi donju granicu intervala:");
                int a = int.Parse(Console.ReadLine());
                Console.WriteLine("Molim unesi gornju granicu intervala:");
                int b = int.Parse(Console.ReadLine());

                if (a > b)
                {
                    throw new WrongIntervalNumberException("Gornja granica intervala je manja od donje!");
                }

                Console.WriteLine("Brojevi koji su deljivi sa 3 u zadanom intervalu su:");

                for (int i = a; i <= b; i++)
                {
                    if(i % 3 == 0)
                    {
                        Console.Write("{0} ",i);
                    }
                }
            }

            catch (WrongIntervalNumberException ex)
            {
                Console.WriteLine("Granice intervala nisu odgovarajuće." + ex.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            Console.ReadLine();

        }
    }
    public class WrongIntervalNumberException : Exception
    {
        public WrongIntervalNumberException()
        {
        }

        public WrongIntervalNumberException(string message)
            : base(message)
        {
        }

        public WrongIntervalNumberException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}
