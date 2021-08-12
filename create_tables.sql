create table if not exists genres(
	id_genre SERIAL PRIMARY key,
	name VARCHAR(50) not null
	);
	
create table if not exists artist(
	id_artist SERIAL PRIMARY key,
	name VARCHAR(50),
	age INTEGER
	);
	
create table if not exists genres_artist(
	id_genres_artist SERIAL PRIMARY key,
	id_genre INTEGER NOT NULL REFERENCES genres(id_genre) not null,
	id_artist INTEGER NOT NULL REFERENCES artist(id_artist) not null
	);
	
	create table if not exists album(
	id_album SERIAL PRIMARY key,
	name VARCHAR(50) not null,
	year_album INTEGER
	);
	
	
create table if not exists artist_album(
	id_artist_album SERIAL PRIMARY key,
	id_album INTEGER NOT NULL REFERENCES album(id_album) not null,
	id_artist INTEGER NOT NULL REFERENCES artist(id_artist)not null
	);
	
create table if not exists list_tracks(
	id_list_tracks SERIAL PRIMARY key,
	name_track VARCHAR(50) not null,
	duration_min numeric(4,2) check (duration_min > 0) not null,
	id_album integer references album(id_album) not null
	);
	
	create table if not exists collection(
	id_collection SERIAL PRIMARY key,
	name VARCHAR(50) not null,
	year_album INTEGER
	);
	
	create table if not exists collection_tracks(
	id_collection_tracks SERIAL PRIMARY key,
	id_collection INTEGER  REFERENCES collection(id_collection),
	id_list_tracks INTEGER NOT NULL REFERENCES list_tracks(id_list_tracks) not null
	);