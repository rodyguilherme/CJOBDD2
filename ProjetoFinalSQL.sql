-- Tabela IMOBILIARIA
CREATE TABLE IMOBILIARIA (
    id_imobiliaria INT PRIMARY KEY,
    nome_fantasia VARCHAR(100) NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    telefone VARCHAR(20) NULL,
    email VARCHAR(100) NULL
);
GO

-- Tabela CORRETOR
CREATE TABLE CORRETOR (
    id_corretor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(100) NULL,
    telefone VARCHAR(20) NULL,
    id_imobiliaria INT NOT NULL FOREIGN KEY REFERENCES IMOBILIARIA(id_imobiliaria)
);
GO

-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(100) NULL,
    telefone VARCHAR(20) NULL
);
GO

-- Tabela COMISSAO
CREATE TABLE COMISSAO (
    id_comissao INT PRIMARY KEY,
    percentual DECIMAL(5,2) NOT NULL,
    valor_comissao DECIMAL(10,2) NOT NULL
);
GO

-- Tabela META_VENDAS
CREATE TABLE META_VENDAS (
    id_meta INT PRIMARY KEY,
    mes INT NOT NULL,
    ano INT NOT NULL,
    valor_esperado DECIMAL(10,2) NOT NULL,
    id_corretor INT NOT NULL FOREIGN KEY REFERENCES CORRETOR(id_corretor)
);
GO

-- Tabela IMOVEL
CREATE TABLE IMOVEL (
    id_imovel INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    bairro VARCHAR(100) NULL,
    cidade VARCHAR(100) NULL,
    estado VARCHAR(2) NULL,
    preco DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    id_imobiliaria INT NOT NULL FOREIGN KEY REFERENCES IMOBILIARIA(id_imobiliaria)
);
GO

-- Tabela VENDA
CREATE TABLE VENDA (
    id_venda INT PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_corretor INT NOT NULL FOREIGN KEY REFERENCES CORRETOR(id_corretor),
    id_comissao INT UNIQUE FOREIGN KEY REFERENCES COMISSAO(id_comissao),
    id_imovel INT UNIQUE FOREIGN KEY REFERENCES IMOVEL(id_imovel),
    id_cliente INT NOT NULL FOREIGN KEY REFERENCES CLIENTE(id_cliente)
);
GO

-- Inserindo 1 Imobiliária
INSERT INTO IMOBILIARIA (id_imobiliaria, nome_fantasia, razao_social, cnpj, telefone, email)
VALUES (1, 'Visão Imobiliária', 'Visão Imobiliária LTDA', '12.345.678/0001-99', '(11)1234-5678', 'contato@visaoimobiliaria.com');
GO

-- Inserindo 8 Corretores
INSERT INTO CORRETOR (id_corretor, nome, cpf, email, telefone, id_imobiliaria) VALUES
(1, 'Carlos Silva', '111.111.111-11', 'carlos@visao.com', '(11)90000-0001', 1),
(2, 'Maria Souza', '222.222.222-22', 'maria@visao.com', '(11)90000-0002', 1),
(3, 'João Pereira', '333.333.333-33', 'joao@visao.com', '(11)90000-0003', 1),
(4, 'Ana Costa', '444.444.444-44', 'ana@visao.com', '(11)90000-0004', 1),
(5, 'Pedro Santos', '555.555.555-55', 'pedro@visao.com', '(11)90000-0005', 1),
(6, 'Fernanda Lima', '666.666.666-66', 'fernanda@visao.com', '(11)90000-0006', 1),
(7, 'Ricardo Alves', '777.777.777-77', 'ricardo@visao.com', '(11)90000-0007', 1),
(8, 'Juliana Rocha', '888.888.888-88', 'juliana@visao.com', '(11)90000-0008', 1);
GO

