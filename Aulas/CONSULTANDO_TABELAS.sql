-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--A PARTIR DESTE PONTO, VAMOS EFETUAR UMA S�RIE DE CONSULTAS NAS TABELAS ACIMA CRIADAS
--PARA EXECUTAR AS DECLARA��ES ABAIXO, PRECISAMOS DAS TABELAS DA ATIVIDADE CRIANDO_TABELAS.SQL
-----------------------------------------------------------------------------------------------------------------------
--UTILIZANDO * PARA TRAZER TODAS AS COLUNAS INDISCRIMINADAMENTE
SELECT * FROM CARGO;

--O SELECT ABAIXO RETORNAR� DUAS LINHAS
SELECT SETOR FROM CARGO;
--PARA ELIMINAR A DUPLICIDADE UTILIZE DISTINCT
SELECT DISTINCT SETOR FROM CARGO;

--OPERA��ES MATEM�TICAS PODEM SER REALIZADAS NOS RETORNOS
SELECT NOME, SALARIO, SALARIO - (SALARIO * 0.27) 
FROM FUNCIONARIO;

--APELIDOS (ALIAS) PODEM SER DADOS PARA DAR MAIS CLAREZA NA INFORMA��O RETORNADA
SELECT NOME, SALARIO "SAL�RIO BRUTO", 
SALARIO - (SALARIO * 0.27) "SAL�RIO L�QUIDO" FROM FUNCIONARIO;

--OU ASSIM EM OUTRAS VERS�ES
SELECT NOME, SALARIO AS "SAL�RIO BRUTO", 
SALARIO - (SALARIO * 0.27) AS "SAL�RIO L�QUIDO" FROM FUNCIONARIO;

--PODE HAVER NECESSIDADE DE INDICAR EM QUAL TABELA EST� A COLUNA CONSULTADA
SELECT FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME 
FROM FUNCIONARIO, DEPENDENTE_FUNCIONARIO;

--UM APELIDO (ALIAS) PODE SER DADO PARA A TABELA DA CONSULTA
SELECT F.CODIGO, F.NOME FROM FUNCIONARIO F;
--NO CASO ANTERIOR ASSIM:
SELECT F.NOME, D.NOME 
FROM FUNCIONARIO F, DEPENDENTE_FUNCIONARIO D;

--PODE-SE CONCATENAR (JUNTAR) AS COLUNAS NO RETORNO DA CONSULTA
SELECT F.CODIGO || ' - ' || 
F.NOME "C�DIGO - NOME DO FUNCION�RIO" 
FROM FUNCIONARIO F;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--CONSULTA UTILIZANDO A CL�USULA WHERE, ONDE UMA CONDI��O DEVE 
--SER ESTABELECIDA PARA O RETORNO DOS DADOS DA TABELA
--UTILIZANDO O SINAL = PARA COMPARA��O DAS INFORMA��ES
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO = 3;

--UTILIZANDO A PALAVRA RESERVADA (IN) PARA COMPARA��O DAS INFORMA��ES
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO IN (2);

--COM (IN) PODEMOS COMPARAR UM GRUPO DE INFORMA��ES
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO IN (2,3);

--OUTRA FORMA DE COMPARA��O � A UTILZA��O DO "LIKE"
SELECT NOME FROM FUNCIONARIO
WHERE CODIGO LIKE 2;

--COM "LIKE" E "%" PODEMOS EFETUAR UMA S�RIE DE COMPARA��ES
--A INFORMA��O COME�A COM A LETRA X
SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE 'R%';

--A INFORMA��O TERMINA COM A LETRA X
SELECT NOME FROM FUNCIONARIO
WHERE NOME LIKE '%�';

--A INFORMA��O POSSUI A LETRA X
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
--UTILIZANDO FUN��ES PARA RETORNO DAS INFORMA��ES NAS TABELAS
--FUN��ES DE LINHA
--INITCAP (string) -- Primeira letra de cada palavra em mai�scula
SELECT INITCAP(NOME) FROM FUNCIONARIO;

--REPLACE (string, string_a_pesquisar [string_substituta])
SELECT REPLACE(NOME, 'RONALDO', 'ANDR�') "NOMES TROCADOS" 
FROM FUNCIONARIO;

--LOWER (string) --retorna a string com letras min�sculas
SELECT LOWER(NOME) FROM FUNCIONARIO;

--UPPER (string) -- retorna a string com letras mai�sculas
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
SELECT LTRIM(NOME) FROM FUNCIONARIO; --remove os espa�os da esquerda da string

--RTRIM (string)
SELECT RTRIM(NOME) FROM FUNCIONARIO; --remove os espa�os da direita da string

--NVL (valor,0)
SELECT QTDE_DEPENDENTE FROM FUNCIONARIO;
SELECT NVL(QTDE_DEPENDENTE, 0) FROM FUNCIONARIO; --troca o valor null por 0
SELECT REPLACE(NVL(QTDE_DEPENDENTE, 0),0,'valor nulo') FROM FUNCIONARIO; --TESTE DO PROFESSOR

