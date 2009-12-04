create table teste (
	codigo int not null,
	descricao varchar(100) not null,
	valor float,
	primary key (codigo)
);

create table sites_rss (
	link varchar(255),
	site varchar(255),
	primary key (link)
);

create table usuario (
	login varchar(50),
	password varchar(50),
	nome varchar(100),
	email varchar(50),
	tipo varchar(50),
	primary key(login)
);
