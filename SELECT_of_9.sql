--1.���������� ������������ � ������ �����;
select g.name, count(a.name) as Qty from genres g 
join genres_artist ga  using  (id_genre)
join artist a using (id_artist) 
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

-- 4 ��� �����������, ������� �� ��������� ������� � 2020 ����;

select a.name, a2.name, year_album from artist a 
	join artist_album aa using(id_artist)
	join album a2 using(id_album)
where year_album <> 2020


-- 5 �������� ���������, � ������� ������������ ���������� ����������� (�������� ����);
select c.name, a.name from collection c 
join collection_tracks ct using(id_collection)
join list_tracks lt using(id_list_tracks)
join artist_album al using(id_album)
join artist a using(id_artist)
where a.name = 'PINK'

-- 6 �������� ��������, � ������� ������������ ����������� ����� 1 �����;

select a.name from album a 
join artist_album aa using(id_album)
join artist ar using(id_artist)
join genres_artist ga using(id_artist)
join genres g using(id_genre)
group by  a.name
having count(distinct id_genre) > 1


--7. ������������ ������, ������� �� ������ � ��������;

select lt.name_track, id_collection from list_tracks lt 
left join collection_tracks ct using(id_list_tracks)
where id_collection is  null

--8. �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������);

select name, name_track, duration_min from (
		select name, lt.name_track, duration_min, artist_min.minim from artist
		join artist_album aa using(id_artist)
		join list_tracks lt using(id_album)
		join (
			select name, min(duration_min) minim from artist 
			join artist_album aa using(id_artist)
			join list_tracks lt using(id_album)
			group by artist.name) artist_min using (name)
			where duration_min = minim) s
order by 3




--9. �������� ��������, ���������� ���������� ���������� ������.
select name, min_count from 
		(select name, count(id_list_tracks) min_count  from album a 
		join list_tracks lt using(id_album)
		group by 1 ) result_1
where min_count = (select min(min_count) from 
		(select name, count(id_list_tracks) min_count  from album a 
		 join list_tracks lt using(id_album)
		 group by 1) a)




