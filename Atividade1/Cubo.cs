using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atividades.Atividade1
{
    internal class Cubo
    {
        public double Lado { get; set; }


        public Cubo(double lado) 
        { 
            Lado = lado;
        }

        public double Volume(double lado)
        {
            Lado = lado;
            return Math.Pow(Lado, 3);
        }
    }
}
