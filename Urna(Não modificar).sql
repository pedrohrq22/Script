--SCRIPT NÃO OFICAL ( N Ã O M O D I F I C A R)

--limpar cmd no sqlplus = clear screen scr

--CRIAR TABLESPACE PARA O PROJETO.
create tablespace Nome 
datafile ' CAMINHO/CAMINHO/CAMINHO.dbf'
size 100M; auto extends 900m;
--------------------------------------------

--drop user UrnaG;
create user UrnaG
identified by 123456;
grant all privileges to UrnaG;

--====================================================================

--ADMINISTRADOR ÚNICO.
--DROP TABLE ADMINISTRADOR
--DELETE FROM ADMINISTRADOR
CREATE TABLE ADMINISTRADOR 
(
COD_ADM INT,
NOME VARCHAR(50) NOT NULL,
ID_ADM VARCHAR2(10) NOT NULL,
CONSTRAINT PK_ADMNISTRADOR PRIMARY KEY (COD_ADM)
);
INSERT INTO ADMINISTRADOR (COD_ADM, NOME, ID_ADM) VALUES (1, 'ADM', '123456');
--select * from Administrador;
--SELECT * FROM ADMINISTRADOR WHERE ID_ADM = '123456';
--===================================

-- DROP TABLE ALUNOS;
-- DELETE FROM ALUNOS;
Create table Alunos
(
Cod_Alunos INT,

Nome varchar2(50) not null,
RM int not null,
Senha varchar2(20) not null,
Ativo int not null,

--contagem de votos
Chapa_votada number(3) null,
Nulo Char(1) Default 'N' not null,
Votou_ou_nao Char(9) DEFAULT 'NAO_VOTOU' not null,

constraint uq_rm unique(RM),
Constraint PK_Alunos Primary key (COD_ALUNOS)
);

--INSERT INTO ALUNOS (COD_ALUNOS, NOME, RM, SENHA, ATIVO) VALUES (ALUNOS_SEQ.NEXTVAL, 'Pedro Henrique', '26515', 'pedro','1');

--DROP SEQUENCE ALUNOS_SEQ
CREATE SEQUENCE ALUNOS_SEQ
MINVALUE 1
MAXVALUE 999999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

SELECT * FROM ALUNOS;

commit;


--COMANDOS USADOS NO PROGRAMA:

-- select que trás campos nulos -----------|
select count(*) from alunos              --|
where chapa_votada is null and ativo=1;  --|
-------------------------------------------|


select chapa_votada,
count (chapa_votada)
from alunos
where ativo=1 group by chapa_votada 
order by chapa_votada asc

--update alunos set chapa_votada=null

--update chapa set nome_chapa='Evolution!',presidente='Guilherme Moraes',
--vice_presidente='Nathalia Lima', 
--descricao='Evolução na escola, com melhor da Tecnologia para um futuro dos alunos preparados para o futuro!',
--caminho_foto='C:\\\\Users\\\\pedro_000\\\\Desktop\\\\Fotos_Votação\\\\Evolution.JPG'
--where cod_chapa=5 and ativo=1

--Select cod_chapa from Chapa 
--where cod_chapa=1

--update chapa set nome_chapa='Aluno Cidadão', presidente='Leandro Augusto', vice_presidente='Laura Rodrigues',
--descricao='Por um movimento estudantil forte, reativo, organizado e combativo.',
--caminho_foto='C:\\\\Users\\\\pedro_000\\\\Desktop\\\\Fotos_Votação\\\\Foto1.PNG';

--Select Nome, rm, senha from alunos where cod_alunos= and ativo=1 

--update alunos set ativo=1

--update alunos set chapa_votada=null, nulo='N', votou_ou_nao='NAO_VOTOU';

--SELECT COUNT (CHAPA_VOTADA) FROM ALUNOS WHERE COD_CHAPA_VOTADA LIKE '%1' and ativo='1'

--SELECT COUNT (CHAPA_VOTADA) FROM ALUNOS WHERE COD_CHAPA_VOTADA=1 and ativo=1 

--SELECT COUNT (NULO) FROM ALUNOS WHERE NULO= 'S' and ativo='1'

--select * from alunos;
--select * from mesario;
--select * from chapa;
--desc alunos;

--update alunos set ativo=1 where rm=26515

--update mesario set votou_ou_nao='NAO_VOTOU' where senha='pedro'

