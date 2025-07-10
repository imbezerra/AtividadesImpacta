using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atividades.Atividade4
{
    internal class Treinamentos : TreinamentoBase
    {
        public int IdTreinamento { get; set; }
        public string? NomeTreinamento { get; set; }

        public Treinamentos(int id, string nome)
        {
            IdTreinamento = id;
            NomeTreinamento = nome;
        }

        public void SetTreinamentos(int id, string nome)
        {
            IdTreinamento = id;
            NomeTreinamento = nome;
        }

        public string GetTreinamento()
        {
            return $"Id: {IdTreinamento}, Nome: {NomeTreinamento}";
        }

        public override string ObterDescricaoTreinamento()
        {
            return $"Treinamento: {NomeTreinamento}, ID: {IdTreinamento}";
        }

    }
}
