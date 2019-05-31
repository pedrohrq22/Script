-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--A PARTIR DESTE PONTO, VAMOS EFETUAR UMA SÉRIE DE CONSULTAS NAS TABELAS ACIMA CRIADAS
--PARA EXECUTAR AS DECLARAÇÕES ABAIXO, PRECISAMOS DAS TABELAS DA ATIVIDADE CRIANDO_TABELAS.SQL
-----------------------------------------------------------------------------------------------------------------------
--UTILIZANDO * PARA TRAZER TODAS AS COLUNAS INDISCRIMINADAMENTE
SELECT * FROM CARGO;

--O SELECT ABAIXO RETORNARÁ DUAS LINHAS
SELECT SETOR FROM CARGO;
--PARA ELIMINAR A DUPLICIDADE UTILIZE DISTINCT
SELECT DISTINCT SETOR FROM CARGO;

--OPERAÇÕES MATEMÁTICAS PODEM SER REALIZADAS NOS RETORNOS
SELECT NOME, SALARIO, SALARIO - (SALARIO * 0.27) 
FROM FUNCIONARIO;

--APELIDOS (ALIAS) PODEM SER DADOS PARA DAR MAIS CLAREZA NA INFORMAÇÃO RETORNADA
SELECT NOME, SALARIO "SALÁRIO BRUTO", 
SALARIO - (SALARIO * 0.27) "SALÁRIO LÍQUIDO" FROM FUNCIONARIO;

--OU ASSIM EM OUTRAS VERSÕES
SELECT NOME, SALARIO AS "SALÁRIO BRUTO", 
SALARIO - (SALARIO * 0.27) AS "SALÁRIO LÍQUIDO" FROM FUNCIONARIO;

--PODE HAVER NECESSIDADE DE INDICAR EM QUAL TABELA ESTÁ A COLUNA CONSULTADA
SELECT FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME 
FROM FUNCIONARIO, DEPENDENTE_FUNCIONARIO;

--UM APELIDO (ALIAS) PODE SER DADO PARA A TABELA DA CONSULTA
SELECT F.CODIGO, F.NOME FROM FUNCIONARIO F;
--NO CASO ANTERIOR ASSIM:
SELECT F.NOME, D.NOME 
FROM FUNCIONARIO F, DEPENDENTE_FUNCIONARIO D;

--PODE-SE CONCATENAR (JUNTAR) AS COLUNAS NO RETORNO DA CONSULTA
SELECT F.CODIGO || ' - ' || 
F.NOME "CÓDIGO - NOME DO FUNCIONÁRIO" 
FROM FUNCIONARIO F;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--CONSULTA UTILIZANDO A CLÁUSULA WHERE, ONDE UMA CONDIÇÃO DEVE 
--SER ESTABELECIDA PARA O RETORNO DOS DADOS DA TABELA
--UTILIZANDO O SINAL = PARA COMPARAÇÃO DAS INFORMAÇÕES
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO = 3;

--UTILIZANDO A PALAVRA RESERVADA (IN) PARA COMPARAÇÃO DAS INFORMAÇÕES
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO IN (2);

--COM (IN) PODEMOS COMPARAR UM GRUPO DE INFORMAÇÕES
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO IN (2,3);

--OUTRA FORMA DE COMPARAÇÃO É A UTILZAÇÃO DO "LIKE"
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO LIKE 2;

--COM "LIKE" E "%" PODEMOS EFETUAR UMA SÉRIE DE COMPARAÇÕES
--A INFORMAÇÃO COMEÇA COM A LETRA X
SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE 'R%';

--A INFORMAÇÃO TERMINA COM A LETRA X
SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE '%É';

--A INFORMAÇÃO POSSUI A LETRA X
SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE '%S%';

SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE '%R%';

SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE '_A_I%';

SELECT NOME FROM FUNCIONARIO
WHERE EMAIL LIKE '%@%';

--ESCAPE --
SELECT NOME, EMAIL FROM FUNCIONARIO
WHERE EMAIL LIKE '%m#_' ESCAPE '#';

--UTILIZANDO A TABELA DUAL
SELECT * FROM DUAL;
DESC DUAL;
-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--UTILIZANDO FUNÇÕES PARA RETORNO DAS INFORMAÇÕES NAS TABELAS
--FUNÇÕES DE LINHA
--INITCAP (string) -- Primeira letra de cada palavra em maiúscula
SELECT INITCAP(NOME) FROM FUNCIONARIO;

--REPLACE (string, string_a_pesquisar [string_substituta])
SELECT REPLACE(NOME, 'RONALDO', 'ANDRÉ') "NOMES TROCADOS" 
FROM FUNCIONARIO;

