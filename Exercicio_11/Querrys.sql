use bdRestaurante

--Questão 5
select * from FORMAPAGAMENTO;
select * from PEDIDO;
select * from ITEMPEDIDO;
select * from CLIENTE;
select * from CATEGORIA;
select * from CARDAPIO;
select * from GARCOM;

--Questão 6
select * from CARDAPIO;

--Questão 7
select * 
from CARDAPIO
order by cat_codigo;

--Questão 8
select c.cli_nome, p.ped_data
from CLIENTE c inner join PEDIDO p on c.cli_codigo = p.cli_codigo;

--Questão 9
alter table CARDAPIO add car_saldo int;

--Questão 10
select fpg_nome from FORMAPAGAMENTO;

--Questão 11
select fpg_nome from FORMAPAGAMENTO 
where fpg_codigo not in (select distinct fpg_codigo from PEDIDO);

--Questão 12
select sum(i.itm_quantitdade), c.car_nome
from ITEMPEDIDO i inner join CARDAPIO c 
on c.car_codigo = i.car_codigo
group by c.car_nome
order by sum(i.itm_quantitdade) DESC, c.car_nome


--Questão 13
alter table CLIENTE add cli_cidade varchar(30), cli_uf varchar(2);

--Questão 14
update CLIENTE set cli_cidade = 'Santana de Parnaíba' where cli_codigo = 2 or cli_codigo = 4;
update CLIENTE set cli_cidade = 'Cajamar' where cli_codigo = 1 or cli_codigo = 3;
update CLIENTE set cli_uf = 'SP';

--Questão 15
select cli_nome, cli_email, cli_telefone, cli_cidade, cli_uf
from CLIENTE
order by cli_uf, cli_cidade;

--Questão 16
select sum(p.ped_valorTotal)
from PEDIDO p inner join FORMAPAGAMENTO fp on fp.fpg_codigo = p.fpg_codigo
where p.ped_data between '2024-01-01' and '2024-03-31'
group by fp.fpg_nome;

--Questão 17
insert GARCOM
       values('205', 'Willian', '----'),
             ('206', 'Paulo Eduardo', '----');

--Questão 18
select ct.cat_nome, sum(p.ped_valorTotal)
from PEDIDO p inner join ITEMPEDIDO i on p.ped_numero = i.ped_numero
inner join CARDAPIO c on c.car_codigo = i.car_codigo
inner join CATEGORIA ct on ct.cat_codigo = c.cat_codigo
where p.ped_data between '2024-01-01' and '2024-03-31'
group by ct.cat_nome;

--Questão 19
select c.car_nome, sum(i.itm_quantitdade)
from PEDIDO p inner join ITEMPEDIDO i on p.ped_numero = i.ped_numero
inner join CARDAPIO c on c.car_codigo = i.car_codigo
inner join  CATEGORIA ct on ct.cat_codigo = c.cat_codigo
where p.ped_data BETWEEN '2024-10-25' and '2024-09-25'
group by c.car_nome;

--Questão 20
select car_nome from CARDAPIO;

--Questão 21
select sum(p.ped_valorTotal)
from PEDIDO p inner join ITEMPEDIDO i on p.ped_numero = i.ped_numero
inner join GARCOM g on g.gar_codigo = i.gar_codigo
where p.ped_data between '2024-01-01' and '2024-03-31'
group by g.gar_nome;

--Questão 22
select g.gar_nome, sum(p.ped_valorTotal)
from PEDIDO p inner join ITEMPEDIDO i on p.ped_numero = i.ped_numero
inner join GARCOM g on g.gar_codigo = i.gar_codigo
group by g.gar_nome;

--Questão 23
select ped_data, AVG(ped_valorTotal)
from PEDIDO
where ped_data = '2024-10-19' or ped_data = '2024-10-20'
group by ped_data;

--Questão 24 /Revisar
select c.car_nome, c.car_preco, ct.cat_nome
from CARDAPIO c full join CATEGORIA ct on c.cat_codigo = ct.cat_codigo

--Questão 25
insert CATEGORIA
       values(1006, 'Pizza');

--Questão 26 /Revisar
select cl.cli_nome
from CLIENTE cl inner join pedido p on cl.cli_codigo = p.cli_codigo
inner join ITEMPEDIDO i on p.ped_numero = i.ped_numero
inner join CARDAPIO c on c.car_codigo = i.car_codigo
inner join CATEGORIA ct on ct.cat_codigo = c.cat_codigo
where ct.cat_codigo not in (select cat_codigo from CARDAPIO)
and c.car_codigo not in (select car_codigo from ITEMPEDIDO)
and p.ped_numero not in (select ped_numero from ITEMPEDIDO)
order by cl.cli_nome

--Questão 27
select p.ped_data, i.itm_numero, c.car_codigo, c.car_nome, i.itm_quantitdade, i.itm_valorUnitario, i.itm_valorTotalItem, g.gar_nome
from PEDIDO p inner join ITEMPEDIDO i on p.ped_numero = i.ped_numero
inner join CARDAPIO c on c.car_codigo = i.car_codigo
inner join GARCOM g on g.gar_codigo = i.gar_codigo
where p.ped_numero = 2003
order by c.car_nome

--Questão 28
alter table PEDIDO add ped_valorPessoa decimal(8,2)

--Questão 29
update PEDIDO set ped_valorPessoa = 0.50 where ped_numero = 2001
update PEDIDO set ped_valorPessoa = 73.50 where ped_numero = 2002
update PEDIDO set ped_valorPessoa = 97.00 where ped_numero = 2003

--Questão 30
select p.ped_data, c.cli_nome, p.ped_valorTotal, p.ped_numeroPessoas, p.ped_valorPessoa, p.ped_valorTotal
from PEDIDO p inner join CLIENTE c on c.cli_codigo = p.cli_codigo
order by p.ped_data, c.cli_nome