--Select Nome, rm, senha from alunos where cod_alunos=4 and ativo=1
--select cod_alunos from alunos where cod_alunos=4 and ativo=1;

--desc alunos;

--update Alunos set nome='" + NomedoAluno + "', rm=" + RM + ", senha='" + SenhaA + "' Where cod_alunos=" + CodA + "
--update Alunos set nome=      'Pedro',        rm=26517,       senha='    pedroh'     Where cod_alunos=4

--update chapa set ativo=1

--update alunos set votou_ou_nao='NAO_VOTOU'
--where rm=26515;

--delete from alunos where cod_alunos=1 
 --UPDATE Alunos  SET  Ativo = '0'  WHERE  cod_alunos = '2'

--UPDATE Mesario  SET  Ativo = '0'  WHERE  cod_mesario = '22'

--rollback; select * from Mesario
--SELECT COUNT (COD_CHAPA_VOTADA) FROM ALUNOS  WHERE COD_CHAPA_VOTADA LIKE '%1' and ativo='1';

-- Select VOTOU_OU_NAO from alunos where RM='26515' and VOTOU_OU_NAO='VOTOU'

--select senha from alunos where senha='pedro' and RM='26515';

--select nome, rm from alunos where VOTOU_OU_NAO='NÃO VOTOU';

-----------------------------------
--Select cod_alunos, nome, rm, senha FROM ALUNOS Where Ativo='1' order by cod_alunos;
--Select nome, rm, senha FROM ALUNOS Where Ativo='1' order by cod_alunos;

--SELECT COUNT (COD_CHAPA_VOTADA) FROM RM_ALUNOS 
--WHERE COD_CHAPA_VOTADA LIKE '%3';

--SELECT COUNT (NULO) FROM RM_ALUNOS WHERE NULO LIKE '%S';
-------------------------------
--UPDATE RM_ALUNOS SET COD_CHAPA_VOTADA = 1 --HERE RM='26515';
--UPDATE RM_ALUNOS SET COD_CHAPA_VOTADA = 1 WHERE RM='26515';
--UPDATE RM_ALUNOS SET COD_CHAPA_VOTADA = null; --WHERE RM = '26515';

------------------------------
--UPDATE ALUNOS  SET  ATIVO = 'NÃO VOTOU', NULO = 'N' WHERE  RM = '26515';
--UPDATE ALUNOS  SET  ATIVO = 'NÃO VOTOU', NULO = 'N' WHERE  RM = '22333';
--UPDATE ALUNOS  SET  ATIVO = 'NÃO VOTOU', NULO = 'N' WHERE  RM = '33444';
--UPDATE ALUNOS  SET  ATIVO = 'NÃO VOTOU', NULO = 'N' WHERE  RM = '44555';
--UPDATE ALUNOS  SET  ATIVO = 'NÃO VOTOU', NULO = 'N' WHERE  RM = '55666';

--SELECT SENHA FROM ALUNOS WHERE SENHA = 'pedro' and RM='11222';

--UPDATE ALUNOS SET ATIVO = 'VOTOU', NULO = 'S' WHERE RM = '11222'
----------------------------
--UPDATE ALUNOS SET ATIVO = 'VOTOU', NULO = 'S' WHERE RM = '22333';
-----------------------------

--SELECT * FROM ALUNOS WHERE SENHA ='pedro' AND RM='11222';

--SELECT SENHA FROM ALUNOS WHERE SENHA ='pedro';
--==========================================================================

--DROP TABLE MESARIO;
--DELETE FROM MESARIO;
Create Table Mesario
(
Cod_Mesario int not null,
Nome varchar2(50) not null,
Id_Mesario varchar2(10) not null,
Senha varchar2(20) not null,
Ativo number(1) not null,
constraint pk_Mesario primary key (cod_mesario)
);

--DROP SEQUENCE MESARIO_SEQ
CREATE SEQUENCE MESARIO_SEQ
MINVALUE 1
MAXVALUE 999999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

SELECT * FROM MESARIO;
Commit;
rollback;

INSERT INTO MESARIO (COD_MESARIO, NOME, ID_MESARIO, SENHA, ATIVO) VALUES (MESARIO_SEQ.NEXTVAL, 'Pedro Henrique', 'P22','12345', 1);
--INSERT INTO MESARIO (COD_MESARIO, NOME, ID_MESARIO, SENHA, ATIVO) VALUES (MESARIO_SEQ.NEXTVAL, 'Vinicius E.', 'V10','12345', 1);


