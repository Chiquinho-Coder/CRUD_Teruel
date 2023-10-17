create schema banco;
use banco;
create table produto(
codigo int not null primary key,
nome varchar(40) not null,
marca varchar(40) null,
preco double
);
insert into produto values (1,'smurf padrao','smurf', 1.50);
select * from produto;

drop table produto;
ALTER TABLE produto
MODIFY COLUMN nome VARCHAR(40),
MODIFY COLUMN marca VARCHAR(40);






select * from produto;

ALTER TABLE produto
CHANGE preco quantidade DECIMAL(10, 2);

ALTER TABLE produto
MODIFY quantidade INT;

ALTER TABLE produto
ADD COLUMN local VARCHAR(100);

DELETE FROM produto WHERE 1;
DELETE FROM produto WHERE 10;
DELETE FROM produto WHERE 33;
DELETE FROM produto WHERE 44;
DELETE FROM produto WHERE 1951;
