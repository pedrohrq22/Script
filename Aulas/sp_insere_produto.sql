select * from produto;

create or replace 
    procedure sp_insere_produto (p_descricao 
        in Produto.descricao%type, 
p_valor_unit in Produto.valor_unit%type, 
p_qtde_atual in Produto.qtde_atual%type)
is
begin

insert into Produto 
(codigo, descricao, valor_Unit, qtde_atual) 
values (SeqProduto.NextVal, p_descricao, 
p_valor_unit, p_qtde_atual);
commit;

insert into Produto 
(codigo, descricao, valor_Unit, qtde_atual) 
values (SeqProduto.NextVal, 
p_descricao, p_valor_unit, p_qtde_atual);
commit;

end sp_insere_produto;
/


-- INSERE PRODUTO NO TABELA Produtos_3B
call sp_insere_produto('Caderno', 5.8, 100);

exec sp_insere_produto('TOALHA', 30.0, 500);
SELECT * FROM PRODUTO;

-- CONSULTA PRODUTO SELECIONADO POR CODIGO
VARIABLE v_descricao VARCHAR2(50)
VARIABLE v_valor_unit VARCHAR2(50)

exec sp_consulta_produto(4, :v_descricao, :v_valor_unit);

print v_descricao;
print v_valor_unit;
/