--Update  Mesario set nome='Pedro Henrique', id_mesario='P33', senha='12345', ativo='1';
--Update Mesario set nome='Pedro Henrique', id_mesario='P33', senha='12345';

--Select Nome, id_mesario, Senha from MESARIO Where Ativo='1' order by cod_mesario;

--SELECT * FROM MESARIO WHERE ID_MESARIO = 'P16';
 --INSERT INTO MESARIO  (NOME, ID_MESARIO, SENHA)  VALUES ( 'Eduardo','E16','12345')
--commit;
--SELECT SENHA FROM MESARIO WHERE SENHA= '12345' and ID_MESARIO= 'P16';
--SELECT MESARIO FROM ID_MESARIO WHERE ID_MESARIO ='12345';

--==================================================
--Não adiciona se não tiver a chapa existente na tabela chapa..
--..dependente do conteudo da tabela chapa.

--usado no sistema atual (Urna eletronica)
drop table Hora_Data_Chapa
delete from Hora_Data_Chapa

create table Hora_Data_Chapa
(
Codpr int not null,
cod_chapa int not null,
nome_chapa varchar2(50) not null,
inserido_hora varchar2(20) not null,
inserido_data varchar2(20) not null,
constraint pk_codpr primary key (codpr)
--constraint fk_cod_chapa foreign key (cod_chapa) references chapa
);


drop sequence codchapa_seq;
drop sequence codpr_seq;

CREATE SEQUENCE codpr_seq
MINVALUE 1
MAXVALUE 9999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE codchapa_seq
MINVALUE 1
MAXVALUE 9999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;
--select * from Hora_Data_Chapa;
--Select * from chapa;
--commit;

insert into Hora_Data_Chapa 
(codpr, cod_chapa,nome_chapa, inserido_hora, inserido_data)
values (codpr_seq.nextval, codchapa_seq.nextval, 'teste NOME', '02:19:04', '10/11/2017');

--===================================================================
--===================================================================

--DROP TABLE CHAPA;
--DELETE FROM CHAPA;
CREATE TABLE CHAPA
(
COD_CHAPA int not null,
Cod_Contagem int not null,
Nome_Chapa varchar2(50) not null,
Numero int not null, 
Presidente varchar2(50) not null,
Vice_Presidente varchar2(50) not null,
Descricao varchar2(4000),
Caminho_foto varchar2(4000),
Ativo Number(1),
constraint pk_chapa primary key(Cod_chapa),
constraint uq_nchapa unique (Numero)
);

--SELECT * FROM CHAPA;
commit;

CREATE SEQUENCE COD_CHAPA_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE COD_CONTAGEM_SEQ
MINVALUE 1
MAXVALUE 5
START WITH 1
INCREMENT BY 1
CACHE 20;

--delete from chapa;
DROP SEQUENCE COD_CHAPA_SEQ;
DROP SEQUENCE COD_CONTAGEM_SEQ;

--rollback;
--commit;

desc CHAPA
desc Hora_Data_Chapa

inner join.
--seleciona cod_chapa, nome da chapa,
--data que foi inserido, e hora que foi inserido

select a.cod_chapa"CodChapa tbChapa",
a.nome_chapa"Nome da Chapa",
b.inserido_data"Dia que foi inserida",
b.inserido_hora"Hora que foi inserida"
from Chapa a
inner join hora_data_chapa b
on a.cod_chapa = b.cod_chapa 
order by a.cod_chapa

select * from chapa
--================================================

--Teste inserir dados na tabela
--chapa1
INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM, NOME_CHAPA, NUMERO, PRESIDENTE, VICE_PRESIDENTE, DESCRICAO, CAMINHO_FOTO, ATIVO) VALUES
(COD_CHAPA_SEQ.NEXTVAL, COD_CONTAGEM_SEQ.NEXTVAL , 'Aluno Cidadão',2345,'Roberto Souza','Maria Laura',
'Por um movimento estudantil forte, reativo, organizado e combativo.',
'C:\\Users\pedro_000\\Desktop\\Fotos_Votação\\Foto1.png',1);

--chapa2
INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM, NOME_CHAPA, NUMERO, PRESIDENTE, VICE_PRESIDENTE, DESCRICAO, CAMINHO_FOTO, ATIVO) VALUES
(COD_CHAPA_SEQ.NEXTVAL, COD_CONTAGEM_SEQ.NEXTVAL , 'O futuro é agora!',56728,'Mariana Silva','Vinicius Eduardo',
'Por uma escola com mais qualidade de ensino e valorização de nossos funcionários..',
'C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Futuro.JPG',1);

