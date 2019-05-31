--conter nome completo, email, usuario, senha, confirmacao de senha.
--drop table Empresa;
--delete from Empresa;
create table Empresa(
cod int constraint pk_user primary key,
Nome varchar2(50) not null,
Email varchar2(50) not null,
Usuario varchar2(15) not null,
Senha varchar2(20) not null,
ativo int not null
);

Select senha from Empresa where Senha='pedro' and Usuario='Pedro';
Select senha from Empresa where Senha='123456' and Usuario='Pedro';

commit;
--drop sequence Seq_tbEmpresa;
create sequence Seq_tbEmpresa
start with 1
increment by 1
maxvalue 99999
minvalue 1
nocache
nocycle;

--insert into Empresa (Cod, Nome, Email, Usuario, senha, ativo) values (1,'Pedro Henrique da Silva', 'pedrohenrique@ig.com','Pedro','pedro','1');
insert into Empresa (Cod, Nome, Email, Usuario, senha, ativo) values 
(Seq_tbEmpresa.NEXTVAL,'Pedro Henrique da Silva','pedrohenrique@ig.com.br','Pedro', 'pedro','1');
select * from Empresa;

commit;
rollback;

update Empresa
set Usuario='Pedro' 
where cod=1;

--==================================

--drop table Alunos;
--delete from Alunos;
create table Alunos(
Matricula int constraint pk_aluno primary key,
Nome varchar2(30) not null,
Idade int not null,
Sala varchar2(6) not null,
ativo int not null
);
--drop sequence seq_Alunos;
create sequence seq_Alunos
start with 1
increment by 1
maxvalue 99999
minvalue 1
nocache
nocycle;
insert into Alunos (Matricula, Nome, idade, Sala, ativo) values (277, 'Pedro', 19, 1);
insert into Alunos (Matricula, Nome, Idade, Sala, ativo) values (seq_Aluno.NEXTVAL,'Pedro',19,'Mif3c',1);
--insert into Alunos (Matricula, Nome, idade,Sala, ativo) values (244, 'Vinicius', 16, 1);

select * from Alunos;


select * from Alunos order by idade;

commit;
--rollback;