-- Inserindo 20 Imóveis
INSERT INTO IMOVEL (id_imovel, tipo, endereco, bairro, cidade, estado, preco, status, id_imobiliaria) VALUES
(1, 'Apartamento', 'Rua das Flores, 100', 'Centro', 'São Paulo', 'SP', 350000.00, 'Disponível', 1),
(2, 'Casa', 'Av. Brasil, 200', 'Jardins', 'São Paulo', 'SP', 750000.00, 'Disponível', 1),
(3, 'Apartamento', 'Rua Verde, 50', 'Pinheiros', 'São Paulo', 'SP', 420000.00, 'Disponível', 1),
(4, 'Casa', 'Rua Azul, 300', 'Morumbi', 'São Paulo', 'SP', 1200000.00, 'Disponível', 1),
(5, 'Apartamento', 'Av. Paulista, 1500', 'Bela Vista', 'São Paulo', 'SP', 600000.00, 'Disponível', 1),
(6, 'Casa', 'Rua das Palmeiras, 80', 'Moema', 'São Paulo', 'SP', 950000.00, 'Disponível', 1),
(7, 'Apartamento', 'Rua das Acácias, 20', 'Vila Mariana', 'São Paulo', 'SP', 500000.00, 'Disponível', 1),
(8, 'Casa', 'Rua das Hortênsias, 15', 'Campo Belo', 'São Paulo', 'SP', 850000.00, 'Disponível', 1),
(9, 'Apartamento', 'Rua das Orquídeas, 45', 'Liberdade', 'São Paulo', 'SP', 380000.00, 'Disponível', 1),
(10, 'Casa', 'Rua das Magnólias, 70', 'Santana', 'São Paulo', 'SP', 720000.00, 'Disponível', 1),
(11, 'Apartamento', 'Rua das Oliveiras, 33', 'Tatuapé', 'São Paulo', 'SP', 410000.00, 'Disponível', 1),
(12, 'Casa', 'Rua das Bromélias, 90', 'Itaim Bibi', 'São Paulo', 'SP', 1100000.00, 'Disponível', 1),
(13, 'Apartamento', 'Rua das Camélias, 12', 'Aclimação', 'São Paulo', 'SP', 370000.00, 'Disponível', 1),
(14, 'Casa', 'Rua das Tulipas, 25', 'Brooklin', 'São Paulo', 'SP', 980000.00, 'Disponível', 1),
(15, 'Apartamento', 'Rua das Rosas, 55', 'Consolação', 'São Paulo', 'SP', 450000.00, 'Disponível', 1),
(16, 'Casa', 'Rua das Violetas, 100', 'Lapa', 'São Paulo', 'SP', 650000.00, 'Disponível', 1),
(17, 'Apartamento', 'Rua das Dalias, 77', 'Barra Funda', 'São Paulo', 'SP', 390000.00, 'Disponível', 1),
(18, 'Casa', 'Rua das Gardênias, 88', 'Butantã', 'São Paulo', 'SP', 800000.00, 'Disponível', 1),
(19, 'Apartamento', 'Rua das Azaleias, 99', 'Sé', 'São Paulo', 'SP', 360000.00, 'Disponível', 1),
(20, 'Casa', 'Rua das Jacarandás, 120', 'Perdizes', 'São Paulo', 'SP', 890000.00, 'Disponível', 1);
GO

-- Inserindo 10 Clientes
INSERT INTO CLIENTE (id_cliente, nome, cpf, email, telefone) VALUES
(1, 'André Oliveira', '999.111.111-11', 'andre@cliente.com', '(11)91000-0001'),
(2, 'Beatriz Mendes', '999.222.222-22', 'beatriz@cliente.com', '(11)91000-0002'),
(3, 'Cláudio Ramos', '999.333.333-33', 'claudio@cliente.com', '(11)91000-0003'),
(4, 'Daniela Martins', '999.444.444-44', 'daniela@cliente.com', '(11)91000-0004'),
(5, 'Eduardo Ferreira', '999.555.555-55', 'eduardo@cliente.com', '(11)91000-0005'),
(6, 'Fernanda Gomes', '999.666.666-66', 'fernanda@cliente.com', '(11)91000-0006'),
(7, 'Gabriel Costa', '999.777.777-77', 'gabriel@cliente.com', '(11)91000-0007'),
(8, 'Helena Rocha', '999.888.888-88', 'helena@cliente.com', '(11)91000-0008'),
(9, 'Igor Almeida', '999.999.999-99', 'igor@cliente.com', '(11)91000-0009'),
(10, 'Juliana Ribeiro', '999.000.000-00', 'juliana@cliente.com', '(11)91000-0010');
GO

-- Inserindo Metas de Vendas para os Corretores
INSERT INTO META_VENDAS (id_meta, mes, ano, valor_esperado, id_corretor) VALUES
(1, 5, 2026, 500000.00, 1),
(2, 5, 2026, 450000.00, 2),
(3, 5, 2026, 400000.00, 3),
(4, 5, 2026, 600000.00, 4),
(5, 5, 2026, 550000.00, 5),
(6, 5, 2026, 480000.00, 6),
(7, 5, 2026, 520000.00, 7),
(8, 5, 2026, 470000.00, 8);
GO

-- Inserindo 12 Comissões
INSERT INTO COMISSAO (id_comissao, percentual, valor_comissao) VALUES
(1, 5.00, 17500.00),
(2, 5.00, 37500.00),
(3, 5.00, 21000.00),
(4, 5.00, 60000.00),
(5, 5.00, 30000.00),
(6, 5.00, 47500.00),
(7, 5.00, 25000.00),
(8, 5.00, 42500.00),
(9, 5.00, 19000.00),
(10, 5.00, 36000.00),
(11, 5.00, 20500.00),
(12, 5.00, 55000.00);
GO

-- Inserindo 12 Vendas
INSERT INTO VENDA (id_venda, data_venda, valor_total, id_corretor, id_comissao, id_imovel, id_cliente) VALUES
(1, '2026-05-01', 350000.00, 1, 1, 1, 1),
(2, '2026-05-02', 750000.00, 2, 2, 2, 2),
(3, '2026-05-03', 420000.00, 3, 3, 3, 3),
(4, '2026-05-04', 1200000.00, 4, 4, 4, 4),
(5, '2026-05-05', 600000.00, 5, 5, 5, 5),
(6, '2026-05-06', 950000.00, 6, 6, 6, 6),
(7, '2026-05-07', 500000.00, 7, 7, 7, 7),
(8, '2026-05-08', 850000.00, 8, 8, 8, 8),
(9, '2026-05-09', 380000.00, 1, 9, 9, 9),
(10, '2026-05-10', 720000.00, 2, 10, 10, 10),
(11, '2026-05-11', 410000.00, 3, 11, 11, 1),
(12, '2026-05-12', 1100000.00, 4, 12, 12, 2);
GO

-- Consulta 1: Listar todos os corretores
SELECT id_corretor, nome, telefone, email
FROM CORRETOR;
GO

-- Consulta 2: Listar todos os clientes
SELECT id_cliente, nome, email
FROM CLIENTE;
GO

-- Consulta 3: Listar todos os imóveis disponíveis
SELECT id_imovel, tipo, endereco, preco, status
FROM IMOVEL
WHERE status = 'Disponível';
GO

-- Consulta 4: Listar todas as vendas realizadas
SELECT id_venda, data_venda, valor_total
FROM VENDA;
GO

-- Consulta 5: Imóveis por preço crescente
SELECT tipo, endereco, preco
FROM IMOVEL
ORDER BY preco ASC;
GO

-- Consulta 6: Imóveis por preço decrescente
SELECT tipo, endereco, preco
FROM IMOVEL
ORDER BY preco DESC;
GO

-- Consulta 7: Corretores em ordem alfabética
SELECT nome, email
FROM CORRETOR
ORDER BY nome ASC;
GO

-- Consulta 8: Vendas por ordem de data (mais recentes primeiro)
SELECT id_venda, data_venda, valor_total
FROM VENDA
ORDER BY data_venda DESC;
GO

-- Consulta 9: Mostrar nome do cliente e imóvel comprado
SELECT c.nome AS NomeCliente, i.tipo AS TipoImovel, i.endereco
FROM VENDA v
JOIN CLIENTE c ON v.id_cliente = c.id_cliente
JOIN IMOVEL i ON v.id_imovel = i.id_imovel;
GO

-- Consulta 10: Mostrar nome do corretor e total de vendas realizadas
SELECT cor.nome AS NomeCorretor, COUNT(v.id_venda) AS TotalVendas
FROM VENDA v
JOIN CORRETOR cor ON v.id_corretor = cor.id_corretor
GROUP BY cor.nome;
GO

-- Consulta 11: Atualizar telefone de um corretor e conferir resultado
UPDATE CORRETOR
SET telefone = '(11)98888-1111'
WHERE id_corretor = 2;
GO

SELECT id_corretor, nome, telefone
FROM CORRETOR
WHERE id_corretor = 2;
GO

-- Consulta 12: Atualizar status de um imóvel para 'Vendido' e conferir resultado
UPDATE IMOVEL
SET status = 'Vendido'
WHERE id_imovel = 4;
GO

SELECT id_imovel, tipo, endereco, status
FROM IMOVEL
WHERE id_imovel = 4;
GO

