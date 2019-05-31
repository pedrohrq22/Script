Create tablespace ALGEBRA_3B_2017 
Datafile 'D:\Oracle\ALGEBRA_3B_2017.dbf' 
Size 5M;

Create User matematico_3B 
identified by 4321 
default tablespace ALGEBRA_3B_2017;

Grant All Privileges to matematico_3B;
 
create table tbCliente
(codCli int not null, -- "Código do Cliente"
nomCli varchar(50) not null, -- 'Nome completo do Cliente'
telCli varchar(11) null, --Telefone do Cliente'
salCli numeric(8,2) null, -- Salário do Cliente
constraint PK_codCli primary key (codCli)) tablespace ALGEBRA_3B_2017;

DESC TBCLIENTE;

create table tbDependente
(codDep int not null, -- Código do Dependente
codCli int not null, --Código do Cliente
nomDep varchar(50) not null, -- Nome do Dependente
telDep varchar(11) null, -- Telefone do Dependente
constraint PK_codDep primary key (codDep),
constraint FK_codCli foreign key (codCli) references tbCliente)
tablespace ALGEBRA_3B_2017;

DESC TBDEPENDENTE;

insert into tbCliente (codCli, nomCli, telCli, salCli) 
values (1, 'Maria', '41779988', 1111.90);
insert into tbCliente (codCli, nomCli, telCli, salCli) 
values (2, 'João', '37376969', 500.8);
insert into tbCliente (codCli, nomCli, telCli, salCli) 
values (3, 'José', '99887766', 3500.0);

insert into tbDependente (codDep, codCli, nomDep, telDep)
values (1, 1, 'André', '24249090');
insert into tbDependente (codDep, codCli, nomDep, telDep)
values (2, 1, 'Josiele', '77777777');
insert into tbDependente (codDep, codCli, nomDep, telDep)
values (3, 1, 'Marcia', '40404040');
insert into tbDependente (codDep, codCli, nomDep, telDep)
values (4, 3, 'Frederico', '56464748');
insert into tbDependente (codDep, codCli, nomDep, telDep)
values (5, 3, 'Maria Fernanda', '34340099');

select * from tbCliente;

select * from tbDependente;

--OPERAÇÕES FUNDAMENTAIS
-- SELEÇÃO
select * from tbCliente
Where codCli = 1;

-- Resposta: ? codCli = 1 (tbCliente)

-- PROJEÇÃO
select nomCli, telCli from tbCliente

-- Resposta: ? nomCli, telCli (tbCliente)

-- PRODUTO CARTESIANO
select * from tbCliente, tbDependente 

-- Resposta: tbCliente X tbDependente

-- UNIÃO
select nomCli, telCli from tbCliente
UNION
select nomDep, telDep from tbDependente 

-- Resposta: tbCliente U tbDependente

-- DIFERENÇA ENTRE CONJUNTOS
select * from tbCliente A
Where NOT EXISTS 
(select * from tbDependente B where B.codCli = A.codCli)

-- Resposta: tbCliente - tbDependente


--OPERAÇÕES DERIVADAS
-- INTERSECÇÃO	
select * from tbCliente A
Where EXISTS 
(select * from tbDependente B where B.codCli = A.codCli)

-- Resposta: tbCliente ? tbDependente

-- JUNÇÃO
select * from tbCliente A
Inner Join tbDependente B
On A.codCli = B.codCli 

-- Resposta: tbCliente |X| 
--tbCliente.codCli = tbDependente.codCli tbDependente

-- JUNÇÃO -- Dados da ESQUERDA
select * from tbCliente A
Left Outer Join tbDependente B
On A.codCli = B.codCli 

-- Resposta: 

-- JUNÇÃO -- Dados da DIREITA
select * from tbCliente A
Right Outer Join tbDependente B
On A.codCli = B.codCli 

-- Resposta: 

-- JUNÇÃO -- Dados da COMPLETO
select * from tbCliente A
Full Outer Join tbDependente B
On A.codCli = B.codCli 

-- Resposta: 

--OPERAÇÕES ESPECIAIS
-- RENOMEAR
select nomCli "Nome do Cliente" from tbCliente A

-- Resposta: ? A (tbCliente)

-- ATRIBUIÇÃO
select nomCli, telCli, 
salCli "salário atual", salCli + 100 "com aumento de R$100,00"
from tbCliente 
where salCli < 3000.0

-- Resposta: tbCliente <-- ? nomCli, telCli, salCli, salCli+100 (? salCli < 3000 (tbCliente))