--chapa3
INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM, NOME_CHAPA, NUMERO, PRESIDENTE, VICE_PRESIDENTE, DESCRICAO, CAMINHO_FOTO, ATIVO) VALUES
(COD_CHAPA_SEQ.NEXTVAL, COD_CONTAGEM_SEQ.NEXTVAL , 'Anônimos',24526,'Pedro Henrique','Amanda Silva',
'Por uma escola com tecnologias melhores para um ensino de qualidade aos alunos interessados..',
'C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Foto2.png',1);

--chapa4
INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM, NOME_CHAPA, NUMERO, PRESIDENTE, VICE_PRESIDENTE, DESCRICAO, CAMINHO_FOTO, ATIVO) VALUES
(COD_CHAPA_SEQ.NEXTVAL, COD_CONTAGEM_SEQ.NEXTVAL , 'Filosofia do ITB',67893,'Mateus Candido','Paola Miranda',
'Promover integração entre os mais diversos perfis de alunos através de atividades culturais,
subsidiando ações que vão desde o entretenimento até grupos formais de estudos.',
'C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Foto3.png',1);

--chapa5
INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM, NOME_CHAPA, NUMERO, PRESIDENTE, VICE_PRESIDENTE, DESCRICAO, CAMINHO_FOTO, ATIVO) VALUES
(COD_CHAPA_SEQ.NEXTVAL, COD_CONTAGEM_SEQ.NEXTVAL , 'Evolution',20565,'Guilherme Moraes','Nathalia Lima',
'Evolução na escola, com melhor da Tecnologia para um futuro dos alunos preparados para o futuro!',
'C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Evolution.JPG',1);

--commit;
--========================================================
--drop table Contato;
--delete from Contato;
Create Table Contato
(
Cod_Contato int not null,
Nome varchar2(50)not null,
Telefone number(15) not null,
Email varchar2(50) Default '-----' null,
Assunto varchar2(1000) not null,
Data_envio varchar2(10) not null,
constraint pk_cont primary key (cod_contato)
--constraint uq_tel unique (Telefone)
--Nulo Char(1) Default 'N' not null,
);

--drop sequence contato_seq;
Create sequence contato_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

desc contato;

insert into Contato (cod_contato, nome, email, telefone, assunto, data_envio)
values(contato_seq.nextval,'Pedro Henrique','pedro_henrique@ig.com', 1144556677,'teste de texto','10/11/2017');


insert into Contato (cod_contato, nome, email, telefone, assunto, data_envio)
values(contato_seq.nextval,'Pedro Henrique', '11 4455-6677','teste de texto','10/11/2017');

select cod_contato, nome, telefone, email, assunto, data_envio from contato;

select * from contato

select * from contato order by cod_contato;

select cod_contato"Código do Contato",
nome"Nome", 
email"E-Mail",
Telefone "Telefone",
assunto"Assunto",
data_envio"Data que foi enviada." 
from contato order by cod_contato;

--========================================================
commit;

--UPDATE CONTATO SET ASSUNTO='Teste de texto'

--update chapa set COD_CONTAGEM=5, Ativo=1 where cod_chapa=5

--SELECT COUNT (COD_CHAPA_VOTADA) FROM ALUNOS WHERE COD_CHAPA_VOTADA=5 and ativo=1

--SELECT * FROM CHAPA WHERE COD_CONTAGEM=1

--update chapa set ativo=1
--where presidente='Guilherme';

--update chapa set ativo=1

--where cod_chapa=1

--select cod_chapa, nome_chapa, numero,presidente,
--vice_presidente, descricao, caminho_foto
--from chapa where ativo='1';

--Select * from Chapa where Ativo='1' order by cod_chapa;

--Select * from Chapa where Ativo='1'

--update chapa set cod_chapa='0', Ativo='0';

--SELECT * FROM CHAPA WHERE COD_CHAPA='1'

