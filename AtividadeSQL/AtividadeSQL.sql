CREATE DATABASE Filmes;
GO

USE Filmes;
GO

CREATE TABLE Produtoras (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NomeProdutora NVARCHAR(255) NOT NULL,
    OrcamentoFilme DECIMAL(18, 2),
    NomeDosProdutores NVARCHAR(255)
);
GO

CREATE TABLE Filmes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(255) NOT NULL,
    ElencoPrincipal NVARCHAR(500),
    Diretor NVARCHAR(255),
    Roteirista NVARCHAR(255),
    DataLancamento DATE,
    ProdutoraID INT NOT NULL,
    CONSTRAINT FK_Filmes_Produtoras FOREIGN KEY (ProdutoraID) REFERENCES Produtoras(ID)
);
GO

INSERT INTO Produtoras (NomeProdutora, OrcamentoFilme, NomeDosProdutores) 
VALUES 
('A24', 25000000.00, 'Daniel Katz, David Fenkel, John Hodges');
GO

INSERT INTO Filmes (Nome, ElencoPrincipal, Diretor, Roteirista, DataLancamento, ProdutoraID) VALUES
('Harry Potter e a Pedra Filosofal', 'Daniel Radcliffe, Emma Watson, Rupert Grint', 'Chris Columbus', 'Steve Kloves', '2001-11-23', 1),
('Interestelar', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', 'Christopher Nolan', 'Jonathan Nolan, Christopher Nolan', '2014-11-06', 1),
('Vingadores: Ultimato', 'Robert Downey Jr., Chris Evans, Mark Ruffalo', 'Anthony Russo, Joe Russo', 'Christopher Markus, Stephen McFeely', '2019-04-25', 1),
('O Cavaleiro das Trevas', 'Christian Bale, Heath Ledger, Aaron Eckhart', 'Christopher Nolan', 'Jonathan Nolan, Christopher Nolan', '2008-07-18', 1);
GO

SELECT * FROM Produtoras; -- Retorna todos os dados da tabela Produtoras
GO

SELECT * FROM Filmes; -- Retorna todos os dados da tabela Filmes
GO

SELECT * FROM Filmes WHERE ProdutoraID = 1; -- Irá Retonar todos os filmes com produtora 1
SELECT * FROM Produtoras WHERE NomeProdutora = 'A24'; -- Retorna Podutora A24

-- Adicionando campos na tabela filmes
ALTER TABLE Filmes
ADD OrcamentoFilme DECIMAL(18, 2),
    NomeDosProdutores NVARCHAR(MAX);
GO

-- Copia os dados existentes da tabela Produtoras para a tabela Filmes
UPDATE f
SET
    f.OrcamentoFilme = p.OrcamentoFilme,
    f.NomeDosProdutores = p.NomeDosProdutores
FROM
    Filmes AS f
JOIN
    Produtoras AS p ON f.ProdutoraID = p.ID;
GO

-- Removendo as tabelas adicionadas na tabela filmes
ALTER TABLE Produtoras
DROP COLUMN OrcamentoFilme,
            NomeDosProdutores;
GO

-- Criando a terceira tabela Bilheteria
CREATE TABLE Bilheteria (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NomePais NVARCHAR(100) NOT NULL,
    NumeroEspectadores BIGINT NOT NULL,

    FilmeID INT,
    CONSTRAINT FK_Espectadores_Filmes FOREIGN KEY (FilmeID) REFERENCES Filmes(ID)
);
GO

-- Populando terceira tabela
INSERT INTO Bilheteria (FilmeID, NomePais, NumeroEspectadores) VALUES
(7, 'EUA', 85000000),
(7, 'Brasil', 17000000),
(7, 'Reino Unido', 14000000),
(7, 'França', 11000000),
(7, 'Espanha', 8000000);

INSERT INTO Bilheteria (FilmeID, NomePais, NumeroEspectadores) VALUES
(8, 'EUA', 25000000),
(8, 'Canadá', 5000000),
(8, 'Reino Unido', 6000000),
(8, 'Argentina', 2000000);

INSERT INTO Bilheteria (FilmeID, NomePais, NumeroEspectadores) VALUES
(9, 'EUA', 45000000),
(9, 'Brasil', 8000000),
(9, 'Canadá', 4500000);

INSERT INTO Bilheteria (FilmeID, NomePais, NumeroEspectadores) VALUES
(10, 'EUA', 30000000),
(10, 'Reino Unido', 5000000),
(10, 'Brasil', 10000000);
GO

-- Selects
SELECT
    f.Nome AS TituloDoFilme,
    f.DataLancamento,
    p.NomeProdutora AS Produtora,
    b.NomePais AS Pais,
    b.NumeroEspectadores
FROM
    Filmes AS f
INNER JOIN
    Produtoras AS p ON f.ProdutoraID = p.ID
INNER JOIN
    Bilheteria AS b ON f.ID = b.FilmeID
ORDER BY
    TituloDoFilme, Pais;
GO

SELECT
    f.Nome AS TituloDoFilme,
    p.NomeProdutora AS Produtora,
    b.NumeroEspectadores
FROM
    Filmes AS f
INNER JOIN
    Produtoras AS p ON f.ProdutoraID = p.ID
INNER JOIN
    Bilheteria AS b ON f.ID = b.FilmeID
WHERE
    b.NomePais = 'Brasil' AND b.NumeroEspectadores > 10000000;
GO

SELECT
    f.Nome AS TituloDoFilme,
    b.NomePais AS Pais,
    b.NumeroEspectadores
FROM
    Filmes AS f
LEFT JOIN
    Bilheteria AS b ON f.ID = b.FilmeID
ORDER BY
    TituloDoFilme;
GO

SELECT
    f.Nome AS TituloDoFilme,
    SUM(b.NumeroEspectadores) AS TotalEspectadoresRegistrados
FROM
    Filmes AS f
JOIN
    Bilheteria AS b ON f.ID = b.FilmeID
GROUP BY
    f.Nome
ORDER BY
    TotalEspectadoresRegistrados DESC;
GO

SELECT
    p.NomeProdutora AS Produtora,
    f.Nome AS TituloDoFilme
FROM
    Filmes AS f
RIGHT JOIN
    Produtoras AS p ON f.ProdutoraID = p.ID
ORDER BY
    Produtora, TituloDoFilme;
GO

SELECT * FROM Bilheteria
