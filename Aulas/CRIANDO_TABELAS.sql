-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--AULA DE CRIA��O DE TABELA--
--BADA/LIEC--PROF.ADRIANO--

--FA�A UMA CONEX�O COM O USU�RIO sys:

--CRIANDO TABLESPACE (�REA DO BANCO DE DADOS) TABELAS:
--DROP TABLESPACE TABELAS_3B_2017 INCLUDING CONTENTS AND DATAFILES;
CREATE TABLESPACE TABELAS_3B_2017 
DATAFILE 'D:\ORACLE\TABELAS_3B_2017.DBF' SIZE 10M
AUTOEXTEND ON NEXT 20M MAXSIZE unlimited;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--VAMOS CRIAR O USU�RIO PARA SER DONO DAS TABELAS QUE SER�O CRIADAS NA TABLESPACE ACIMA CRIADA
--OBSERVE A OP��O QUOTA, RESPONS�VEL POR DETERMINAR O ESPA�O F�SICO DOS OBJETOS DESTE USU�RIO
--NA TABLESPACE TABELAS_3B_2017.
--SE O USU�RIO ABAIXO J� FOI CRIADO NA AULA ANTERIOR, RODE O COMANDO AO LADO: 

--DROP USER usuario3B cascade;

CREATE USER usuario3B IDENTIFIED BY 4321 
DEFAULT TABLESPACE TABELAS_3B_2017 
TEMPORARY TABLESPACE TEMP
QUOTA 5M ON TABELAS_3B_2017;

--FORNECER PERMISS�ES AO USU�RIO: 

--1. PARA PERMITIR CONEX�O COM O BANCO DE DADOS
GRANT CONNECT TO usuario3B;
GRANT CREATE SESSION TO USUARIO3B;

--2. PARA PERMITIR A CRIA��O DE TABELAS
GRANT CREATE TABLE TO USUARIO3B;
GRANT ALL PRIVILEGES TO usuario3B;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--A PARTIR DESTE PONTO CONECTE-SE COM O USU�RIO CRIADO E FA�A A CRIA��O DAS TABELAS ABAIXO:
--FA�A A TROCA DO USU�RIO ATRAV�S DO COMBOBOX ACIMA E � DIREITA!

--CRIA��O DA TABELA CARGO
--DROP TABLE CARGO;   
CREATE TABLE CARGO(
CODIGO INT NOT NULL,
DESCRICAO VARCHAR2(50) NOT NULL,
SETOR VARCHAR2(20) NOT NULL,
CONSTRAINT PK_CARGO PRIMARY KEY (CODIGO),
CONSTRAINT CHK_SETOR_CARGO CHECK (SETOR IN 
('INFORM�TICA','FINANCEIRO','VENDAS','COMPRAS')))
TABLESPACE TABELAS_3B_2017;

--VERIFIQUE SE A TABELA ACIMA FOI CRIADA CORRETAMENTE
DESC CARGO;

