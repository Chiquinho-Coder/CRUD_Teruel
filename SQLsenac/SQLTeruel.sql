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
