create table if not exists Genres (
	id serial primary key,
	name varchar(128) not null
);

create table if not exists Artists (
	id serial primary key,
	name varchar(128) not null
);

create table if not exists GenreArtist (
	genre_id integer references Genres(id),
	artist_id integer references Artists(id),
	constraint pk1 primary key (genre_id, artist_id)
);

create table if not exists Collections (
	id serial primary key,
	name varchar(128) not null,
	year integer not null
);

create table if not exists Albums (
	id serial primary key,
	name varchar(128) not null,
	artist_id integer not null references Artists(id),
	year integer not null
);

create table if not exists AlbumArtist (
	album_id integer references Albums(id),
	artist_id integer references Artists(id),
	constraint pk2 primary key (album_id, artist_id)
);

create table if not exists Songs (
	id serial primary key,
	name varchar(128) not null,
	album_id integer not null references Albums(id),
	description text
);

create table if not exists CollectionSong (
	collection_id integer references Collections(id),
	song_id integer references Songs(id),
	constraint pk3 primary key (collection_id, song_id)
)