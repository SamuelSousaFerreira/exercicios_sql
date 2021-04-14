
select * from tbcliente;

select CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,
SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA from tbcliente;

select CPF,NOME from tbcliente;

select CPF,NOME from tbcliente limit 5;


select NOME as NOME_VEND, MATRICULA as MAT_VEND from tabela_de_vendedores;