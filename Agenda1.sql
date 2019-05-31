-- 2: Criar as tabelas e os itens abaixo com o usu�rio criado: userAgenda e senha 123456 
-- Tabela Dados da Agenda
-- Nome:2Script_Agenda_Oracle-Tabelas

CREATE TABLE T_DadosAgenda 
    (
     cod number (4) constraint pk_dados primary key,
     Nome VARCHAR2 (50) NOT NULL,
	   Tel VARCHAR2 (16) NOT NULL, 
	   Endereco VARCHAR2 (100) NOT NULL,
	   Nr VARCHAR2 (5) NOT NULL,
	   Bairro VARCHAR2 (100) NOT NULL,
     Cidade VARCHAR2 (100) NOT NULL,
     CEP VARCHAR2 (9) NOT NULL,
     UF CHAR (2) NOT NULL,
     Ativo NUMBER (3) NOT NULL
     );
commit;

--DROP TABLE t_dadosagenda;
--COMMIT;
--DROP SEQUENCE Seq_DadosAgenda;
--COMMIT;

-- Seguencia para AutoNumera��o
create sequence Seq_DadosAgenda
start with 1
increment by 1
maxvalue 999
minvalue 1
nocache
nocycle;
commit;

-- Outra seguencia
-- insert into emp (id,nome) select nvl(max(id),0)+1,'ANDR�IA' from emp;
-- create SEQUENCE s1 START WITH 1;
-- insert into ANDR�IA values (TST_IMASTERS.NEXTVAL,'TESTE 1');

-- create sequence seq_decrescente_5
--    2  start with 5
--    3  increment by -1
--    4  maxvalue 5
--    5  minvalue 0
--    6  nocache
--    7  cycle;

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome1','4197-1010','Endere�o1','10','Bairro1','Cidade1','12345678','SP',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome2','4197-2020','Endere�o2','20','Bairro2','Cidade2','12345678','RJ',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome3','4197-3030','Endere�o3','30','Bairro3','Cidade3','12345678','MG',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome4','4197-4040','Endere�o4','40','Bairro4','Cidade4','12345678','SP',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome5','4197-5050','Endere�o5','50','Bairro5','Cidade5','12345678','SP',1);

commit;

select * from t_dadosagenda;
-----------------------------------------------------------------------
-- 5: Criar a tabela de UF 

CREATE TABLE T_UF 
    (
     cod number (2) constraint pk_UF primary key,
     UF VARCHAR2 (2) NOT NULL
     ); 

--drop table T_UF;

create sequence Seq_UF
start with 1
increment by 1
maxvalue 999
minvalue 1
nocache
nocycle;
commit;

--drop table Seq_UF;

insert into t_UF values (Seq_UF.NEXTVAL,'AL');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'AP');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'AM');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'BA');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'CE');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'DF');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'ES');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'GO');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'MA');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'MT');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'MS');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'MG');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'PA');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'PB');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'PR');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'PE');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'PI');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'RJ');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'RN');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'RS');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'RO');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'RR');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'SC');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'SP');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'SE');
insert into t_UF(cod,UF) values (Seq_UF.NEXTVAL,'TO');

commit;
SELECT * FROM T_UF;



------------------------------------------------------------------------
--Select cod,nome,tel From t_dadosAgenda Where nome like '%No%' and Ativo='1'
--select cod,nome,tel From T_DadosAgenda where ativo='1'
--Select cod,nome,tel From t_dadosAgenda
--------------------------------------------------------------------------------------------------
--insert into emp (id,nome) select nvl(max(id),0)+1,'MARIA' from emp;
--select nextval from dual
--insert into emp (id,nome) select nvl(max(id),0)+1,'EDUARDO' from emp;
--Alter table Pessoa add constraint ID_PESSOA_PK primary key (ID_PESSOA);
--Abaixo temos o comando para adicionar uma nova coluna na tabela Pessoa
--Alter table Pessoa add RG varchar2(14);
--Abaixo temos o comando para remover uma coluna da tabela Pessoa
--Alter table Pessoa drop column RG;
--Abaixo temos o comando para modificar o nome de uma coluna da tabela Pessoa
--ALTER TABLE Pessoa RENAME COLUMN CPF TO Num_CPF;
--Abaixo temos o comando para modificar o nome da tabela Pessoa
--ALTER TABLE Pessoa RENAME TO Alunos;
--insert into emp (id,nome) select nvl(max(id),0)+1,'REGINA' from emp;
--insert into emp (id,nome) select nvl(max(id),0)+1,'MARIA' from emp;

--DROP TABLE t_dadosagenda;
--COMMIT;

--As cl�usulas mais importantes s�o:
--start with n- Permite especificar o primeiro valor a ser gerado pela seq��ncia. Uma vez criada, a seq��ncia ir� gerar o valor especificado por start with na primeira vez que a coluna virtual NEXTVAL da seq��ncia for referenciada. Se nenhum valor start with for especificado, ent�o a seq��ncia assumir� o valor padr�o 1.
--increment by n - Define o n�mero a ser incrementado cada vez que a coluna virtual NEXTVAL for referenciada. O valor padr�o para esta coluna � 1, se n�o for explicitamente especificado. Voc� pode definir (n) com um valor positivo para seq��ncias crescentes, ou com um valor negativo para seq��ncias decrescentes de forma a gerar valores regressivos.
--minvalue n - Define o valor m�nimo que pode ser produzido pela seq��ncia. Se nenhum valor m�nimo for especificado, o Oracle ir� assumir o padr�o nominvalue 1 para uma seq��ncia crescente e (10^27) para uma seq��ncia decrescente.
--maxvalue n - Define o valor m�ximo que pode ser produzido pela seq��ncia. Se nenhum valor m�ximo for especificado, o Oracle ir� assumir o padr�o nomaxvalue (10^27) para uma seq��ncia crescente e 1 para uma seq��ncia decrescente.
--cycle - Especifica se a seq��ncia continuar� a gerar valores ap�s alcan�ar seu valor m�ximo ou m�nimo. Se esta cl�usula n�o for especificada explicitamente, o Oracle ir� assumir o valor padr�o nocycle. Voc� n�o pode especificar cycle em conjunto com nomaxvalue ou nominvalue. Se voc� quiser que sua seq��ncia use um ciclo, voc� dever� especificar maxvalue para seq��ncias crescentes, ou minvalue para seq��ncias decrescentes.
--cache n - Especifica quantos valores o servidor Oracle alocar� previamente na mem�ria (SGA). O uso desta cl�usula permite � seq��ncia gerar antecipadamente um n�mero especificado de valores, usando um cache para melhorar o desempenho. Se o cache n�o for especificado explicitamente, o Oracle ir� assumir o padr�o, que � de gerar um cache de 20 valores.

--Obs: N�o use a op��o CYCLE se a seq��ncia for utilizada para gerar valores de chave prim�ria, a menos que voc� tenha um mecanismo confi�vel que expurgue linhas mais rapidamente que os ciclos da seq��ncia.

--Considere agora um exemplo de defini��o de seq��ncias. Como dito anteriormente, os n�meros inteiros que podem ser especificados para seq��ncias, podem ser tanto negativos quanto positivos. O exemplo abaixo usa uma seq��ncia decrescente onde o n�mero inteiro de start with � positivo, mas o n�mero inteiro de increment by � negativo, o que na pr�tica diz � seq��ncia para decrescer, ao inv�s de crescer. Quando o valor zero for atingido, a seq��ncia come�ar� novamente a contagem.
