drop database dbTCC;
create database dbTCC;
use dbTCC;

create table tbEndereco(
	IdEndereco int primary key auto_increment,
    Bairro varchar(30) not null,
    Rua varchar(40) not null,
    Complemento varchar(20) not null,
    Numero int not null
);

create table tbUsuario(
	IdUsuario int primary key auto_increment,
    Nome varchar(50) unique not null,
    CPF bigint unique not null,
    DataNasc date not null,
    Telefone varchar(20) not null,
    Email varchar (50) not null,
    Senha varchar(100) not null,
    idendereco int not null,
    rg varchar(15) not null
);

create table tbFunc(
	IdFunc int primary key auto_increment,
    Nome varchar(50) unique not null,
    CPF bigint unique not null,
    DataNasc date not null,
    Telefone varchar(20) not null,
    Email varchar (50) not null,
    idEndereco int not null,
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

create table tbPeca(
	IdPeca int primary key auto_increment,
    Tipo varchar(30) not null,
    Nome varchar(50) not null,
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
    IdFreio int not null
);

create table tbSuspensao(
	IdSuspensao int primary key auto_increment,
    IdPeca int not null,
    MarcaSuspensao varchar(40) not null
);

/*
create table tbFarois(
	IdFarol int primary key auto_increment, 
    IdPeca int not null,
	IdLampada int
);

create table tbLampada(
	IdLampada int primary key auto_increment, 
	TipoLampada varchar(25) not null,
    CorLampada varchar(40) not null,
    PrecoLampada decimal(8,2) not null
);
*/

create table tbAerofolio(
	IdAerofolio int primary key auto_increment,
    IdPeca int not null,
	MaterialAerofolio varchar(40) not null
);

create table tbKits(
	IdKits int primary key auto_increment,
    IdPeca int not null,
    MaterialKits varchar(40) not null
);

/*
create table tbEscapamentos(
	IdEscapamentos int primary key auto_increment,
    IdPeca int not null,
    Catalizador varchar(40) not null,
    Silenciador varchar(40) not null,
    Porteira varchar(40) not null
);
*/

create table tbBancos(
	IdBancos int primary key auto_increment,
    IdPeca int not null,
    TipoBanco varchar(50) not null
);

 create table tbPersonalizacao(
	IdPersonalizacao int primary key auto_increment,
    IdModelo int not null,
    IdPeca int not null
 );

create table tbCinto(
	IdCinto int primary key auto_increment,
    IdPeca int not null,
    CorCinto varchar(20) not null
);

create table tbDesignInterior(
	IdDesignInterior int primary key auto_increment,
    CorCostura varchar(30) not null,
    CorInterior varchar(30) not null,
    Tipo varchar(30) not null,
    IdPersonalizacao int not null
);

create table tbFreio(
	IdFreio int primary key auto_increment,
    Cor varchar(20) not null
);

alter table tbUsuario add constraint fk_idendereco foreign key(idendereco) references tbEndereco(idEndereco);
alter table tbFunc add constraint fk_idFuncEndereco foreign key(idEndereco) references tbEndereco(idEndereco);
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
alter table tbSuspensao add constraint fk_idPecaSuspensao foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbAerofolio add constraint fk_idPecaAerofolio foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbKits add constraint fk_idPecaKits foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbBancos add constraint fk_idPecaBanco foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbCinto add constraint fk_idPecaCinto foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbRodas add constraint fk_idFreioRoda foreign key(IdFreio) references tbFreio(IdFreio);
alter table tbDesignInterior add constraint fk_idPersonalizacaoDesign foreign key(idPersonalizacao) references tbPersonalizacao(idPersonalizacao);