--ROUND (valor)
SELECT SALARIO FROM FUNCIONARIO; -- sal�rio original
SELECT to_char(SALARIO) FROM FUNCIONARIO;
SELECT ROUND(SALARIO) FROM FUNCIONARIO; --arredondado

--TRUNC (valor)
SELECT TRUNC(SALARIO) FROM FUNCIONARIO; --truncado, apenas a parte inteira

--MOD (valor1, valor2)
SELECT MOD(SALARIO, 2) FROM FUNCIONARIO; --retorna o resto da divis�o

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--FUN��ES DE GRUPO
--AVG - RETORNA A M�DIA DA COLUNA PESQUISADA
SELECT AVG(SALARIO) FROM FUNCIONARIO;

--MAX - RETORNA O VALOR M�XIMO DA COLUNA PESQUISADA
SELECT MAX(SALARIO) FROM FUNCIONARIO;
SELECT MAX(EMAIL) FROM FUNCIONARIO; -- TABELA ASCII

--MIN - RETORNA O VALOR M�NIMO DA COLUNA PESQUISADA
SELECT MIN(SALARIO) FROM FUNCIONARIO;
SELECT MIN(EMAIL) FROM FUNCIONARIO; -- TABELA ASCII

--SUM -- RETORNA A SOMA DA COLUNA PESQUISADA
SELECT SUM(SALARIO) FROM FUNCIONARIO;

--ORDEM ALFAB�TICA CRESCDENTE
SELECT NOME FROM FUNCIONARIO
ORDER BY NOME ASC;

--ORDEM ALFAB�TICA DECRESCENTE
SELECT NOME FROM FUNCIONARIO
ORDER BY NOME DESC;

--ORDENAR PELA SEGUNDA COLUNA DA CONSULTA
SELECT NOME, SALARIO * 12 "SAL�RIO ANUAL" FROM FUNCIONARIO
ORDER BY 2 DESC;

--PODE-SE AGRUPAR AS LINHAS EM COMUM DA CONSULTA
-- A CONSULTA ABAIXO AGRUPA OS FUNCION�RIOS QUE TEM SAL�RIOS IGUAIS
--  EM UM AGRUPAMENTO TODAS AS COLUNAS DA CONSULTAS DEVEM SER CONTEMPLADAS
SELECT NOME, SALARIO FROM FUNCIONARIO
GROUP BY SALARIO, NOME;

--A CL�USULA HAVING � USADA PARA AGRUPAR OS DADOS CONSULTADOS DE UMA TABELA, ATRAV�S DE UMA CONDI��O
SELECT NOME, SALARIO FROM FUNCIONARIO
GROUP BY NOME, SALARIO
HAVING (SALARIO) = 5000.00;

--EFETUA A CONTAGEM DO N�MERO DE LINHAS DA PESQUISA
SELECT COUNT(*) FROM FUNCIONARIO; --CONTAGEM DE TODOS OS FUNCION�RIOS

SELECT COUNT(*) FROM FUNCIONARIO WHERE SEXO = 'M'; --CONTAGEM DE TODOS OS FUNCION�RIOS HOMENS

SELECT COUNT(EMAIL) FROM FUNCIONARIO; --CONTAGEM DE TODOS OS FUNCION�RIOS QUE TEM EMAIL CADASTRADO
-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------

--UTILIZA-SE NA CONDI��O A COLUNA DO ORACLE ROWNUM DA TABELA PARA TRAZER O 
--N�MERO DE LINHAS DESEJADO NO RETORNO
SELECT CODIGO, NOME, CPF FROM FUNCIONARIO
WHERE ROWNUM = 1; --RETORNAR� 1 LINHA, INDEPENDENTE SE RETORNARIA 10 OU MAIS

--CONSULTA DE UMA CONSULTA DE UMA TABELA
SELECT * FROM (SELECT CODIGO, NOME, CPF, SALARIO FROM FUNCIONARIO)
ORDER BY CODIGO DESC;

--OPERADORES L�GICOS E RELACIONAIS PODEM SER UTILIZADOS
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

--FUNCION�RIOS QUE N�O POSSUEM DEPENDENTES
SELECT F.CODIGO || ' - ' || F.NOME 
"C�DIGO - NOME DO FUNCION�RIO" FROM FUNCIONARIO F
WHERE NOT EXISTS 
(SELECT * FROM DEPENDENTE_FUNCIONARIO D 
WHERE F.CODIGO = D.COD_FUNC);

--FUNCION�RIOS QUE POSSUEM DEPENDENTES
SELECT F.CODIGO || ' - ' || 
F.NOME "C�DIGO - NOME DO FUNCION�RIO" FROM FUNCIONARIO F
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

