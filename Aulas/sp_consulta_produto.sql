select * from produto;

create or replace procedure 
sp_consulta_produto (
p_codigo in Produto.codigo%type, 
p_descricao out Produto.descricao%type, 
p_valor_unit out Produto.valor_unit%type)
is
begin

select descricao, valor_Unit
into p_descricao, p_valor_unit
from produto
where codigo = p_codigo;

return;
end;
/


VARIABLE v_descricao VARCHAR2(50)
VARIABLE v_valor_unit VARCHAR2(50)

exec sp_consulta_produto(2, :v_descricao, :v_valor_unit);

print v_descricao;
print v_valor_unit;
/

show errors 
-- retorna eventuais erros ocorridos 
--na execução de um bloco pl/sql


--exibe as procedures e functions gravadas no banco de dados
select object_name, object_type
from user_objects
where object_type in ('PROCEDURE','FUNCTION')
ORDER BY object_name;

