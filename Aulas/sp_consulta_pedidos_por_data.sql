select * from pedido;

desc pedido;

create or replace procedure 
sp_consulta_pedido_por_data (
p_codigo out Pedido.codigo%type, 
p_data_Pedido in Pedido.data_Pedido%type, 
p_valor_Total out Pedido.valor_Total%type)
is
begin

select codigo, valor_Total
into p_codigo, p_valor_Total
from Pedido
where data_Pedido > p_data_Pedido
and rownum = 1;

return;
end;
/

--FORMATO DATE ARMAZENA HORA JUNTO COM A DATA
select codigo, valor_Total
from Pedido
where data_Pedido > '18/10/16';

VARIABLE CODIGO VARCHAR2(50)
VARIABLE VALOR_TOTAL VARCHAR2(50)
exec sp_consulta_pedido_por_data(:CODIGO, TO_DATE('18-10-16', 'dd-MM-yy'), :VALOR_TOTAL);
print CODIGO;
print VALOR_TOTAL;

--TO_CHAR APRESENTA A DATA NO FORMATO DESEJADO
select to_char(data_Pedido, 'dd/mm/yyyy hh24:mi:ss') from Pedido
where data_Pedido > '08/05/15';

--SUBSTR SELECIONA PARTE DA STRING DESEJADA OU COMPARA PARTE DO CONTEÚDO DA COLUNA DESEJADA
select codigo, valorTotal
from Pedido
where substr(data_Pedido,3,10) = '05/2015';

