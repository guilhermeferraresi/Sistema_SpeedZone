drop database dbTCC;
create database dbTCC;
use dbTCC;

create table tbUsuario(
	IdUsuario int primary key auto_increment,
    Nome varchar(50) unique not null,
    CPF bigint unique not null,
    DataNasc date not null,
    Sexo char(1) not null,
    Telefone varchar(20) not null,
    Email varchar (50) not null,
    Senha varchar(100) not null,
    NumEnd int not null,
    Cep varchar(15) not null,
    CompEnd varchar(30) not null,
    rg varchar(15) not null
);

insert into tbUsuario(nome, cpf, datanasc, sexo, telefone, email, senha, numend, cep, compend, rg) values("Guilherme Ferraresi", "50887741843", "2008-01-11", "M", "11994944785", "gui.ferraresi2008@gmail.com", "12345678", 1600, "06026090", "Apto. 52E", "577236945");
select * from tbusuario;

create table tbFunc(
	IdFunc int primary key auto_increment,
    Nome varchar(50) unique not null,
    CPF bigint unique not null,
    DataNasc date not null,
    Sexo char(1) not null,
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
    TipoCor varchar(50) not null
);

create table tbPneu(
	IdPneu int primary key auto_increment, 
    IdPeca int not null,
    Tipo varchar(100) not null
);

create table tbAro(
	IdAro int primary key auto_increment, 
    IdPeca int not null,
    Tipo varchar(100) not null
);

create table tbFreio(
	IdFreio int primary key auto_increment, 
    IdPeca int not null,
    Tipo varchar(100) not null
);

create table tbKits(
	IdKits int primary key auto_increment,
    IdPeca int not null,
    MaterialKits varchar(100) not null
);
 
 /*
create table tbDesignInterior(
	IdDesignInterior int primary key auto_increment,
    IdPeca int not null,
    CorCostura varchar(30) not null,
    CorInterior int not null,
    Tipo varchar(30) not null,
    TipoBanco varchar(25) not null,
    Cinto varchar(20) not null
);
*/

create table tbBanco(
	IdBanco	 int primary key auto_increment,
    IdPeca int not null,
    Tipo varchar(100) not null
);

create table tbCinto(
	IdCinto int primary key auto_increment,
    IdPeca int not null,
    Tipo varchar(100) not null
);

create table tbCorInterior(
	IdCorInterior	 int primary key auto_increment,
    IdPeca int not null,
    Tipo varchar(100) not null
);

