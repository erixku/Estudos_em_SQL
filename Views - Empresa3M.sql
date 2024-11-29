use Empresa3M
go

--Crie uma View chamada vw_Clientes_Ativos que exiba todos os
--clientes que têm um nome que começa com a letra 'A'.
create view vw_Clientes_Ativos AS
select distinct c.Nome
from Clientes c 
where c.nome like 'A%'
GO

select * from vw_Clientes_Ativos
GO

--Crie uma View chamada vw_Produtos_Fornecedores que 
--mostre a descrição do produto, o preço e o nome da empresa do fornecedor correspondente.
create view vw_Produtos_Fornecedores AS
select p.Descr, p.Preco, e.Empresa as Nome_Empresa
from Produtos p INNER JOIN Fornecedores e ON p.CodFor = e.CodFor
GO

select * from vw_Produtos_Fornecedores
GO

--Crie uma View chamada vw_Pedidos_Resumo que exiba
--o número do pedido, o nome do cliente, a data do pedido e o total do frete.
create view vw_Pedidos_Resumo AS
select p.NumPed, c.Nome, p.DataPed, p.Frete
from Pedidos p INNER JOIN Clientes c ON p.CodCli = c.CodCli
GO

select * from vw_Pedidos_Resumo
go


--Anotações sobre as Views:
--1. A criação de uma View é feita com a instrução CREATE VIEW.
--2. A View é uma tabela virtual, ou seja, não armazena dados em si
--3. A View pode ser criada com base em uma tabela ou em uma combinação
--   de tabelas.
--4. A View pode ser usada como se fosse uma tabela real, ou seja,
--   pode ser usada em consultas, inserções, atualizações e exclusões.
--5. A View pode ser usada para simplificar consultas complexas.
--6. A View pode ser usada para ocultar detalhes de implementação de uma
--   tabela.
--7. A View pode ser usada para fornecer uma visão resumida de dados
