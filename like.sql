use sucos_vendas;

select * from tabela_de_produtos where SABOR like('%Maçã%');

select * from tabela_de_produtos where SABOR like('%Maçã%')
and EMBALAGEM ='PET';

select * from tabela_de_clientes where NOME like('%Mattos%');