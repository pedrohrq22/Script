desc PEDIDO;
create or replace procedure 
sp_insere_pedido (
p_valor_Total in Pedido.valor_Total%type)
is
begin

insert into Pedido (codigo, data_Pedido, valor_Total) 
values (SeqPedido.NextVal, SYSDATE, p_valor_Total);

end;
/




-- INSERE PRODUTO NO TABELA Produtos_3B
call sp_insere_pedido(7800.00); --, 'Asdrubal', null);

--delete from Pedido;
select * from Pedido;

-- CONSULTA PRODUTO SELECIONADO POR CODIGO
variable v_codigo NUMBER
VARIABLE v_valor_Total number

exec sp_consulta_pedido_por_data(:v_codigo, '08/05/15', :v_valor_Total);

print v_codigo;
print v_valorTotal;
/