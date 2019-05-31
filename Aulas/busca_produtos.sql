create tablespace DOMTEC
datafile 'd:\Oracle\Domtec.dbf' size 10M;

-- drop table produto;
create table produto(
codigo int primary key,
nome varchar2(50) not null unique,
qtde int not null,
valor number(10,2) not null, 
marca varchar2(50) null,
fornecedor varchar2(50) null)
tablespace domtec;

--drop sequence seq_codigo_produto;
create sequence seq_codigo_produto;

insert into produto values (seq_codigo_produto.nextval, 'caneta', 100, 1.5, null, null);
insert into produto values (seq_codigo_produto.nextval, 'borracha', 200, 1.0, null, null);
insert into produto values (seq_codigo_produto.nextval, 'lápis', 200, 1.0, null, null);
insert into produto values (seq_codigo_produto.nextval, 'giz', 1150, 0.5, null, null);
insert into produto values (seq_codigo_produto.nextval, 'caderno', 500, 10.5, null, null);
insert into produto values (seq_codigo_produto.nextval, 'cola', 1000, 3.5, null, null);

select * from produto;
