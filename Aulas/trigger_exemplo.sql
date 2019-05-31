create table exemplo (teste varchar2(50));

drop table exemplo_audit
create table exemplo_audit (id_audit int, usuario varchar2(50));

create sequence seq_exemplo_audit start with 1;

create or replace trigger adriano.t_exemplo
after delete or insert or update on adriano.exemplo
for each row
begin
  insert into adriano.exemplo_audit (id_audit, usuario) values
    (seq_exemplo_audit.nextval, user);
end;

insert into adriano.exemplo (teste) values ('Jack');

select * from adriano.exemplo;
select * from adriano.exemplo_audit;
commit;