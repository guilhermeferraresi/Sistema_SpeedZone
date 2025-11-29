drop database dbTCC;
create database dbTCC;
use dbTCC;

create table tbUsuario(
	IdUsuario int primary key auto_increment,
    Nome varchar(200) not null,
    CPF varchar(15) unique not null,
    DataNasc date not null,
    -- Sexo char(1) not null,
    Telefone varchar(20) not null,
    Email varchar (50) not null,
    Senha varchar(20) not null,
    NumEnd int not null,
    Cep varchar(15) not null,
    CompEnd varchar(30) not null,
    rg varchar(15) not null
);

-- insert into tbUsuario(nome, cpf, datanasc, telefone, email, senha, numend, cep, compend, rg) values("Guilherme Ferraresi", "50887741843", "2008-01-11", "11994944785", "gui.ferraresi2008@gmail.com", "12345678", 1600, "06026090", "Apto. 52E", "577236945");
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
    NumeroCartao varchar(16) not null,
    Nome varchar(30) not null,
    Validade varchar(10) not null,
    Bandeira varchar(20) not null
);

-- insert into tbCartao(NumeroCartao, Nome, Validade, Bandeira) values("1234567812345678", "Guilherme Ferraresi", "10/32", "Master Cadrd");
-- select * from tbCartao;

create table tbPedido(
	IdPedido int primary key auto_increment,
    IdUsuario int not null,
    IdPersonalizacao int not null,
    idFuncAprovador int not null,
	DataPedido datetime not null,
    StatusPedido char(1) not null,
    ValorTotal decimal(10,2) not null
);

