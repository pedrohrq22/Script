--Logar como Admin (sys)

Create Tablespace SONECA 
Datafile 'D:\Oracle\SONECA.dbf' Size 5M;

Create User dorminhoco identified by 4321 default tablespace SONECA;

Grant All Privileges to dorminhoco;

--Logar com o usuário criado acima
--Drop table Aluno;
Create Table Aluno(
rm number(10),
nome varchar2(50) not null,
email varchar2(30) null,
data_Nasc Date null,
constraint pkAluno primary key (rm)) tablespace SONECA;

Desc Aluno;

Alter table Aluno
add (situacao varchar2(15) not null);

Desc Aluno;

Insert Into Aluno (rm, nome, situacao) values (1, 'Ronaldo', 'Matriculado');
Insert Into Aluno (rm, nome, situacao) values (2, 'Maria', 'Matriculado');
Insert Into Aluno (rm, nome, situacao) values (3, 'Ronaldo', 'Matriculado');
Insert Into Aluno (rm, nome, situacao) values (4, 'Ronaldo Santos', 'Matriculado');
Insert Into Aluno (rm, nome, situacao) values (5, 'Andrea', 'Matriculado');

select rm, nome, situacao from Aluno;

select rm, nome, situacao from Aluno
where nome = 'Ronaldo';

select rm, nome, situacao from Aluno
where substr(nome,1,7) = 'Ronaldo';

select rm, nome, situacao from Aluno
where nome like 'Ronaldo%';

Update Aluno Set nome='Jenifer' Where nome = 'Ronaldo';

select rm, nome, situacao from Aluno;

Update Aluno Set nome='Ronaldo' Where rm = 3;

select rm, nome, situacao from Aluno;

Delete From Aluno where rm = 5;

select rm, nome, situacao from Aluno;

Update Aluno Set situacao='Trancado' Where rm = 4;

select rm, nome, situacao from Aluno;

DESC ALUNO
select rm, nome, email, data_Nasc, situacao from Aluno;

