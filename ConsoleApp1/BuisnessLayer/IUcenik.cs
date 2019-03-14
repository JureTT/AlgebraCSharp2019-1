using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BuisnessLayer
{
    public interface IUcenik
    {
        double Prosjek();
        string ToString();
        void PrijaviIspit(Ispit ispit);
    }
}
