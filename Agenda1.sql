-- 2: Criar as tabelas e os itens abaixo com o usuário criado: userAgenda e senha 123456 
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

-- Seguencia para AutoNumeração
create sequence Seq_DadosAgenda
start with 1
increment by 1
maxvalue 999
minvalue 1
nocache
nocycle;
commit;

-- Outra seguencia
-- insert into emp (id,nome) select nvl(max(id),0)+1,'ANDRÉIA' from emp;
-- create SEQUENCE s1 START WITH 1;
-- insert into ANDRÉIA values (TST_IMASTERS.NEXTVAL,'TESTE 1');

-- create sequence seq_decrescente_5
--    2  start with 5
--    3  increment by -1
--    4  maxvalue 5
--    5  minvalue 0
--    6  nocache
--    7  cycle;

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome1','4197-1010','Endereço1','10','Bairro1','Cidade1','12345678','SP',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome2','4197-2020','Endereço2','20','Bairro2','Cidade2','12345678','RJ',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome3','4197-3030','Endereço3','30','Bairro3','Cidade3','12345678','MG',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome4','4197-4040','Endereço4','40','Bairro4','Cidade4','12345678','SP',1);

insert into t_dadosAgenda(cod, Nome,Tel,Endereco,Nr,Bairro,Cidade,cep,UF,Ativo) values
(Seq_DadosAgenda.NEXTVAL,'Nome5','4197-5050','Endereço5','50','Bairro5','Cidade5','12345678','SP',1);

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

--As cláusulas mais importantes são:
--start with n- Permite especificar o primeiro valor a ser gerado pela seqüência. Uma vez criada, a seqüência irá gerar o valor especificado por start with na primeira vez que a coluna virtual NEXTVAL da seqüência for referenciada. Se nenhum valor start with for especificado, então a seqüência assumirá o valor padrão 1.
--increment by n - Define o número a ser incrementado cada vez que a coluna virtual NEXTVAL for referenciada. O valor padrão para esta coluna é 1, se não for explicitamente especificado. Você pode definir (n) com um valor positivo para seqüências crescentes, ou com um valor negativo para seqüências decrescentes de forma a gerar valores regressivos.
--minvalue n - Define o valor mínimo que pode ser produzido pela seqüência. Se nenhum valor mínimo for especificado, o Oracle irá assumir o padrão nominvalue 1 para uma seqüência crescente e (10^27) para uma seqüência decrescente.
--maxvalue n - Define o valor máximo que pode ser produzido pela seqüência. Se nenhum valor máximo for especificado, o Oracle irá assumir o padrão nomaxvalue (10^27) para uma seqüência crescente e 1 para uma seqüência decrescente.
--cycle - Especifica se a seqüência continuará a gerar valores após alcançar seu valor máximo ou mínimo. Se esta cláusula não for especificada explicitamente, o Oracle irá assumir o valor padrão nocycle. Você não pode especificar cycle em conjunto com nomaxvalue ou nominvalue. Se você quiser que sua seqüência use um ciclo, você deverá especificar maxvalue para seqüências crescentes, ou minvalue para seqüências decrescentes.
--cache n - Especifica quantos valores o servidor Oracle alocará previamente na memória (SGA). O uso desta cláusula permite à seqüência gerar antecipadamente um número especificado de valores, usando um cache para melhorar o desempenho. Se o cache não for especificado explicitamente, o Oracle irá assumir o padrão, que é de gerar um cache de 20 valores.

--Obs: Não use a opção CYCLE se a seqüência for utilizada para gerar valores de chave primária, a menos que você tenha um mecanismo confiável que expurgue linhas mais rapidamente que os ciclos da seqüência.

--Considere agora um exemplo de definição de seqüências. Como dito anteriormente, os números inteiros que podem ser especificados para seqüências, podem ser tanto negativos quanto positivos. O exemplo abaixo usa uma seqüência decrescente onde o número inteiro de start with é positivo, mas o número inteiro de increment by é negativo, o que na prática diz à seqüência para decrescer, ao invés de crescer. Quando o valor zero for atingido, a seqüência começará novamente a contagem.
