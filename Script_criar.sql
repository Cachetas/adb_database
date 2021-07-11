create table estudio (

	nomeEst varchar2 (35) not null, 
	lucroAno number (15,2) not null, 
	dtFund date not null, 
	dono varchar2 (50) not null, 
	morada varchar2 (60) not null, 
	nrPorta number (5) not null, 
	codPostal number (8) not null,

	constraint pkEstudio primary key  (nomeEst)
);

create table ator (

	numID int not null,
	numSS int not null , 
	nomeArt varchar2 (35) not null, 
	sexo char (1) not null, 
	nacionalidade varchar2 (35) not null, 
	dtNasc date not null, 
	email varchar2(50),

	constraint pkAtor primary key (numID),
	
	constraint AtributosAtor UNIQUE (numSS, nomeArt) -- UNIQUE define que estes atributos não podem ter valores iguais, apesar de não serem chaves primárias
);

create table tipoPapelAtor (

	papel varchar2 (25) not null, 
	numID int not null, 
	
	constraint pkTipoPapelAtor primary key (papel, numID), 
	
	constraint fkTipoPapelAtorNumID foreign key (numID) references ator (numID) 
);

create table realizador (

	nomeReal varchar2 (50) not null,
	constraint pkRealizador primary key (nomeReal)
);

create table filme (

	tituloOriginal varchar2 (60) not null,
	anoLanc int not null, 
	custo number (15,2) not null, 
	durFilmagem int not null, 
	nomeEst varchar2 (35) not null, 
	nomeReal varchar2 (50) not null,

	constraint pkFilme primary key (tituloOriginal),

	constraint fkFilmeNomeEst foreign key  (nomeEst) references estudio (nomeEst),
	constraint fkFilmeNomeReal foreign key (nomeReal) references realizador (nomeReal)
);

create table generoFilme (

	tituloOriginal varchar2 (60) not null,
	genero varchar2 (25)  not null, 

	constraint pkGereroFilme primary key (tituloOriginal, genero),

	constraint fkGeneroFilmeTituloOriginal foreign key (tituloOriginal) references filme (tituloOriginal)
);

create table contactoReal (

	telefone int not null,
	nomeReal varchar2 (50) not null,

	constraint pkContactoReal primary key (telefone, nomeReal),

	constraint fkContactoRealNomeReal foreign key (nomeReal) references realizador (nomereal)
);

create table contactoAtor (

	telefone int not null, 
	numID int not null, 
	
	constraint pkContactoAtor primary key (telefone, numID), 
	
	constraint fkContactoAtorNumID foreign key (numID) references ator (numID)
);

create table personagem (

	nomePerson varchar2 (30) not null, 
	cache number (10,2) not null,
	tituloOriginal varchar2 (60) not null, 
	numID int not null, 
	
	constraint pkpersonagem primary key (nomePerson), 
	
	constraint fkPersonagemTituloOriginal foreign key (tituloOriginal) references filme (tituloOriginal), 
	constraint fkPersonagemNumID foreign key (numID) references ator (numID)
);

create table pode (

	numID int not null, 
	nomeReal varchar2 (50) not null,

	constraint pkPode primary key (numID),

	constraint fkPodeNumID foreign key (numID) references ator (numID),
	constraint fkPodeNomeReal foreign key (nomeReal) references realizador (nomeReal)
);

create table cinema (
	
	codCine int not null,
	nomeCine varchar2 (25) not null,
	localidade varchar2 (25) not null,

	constraint pkCinema primary key (codCine)	
);


create table distribui (
	
	tituloOriginal varchar2 (60) not null,
	codCine int not null, 
	
	constraint pkDistribuiFilme primary key (tituloOriginal, codCine),
	
	constraint fkDistribuiFilme foreign key (tituloOriginal) references filme (tituloOriginal),
	constraint fkDistribuiFilmeCodCine foreign key (codCine) references cinema (codCine)
);