--LOWER (string) --retorna a string com letras minúsculas
SELECT LOWER(NOME) FROM FUNCIONARIO;

--UPPER (string) -- retorna a string com letras maiúsculas
SELECT UPPER(NOME) FROM FUNCIONARIO;

--CONCAT (string1, string2) -- concatena duas strings
SELECT CONCAT(NOME, EMAIL) FROM FUNCIONARIO;
--mais organizado agora
SELECT CONCAT(NOME || ' ', EMAIL) FROM FUNCIONARIO;

--SUBSTR (string, a[,b]) 
-- retorna um trecho determinado da string --a - inicial 
--b - QUANTIDADE DE CARACTERES
SELECT SUBSTR(NOME, 1, 7) FROM FUNCIONARIO;

--LENGTH (string) -- retorna o tamanho da string
SELECT LENGTH(NOME) FROM FUNCIONARIO;

--SOUNDEX (string) --retorna as linhas, se o som for parecido com o original
SELECT * FROM FUNCIONARIO WHERE SOUNDEX(NOME) = SOUNDEX('RONALDA');
SELECT * FROM FUNCIONARIO WHERE SOUNDEX(NOME) = SOUNDEX('RONALDA GAUCHA');
SELECT * FROM FUNCIONARIO WHERE SOUNDEX(SUBSTR(NOME, 1, 7)) = SOUNDEX('RONALDA');
SELECT * FROM DUAL WHERE SOUNDEX('ROBSON') = SOUNDEX('ROPSON');
SELECT * FROM DUAL WHERE SOUNDEX('ADRIANO') = SOUNDEX('ADRIANA');
SELECT * FROM DUAL WHERE SOUNDEX('ROBSON') = SOUNDEX('ADRIANO');

--LTRIM (string)
SELECT LTRIM(NOME) FROM FUNCIONARIO; --remove os espaços da esquerda da string

--RTRIM (string)
SELECT RTRIM(NOME) FROM FUNCIONARIO; --remove os espaços da direita da string

--NVL (valor,0)
SELECT QTDE_DEPENDENTE FROM FUNCIONARIO;
SELECT NVL(QTDE_DEPENDENTE, 0) FROM FUNCIONARIO; --troca o valor null por 0
SELECT REPLACE(NVL(QTDE_DEPENDENTE, 0),0,'valor nulo') FROM FUNCIONARIO; --TESTE DO PROFESSOR

--ROUND (valor)
SELECT SALARIO FROM FUNCIONARIO; -- salário original
SELECT to_char(SALARIO) FROM FUNCIONARIO;
SELECT ROUND(SALARIO) FROM FUNCIONARIO; --arredondado

--TRUNC (valor)
SELECT TRUNC(SALARIO) FROM FUNCIONARIO; --truncado, apenas a parte inteira

--MOD (valor1, valor2)
SELECT MOD(SALARIO, 2) FROM FUNCIONARIO; --retorna o resto da divisão

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--FUNÇÕES DE GRUPO
--AVG - RETORNA A MÉDIA DA COLUNA PESQUISADA
SELECT AVG(SALARIO) FROM FUNCIONARIO;

--MAX - RETORNA O VALOR MÁXIMO DA COLUNA PESQUISADA
SELECT MAX(SALARIO) FROM FUNCIONARIO;
SELECT MAX(EMAIL) FROM FUNCIONARIO; -- TABELA ASCII

--MIN - RETORNA O VALOR MÍNIMO DA COLUNA PESQUISADA
SELECT MIN(SALARIO) FROM FUNCIONARIO;
SELECT MIN(EMAIL) FROM FUNCIONARIO; -- TABELA ASCII

--SUM -- RETORNA A SOMA DA COLUNA PESQUISADA
SELECT SUM(SALARIO) FROM FUNCIONARIO;

--ORDEM ALFABÉTICA CRESCDENTE
SELECT NOME FROM FUNCIONARIO
ORDER BY NOME ASC;

--ORDEM ALFABÉTICA DECRESCENTE
SELECT NOME FROM FUNCIONARIO
ORDER BY NOME DESC;

--ORDENAR PELA SEGUNDA COLUNA DA CONSULTA
SELECT NOME, SALARIO * 12 "SALÁRIO ANUAL" FROM FUNCIONARIO
ORDER BY 2 DESC;

--PODE-SE AGRUPAR AS LINHAS EM COMUM DA CONSULTA
-- A CONSULTA ABAIXO AGRUPA OS FUNCIONÁRIOS QUE TEM SALÁRIOS IGUAIS
--  EM UM AGRUPAMENTO TODAS AS COLUNAS DA CONSULTAS DEVEM SER CONTEMPLADAS
SELECT NOME, SALARIO FROM FUNCIONARIO
GROUP BY SALARIO, NOME;