--VERIFICA AS RESTRI��ES CRIADAS PARA A TABELA ACIMA
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CARGO';

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--CRIA��O DA TABELA DO FUNCION�RIO
--DROP TABLE FUNCIONARIO;
CREATE TABLE FUNCIONARIO(
CODIGO NUMBER NOT NULL, --C�digo Interno do Funcion�rio na Empresa
NOME VARCHAR2(50) NOT NULL, --Nome completo do Funcion�rio
CPF VARCHAR2(11) NOT NULL, --Cpf do Funcion�rio
ENDERECO VARCHAR2(50) NOT NULL, --Endere�o completo do Funcion�rio
TELEFONE_RES VARCHAR2(15) NOT NULL, --Telefone residencial do Funcion�rio
TELEFONE_CEL VARCHAR2(15) NULL, --Telefone celular do Funcion�rio
EMAIL VARCHAR2(30) NULL, --E-mail do funcion�rio
SEXO CHAR(1) NOT NULL, --Sexo do funcion�rio
ESTADO_CIVIL CHAR(15) NOT NULL, --Estado civil do funcion�rio
QTDE_DEPENDENTE INT NULL, --Quantidade de dependentes do funcion�rio
COD_CARGO INT NOT NULL, --Cargo do funcion�rio (C�DIGO DA TABELA CARGO)
SALARIO NUMBER(15,2) NOT NULL, --Sal�rio bruto do funcion�rio
DATA_NASCIMENTO DATE NOT NULL, --Data de nascimento do funcion�rio
DATA_ENTRADA DATE NOT NULL, --Data de entrada do funcion�rio na empresa
DATA_SAIDA DATE NULL, --Data de sa�da do funcion�rio na empresa
SITUACAO VARCHAR2(10) NOT NULL, --Situa��o do funcion�rio
CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (CODIGO), --Regra de restri��o de chave prim�ria simples
CONSTRAINT FK_CARGO_FUNCIONARIO FOREIGN KEY (COD_CARGO) 
                                              REFERENCES CARGO (CODIGO), --Regra de restri��o de chave estrangeira
CONSTRAINT UNICO_EMAIL_FUNCIONARIO UNIQUE (EMAIL), --Regra de restri��o de unicidade para o email do funcion�rio, isto �, um email n�o pode pertencer a outro funcion�rio.
CONSTRAINT CHK_SEXO_FUNCIONARIO CHECK (SEXO IN ('F','M')), --Regra de restri��o de checagem do sexo do funcion�rio, apenas a informa��o que obedece a regra ser� inserida.
CONSTRAINT CHK_ESTADO_CIVIL_FUNCIONARIO CHECK (ESTADO_CIVIL IN ('SOLTEIRA(O)','CASADA(O)','SEPARADA(O)','DIVORCIADA(O)','VI�VA(O)')), --Regra de restri��o de checagem do estado civil do funcion�rio
CONSTRAINT CHK_SITUACAO_FUNCIONARIO CHECK (SITUACAO IN ('ATIVO','SUSPENSO','INATIVO')) --Regra de restri��o de checagem da situa��o do funcion�rio na empresa.
--CONSTRAINT CHK_DATA_NASC_FUNCIONARIO CHECK (DATA_NASCIMENTO < TO_DATE('01/JAN/99','DD/MON/YY')) -- N�o contratar pessoas menores de 16 anos
)TABLESPACE TABELAS_3B_2017;

--VERIFICA��O
DESC FUNCIONARIO;

--VERIFICA AS RESTRI��ES CRIADAS PARA A TABELA ACIMA
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'FUNCIONARIO';

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--CRIA��O DA TABELA DE DEPENDENTES DO FUNCION�RIO
--DROP TABLE DEPENDENTE_FUNCIONARIO;
CREATE TABLE DEPENDENTE_FUNCIONARIO(
CODIGO INT NOT NULL, --C�digo do dependente do funcion�rio
NOME VARCHAR2(50) NOT NULL, --Nome do dependente do funcion�rio
CPF VARCHAR2(15) NOT NULL, --Cpf do dependente do Funcion�rio
SEXO CHAR(1) NOT NULL, --Sexo do dependente do funcion�rio
COD_FUNC NUMBER NOT NULL, --C�digo do funcion�rio (C�DIGO DA TABELA FUNCION�RIO)
CONSTRAINT PK_DEP_FUNC PRIMARY KEY (COD_FUNC, CODIGO), --Regra de restri��o de chave prim�ria composta, isto �, com mais de uma coluna da table Dependente
CONSTRAINT FK_COD_FUNC_DEP FOREIGN KEY (COD_FUNC) REFERENCES FUNCIONARIO (CODIGO), --Regra de restri��o de chave estrangeira, isto �, o c�digo do funcion�rio a quem pertence o dependente
CONSTRAINT CHK_SEXO_DEP_FUNC CHECK (SEXO IN ('F','M')) --Regra de restri��o de checagem do sexo do dependente do funcion�rio, apenas a informa��o que obedece a regra ser� inserida.
)TABLESPACE TABELAS_3B_2017;

--VERIFICA��O
DESC DEPENDENTE_FUNCIONARIO;

