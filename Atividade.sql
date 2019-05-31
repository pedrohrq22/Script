--usar letras maiusculas para exclusao de user e tablespace.
--exclui tablespace e arquivo físico.
--DROP TABLESPACE "TBSATIVIDADE" INCLUDING CONTENTS AND DATAFILES;
Create tablespace tbsAtividade 
Datafile 'C:\Users\pedro_000\Documents\SQL_DBF\tbsAtividade.dbf' 
Size 5M;

--exclui o usuário
--DROP USER "ATIVIDADECONSULTA" CASCADE;
create user AtividadeConsulta
identified by 123456
default tablespace tbsAtividade;

--incluindo todos os privilégios ao usuário
grant all privileges to AtividadeConsulta;

-- permitir espaço ilimitado ao usuario 
ALTER USER AtividadeConsulta QUOTA UNLIMITED ON tbsAtividade;

commit;

-- até aqui executar com o usuario sys.

--executar a table (1)cargo,(2)funcionario,(3)dependente.
--depois de criar as tabelas, executar insert's na mesma sequencia.


--drop table tbDependente;
--delete from tbDependente;
create table tbDependente(
cod_dep int constraint pk_dep primary key,
nome_dep varchar2(50) not null, -- "Nome do dependente"
Sexo varchar2(2) not null, constraint chk_Sex1 check (Sexo in ('F','M')),--"Sexo do dependente"
dt_nasc date not null, -- "Data de Nascimento do dependente"
cod_func int null,
constraint fk_codfunc foreign key (cod_func) references tbFuncionario)
tablespace tbsAtividade;

--insere dados na tabela
insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(1, 'Mateus Leopoldo', 'M', '22/11/1998', 1);

insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(2, 'Ana Flávia', 'F', '27/05/1997', 1);

insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(3, 'Bruno Stevs', 'F', '18/02/1994', 2);

insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(4, 'Vagner Fernandes', 'M', '10/01/1998', 2);

insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(5, 'Silvestre Sanchez', 'M', '21/03/1995', 3);

insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(6, 'Gilberto Marinho', 'M', '14/06/1992', 3);

insert into tbDependente (cod_dep, Nome_dep, Sexo, dt_Nasc, cod_func)
values(7, 'Thainara Balhs', 'M', '17/07/1992', 3);

select * from tbDependente;
desc tbDependente;


--drop table tbFuncionario;
--delete from tbFuncionario;
create table tbFuncionario
(cod_func int not null,
Nome_func varchar2(50) not null, --"Nome do funcionario"
Sexo varchar2(2) not null constraint chk_Sex check (Sexo in ('F','M')), --"Sexo do funcionario"
--CONSTRAINT CHK_SEXO CHECK (SEXO='F' OR SEXO='M') --OUTRA OPÇÃO DE USAR CONSTRAINT CHECK
Salario numeric(8,2) null, --"Salario do funcionario"
cod_cargo int not null,
constraint pk_cod_func primary key (cod_func),
constraint fk_cod_cargo foreign key (cod_cargo) references tbCargo)
tablespace tbsAtividade;

--insere dados na tabela
insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(1,'Pedro Henrique', 'M', 3000.00, 2);

insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(2,'Amanda Miranda', 'F', 3200.00, 1);

insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(3,'Leandro Augusto', 'M', 1100.00, 3);

insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(4,'Gabriel Silva', 'M', 1100.00, 3);

insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(5,'Milenna dos Santos', 'F', 1100.00, 3);

insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(6,'Ana Carolina', 'F', 2000.00, 5);

insert into tbFuncionario (cod_func,Nome_func, Sexo, Salario, cod_cargo)
values(7,'Rafael dos Anjos', 'M', 2500.00, 6);

select * from tbFuncionario;
desc tbFuncionario;

update tbfuncionario set sexo='M' where cod_func=7

--drop table tbCargo;
--delete from tbCargo;
create table tbCargo(
cod_cargo int,
descricao varchar2(70) not null, -- "Descricao do cargo"
constraint pk_cod_cargo primary key (cod_cargo))
tablespace tbsAtividade;

--insere dados na tabela
insert into tbCargo (cod_cargo, descricao) values (1, 'Analista de Sistemas');
insert into tbCargo (cod_cargo, descricao) values (2, 'Desenvolvedor C#');
insert into tbCargo (cod_cargo, descricao) values (3, 'Técnico em Informática');
insert into tbCargo (cod_cargo, descricao) values (4, 'Analista de Testes');
insert into tbCargo (cod_cargo, descricao) values (5, 'Gerente de Projetos');
insert into tbCargo (cod_cargo, descricao) values (6, 'Desenvolvedor Java(desktop)');
insert into tbCargo (cod_cargo, descricao) values (7, 'Desenvolvedor Java(Android)');

select * from tbCargo;
desc tbCargo;


commit;

--apaga todas as tabelas e seus conteúdos.
--1  delete from tbCargo
--2  drop table tbCargo;
--3  delete from tbFuncionario
--4  drop table tbFuncionario;
--5  delete from tbDependente
--6  drop table tbDependente;


--QUESTÕES
--seleção
select * from tbFuncionario
where sexo='F' 
order by cod_func

--projeção1
select nome_dep, sexo, dt_nasc from tbDependente

--projeção2
--update tbFuncionario set Salario = 2050.00 
--where nome_func='Ana Carolina'

select nome_func, sexo, cod_cargo from tbFuncionario
where salario > 2000.00 
order by cod_cargo

--Junção1
select a.cod_func, a.nome_func, a.salario, b.nome_dep, b.dt_nasc
from tbFuncionario a
Inner Join tbDependente b
on a.cod_func = b.cod_func

--Junção2
select b.cod_func, b.nome_func, a.descricao
from tbCargo a
inner join tbFuncionario b
on a.cod_cargo = b.cod_cargo
where descricao='Técnico em Informática'
--select nome_func, cod_func from tbFuncionario 
--where cod_func='1'


--Junção2 INCORRETA
select b.cod_func "Código do Funcionário",
b.nome_func "Nome do Funcionário", 
a.descricao"Cargo"
from tbCargo a
inner join tbFuncionario b
on a.cod_cargo = b.cod_cargo


--===========================================
--Exercícios

--Ex13
select cod_dep, nome_dep, dt_nasc from tbDependente

--Ex14
select b.cod_func"Código do funcionário", 
b.nome_func"Nome do Funcionário", 
a.descricao "Cargo"
from tbCargo a
inner join tbFuncionario b
on a.cod_cargo = b.cod_cargo
where descricao='Analista de Sistemas'

--Ex15
select cod_func"Código do funcionário", 
nome_func"Nome do Funcionário",
sexo"Sexo do Funcionário" 
from tbFuncionario
where Salario > 3000.00

--Ex16
select b.cod_func "Código do Funcionário",
b.nome_func "Nome do Funcionário",
a.descricao"Cargo",
c. nome_dep "Nome dos Dependentes"
from tbCargo a
inner join tbFuncionario b
on a.cod_cargo = b.cod_cargo
inner join tbDependente c
on b.cod_func = c.cod_func

--para testes:
select * from tbFuncionario
update tbFuncionario set Salario = 3150.00 
where nome_func='Pedro Henrique'
commit;
select * from tbDependente
update tbDependente set Nome_dep='Joyce Santos'
where cod_dep=4
--NOME do func e sexo do dep
select a.nome_func"Nome do Funcionario",
b.sexo "Sexo do Dependente"
from tbFuncionario a
inner join tbDependente b
on a.cod_func = b.cod_func
where nome_func='Pedro Henrique'