create table tbModelo(
	IdModelo int primary key auto_increment,
    Marca varchar(40) not null,
    Nome varchar(40) not null,
    Ano int not null,
    CategoriaCarro varchar(30) not null,
    Img varchar(70) not null,
    Descricao varchar(500) not null,
	HP varchar(10) not null,
    Motor varchar(10) not null,
    Torque varchar(10) not null
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
    TipoCor varchar(50) not null,
    CodigoCor varchar(10) not null
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
('cor', 8500.00, '/img/cor/grigio_nimbus'),
('cor', 8000.00, '/img/cor/verde_mantis'),
('cor', 8700.00, '/img/cor/rosso_anteros'),
('cor', 8600.00, '/img/cor/arancio_borealis'),
('cor', 8300.00, '/img/cor/blu_astraeus'),
('cor', 8900.00, '/img/cor/blue_eleos'),
('cor', 9000.00, '/img/cor/giallo_auge'),
('cor', 8200.00, '/img/cor/giallo_inti'),
('cor', 8800.00, '/img/cor/grigio_keres');


INSERT INTO tbPintura (IdPeca, TipoCor, CodigoCor) VALUES
(1, 'Arancio Xanto', "A0A0A3"),
(2, 'Bianco Asopo', "0C0C0B"),
(3, 'Blu Nethuns', "578A20"),
(4, 'Giallo Belenus', "EBBD39"),
(5, 'Grigio Telesto', "c94b24"),
(6, 'Rosso Anteros', "AF2025"),
(7, 'Rosso Mars', "00174C"),
(8, 'Verde Lares', "3460B2"),
(9, 'Verde Mantis', "2f5167");

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('Aro', 15000.00, '/img/roda1.png'),
('Aro', 15500.00, '/img/roda2.png'),
('Aro', 15200.00, 'img/roda3.png');

INSERT INTO tbAro (IdPeca, Tipo) VALUES
(10, 'Rims Altanero Bronze Diamond cut (21"|22" forged)'),
(11, 'Rims Altanero Titanium matt Diamond cut (21"|22" forged)'),
(12, 'Rims Altanero Titanium shiny (21"|22" forged)');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('Cinto', 2200.00, '/img/cinto/marrone_elpis'),
('Cinto', 2400.00, '/img/cinto/grigio_sirius');

INSERT INTO tbCinto (IdPeca, Tipo) VALUES
(13, 'Marrone Elpis'),
(14 , 'Grigio Sirius');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('freio', 9000.00, '/img/freio/matt_black_ccb_brake_calipers'),
('freio', 9200.00, '/img/freio/bronzo_ccb_brake_calipers'),
('freio', 9500.00, '/img/freio/verde_chiaro_ccb_brake_calipers'),
('freio', 9400.00, '/img/freio/arancio_ccb_brake_calipers'),
('freio', 9300.00, '/img/freio/blu_ccb_brake_calipers'),
('freio', 9100.00, '/img/freio/bianco_ccb_brake_calipers'),
('freio', 9600.00, '/img/freio/giallo_ccb_brake_calipers'),
('freio', 9700.00, '/img/freio/verde_ccb_brake_calipers');

INSERT INTO tbFreio (IdPeca, Tipo) VALUES
(15, 'Giallo CCB brake Calipers'),
(16, 'Verde CCB brake Calipers'),
(17, 'Matt black CCB brake Calipers'),
(18, 'Bronzo CCB Brake Calipers'),
(19, 'Verde Chiaro CCB Brake Calipers'),
(20, 'Arancio CCB Brake Calipers'),
(21, 'Blu CCB Brake Calipers'),
(22, 'Bianco CCB Brake Calipers');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('teto', 7000.00, '/img/teto1.png'),
('teto', 7200.00, '/img/teto2.png');

INSERT INTO tbTeto (IdPeca, Tipo) VALUES
(23, 'Engine grilles colored in matt black'),
(24, 'Engine grilles colored in match with Grigio Titans');

INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('Banco', 8500.00, "/img/banco1.jfif"),
('Banco', 12500.00, "/img/banco2.jfif"),
('Banco', 18900.00, "/img/banco3.jfif");

INSERT INTO tbBanco (IdPeca, Tipo) VALUES
(25, 'Comfort Seats'),
(26, 'Sport Seats (Corsa Tex Pack)'),
(27, 'Fully electric and heated seats');



/*INSERT INTO tbPeca (Tipo, Preco, Img) VALUES
('CorInterior', 3200.00, '/img/corinterior/grigio_octans'),
('CorInterior', 3300.00, '/img/corinterior/blu_delphinus'),
('CorInterior', 3400.00, '/img/corinterior/rosso_burgundy'),	
('CorInterior', 3500.00, '/img/corinterior/blu_amon'),
('CorInterior', 3600.00, '/img/corinterior/arancio_apodis'),
('CorInterior', 3700.00, '/img/corinterior/arancio_leonis'),
('CorInterior', 3200.00, '/img/corinterior/bianco_leda');

INSERT INTO tbCorInterior (IdPeca, Tipo) VALUES
(30, 'Grigio Octans'),
(31, 'Blu Delphinus'),
(32, 'Rosso Burgundy'),
(33, 'Blu Amon'),
(34, 'Arancio Apodis'),
(35, 'Arancio Leonis'),
(36, 'Bianco Leda');*/




insert into tbModelo(marca, nome, ano, categoriacarro, img, hp, torque, motor, Descricao) values
("Lamborghini", "Urus", 2025, "SUV", "/img/revuelto", "650cv", "86,7 kgfm", "V8", "A Lamborghini Urus é o primeiro Super SUV (Super Sport Utility Vehicle) do mundo, unindo a alma de um superesportivo com a funcionalidade prática de um utilitário esportivo. Impulsionado pelo motor V8 biturbo de 4,0 litros da Lamborghini."),
("Lamborghini", "Revuelto", 2025, "Esportivo", "/img/temerario", "1015cv", "77,0 kgfm", "V12", "Pouco antes do 60º aniversário da marca, a Lamborghini revelou o Revuelto, o primeiro superesportivo híbrido HPEV (High Performance Electrified Vehicle). Com o Revuelto, a Lamborghini estabeleceu um novo padrão em desempenho, tecnologia a bordo e prazer ao dirigir."),
("Lamborghini", "Temerario", 2025, "USV", "/img/urus", "920cv", "74,4", "V8", "Pouco antes de inaugurar uma nova era em sua linha de veículos eletrificados, a Lamborghini apresentou o Temerario, o sucessor direto do Huracán e o mais recente superesportivo equipado com motorização híbrida V8.");

select * from tbpeca;

Delimiter $$
create procedure cadastrarUsuario(vNome varchar(200), vCPF varchar(15), vNasc date, vTelefone varchar(20), vEmail varchar(50), vSenha varchar(20), vConfSenha varchar(20), vNumEnd int, vCEP varchar(15), vComp varchar(30), vRG varchar(15))
begin
	if vConfSenha = vSenha then
		insert into tbUsuario(nome, cpf, datanasc, telefone, email, senha, numend, cep, compend, rg) values(vNome, vCPF, vNasc, vTelefone, vEmail, vSenha, vNumEnd, vCEP, vComp, vRG);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'As senhas não coincidem.';
    end if;
end
$$

Delimiter $$
	create procedure selectImgAro(vIdAro int)
	begin
		select img from tbPeca where idPeca = vIdAro;
	end
$$