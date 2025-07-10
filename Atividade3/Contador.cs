using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atividades.Atividade3
{
    internal class Contador
    {
        public static int ValorAtual { get; set; } = 0;

        public static void Incrementar()
        {
            ValorAtual++;
        }

        public static void Decrementar()
        {
            ValorAtual--;
        }

        public static void Resetar()
        {
            ValorAtual = 0;
        }

        public static void ExibirValor()
        {
            Console.WriteLine($"Valor atual do contador: {ValorAtual}");
        }
    }
}
