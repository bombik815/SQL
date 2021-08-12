--1. ���������� ������������ � ������ �����;
select g.name, count(a.name) as Qty from genres g 
join genres_artist ga  using  (id_genre)
join artist a using (id_artist) 
GROUP by g.name
order by 2 desc 

select g.name, count(a.name) from genres g 
join genres_artist ga  on g.id_genre = ga.id_genre 
join artist a on ga.id_artist = a.id_artist 
GROUP by g.name
order by 2 desc

--2. ���������� ������, �������� � ������� 2019-2020 �����;
select count(*) from list_tracks lt 
join album a using (id_album)
where a.year_album between 2019 and 2020

--3. ������� ����������������� ������ �� ������� �������;
select a.name, Round(AVG(duration_min),2)  from list_tracks lt 
join album a using (id_album)
group by a.name
order by 2 desc

-- 5 �������� ���������, � ������� ������������ ���������� ����������� (�������� ����);
select c.name, a.name from collection c 
join collection_tracks ct using(id_collection)
join list_tracks lt using(id_list_tracks)
join artist_album al using(id_album)
join artist a using(id_artist)
where a.name = 'PINK'

-- 6 �������� ��������, � ������� ������������ ����������� ����� 1 �����;
select distinct (a.name) from album a 
join artist_album aa using(id_album)
join artist ar using(id_artist)
join genres_artist ga using(id_artist)
join genres g using(id_genre)
where ga.id_artist in (
select id_artist from genres_artist
join artist_album aa using(id_artist)
group by id_artist
having count(id_genre) > 1)
order by 1

--7. ������������ ������, ������� �� ������ � ��������;
select lt.name_track, id_collection from list_tracks lt 
join collection_tracks ct using(id_list_tracks)
where id_collection is  null

--8. �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������);
select name, duration_min from artist 
join artist_album aa using(id_artist)
join list_tracks lt using(id_album)
order by 2 
limit 5

--9. �������� ��������, ���������� ���������� ���������� ������.
select name, count(id_list_tracks) from album a 
join list_tracks lt using(id_album)
group by 1
order by 2 
limit 3

