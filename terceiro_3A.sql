--Criar tablespace
Create Tablespace EXEMPLO_PESQUISA
Datafile 'D:\Oracle\BADA_3A'
Size 10M;

--Criar usuário 
Create User terceiro_3A Identified by 1234
default tablespace BADA_3A;

--Fornecer permissões ao usuário 
Grant All Privileges to terceiro_3A;

Grant Create Session, Create Table, Create User to terceiro_3A;

--Conectar com o usuário terceiro_3A
--Criar tabelas Agenda e Endereço
Create Table Agenda_3A(
codigo number(10),
nome varchar2(50) not null,
telefone varchar2(15) not null,
email varchar(30) not null,
constraint pk_codAgenda primary key (codigo),
constraint uni_emailAgenda unique (email))
tablespace BADA_3A;

Create Sequence SeqAgenda_3A;

Create Table Endereco_3A(
codEndereco number(10),
codAgenda number(10),
logradouro varchar(60) not null,
numero varchar(6) not null,
compl varchar(20) null,
bairro varchar(40) not null,
cidade varchar(50) not null,
uf char(2) not null,
cep varchar(8) not null,
constraint pk_codEndAgenda primary key (codEndereco, codAgenda),
constraint fk_codAgenda foreign key (codAgenda) references Agenda_3A (codigo))
tablespace BADA_3A;

Create Sequence SeqEndereco_3A;