--A CLÁUSULA HAVING É USADA PARA AGRUPAR OS DADOS CONSULTADOS DE UMA TABELA, ATRAVÉS DE UMA CONDIÇÃO
SELECT NOME, SALARIO FROM FUNCIONARIO
GROUP BY NOME, SALARIO
HAVING (SALARIO) = 5000.00;

--EFETUA A CONTAGEM DO NÚMERO DE LINHAS DA PESQUISA
SELECT COUNT(*) FROM FUNCIONARIO; --CONTAGEM DE TODOS OS FUNCIONÁRIOS

SELECT COUNT(*) FROM FUNCIONARIO WHERE SEXO = 'M'; --CONTAGEM DE TODOS OS FUNCIONÁRIOS HOMENS

SELECT COUNT(EMAIL) FROM FUNCIONARIO; --CONTAGEM DE TODOS OS FUNCIONÁRIOS QUE TEM EMAIL CADASTRADO
-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------

--UTILIZA-SE NA CONDIÇÃO A COLUNA DO ORACLE ROWNUM DA TABELA PARA TRAZER O 
--NÚMERO DE LINHAS DESEJADO NO RETORNO
SELECT CODIGO, NOME, CPF FROM FUNCIONARIO
WHERE ROWNUM = 1; --RETORNARÁ 1 LINHA, INDEPENDENTE SE RETORNARIA 10 OU MAIS

--CONSULTA DE UMA CONSULTA DE UMA TABELA
SELECT * FROM (SELECT CODIGO, NOME, CPF, SALARIO FROM FUNCIONARIO)
ORDER BY CODIGO DESC;

--OPERADORES LÓGICOS E RELACIONAIS PODEM SER UTILIZADOS
SELECT * FROM FUNCIONARIO
WHERE SALARIO < 5000.00;

SELECT * FROM FUNCIONARIO
WHERE SALARIO >= 5000.00;

SELECT * FROM FUNCIONARIO
WHERE SALARIO >= 5000.00 AND SEXO = 'F';

SELECT * FROM FUNCIONARIO
WHERE SALARIO < 5000.00 OR SEXO = 'F';

SELECT * FROM FUNCIONARIO WHERE EMAIL IS NULL;

SELECT * FROM FUNCIONARIO WHERE CODIGO BETWEEN 1 AND 2;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--QUANTIFICADOR EXISTENCIAL

--FUNCIONÁRIOS QUE NÃO POSSUEM DEPENDENTES
SELECT F.CODIGO || ' - ' || F.NOME 
"CÓDIGO - NOME DO FUNCIONÁRIO" FROM FUNCIONARIO F
WHERE NOT EXISTS 
(SELECT * FROM DEPENDENTE_FUNCIONARIO D 
WHERE F.CODIGO = D.COD_FUNC);

--FUNCIONÁRIOS QUE POSSUEM DEPENDENTES
SELECT F.CODIGO || ' - ' || 
F.NOME "CÓDIGO - NOME DO FUNCIONÁRIO" FROM FUNCIONARIO F
WHERE EXISTS 
(SELECT * FROM DEPENDENTE_FUNCIONARIO D 
WHERE F.CODIGO = D.COD_FUNC);

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--SUBCONSULTAS
--FUNCIONARIOS COM NOME DE RONALDO
SELECT NOME, SALARIO FROM FUNCIONARIO 
WHERE SUBSTR(NOME,1,7) = (SELECT SUBSTR(NOME,1,7) 
FROM FUNCIONARIO 
WHERE SUBSTR(NOME,1,7)='RONALDO' AND ROWNUM=1);

--FUNCIONÁRIOS QUE SÃO ANALISTAS DE SISTEMAS                                                          
SELECT NOME, SALARIO FROM FUNCIONARIO 
WHERE COD_CARGO = 
(SELECT CODIGO FROM CARGO 
WHERE DESCRICAO = 'ANALISTA DE SISTEMAS'); 

--ESTA CONSULTA RETORNA OS FUNCIONÁRIO QUE TEM SALÁRIO MAIS ALTO DO QUE O DO RONALDO GAÚCHO
SELECT NOME, AVG(SALARIO) FROM FUNCIONARIO
GROUP BY NOME
HAVING AVG(SALARIO) > (SELECT SALARIO 
FROM FUNCIONARIO WHERE NOME = 'RONALDO GAÚCHO');

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--UNION
SELECT NOME FROM FUNCIONARIO
UNION
SELECT NOME FROM DEPENDENTE_FUNCIONARIO;

--UNION ALL
SELECT NOME FROM FUNCIONARIO
UNION ALL
SELECT NOME FROM DEPENDENTE_FUNCIONARIO;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------

