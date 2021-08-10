/* 1. �������� � ��� ������ ��������, �������� � 2018 ����*/
 select name, year_album from album a 
where year_album = 2018

/* 2. �������� � ����������������� ������ ����������� �����;
 * ������ ������� */
 select name_track, duration_min from list_tracks lt  
order by duration_min desc 
limit 1
/*������ �������*/
select name_track, duration_min from list_tracks lt  
where duration_min = (select max(duration_min) from lt )

/* 3.�������� ������, ����������������� ������� �� ����� 3,5 ������;*/
select name_track, duration_min from list_tracks lt 
where duration_min >= 3.5
order by duration_min desc 

/*4. �������� ���������, �������� � ������ � 2018 �� 2020 ��� ������������;*/
select name, year_album from collection c 
where year_album between 2018 and 2020

/*5. �����������, ��� ��� ������� �� 1 �����;*/
select name from artist a 
 where name not like '% %'

/*6. �������� ������, ������� �������� ����� "���"/"my".*/
select name_track from list_tracks lt 
where name_track ilike '%My%'