create table tbTeto(
	IdTeto	 int primary key auto_increment,
    IdPeca int not null,
    Tipo varchar(100) not null
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
alter table tbKits add constraint fk_idPecaKits foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbVidro add constraint fk_idPecaVidro foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbTeto add constraint fk_idPecaTeto foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbPneu add constraint fk_idPecaPneu foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbFreio add constraint fk_idPecaFreio foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbAro add constraint fk_idPecaAro foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbBanco add constraint fk_idPecaBanco foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbCinto add constraint fk_idPecaCinto foreign key(IdPeca) references tbPeca(IdPeca);
alter table tbCorInterior add constraint fk_idPecaCorInts foreign key(IdPeca) references tbPeca(IdPeca);

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

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('Aro', 15000.00, 'img/aro/altanero_bronze_diamond_cut'),
('Aro', 15500.00, 'img/aro/altanero_titanium_matt_diamond_cut'),
('Aro', 15200.00, 'img/aro/altanero_titanium_shiny'),
('Aro', 15800.00, 'img/aro/altanero_shiny_black_diamond_cut'),
('Aro', 14900.00, 'img/aro/altanero_shiny_black');

INSERT INTO tbAro (IdPeca, Tipo) VALUES
(17, 'Rims Altanero Bronze Diamond cut (21"|22" forged)'),
(18, 'Rims Altanero Titanium matt Diamond cut (21"|22" forged)'),
(19, 'Rims Altanero Titanium shiny (21"|22" forged)'),
(20, 'Rims Altanero Shiny Black Diamond cut (21"|22" forged)'),
(21, 'Rims Altanero Shiny Black (21"|22" forged)');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('pneu', 5200.00, 'img/pneu/bridgestone_sport_tires_20_21_rft'),
('pneu', 4800.00, 'img/pneu/bridgestone_sport_tires_20_21');

INSERT INTO tbPneu (IdPeca, Tipo) VALUES
(22, 'Bridgestone Sport Tires 20"/21" RFT'),
(23, 'Bridgestone Sport Tires 20"/21');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('freio', 9000.00, 'img/freio/matt_black_ccb_brake_calipers'),
('freio', 9200.00, 'img/freio/bronzo_ccb_brake_calipers'),
('freio', 9500.00, 'img/freio/verde_chiaro_ccb_brake_calipers'),
('freio', 9400.00, 'img/freio/arancio_ccb_brake_calipers'),
('freio', 9300.00, 'img/freio/blu_ccb_brake_calipers'),
('freio', 9100.00, 'img/freio/bianco_ccb_brake_calipers'),
('freio', 9600.00, 'img/freio/giallo_ccb_brake_calipers'),
('freio', 9700.00, 'img/freio/verde_ccb_brake_calipers');

INSERT INTO tbFreio (IdPeca, Tipo) VALUES
(24, 'Matt black CCB brake Calipers'),
(25, 'Bronzo CCB Brake Calipers'),
(26, 'Verde Chiaro CCB Brake Calipers'),
(27, 'Arancio CCB Brake Calipers'),
(28, 'Blu CCB Brake Calipers'),
(29, 'Bianco CCB Brake Calipers'),
(30, 'Giallo CCB brake Calipers'),
(31, 'Verde CCB brake Calipers');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('teto', 7000.00, 'img/teto/engine_grilles_matt_black'),
('teto', 7200.00, 'img/teto/engine_grilles_grigio_titans'),
('teto', 8000.00, 'img/teto/upper_matt_black_livery'),
('teto', 8200.00, 'img/teto/upper_shiny_black_livery');

INSERT INTO tbTeto (IdPeca, Tipo) VALUES
(32, 'Engine grilles colored in matt black'),
(33, 'Engine grilles colored in match with Grigio Titans'),
(34, 'Upper matt black livery (roof, A-pillars, livery on cofango)'),
(35, 'Upper shiny black livery (roof,A-pillars,livery on cofango)');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('CorInterior', 3000.00, 'img/corinterior/nero_ade'),
('CorInterior', 3200.00, 'img/corinterior/grigio_octans'),
('CorInterior', 3300.00, 'img/corinterior/blu_delphinus'),
('CorInterior', 3400.00, 'img/corinterior/rosso_burgundy'),	
('CorInterior', 3500.00, 'img/corinterior/blu_amon'),
('CorInterior', 3600.00, 'img/corinterior/arancio_apodis'),
('CorInterior', 3700.00, 'img/corinterior/arancio_leonis'),
('CorInterior', 3200.00, 'img/corinterior/bianco_leda');

INSERT INTO tbCorInterior (IdPeca, Tipo) VALUES
(36, 'Nero Ade'),
(37, 'Grigio Octans'),
(38, 'Blu Delphinus'),
(39, 'Rosso Burgundy'),
(40, 'Blu Amon'),
(41, 'Arancio Apodis'),
(42, 'Arancio Leonis'),
(43, 'Bianco Leda');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('Banco', 8500.00, 'img/banco/comfort_seats'),
('Banco', 12500.00, 'img/banco/sport_seats_corsa_tex_pack'),
('Banco', 18900.00, 'img/banco/fully_electric_and_heated_seats'),
('Banco', 11000.00, 'img/banco/sport_seats');

INSERT INTO tbBanco (IdPeca, Tipo) VALUES
(1, 'Comfort Seats'),
(2, 'Sport Seats (Corsa Tex Pack)'),
(3, 'Fully electric and heated seats'),
(4, 'Sport Seats');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('Cinto', 2200.00, 'img/cinto/marrone_elpis'),
('Cinto', 2400.00, 'img/cinto/grigio_sirius'),
('Cinto', 2500.00, 'img/cinto/rosso_efesto'),
('Cinto', 2600.00, 'img/cinto/blu_cepheus'),
('Cinto', 2500.00, 'img/cinto/rosso_alala'),
('Cinto', 2700.00, 'img/cinto/giallo_taurus');

INSERT INTO tbCinto (IdPeca, Tipo) VALUES
(5, 'Marrone Elpis'),
(6, 'Grigio Sirius'),
(7, 'Rosso Efesto'),
(8, 'Blu Cepheus'),
(9, 'Rosso Alala'),
(10, 'Giallo Taurus');

insert into tbModelo(marca, nome, ano, categoriacarro, img) values
("Lamborghini", "Revuelto", 2025, "Esportivo", "img/revuelto"),
("Lamborghini", "Temerario", 2025, "Esportivo", "img/temerario"),
("Lamborghini", "Urus", 2025, "USV", "img/urus");

select * from tbpeca;