--Consultando funcionário e seu cargo
SELECT FUNCIONARIO.NOME, CARGO.DESCRICAO FROM CARGO
INNER JOIN FUNCIONARIO
ON FUNCIONARIO.COD_CARGO = CARGO.CODIGO
WHERE FUNCIONARIO.CODIGO = 1;
      
--Consultando funcionário e seus dependentes
SELECT FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME 
FROM FUNCIONARIO
INNER JOIN DEPENDENTE_FUNCIONARIO
ON FUNCIONARIO.CODIGO = DEPENDENTE_FUNCIONARIO.COD_FUNC
GROUP BY FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME;

--MESMA CONSULTA ANTERIOR COM APELIDOS NAS COLUNAS NOME
SELECT FUNCIONARIO.NOME "NOME DO FUNCIONÁRIO", 
DEPENDENTE_FUNCIONARIO.NOME "NOME DO DEPENDENTE" 
FROM FUNCIONARIO
INNER JOIN DEPENDENTE_FUNCIONARIO
ON FUNCIONARIO.CODIGO = DEPENDENTE_FUNCIONARIO.COD_FUNC
GROUP BY FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME;

--MESMA CONSULTA ANTERIOR COM APELIDOS TAMBÉM PARA AS TABELAS
SELECT F.NOME "NOME DO FUNCIONÁRIO", 
D.NOME "NOME DO DEPENDENTE" FROM FUNCIONARIO F
INNER JOIN DEPENDENTE_FUNCIONARIO D
ON F.CODIGO = D.COD_FUNC
GROUP BY F.NOME, D.NOME;

--LADO ESQUERDO DO CONJUNTO -- FUNCIONARIO
SELECT F.NOME "NOME DO FUNCIONÁRIO", 
D.NOME "NOME DO DEPENDENTE" FROM FUNCIONARIO F
LEFT OUTER JOIN DEPENDENTE_FUNCIONARIO D
ON F.CODIGO = D.COD_FUNC;

--LADO DIREITO DO CONJUNTO -- DEPENDENTE_FUNCIONARIO
SELECT F.NOME "NOME DO FUNCIONÁRIO", D.NOME "NOME DO DEPENDENTE" FROM FUNCIONARIO F
RIGHT OUTER JOIN DEPENDENTE_FUNCIONARIO D
ON F.CODIGO = D.COD_FUNC;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--FUNÇÕES DE CONVERSÃO
-----------------------------------------------------------------------------------------------------------------------
--CONVERTER DATA EM STRING
SELECT TO_CHAR(SYSDATE, 'DD-MON-YY HH24:MI:SS') 
"Data e Hora" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI:SS') 
"Data e Hora" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH24:MI') "Data e Hora" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'Day - Mon - YYYY HH24:MI:SS') "Data e Hora" FROM DUAL;

--CONVERTER NÚMERO EM STRING
SELECT TO_CHAR(123456, '99G99G99') "Resultado" FROM DUAL;

SELECT TO_CHAR(SALARIO, '999,999,999.99') "Salário" 
FROM FUNCIONARIO;

SELECT REPLACE(TO_CHAR(SALARIO, '999999999.99'),'.',',')
"Salário" FROM FUNCIONARIO;

SELECT TO_CHAR(SALARIO, '999999999.99') FROM FUNCIONARIO;
SELECT REPLACE(TO_CHAR(SALARIO, '$999999999.99'),'.',',') 
FROM FUNCIONARIO;

--CONVERTER STRING EM DATA
SELECT TO_DATE('Janeiro 10, 1982','Month DD, YYYY') 
"Resultado" FROM DUAL;


,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
--CONVERTER STRING EM TIMESTAMP
SELECT TO_TIMESTAMP('Janeiro 10, 1982','Month DD, YYYY') 
"Resultado" FROM DUAL;

--CONVERTER STRING EM NÚMERO
SELECT TO_NUMBER('$12345.12','$99999.99') 
"Resultado" FROM DUAL;

SELECT TO_NUMBER(TELEFONE_RES,'999999999999999') "Telefone convertido em número" FROM FUNCIONARIO;
-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--INTERSECT
SELECT NOME "FUNCIONÁRIOS E CLIENTES" FROM FUNCIONARIO
INTERSECT
SELECT NOME FROM CLIENTE
ORDER BY "FUNCIONÁRIOS E CLIENTES";

--MINUS
SELECT NOME "FUNCIONÁRIOS NÃO CLIENTES" FROM FUNCIONARIO
MINUS
SELECT NOME FROM CLIENTE
ORDER BY "FUNCIONÁRIOS NÃO CLIENTES";
