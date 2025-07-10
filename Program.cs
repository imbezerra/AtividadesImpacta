using Atividades.Atividade1;
using Atividades.Atividade2;
using Atividades.Atividade3;
using Atividades.Atividade4;

// Atividade 1
Cubo cubo = new Cubo(10);
Console.WriteLine($"Volume do cubo: {cubo.Volume(cubo.Lado)}" + "m3");

// Atividade 2
NomeCompleto nomeCompleto = new NomeCompleto();
nomeCompleto.ExibirNome("João", "Silva", "Souza");
nomeCompleto.ExibirNome("João", "Souza");
nomeCompleto.ExibirNome("João");

// Atividade 3
Contador.ValorAtual = 0;  
Contador.Incrementar(); // Incrementa o contador
Contador.Incrementar();
Contador.ExibirValor();
Contador.Resetar(); // Reseta o contador
Contador.ExibirValor();

// Atividade 4
Treinamentos treinamento1 = new Treinamentos(1, "Treinamento de C#");
Console.WriteLine(treinamento1.GetTreinamento());
Treinamentos treinamento2 = new Treinamentos(2, "Treinamento de .NET");
Treinamentos treinamento3 = new Treinamentos(3, "Treinamento de ASP.NET");
Treinamentos treinamento4 = new Treinamentos(4, "Treinamento de Entity Framework");
// Essa lista pode ser implementada diretamente na classe Treinamentos
List<Treinamentos> listaTreinamentos = new List<Treinamentos> { treinamento1, treinamento2, treinamento3, treinamento4 };
foreach (var treinamento in listaTreinamentos) // Lista de Treinamentos
{
    Console.WriteLine(treinamento.GetTreinamento());
}
Console.WriteLine(treinamento2.ObterDescricaoTreinamento());
TreinamentoBase treinamentoBase = treinamento1; // Polimorfismo
