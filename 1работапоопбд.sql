drop table if exists animals_klass, animals_form, countries, animals, terariyms, zone_obitation, born_places, genders;

create table animals_klass (
id serial primary key,
klass_name varchar(30)
);

create table zone_obitation (
id serial primary key,
zone varchar(60)	
);

create table animals_form (
id serial primary key,
form_name varchar(60),
zone_need integer REFERENCES zone_obitation(id)
);

create table countries (
id serial primary key,
country_name varchar(60)
);

create table terariyms(
id serial primary key,
teratiym_name varchar(50),
zone_pretent integer REFERENCES zone_obitation(id)
);

create table born_places (
id serial primary key,
born_name varchar(50)	
);

create table genders (
id serial primary key,
gender_name varchar(50)
);

create table animals (
id serial primary key,
klass integer REFERENCES animals_klass(id),
form integer REFERENCES animals_form(id),	
name varchar(30),
gender integer REFERENCES genders(id),
country_living integer REFERENCES countries(id), 
age integer,
terariym_living integer REFERENCES terariyms(id),
borned_place integer REFERENCES born_places(id)
);


insert into animals_klass values (1, 'Землеводные'),
(2, 'Беспозвоночные'),
(3, 'Пресмыкающиеся'),
(4, 'Птицы'),
(5, 'Млекопитающие')


insert into born_places values (1, 'Дикая природа'),
(2, 'Экзотариум'),
(3, 'Заводчик')

insert into countries values (1, 'Австралия'),
(2, 'Новая Гвинея'),
(3, 'Тайланд'),
(4, 'Мадагаскар'),
(5, 'Египет'),
(6, 'Индия'),
(7, 'Колумбия'),
(8, 'Южная Корея')


insert into genders values (1, 'ж'),
(2, 'м')

insert into zone_obitation values (1, 'леса'),
(2, 'тайга'),
(3, 'тундра'),
(4, 'арктическая пустыня'),
(5, 'пустыня'),
(6, 'степь'),
(7, 'субтропики')

insert into animals_form values (1, 'Черепаха шпороносная', 7),
(2, 'Варан Сальвадора', 7),
(3, 'Агама бородатая', 5),
(4, 'Квашка австралийская', 7),
(5, 'Узкорот винный', 7), 
(6, 'Неясыть серая', 1),
(7, 'Попугай индийский кольчатый', 7),
(8, 'Тамарин эдипов', 7),
(9, 'Дегу', 7),
(10, 'Лемур кошачик', 7),
(11, 'Палочник аннамийский', 2);

insert into terariyms values (2, 'субтропики', 7),
(4, 'пустыни', 5),
(5, 'тундровый', 3),
(6, 'таежный', 2),
(7, 'лесистый', 1),
(8, 'арктика', 4)

insert into animals values (1, 3, 3, 'Геннадий', 2, 1, 3, 4, 1),
(2, 3, 3, 'Агрипина', 1,  1, 4, 4, 2),
(3, 3, 3, 'Сынмин', 2, 1, 1, 4, 3),
(4, 3, 3, 'Мефодий', 2, 1, 1, 4, 3),
(5, 3, 3, 'Чунгук', 2, 1, 5, 4, 3), 
 (6, 3, 2, 'Боня', 1, 2, 4, 2, 2),
(7, 3, 2, 'Моня', 1, 2, 3, 2, 1),
(8, 3, 1, 'Барсилия', 1, 5, 9, 2, 2),
(9, 2, 11, 'Маркиз', 2, 3, 3, 2, 2),
(10, 2, 11, 'Хакуна', 1, 3, 5, 2, 1),
(11, 2, 11, 'Матата', 1, 3, 6, 2, 2),
(12, 1, 4, 'Квакки', 2, 1, 4, 2, 3),
(13, 1, 4, 'Мари', 1, 1, 3, 2, 3),
(14, 1, 5, 'Изабелла', 1, 4, 3, 2, 1),  
(15, 4, 6, 'Сергей', 2, 8, 2, 5, 2),
(16, 4, 6, 'Григорий', 2, 8, 3, 5, 2),
(17, 4, 6, 'Тамара', 1, 8, 4, 5, 2),
(18, 4, 6, 'Борис', 2, 8, 4, 5, 1),
(19, 4, 7, 'Джимми-Джимми', 2, 6, 5, 2, 3),   
(20, 5, 8, 'Эдуард', 2, 7, 3, 5, 3),
(21, 5, 9, 'Азиза', 1, 8, 4, 2, 3),
(22, 5, 9, 'Сальвадор', 2, 8, 3, 2, 3),
(23, 5, 9,  'Алиса', 1, 8, 3, 2, 2),
(24, 5, 10, 'Висконтий', 2, 4, 2, 5, 1);


create or replace function terariym_by_form (form_animal int) returns integer as '
select zo.id from zone_obitation zo join animals_form af on zo.id = af.zone_need where af.id=form_animal   
' LANGUAGE SQL;