-- Consulta 13: Atualizar e-mail de um cliente e conferir resultado
UPDATE CLIENTE
SET email = 'cliente.atualizado@email.com'
WHERE id_cliente = 5;
GO

SELECT id_cliente, nome, email
FROM CLIENTE
WHERE id_cliente = 5;
GO

-- Consulta 14: Excluir vendas com valor menor que 400.000 e conferir resultado
DELETE FROM VENDA
WHERE valor_total < 400000.00;
GO

SELECT id_venda, valor_total
FROM VENDA;
GO

-- Consulta 15: Exibir os corretores que já realizaram vendas
SELECT DISTINCT c.id_corretor, c.nome
FROM VENDA v
JOIN CORRETOR c ON v.id_corretor = c.id_corretor;
GO

-- Consulta 16: Exibir corretores cujo nome seja diferente de 'Carlos'
SELECT * 
FROM CORRETOR
WHERE nome <> 'Carlos';
GO

-- Consulta 17: Exibir clientes cujo e-mail não seja 'joao@cliente.com'
SELECT * 
FROM CLIENTE
WHERE email != 'joao@cliente.com';
GO

-- Consulta 18: Exibir imóveis cujo preço esteja entre 300.000 e 700.000
SELECT id_imovel, tipo, endereco, preco
FROM IMOVEL
WHERE preco BETWEEN 300000 AND 700000;
GO

-- Consulta 19: Exibir vendas com valor entre 500.000 e 900.000
SELECT id_venda, data_venda, valor_total
FROM VENDA
WHERE valor_total >= 500000 AND valor_total <= 900000;
GO

-- Consulta 20: Exibir imóveis vendidos (status = 'Vendido')
SELECT id_imovel, tipo, endereco, status
FROM IMOVEL
WHERE status = 'Vendido';
GO
-- Consulta 21: Criar função para calcular comissão de uma venda
CREATE FUNCTION fn_ComissaoVenda(@valor MONEY)
RETURNS MONEY
AS
BEGIN
    RETURN @valor * 0.05; -- 5% de comissão
END;
GO

-- Consulta 22: Usar função fn_ComissaoVenda e mostrar resultado
SELECT id_venda, valor_total,
       dbo.fn_ComissaoVenda(valor_total) AS 'Comissão'
FROM VENDA;
GO


-- Consulta 23: Criar trigger para impedir exclusão de corretores
CREATE TRIGGER trg_BloqueiaExclusaoCorretor
ON CORRETOR
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Não é permitido excluir corretores!';
END;
GO

-- Consulta 24: Testar trigger tentando excluir um corretor
DELETE FROM CORRETOR WHERE id_corretor = 2;
GO

-- Consulta 25: Exibir triggers criados
SELECT * FROM sys.triggers;
GO

-- Consulta 26: Criar cursor para listar clientes
DECLARE curCLIENTE CURSOR FOR
SELECT nome FROM CLIENTE;
OPEN curCLIENTE;
FETCH NEXT FROM curCLIENTE;
CLOSE curCLIENTE;
DEALLOCATE curCLIENTE;
GO

-- Consulta 27: Criar cursor para listar imóveis
DECLARE curIMOVEL CURSOR FOR
SELECT tipo FROM IMOVEL;
OPEN curIMOVEL;
FETCH NEXT FROM curIMOVEL;
CLOSE curIMOVEL;
DEALLOCATE curIMOVEL;
GO

-- Consulta 28: Usar variável para armazenar resultado do cursor de corretores
DECLARE curCORRETOR CURSOR FOR
SELECT nome FROM CORRETOR;
DECLARE @nome CHAR(50);
OPEN curCORRETOR;
FETCH NEXT FROM curCORRETOR INTO @nome;
PRINT @nome;
CLOSE curCORRETOR;
DEALLOCATE curCORRETOR;
GO

-- Consulta 29: Exibir vendas com os imóveis e seus respectivos corretores
SELECT v.id_venda, i.tipo AS TipoImovel, i.endereco, c.nome AS NomeCorretor
FROM VENDA v
JOIN IMOVEL i ON v.id_imovel = i.id_imovel
JOIN CORRETOR c ON v.id_corretor = c.id_corretor;
GO


-- Consulta 30: Exibir clientes e suas compras
SELECT cl.nome AS NomeCliente, im.tipo AS TipoImovel, v.valor_total
FROM VENDA v
JOIN CLIENTE cl ON v.id_cliente = cl.id_cliente
JOIN IMOVEL im ON v.id_imovel = im.id_imovel;
GO
