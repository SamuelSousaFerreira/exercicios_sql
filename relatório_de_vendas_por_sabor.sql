#Montar um relatório por sabor do ano de 2016 de vendas decrescentes e a orcentagem do volume total de vendas

# para pegar a quantidade, ano e sabor precisaremos pegar esses dados em 3 tabelas
select TP.SABOR, NF.DATA_VENDA,INF.QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO;

#somente o ano de 2016 e ordenado pela quantidade em ordem decrescente
/*QUANTIDADE VENDIDA POR SABOR ANO DE 2016*/
select TP.SABOR, year(NF.DATA_VENDA) as ANO,SUM(INF.QUANTIDADE) as QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA) 
order by SUM(INF.QUANTIDADE)desc;

#calculando o percentual de participação
#Total- usando a mesma de cima e tirando o sabor da consulta
select year(NF.DATA_VENDA) as ANO,SUM(INF.QUANTIDADE) as QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA) 
order by SUM(INF.QUANTIDADE)desc;

select * from
(select TP.SABOR, year(NF.DATA_VENDA) as ANO,SUM(INF.QUANTIDADE) as QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR

inner join 

(select year(NF.DATA_VENDA) as ANO,SUM(INF.QUANTIDADE) as QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_TOTAL

on VENDA_SABOR.ANO = VENDA_TOTAL.ANO ;

#coluna porcentagem
select VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
round( (VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE)*100,2) as PECENTUAL_DE_VENDAS from
(select TP.SABOR, year(NF.DATA_VENDA) as ANO,SUM(INF.QUANTIDADE) as QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR

inner join 

(select year(NF.DATA_VENDA) as ANO,SUM(INF.QUANTIDADE) as QUANTIDADE from 
tabela_de_produtos TP
inner join itens_notas_fiscais INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_TOTAL;


SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
ROUND((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM
TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM
TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_SABOR.QUANTIDADE DESC;