
select *from tbproduto where PRECO_LISTA >= 16.007 and PRECO_LISTA <= 16.009; 

select * from tbcliente where IDADE >= 18 and IDADE <= 22;

select * from tbcliente where IDADE >= 18 and IDADE <= 22 and SEXO ='M';

select * from tbcliente where CIDADE='Rio de Janeiro' or BAIRRO='Jardins';

select * from tbcliente where (IDADE >= 18 and IDADE <= 22 and SEXO ='M') or  
(CIDADE='Rio de Janeiro' or BAIRRO='Jardins');