--======================= NÃO TERMINADO
-- TABELA NÃO TERMINADA//
--CREATE TABLE APURACAO
--(
--COD_APURACAO INT,
--DATA DATE NOT NULL,
--HORA DATE NOT NULL,
--RM VARCHAR2(5)NOT NULL,
--COD_CHAPA VARCHAR2(50) DEFAULT ATIVO ('S' OR 'N') NOT NULL,
--COD_MESARIO VARCHAR2(50) NOT NULL

--CONSTRAINT PK_ELEICAO PRIMARY KEY (COD_APURACAO),
--CONSTRAINT FK_RM_ALUNOS FOREIGN KEY (RM),
--CONSTRAINT FK_CHAPA FOREIGN KEY (COD_CHAPA)
--CONSTRAINT FK_MESARIO FOREIGN KEY (COD_MESARIO)
--);

--==========================================================












--tabela insere hora e data com o sysdate do sql.
--pega hora e data do sistema operacional
create table Hora_Data_Chapa
(
cod_chapa int not null,
nome_chapa varchar2(50) not null,
inserido_hora date not null,
inserido_data date not null,
constraint fk_cod_chapa foreign key (cod_chapa) references chapa
);

-- insere e pega hora e data atual do sistema pelo comando direto de sysdate do sql.
insert into Hora_Data_Chapa
(cod_chapa, nome_chapa, hora_ap, data_ap) values (2, 'teste NOME', to_date(sysdate, 'hh24:mi'), to_date(sysdate, 'yyyy-MM-dd') );

--insert insere data e hora manualmente
insert into Hora_Data_Chapa
(cod_chapa, nome_chapa, hora_ap, data_ap) values (1, 'teste NOME', to_date('20:29', 'hh24:mi'), to_date('2017-11-09', 'yyyy-MM-dd') );

select to_char(hora_ap, 'hh24:mi') from Hora_Data_Chapa;
--==========================================================

--Excluir todas as tabelas
drop table administrador;
drop table alunos;
drop table chapa;
drop table hora_data_chapa;
drop table mesario;
drop table contato;

--Excluir sequences de todas as tabelas.
drop sequence cod_contagem_seq;
drop sequence codchapa_seq;
drop sequence codpr_seq;
drop sequence mesario_seq;
drop sequence Alunos_seq;
drop sequence hr_dt_seq;


select * from mesario
select * from alunos;
select * from chapa;

INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM,  NOME_CHAPA, NUMERO,  PRESIDENTE, VICE_PRESIDENTE,  DESCRICAO, CAMINHO_FOTO, ATIVO) 
VALUES ( COD_CHAPA_SEQ.NEXTVAL,  COD_CONTAGEM_SEQ.NEXTVAL, 'Evolution','22334','Guilherme Moraes','Nathalia Guimarães',
'Evolução na escola, com melhor da Tecnologia para um futuro dos alunos preparados para o futuro!',
'C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Evolution.JPG', '1');

INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM,  NOME_CHAPA, NUMERO,  PRESIDENTE, VICE_PRESIDENTE,  DESCRICAO, CAMINHO_FOTO, ATIVO) 
VALUES ( COD_CHAPA_SEQ.NEXTVAL,  COD_CONTAGEM_SEQ.NEXTVAL, 'Evolution','22334','Guilherme Moraes',
'Nathalia Guimarães','Evolução na escola, com melhor da Tecnologia para um futuro dos alunos preparados para o futuro!	',
'C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Evolution.JPG', '1');

INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM,  NOME_CHAPA, NUMERO,  PRESIDENTE, VICE_PRESIDENTE,  DESCRICAO, CAMINHO_FOTO, ATIVO)  
VALUES ( COD_CHAPA_SEQ.NEXTVAL,  COD_CONTAGEM_SEQ.NEXTVAL, 'O futuro é agora! ','26728','Mariana Silva','Vinicius Eduardo',
'Por uma escola com mais qualidade de ensino e valorização de nossos funcionários..
','C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Futuro.JPG', '1' );

commit;
--rollback

update chapa set Numero=25605
where cod_chapa=5

select * from chapa

delete from chapa

INSERT INTO CHAPA (COD_CHAPA, COD_CONTAGEM,  NOME_CHAPA, NUMERO,  PRESIDENTE, VICE_PRESIDENTE,  DESCRICAO, CAMINHO_FOTO, ATIVO)  VALUES
( COD_CHAPA_SEQ.NEXTVAL,  COD_CONTAGEM_SEQ.NEXTVAL, 'Anônimos do ITB','24526','Pedro Henrique ','Amanda Silva','Por uma escola 
com tecnologias melhores para um ensino de qualidade aos alunos interessados..','C:\\Users\\pedro_000\\Desktop\\Fotos_Votação\\Foto2.png', '1' );

commit

