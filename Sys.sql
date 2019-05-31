Oracle precisa de no mínimo 500MB


select
service_id, name, NETWORK_NAME, CREATION_DATE, blocked
from V$ACTIVE_SERVICES;

select * from V$ACTIVE_SERVICES;

select NAME, CREATED, OPEN_MODE, VERSION_TIME,
PLATFORM_NAME from V$DATABASE;

select * from V$SGA;

select * from V$SGAINFO;

select * from V$SGASTAT;

--drop table confirmacao
create table Confirmacao(
Campo1 varchar2(10) not null);

insert into Confirmacao (Campo1) values ('Dado');

Select * from Confirmacao;

commit;

ROLLBACK; 

-----------------
SELECT NAME, OPEN_MODE FROM V$DATABASE;

SELECT * FROM V$DATABSE;
-----------------


--========================================
06/10/17

ALTER DATABASE MOUNT;

Limpa a tela cmd
CL SRC - CLEAR SCREEN 
CL SCR

SHUTDOWN
shutdown immediate -- Força o desligamento do banco

StartUp
startup force; força iniciar o banco.
StartUp Mount;

--seta para cima mostra os comandos executados anteriormente.


Ferramente de backup - RMAN 
                       Completo(FULL)
                       Comulativo - Level 0 sempre.
                       Diferêncial - Level 1.

Digitar na barra de menu do windows - "RMAN" e dar enter.



ALTER DATABASE ARCHIVELOG;
--===================================

20/10 --Aula de Backup 

--RESTAURANDO O ARQUIVO EXCLUIDO
RMAN TARGET SYS/123456
REPORT SCHEMA;
CONFIGURE CONTROLFILE AUTOBACKUP ON;
RESTORE TABLESPACE USERS;

--BACKUP COMPLETO
RMAN TARGET SYS/123456
CONFIGURE CONTROLFILE AUTOBACKUP Off;
BACKUP DATABASE;

visualizar o caminho do backup
show parameter db_recovery file_dest;


mudar o caminho do backup
alter system set controlfile='C:\CAMINHO_DESEJADO'


SCOPE=SPFILE