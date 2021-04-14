
select * from tabela_de_produtos;

select * from tabela_de_produtos order by PRECO_DE_LISTA;

select * from tabela_de_produtos order by PRECO_DE_LISTA desc;

select * from tabela_de_produtos order by NOME_DO_PRODUTO desc;

select * from tabela_de_produtos order by EMBALAGEM, NOME_DO_PRODUTO;

select * from tabela_de_produtos order by EMBALAGEM desc , NOME_DO_PRODUTO asc ;


select NUMERO from itens_notas_fiscais order by QUANTIDADE limit 3;

SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão'

SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC