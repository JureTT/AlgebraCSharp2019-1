using Microsoft.VisualStudio.TestTools.UnitTesting;
using zadatak_8._2._1_zbirka_zadaca;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zadatak_8._2._1_zbirka_zadaca.Tests
{
    [TestClass()]
    public class MatikaTests
    {
        [TestMethod()]
        public void ZbrojTest()
        {
            Assert.AreEqual(5, Matika.Zbroj(2, 3));
            Assert.AreEqual(6, Matika.Zbroj(2.6, 3.4));
            //Assert.Fail();
        }

        [TestMethod()]
        public void KubTest()
        {
            Assert.AreEqual(8, Matika.Kub(2));
            Assert.AreEqual(27, Matika.Kub(3));
            //Assert.Fail();
        }

        [TestMethod()]
        public void UdaljenostTest()
        {
            Assert.AreEqual(2, Matika.Udaljenost(0, 0, 0, 2));
            Assert.AreEqual(2, Matika.Udaljenost(1, 1, 1, 3));
            Assert.AreEqual((2.82842712474619).ToString("F6"), (Matika.Udaljenost(2, 4, 4, 6)).ToString("F6"));
            Assert.AreNotEqual(2, Matika.Udaljenost(1, 1, 3, 3));
            //Assert.Fail();
        }

        [TestMethod()]
        public void ToFahrenTest()
        {
            Assert.AreEqual(60.8, Matika.ToFahren(16));
            Assert.AreEqual(32, Matika.ToFahren(0));
            Assert.AreEqual(118.4, Matika.ToFahren(48));
            Assert.AreEqual(23, Matika.ToFahren(-5));
            Assert.AreEqual(-508, Matika.ToFahren(-300));
            Assert.AreEqual(-5368, Matika.ToFahren(-3000));
            Assert.AreEqual(118.4, Matika.ToFahren(48));
            Assert.IsTrue(Matika.ToFahren(-150) >= -273);

            //Assert.Fail();
        }
    }
}