--FUNCION�RIOS QUE S�O ANALISTAS DE SISTEMAS                                                          
SELECT NOME, SALARIO FROM FUNCIONARIO 
WHERE COD_CARGO = 
(SELECT CODIGO FROM CARGO 
WHERE DESCRICAO = 'ANALISTA DE SISTEMAS'); 

--ESTA CONSULTA RETORNA OS FUNCION�RIO QUE TEM SAL�RIO MAIS ALTO DO QUE O DO RONALDO GA�CHO
SELECT NOME, AVG(SALARIO) FROM FUNCIONARIO
GROUP BY NOME
HAVING AVG(SALARIO) > (SELECT SALARIO 
FROM FUNCIONARIO WHERE NOME = 'RONALDO GA�CHO');

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

--Consultando funcion�rio e seu cargo
SELECT FUNCIONARIO.NOME, CARGO.DESCRICAO FROM CARGO
INNER JOIN FUNCIONARIO
ON FUNCIONARIO.COD_CARGO = CARGO.CODIGO
WHERE FUNCIONARIO.CODIGO = 1;
      
--Consultando funcion�rio e seus dependentes
SELECT FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME 
FROM FUNCIONARIO
INNER JOIN DEPENDENTE_FUNCIONARIO
ON FUNCIONARIO.CODIGO = DEPENDENTE_FUNCIONARIO.COD_FUNC
GROUP BY FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME;

--MESMA CONSULTA ANTERIOR COM APELIDOS NAS COLUNAS NOME
SELECT FUNCIONARIO.NOME "NOME DO FUNCION�RIO", 
DEPENDENTE_FUNCIONARIO.NOME "NOME DO DEPENDENTE" 
FROM FUNCIONARIO
INNER JOIN DEPENDENTE_FUNCIONARIO
ON FUNCIONARIO.CODIGO = DEPENDENTE_FUNCIONARIO.COD_FUNC
GROUP BY FUNCIONARIO.NOME, DEPENDENTE_FUNCIONARIO.NOME;

--MESMA CONSULTA ANTERIOR COM APELIDOS TAMB�M PARA AS TABELAS
SELECT F.NOME "NOME DO FUNCION�RIO", 
D.NOME "NOME DO DEPENDENTE" FROM FUNCIONARIO F
INNER JOIN DEPENDENTE_FUNCIONARIO D
ON F.CODIGO = D.COD_FUNC
GROUP BY F.NOME, D.NOME;

--LADO ESQUERDO DO CONJUNTO -- FUNCIONARIO
SELECT F.NOME "NOME DO FUNCION�RIO", 
D.NOME "NOME DO DEPENDENTE" FROM FUNCIONARIO F
LEFT OUTER JOIN DEPENDENTE_FUNCIONARIO D
ON F.CODIGO = D.COD_FUNC;

--LADO DIREITO DO CONJUNTO -- DEPENDENTE_FUNCIONARIO
SELECT F.NOME "NOME DO FUNCION�RIO", D.NOME "NOME DO DEPENDENTE" FROM FUNCIONARIO F
RIGHT OUTER JOIN DEPENDENTE_FUNCIONARIO D
ON F.CODIGO = D.COD_FUNC;

-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--FUN��ES DE CONVERS�O
-----------------------------------------------------------------------------------------------------------------------
--CONVERTER DATA EM STRING
SELECT TO_CHAR(SYSDATE, 'DD-MON-YY HH24:MI:SS') 
"Data e Hora" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI:SS') 
"Data e Hora" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH24:MI') "Data e Hora" FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'Day - Mon - YYYY HH24:MI:SS') "Data e Hora" FROM DUAL;

--CONVERTER N�MERO EM STRING
SELECT TO_CHAR(123456, '99G99G99') "Resultado" FROM DUAL;

SELECT TO_CHAR(SALARIO, '999,999,999.99') "Sal�rio" 
FROM FUNCIONARIO;

SELECT REPLACE(TO_CHAR(SALARIO, '999999999.99'),'.',',')
"Sal�rio" FROM FUNCIONARIO;

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

--CONVERTER STRING EM N�MERO
SELECT TO_NUMBER('$12345.12','$99999.99') 
"Resultado" FROM DUAL;

SELECT TO_NUMBER(TELEFONE_RES,'999999999999999') "Telefone convertido em n�mero" FROM FUNCIONARIO;
-----------------------------------------------------------------------------------------------------------------------
--*******************************************************************************************************************--
-----------------------------------------------------------------------------------------------------------------------
--INTERSECT
SELECT NOME "FUNCION�RIOS E CLIENTES" FROM FUNCIONARIO
INTERSECT
SELECT NOME FROM CLIENTE
ORDER BY "FUNCION�RIOS E CLIENTES";

--MINUS
SELECT NOME "FUNCION�RIOS N�O CLIENTES" FROM FUNCIONARIO
MINUS
SELECT NOME FROM CLIENTE
ORDER BY "FUNCION�RIOS N�O CLIENTES";
