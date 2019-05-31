--Criar usuário de trabalho, CASO NÃO POSSUA UM CRIADO!!!
CREATE USER adriano_001108 IDENTIFIED BY 4321;
  GRANT ALL PRIVILEGES TO adriano_001108;
  --LOGAR COM O USUÁRIO CRIADO ACIMA PARA 
  --INICIAR O TRABALHO!!!
  ----------------------------------------------------------------------------------------------------------------------
  --CRIAR TABELA PEDIDO
  --Drop Table Pedido
  CREATE TABLE Pedido
    (
      codigo      INT PRIMARY KEY,
      data_Pedido DATE NOT NULL,
      valor_Total NUMBER(15,2) NOT NULL
    );
  --CRIAR SEQUÊNCIA NUMÉRICA
  --Drop Sequence SeqPedido
CREATE Sequence SeqPedido 
Start With 1 Increment BY 1 
noCache noCycle maxvalue 99999;
  --INSERIR DADOS NA TABELA PEDIDO, UTILIZANDO A SEQUENCE
  INSERT INTO Pedido (codigo, data_Pedido,
      valor_Total)
    VALUES (
      SeqPedido.NextVal,
      '11/10/2016',
      552.75
    );
    
  INSERT INTO Pedido (codigo, data_Pedido,
      valor_Total)
    VALUES (
      SeqPedido.NextVal,
      SYSDATE,
      100.00
    );
    
  INSERT INTO Pedido (codigo, data_Pedido,
      valor_Total)
    VALUES
    (SeqPedido.NextVal,
      SYSDATE,
      250.00
    );
  --PESQUISANDO A TABELA PEDIDO
  SELECT * FROM Pedido;
  --Criar a tabela Produto
  --drop table Produto
  CREATE TABLE Produto
    (codigo     INT PRIMARY KEY,
      descricao  VARCHAR2(50) NOT NULL,
      valor_Unit NUMBER(15,2) NOT NULL,
      qtde_Atual NUMBER NOT NULL,
      qtde_min   NUMBER NULL,
      qtde_max   NUMBER NULL
    );
  --Criar sequência para tabela Produto
  --Drop Sequence SeqProduto
CREATE Sequence SeqProduto 
Start With 1 Increment BY 1 
noCache noCycle maxvalue 99999;
  --INSERIR DADOS NA TABELA Produto
  INSERT INTO Produto(codigo,descricao,
  valor_Unit,qtde_atual,qtde_min,qtde_max)
    VALUES
    (SeqProduto.NextVal, 'Refrigerante',
      5.8, 220, 20,  1000);
  
  INSERT INTO Produto(codigo,descricao,
  valor_Unit,qtde_atual,qtde_min,qtde_max)
    VALUES
    (SeqProduto.NextVal, 'misto quente',
      7.5, 100, 5,  1000);
  
  INSERT INTO Produto(codigo,descricao,
  valor_Unit,qtde_atual,qtde_min,qtde_max)
    VALUES
    (SeqProduto.NextVal, 'suco',
      10.0, 530, 60,  1000);
      
  SELECT * FROM Produto;
  
  --CRIANDO A TABELA ITEM
  --Drop Table Item
  CREATE TABLE Item
    ( codigo     INT,
      cod_Pedido INT,
      valor_Unit NUMBER(15,2) NOT NULL,
      cod_Prod   INT NULL,
      qtde       INT NULL,
      CONSTRAINT pkItemPedido 
      PRIMARY KEY (codigo, cod_Pedido),
      CONSTRAINT fkProduto 
      FOREIGN KEY (cod_Prod) 
      REFERENCES Produto (codigo),
      CONSTRAINT fkPedido 
      FOREIGN KEY (cod_Pedido) 
      REFERENCES Pedido (codigo)
    );
  --CRIAR SEQUÊNCIA SeqItem, para a tabela Item, criada acima
  --drop sequence SeqItem
CREATE Sequence SeqItem 
Start With 1 Increment BY 1 
noCache noCycle maxvalue 99999;
  --INSERIR DADOS NA TABELA ITEM, utilizando a Sequence SeqItem para a coluna CODIDO da tabela Item
  --CONSULTAR TABELA USER_SEQUENCES, para verificar situação da SEQUENCE criada
  SELECT *
  FROM SYS.USER_SEQUENCES
  WHERE SEQUENCE_NAME LIKE 'SEQITEM';
  
  --INSERIR DADOS NA TABELA ITEM, 
  --utilizando a Sequence SeqItem 
  --para a coluna CODIDO da tabela Item
  INSERT INTO Item (codigo, cod_Pedido,
      valor_Unit, cod_Prod, qtde)
    VALUES ( SeqItem.NextVal,
      2, 5.8, 2, 1);
      
  SELECT * FROM Item;
  
  SELECT I.codigo "Item",
    Ped.codigo "Pedido",
    Prod.DESCRICAO "Produto"
  FROM Item I
  INNER JOIN Pedido Ped
  ON Ped.CODIGO = I.COD_PEDIDO
  INNER JOIN Produto Prod
  ON Prod.CODIGO = I.COD_PROD
  WHERE ped.codigo = 2; --I.codigo = 1;
  
  SELECT I.codigo, Prod.descricao 
  FROM Item I, Produto Prod;
  
  --Alterar tabela Item, adicionando 
  --constraint fkProduto
  --1. Deletar as linhas da tabela Item, antes de tudo
  DELETE FROM Item;
  
  ALTER TABLE Item 
  ADD (CONSTRAINT fkProduto 
  FOREIGN KEY (cod_prod) 
  REFERENCES Produto (codigo));
  
  DESC Item;
  
  SELECT * FROM user_constraints 
  WHERE TABLE_name = 'ITEM';

SELECT * FROM user_constraints 
  WHERE TABLE_name = 'PRODUTO';


