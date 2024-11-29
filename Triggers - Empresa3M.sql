use Empresa3M
go

--Trigger que impede a remoção de um dado da tabela Fornecedores se estiver assiciada a algum produto
create trigger tr_Apagar_Fornecedor on Fornecedores
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @Cod INT;
    SELECT @Cod = CodFor FROM deleted;

    IF EXISTS (SELECT 1 FROM Produtos WHERE CodFor = @Cod)
    BEGIN
        RAISERROR ('Não é possível apagar o fornecedor pois há produtos associados a ele', 16, 1)
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        DELETE FROM Fornecedores WHERE CodFor = @Cod;
    END
END;
go

create trigger tr_Ajustar_Saldo_Produto on DetalhesPed
AFTER INSERT
AS
BEGIN
    UPDATE Produtos
    SET Unidades = Unidades - i.Qtde
    FROM Produtos p 
    INNER JOIN inserted i ON p.CodProd = i.CodProd
END;
go