--VERIFICA AS RESTRI��ES CRIADAS PARA A TABELA ACIMA
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPENDENTE_FUNCIONARIO';

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--CRIA��O DA TABELA DO 
--DROP TABLE CLIENTE;
CREATE TABLE CLIENTE(
CODIGO NUMBER NOT NULL, --C�digo Interno do Cliente na Empresa
NOME VARCHAR2(50) NOT NULL, --Nome completo do Cliente
CPF VARCHAR2(11) NOT NULL, --Cpf do Cliente
ENDERECO VARCHAR2(50) NOT NULL, --Endere�o completo do Cliente
TELEFONE_RES VARCHAR2(15) NOT NULL, --Telefone residencial do Cliente
TELEFONE_CEL VARCHAR2(15) NULL, --Telefone celular do Cliente
EMAIL VARCHAR2(30) NULL, --E-mail do Cliente
SEXO CHAR(1) NOT NULL, --Sexo do Cliente
ESTADO_CIVIL CHAR(15) NOT NULL, --Estado civil do Cliente
DATA_NASCIMENTO DATE NOT NULL, --Data de nascimento do Cliente
SITUACAO VARCHAR2(10) NOT NULL, --Situa��o do Cliente
CONSTRAINT PK_CLIENTE PRIMARY KEY (CODIGO), --Regra de restri��o de chave prim�ria simples
CONSTRAINT UNICO_EMAIL_CLIENTE UNIQUE (EMAIL), --Regra de restri��o de unicidade para o email do Cliente, isto �, um email n�o pode pertencer a outro funcion�rio.
CONSTRAINT CHK_SEXO_CLIENTE CHECK (SEXO IN ('F','M')), --Regra de restri��o de checagem do sexo do Cliente, apenas a informa��o que obedece a regra ser� inserida.
CONSTRAINT CHK_ESTADO_CIVIL_CLIENTE CHECK (ESTADO_CIVIL IN ('SOLTEIRA(O)','CASADA(O)','SEPARADA(O)','DIVORCIADA(O)','VI�VA(O)')), --Regra de restri��o de checagem do estado civil do Cliente
CONSTRAINT CHK_SITUACAO_CLIENTE CHECK (SITUACAO IN ('ATIVO','INATIVO')) --Regra de restri��o de checagem da situa��o do cliente na empresa.
--,CONSTRAINT CHK_DATA_NASC_CLIENTE CHECK (DATA_NASCIMENTO < TO_DATE('Janeiro 01, 1999','Month DD, YYYY')) -- N�o contratar pessoas menores de 16 anos
)TABLESPACE TABELAS_3B_2017;

--VERIFICA��O
DESC CLIENTE;

--VERIFICA AS RESTRI��ES CRIADAS PARA A TABELA ACIMA
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CLIENTE';

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--INSER��O DE DADOS NAS TABELA ACIMA CRIADAS
--INSER��O DE DADOS NAS TABELA CARGO
INSERT INTO CARGO (CODIGO, DESCRICAO, SETOR) VALUES (1, 'ANALISTA DE SISTEMAS', 'INFORM�TICA');
INSERT INTO CARGO (CODIGO, DESCRICAO, SETOR) VALUES (2, 'PROGRAMADOR', 'INFORM�TICA');

--Consultando a tabela onde os dados foram inseridos
SELECT CODIGO, DESCRICAO, SETOR FROM CARGO;

--DELETE FROM CARGO

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--INSER��O DE DADOS NAS TABELA FUNCIONARIO
INSERT INTO FUNCIONARIO (CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, 
      QTDE_DEPENDENTE, COD_CARGO, SALARIO, DATA_NASCIMENTO, DATA_ENTRADA, DATA_SAIDA, SITUACAO) 
VALUES (1, 'RONALDO NAZ�RIO', '12345678900', 'RUA X, 56', '1141625040', '11947998877', 'r9@gmail.com', 
      'M', 'SOLTEIRA(O)', null, 1, 5000.00, '03/09/1977', '24-08-2015', null, 'ATIVO');

INSERT INTO FUNCIONARIO (CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, 
      QTDE_DEPENDENTE, COD_CARGO, SALARIO, DATA_NASCIMENTO, DATA_ENTRADA, DATA_SAIDA, SITUACAO) 
VALUES (2, 'RONALDO GA�CHO', '98765432100', 'RUA Y, 33', '1141625040', '11947998878', null, 
      'M', 'SOLTEIRA(O)', null, 2, 3500.50, '23/03/1975', '01-02-2015', null, 'ATIVO');

INSERT INTO FUNCIONARIO (CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, 
      QTDE_DEPENDENTE, COD_CARGO, SALARIO, DATA_NASCIMENTO, DATA_ENTRADA, DATA_SAIDA, SITUACAO) 
VALUES (3, 'MARIA JOS�', '98765432199', 'RUA Z, 51-E', '1141625040', '11947998879', 'mariajose@outlook.com', 
      'F', 'CASADA(O)', null, 1, 5000.00, '03-04-1969', '20-08-2013', null, 'SUSPENSO');
      
