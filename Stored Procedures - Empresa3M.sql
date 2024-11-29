use Empresa3M
go

--Procedure que cria um novo registro na tabela Fornecedores
create procedure sp_Inserir_Resumo(@Empresa varchar(40), @Contato varchar(30), @Cargo varchar(30), @Endereco varchar(60), @Cidade varchar(15), @CEP varchar(10), @Pais varchar(15)) as
begin
    insert into Fornecedores(Empresa, Contato, Cargo, Endereco, Cidade, CEP, Pais)
    values (@Empresa, @Contato, @Cargo, @Endereco, @Cidade, @CEP, @Pais)
END
GO

--Procedure que atualiza o salário de um funcionário especificado
create procedure sp_Atualizar_Salario (@CodFun int, @Salario money) AS
begin
    update Funcionarios set Salario = @Salario where CodFun = @CodFun
END
GO

--Procedure que retorna os pedidos de um cliente especificado
create procedure sp_Consultar_Pedidos (@CodCli int) AS
begin
    select * from Pedidos where CodCli = @CodCli
end
go

--Antoações sobre Stored Procedures:
--1. Uma stored procedure pode ser chamada várias vezes, sem a necessidade
--   de recriar o código da procedure
--2. Uma stored procedure pode ser chamada de qualquer lugar do banco de dados
--3. Uma stored procedure armazena instruções que podem ser executadas com variáveis passadas
--   por parâmetros, assim como funções em uma linguagem estruturada ou métodos em uma orientada a objetos
