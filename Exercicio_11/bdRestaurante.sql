create database bdRestaurante;
use bdRestaurante;

--SESSÃO DE CRIAÇÃO DE TABELAS
create table CLIENTE(
    cli_codigo  int     not null,
    cli_cpf     varchar(14) not null,
    cli_nome    varchar(60) not null,
    cli_dataNasc    varchar(10) not null,
    cli_email       varchar(60) not null,
    cli_telefone    varchar(30) not null,

    primary key(cli_codigo)
);

create table FORMAPAGAMENTO(
    fpg_codigo  int     not null,
    fpg_nome    varchar(30) not null,

    primary key(fpg_codigo)
);

create table GARCOM(
    gar_codigo  int     not null,
    gar_nome    varchar(14) not null,
    gar_horarioTrabalho     varchar(20) not null,

    primary key(gar_codigo)
);

create table CATEGORIA(
    cat_codigo  int     not null,
    cat_nome    varchar(30) not null,

    primary key(cat_codigo)
);

create table CARDAPIO(
    car_codigo  int     not null,
    car_nome    varchar(60) not null,
    car_preco   decimal(8,2)    not null,
    car_unidade varchar(05)     not null,
    cat_codigo  INT     not null,

    primary key(car_codigo),
    constraint cat_codigo foreign key (cat_codigo) references CATEGORIA(cat_codigo)
);

create table PEDIDO(
    ped_numero  int     not null,
    ped_data    varchar(10) not null,
    ped_numeroPessoas   int     not null,
    ped_valorTotal  decimal(8,2)    not null,
    cli_codigo  int     not null,
    fpg_codigo  int     not null,

    primary key(ped_numero),
    constraint cli_codigo foreign key (cli_codigo) references CLIENTE(cli_codigo),
    constraint fpg_codigo foreign key (fpg_codigo) references FORMAPAGAMENTO(fpg_codigo)
);

create table ITEMPEDIDO(
    itm_numero  int     not null,
    itm_quantitdade int not null,
    itm_valorUnitario   decimal(8,2)    not null,
    itm_valorTotalItem  decimal(8,2)    not null,
    gar_codigo  int     not null,
    ped_numero  int     not null,
    car_codigo  int     not null,

    primary key(itm_numero),
    constraint gar_codigo foreign key(gar_codigo) references GARCOM(gar_codigo),
    constraint ped_numero foreign key(ped_numero) references PEDIDO(ped_numero),
    constraint car_codigo foreign key(car_codigo) references CARDAPIO(car_codigo)
);

--SESSÃO DE INSERÇÕES DO BANCO DE DADOS
insert CLIENTE
       values(1, '123.456.789-11', 'Erick', '2005-12-16', 'erick@gmail.com', '(11)91234-5678'),
             (2, '321.654.987-22', 'Anna Júlia', '2005-06-02', 'naju@gmail.com', '(11)94321-8765'),
             (3, '987.654.321-33', 'Alana', '2002-06-11', 'lana@gmail.com', '(11)95678-1234'),
             (4, '789.456.123-44', 'Lucas', '2005-06-11', 'lucas@gmail.com', '(11)93124-8756');

insert FORMAPAGAMENTO
       values(101, 'Débito'),
             (102, 'Crétido'),
             (103, 'Dinheiro'),
             (104, 'PIX');

insert GARCOM
       values(201, 'Clodoaldo', '08:00 até 18:00'),
             (202, 'Emerson', '13:00 até 23:00'),
             (203, 'Alexandre', '06:00 até 16:00'),
             (204, 'Vinicius', '06:00 até 16:00');

insert CATEGORIA
       values(1001, 'Conhecimento'),
             (1002, 'Bebida'),
             (1003, 'Prato completo'),
             (1004, 'Lanche'),
             (1005, 'Salgado');

insert CARDAPIO
       values(1101, 'Laboratório de Banco de Dados', 20.00, 'Aula', 1001),
             (1102, 'Suco de Laranja 200ml', 7.00, 'Copo', 1002),
             (1103, 'Coca-Cola 600ml', 10.00, 'Grrf', 1002),
             (1104, 'Arroz com Bife a Milanesa', 50.00, 'Prato', 1003),
             (1105, 'Barca de Comida Japonesa', 90.00, 'Barca', 1003),
             (1106, 'Coxinha de Frango Vegana', 15.00, 'Saco', 1005),
             (1107, 'Bauru', 20.00, 'Prato', 1004);

insert PEDIDO
       values(2001, '2024-10-25', 40, 20.00, 4, 104),
             (2002, '2024-10-20', 2, 147.00, 2, 102),
             (2003, '2024-10-13', 1, 97.00, 1, 101);

insert ITEMPEDIDO
       values(2101, 1, 20.00, 20.00, 202, 2001, 1101),
             (2102, 1, 7.00, 7.00, 201, 2002, 1102),
             (2103, 1, 10.00, 10.00, 201, 2002, 1103),
             (2104, 1, 50.00, 50.00, 201, 2002, 1104),
             (2105, 1, 90.00, 90.00, 201, 2002, 1105),
             (2106, 1, 90.00, 90.00, 203, 2003, 1105),
             (2107, 1, 7.00, 7.00, 203, 2001, 1102);

--SESSÃO DE CONSULTAS DO BANCO DE DADOS
--Questão 4
DESC FORMAPAGAMENTO;
DESC PEDIDO;
DESC ITEMPEDIDO;
DESC CLIENTE;
DESC CATEGORIA;
DESC CARDAPIO;
DESC GARCOM;

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