--Consultando a tabela onde os dados foram inseridos
SELECT CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, QTDE_DEPENDENTE, COD_CARGO, 
        SALARIO, DATA_NASCIMENTO, DATA_ENTRADA, DATA_SAIDA, SITUACAO 
    FROM FUNCIONARIO;
      
--DELETE FROM FUNCIONARIO;      

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--INSER��O DE DADOS NAS TABELA DEPENDENTE_FUNCIONARIO
INSERT INTO DEPENDENTE_FUNCIONARIO (CODIGO, NOME, CPF, SEXO, COD_FUNC) 
VALUES (1, 'RONALD DOMINGUES NAZ�RIO', '12345678901', 'M', 1);

INSERT INTO DEPENDENTE_FUNCIONARIO (CODIGO, NOME, CPF, SEXO, COD_FUNC) 
VALUES (2, 'ALEX NAZ�RIO', '12345678902', 'M', 1);
      
--Consultando a tabela onde os dados foram inseridos
SELECT CODIGO, NOME, CPF, SEXO, COD_FUNC FROM DEPENDENTE_FUNCIONARIO;

--DELETE FROM DEPENDENTE_FUNCIONARIO; 

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--INSER��O DE DADOS NAS TABELA CLIENTE
INSERT INTO CLIENTE (CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, DATA_NASCIMENTO, 
              SITUACAO) 
VALUES (1, 'RONALDO NAZ�RIO', '12345678900', 'RUA X, 56', '1141625040', '11947998877', 'r9@gmail.com', 
      'M', 'SOLTEIRA(O)', '14/10/1992', 'ATIVO');

INSERT INTO CLIENTE (CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL,
              DATA_NASCIMENTO, SITUACAO) 
VALUES (2, 'ANDR�', '98765432177', 'RUA Y, 33', '1141625040', '11947998878', null, 
      'M', 'SOLTEIRA(O)', '16/01/1995', 'ATIVO');

INSERT INTO CLIENTE (CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, 
              DATA_NASCIMENTO, SITUACAO)
VALUES (3, 'MARIA JOS�', '98765432199', 'RUA Z, 51-E', '1141625040', '11947998879', 'mariajose@outlook.com', 
      'F', 'CASADA(O)', '14/11/1956', 'ATIVO');
      
--Consultando a tabela onde os dados foram inseridos
SELECT CODIGO, NOME, CPF, ENDERECO, TELEFONE_RES, TELEFONE_CEL, EMAIL, SEXO, ESTADO_CIVIL, DATA_NASCIMENTO, SITUACAO
    FROM CLIENTE;
      
--DELETE FROM CLIENTE;      

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
-- 1.CRIAR UMA TABELA DE DEPENDENTES DO CLIENTE (DEP_CLI)
--    COLUNAS: COD_CLI, COD_DEP_CLI, NOME, EMAIL, CPF, SEXO
--  REALIZAR 5 INSERTS E SELECT
--CRIA��O DA TABELA DE DEPENDENTES DO CLIENTE
--DROP TABLE DEP_CLI;
CREATE TABLE DEP_CLI(
COD_DEP_CLI INT NOT NULL, --C�digo do dependente do cliente
NOME VARCHAR2(50) NOT NULL, --Nome do dependente do cliente
CPF VARCHAR2(15) NOT NULL, --Cpf do dependente do cliente
EMAIL VARCHAR2(30) NULL, --E-mail do dependente do Cliente
SEXO CHAR(1) NOT NULL, --Sexo do dependente do cliente
COD_CLI NUMBER NOT NULL, --C�digo do cliente (C�DIGO DA TABELA CLIENTE)
CONSTRAINT PK_DEP_CLI PRIMARY KEY (COD_CLI, COD_DEP_CLI), --Regra de restri��o de chave prim�ria composta, isto �, com mais de uma coluna da table Dependente
CONSTRAINT FK_COD_CLI_DEP FOREIGN KEY (COD_CLI) 
REFERENCES CLIENTE (CODIGO), --Regra de restri��o de chave estrangeira, isto �, o c�digo do cliente a quem pertence o dependente
CONSTRAINT CHK_SEXO_DEP_CLI CHECK (SEXO IN ('F','M')) --Regra de restri��o de checagem do sexo do dependente do cliente, apenas a informa��o que obedece a regra ser� inserida.
)TABLESPACE TABELAS_3B_2017;

--VERIFICA��O
DESC DEP_CLI;

--VERIFICA AS RESTRI��ES CRIADAS PARA A TABELA ACIMA
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEP_CLI';

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------










