drop database dbTCC;
create database dbTCC;
use dbTCC;

create table tbUsuario(
	IdUsuario int primary key auto_increment,
    Nome varchar(50) unique not null,
    CPF bigint unique not null,
    DataNasc date not null,
    Telefone varchar(20) not null,
    Email varchar (50) not null,
    Senha varchar(100) not null,
    NumEnd int not null,
    Cep varchar(15) not null,
    CompEnd varchar(30) not null,
    rg varchar(15) not null
);

create table tbFunc(
	IdFunc int primary key auto_increment,
    Nome varchar(50) unique not null,
    CPF bigint unique not null,
    DataNasc date not null,
    Telefone varchar(20) not null,
    Email varchar (50) not null,
    NumEnd int not null,
    Cep varchar(15) not null,
    CompEnd varchar(30) not null,
    rg varchar(15) not null
);

create table tbFormaPagamento(
	IdFormaPagamento int primary key auto_increment,
    TipoPagamento varchar(25) not null,
    Parcelas int not null
);

create table tbPagamento(
	IdPagamento int primary key auto_increment,
    IdPedido int not null,
    IdFormaPagamento int not null,
    Valor decimal(10,2) not null,
    DataPagamento date not null,
    StatusPagamento varchar(20) not null
);

create table tbCartao(
	IdCartao int primary key auto_increment,
	IdPagamento int not null,
    NumeroCartao varchar(16) not null,
    Nome varchar(30) not null,
    Validade varchar(5) not null,
    Bandeira varchar(20) not null
);

create table tbPedido(
	IdPedido int primary key auto_increment,
    IdUsuario int not null,
    IdPersonalizacao int not null,
    idFuncAprovador int not null,
	DataPedido datetime not null,
    StatusPedido varchar(30) not null,
    ValorTotal decimal(10,2) not null
);

create table tbModelo(
	IdModelo int primary key auto_increment,
    Marca varchar(40) not null,
    Nome varchar(40) not null,
    Ano int not null,
    CategoriaCarro varchar(30) not null,
    Img varchar(70) not null
);

create table tbPersonalizacao(
	IdPersonalizacao int primary key auto_increment,
    IdModelo int not null,
    IdPeca int not null
 );

create table tbPeca(
	IdPeca int primary key auto_increment,
    Tipo varchar(30) not null,
    Preco double(8,2) not null,
    Img varchar(70) not null
);

create table tbPintura(
	IdCor int primary key auto_increment, 
	IdPeca int not null,
    TipoCor varchar(25) not null
);

create table tbRodas(
	IdRoda int primary key auto_increment, 
    IdPeca int not null,
    Aro varchar(40) not null,
    Pneu varchar(30) not null,
    Freio varchar(20) not null
);

create table tbKits(
	IdKits int primary key auto_increment,
    IdPeca int not null,
    MaterialKits varchar(40) not null
);
 
create table tbDesignInterior(
	IdDesignInterior int primary key auto_increment,
    IdPeca int not null,
    CorCostura varchar(30) not null,
    CorInterior int not null,
    Tipo varchar(30) not null,
    TipoBanco varchar(25) not null,
    Cinto varchar(20) not null
);

create table tbTeto(
	IdVidro	 int primary key auto_increment,
    IdPeca int not null,
    CorTeto varchar(20) not null
);

create table tbVidro(
	IdVidro	 int primary key auto_increment,
    IdPeca int not null,
    Transparencia varchar(20) not null
);

alter table tbPedido add constraint fk_idUsuario foreign key(idUsuario) references tbUsuario(idUsuario);
alter table tbPedido add constraint fk_idFuncAprovador foreign key(IdFuncAprovador) references tbFunc(IdFunc);
alter table tbPedido add constraint fk_idPersonalizacaoPedido foreign key(idPersonalizacao) references tbPersonalizacao(idPersonalizacao);
alter table tbPagamento add constraint fk_idpedido foreign key(idpedido) references tbPedido(idpedido);
alter table tbPagamento add constraint fk_idFormaPagamento foreign key(idFormaPagamento) references tbFormaPagamento(idFormaPagamento);
alter table tbCartao add constraint fk_idPagamentoCartao foreign key(idPagamento) references tbPagamento(idPagamento);
alter table tbPersonalizacao add constraint fk_idPeca foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbPersonalizacao add constraint fk_idModeloPersonalizacao foreign key(IdModelo) references tbModelo(IdModelo);
alter table tbPintura add constraint fk_idPecaPintura foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbRodas add constraint fk_idPecaRodas foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbKits add constraint fk_idPecaKits foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbVidro add constraint fk_idPecaVidro foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbTeto add constraint fk_idPecaTeto foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbDesignInterior add constraint fk_idPecaDesignInts foreign key(IdPeca) references tbPeca(IdPeca);

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('cor', 8500.00, 'img/cor/arancio_xanto'),
('cor', 8000.00, 'img/cor/bianco_asopo'),
('cor', 8700.00, 'img/cor/blu_nethuns'),
('cor', 8600.00, 'img/cor/giallo_belenus'),
('cor', 8300.00, 'img/cor/grigio_telesto'),
('cor', 8900.00, 'img/cor/rosso_anteros'),
('cor', 9000.00, 'img/cor/rosso_mars'),
('cor', 8200.00, 'img/cor/verde_lares'),
('cor', 8800.00, 'img/cor/verde_mantis'),
('cor', 8700.00, 'img/cor/arancio_borealis'),
('cor', 8100.00, 'img/cor/bianco_icarus'),
('cor', 8000.00, 'img/cor/bianco_monocerus'),
('cor', 8600.00, 'img/cor/blu_astraeus'),
('cor', 8700.00, 'img/cor/blu_eleos'),
('cor', 8500.00, 'img/cor/giallo_auge'),
('cor', 8500.00, 'img/cor/giallo_inti');

INSERT INTO tbPintura (IdPeca, TipoCor) VALUES
(1, 'Arancio Xanto'),
(2, 'Bianco Asopo'),
(3, 'Blu Nethuns'),
(4, 'Giallo Belenus'),
(5, 'Grigio Telesto'),
(6, 'Rosso Anteros'),
(7, 'Rosso Mars'),
(8, 'Verde Lares'),
(9, 'Verde Mantis'),
(10, 'Arancio Borealis'),
(11, 'Bianco Icarus'),
(12, 'Bianco Monocerus'),
(13, 'Blu Astraeus'),
(14, 'Blu Eleos'),
(15, 'Giallo Auge'),
(16, 'Giallo Inti');

select * from tbpintura;