--Stucture
drop table if exists company_films;
drop table if exists companies;
drop table if exists films;
drop table if exists directors;
drop table if exists awards;
drop table if exists countries;

-- Creating tables
create table countries
(
	country_id serial,
	country_name text not null,
	population decimal not null,
	continent text not null,
	primary key (country_id)
);

create table awards
(
	award_id serial,
	award_name text not null,
	start_data date not null,
	category text not null, -- national/international
	primary key (award_id)
);

create table directors
(
	director_id serial,
	director_name text not null,
	director_surname text not null,
	country_id int references countries(country_id),
	award_id int references awards(award_id),
	primary key (director_id)
);

create table films
(
	film_id serial,
	film_name text not null,
	principal_genre text not null,
	secondary_genre text not null,
	release_date date,
	box_office decimal not null,
	director_id int references directors(director_id),
	award_id int references awards(award_id),
	primary key(film_id)
);

create table companies
(
	company_id serial,
	company_name text not null,
	director text not null, 
	country_id int references countries(country_id),
	primary key (company_id)
);

create table company_films
(
	film_id int not null references films(film_id),
	company_id int not null references companies(company_id),
	budget decimal,
	primary key (film_id, company_id)
);




-- Inserting the data
insert into countries (country_name, population, continent) values ('Spain',47.35,'Europe');
insert into countries (country_name, population, continent) values ('France',67.39,'Europe');
insert into countries (country_name, population, continent) values ('United States',329.5,'America');
insert into countries (country_name, population, continent) values ('New Zealand',5.08,'Ocenia');
insert into countries (country_name, population, continent) values ('Canada',38,'America');
insert into countries (country_name, population, continent) values ('Chile',19.12,'America');

insert into awards (award_name, start_data, category) values ('Goya','17/3/1986','National');
insert into awards (award_name, start_data, category) values ('Oscar','16/5/1929','International');
insert into awards (award_name, start_data, category) values ('Globos de oro','9/1/1944','International');

insert into directors (director_name, director_surname, country_id) values ('Steven','Spielberg',3);
insert into directors (director_name, director_surname, country_id) values ('Guillermo','del Toro',1);
insert into directors (director_name, director_surname, country_id) values ('Álex','de la Iglesia',1);
insert into directors (director_name, director_surname, country_id) values ('Louis','Leterrier',2);
insert into directors (director_name, director_surname, country_id) values ('Peter','Jackson',4);
insert into directors (director_name, director_surname, country_id) values ('James','Cameron',5);
insert into directors (director_name, director_surname, country_id) values ('Alejandro','Amenábar',6);
insert into directors (director_name, director_surname, country_id, award_id) values ('Martin','Scorsese',NULL,2);

insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('The others','Horror','Thriller','7/9/2001',209.9,6,1);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Mr Nobody','Drama','Fantasy','6/11/2009',3.55,NULL,NULL);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Balada triste de trompeta','Comedy','Drama','17/12/2010',3.6,3,NULL);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Sen to Chihiro no kamikakushi','Adventure','Animation','17/12/2010',355.7,NULL,NULL);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('The Lord of the Rings: The Fellowship of the Ring','Action','Adventure','19/12/2001',897.6,5,2);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('El laberinto del fauno','Drama','War','11/9/2006',83.8,2,1);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Now you see me','Crime','Mistery','29/5/2013',351.7,4,NULL);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Titanic','Drama','Romance','19/12/1997',2201.6,6,3);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Frozen','Animation','Family','22/11/2013',1281.5,NULL,NULL);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('300','Action','Drama','7/4/2007',456,NULL,NULL);
insert into films (film_name, principal_genre, secondary_genre, release_date, box_office, director_id, award_id) values ('Amanece, que no es poco','Comedy','Absurd comedy','17/1/1989',0.6,NULL,NULL);

insert into companies (company_name, director, country_id ) values ('The Walt Disney Company','Bob Chapek',3);
insert into companies (company_name, director, country_id ) values ('Studio Ghibli','Toshio Suzuki',NULL);
insert into companies (company_name, director, country_id ) values ('Sony Pictures','Tony Vinciquerra',3);

insert into company_films (film_id, company_id, budget) values (9,1,150);
insert into company_films (film_id, company_id, budget) values (4,2,19);



