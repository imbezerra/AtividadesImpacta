using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atividades.Atividade2
{
    internal class NomeCompleto
    {
        public void ExibirNome(string primeiroNome, string nomeDoMeio, string ultimoNome)
        {
            Console.WriteLine($"Nome completo: {primeiroNome} {nomeDoMeio} {ultimoNome}");
        }
        public void ExibirNome(string primeiroNome, string ultimoNome)
        {
            Console.WriteLine($"Nome e Sobrenome: {primeiroNome} {ultimoNome}");
        }
        public void ExibirNome(string primeiroNome)
        {
            Console.WriteLine($"Nome: {primeiroNome}");
        }
    }
}
