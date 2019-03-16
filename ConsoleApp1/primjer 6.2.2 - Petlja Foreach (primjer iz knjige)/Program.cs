using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primjer_6._2._2___Petlja_Foreach__primjer_iz_knjige_
{
    class Program
    {
        static void Main(string[] args)
        {
            ArrayList arr = new ArrayList();
            Console.WriteLine("Unosimo nekoliko različitih tipova.");

            arr.Add(3);
            arr.Add(true);
            arr.Add(9);
            arr.Add("jedenaest");
            arr.Add(13);
            
            //ispis
            for (int i = 0; i < arr.Count; i++)
            {
                try
                {
                    Console.WriteLine(int.Parse(arr[i].ToString()));
                }
                catch
                {
                    Console.WriteLine("Varijabla nije u formatu koji se pretvoriti u int.");
                }
            }
            
            Console.ReadKey();
        }
    }
}
