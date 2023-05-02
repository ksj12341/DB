Drop Table Summer;

Create Table Summer(
sid NUMBER,
class VARCHAR2(20),
price NUMBER);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'FORTRAN', 20000);

SELECT *
FROM Summer;


select sid, class
from Summer;

SELECT price
from Summer
WHERE class='C';

select DISTINCT class
FROM Summer
where price=(SELECT max(price) from Summer);

select count(*),SUM(price)
FROM Summer;

delete from Summer where sid=200;

Select price 
from summer
where class='C';

Insert into Summer Values (NULL, 'JAVA', 25000);
Select * from Summer;

select count(*) as "수강인원"
From Summer;

Select Count(sid) as "수강인원"
from Summer;

select count(*) as "수강인원"
From Summer
Where sid IS NOT NULL;

Update Summer
set price=15000
where class='FORTRAN';

Select *
From Summer;

Select DISTINCT price as "FORTRAN 수강료"
from Summer
where class='FORTRAN';

UPDATE Summer
set price =20000
where class='FORTRAN';

Update Summer
set price =15000
where class='FORTRAN' AND sid=100;

SELECT *
FROM Summer;

drop table SummerPrice;
drop table SummerEnroll;


create table summerprice(
class varchar(20),
price INTEGER);

INSERT INTO summerprice Values ('FORTRAN', 20000);
INSERT INTO summerprice Values ('PASCAL', 15000);
INSERT INTO summerprice Values ('C', 10000);


SELECT *
FROM SummerPrice;

create table SummerEnroll(
sid INTEGER,
class VARCHAR(20));

INSERT INTO summerenroll Values ('100', 'FORTRAN');
INSERT INTO summerenroll Values ('150', 'PASCAL');
INSERT INTO summerenroll Values ('200', 'C');
INSERT INTO summerenroll Values ('250', 'FORTRAN');


SELECT *
FROM Summerenroll;

select sid, class
from Summerenroll;

SELECT price
from Summerprice
WHERE class='C';

select DISTINCT class
FROM Summerprice
where price=(SELECT max(price) from Summerprice);

select count(*),SUM(price)
FROM Summerprice, Summerenroll
where Summerprice.class=Summerenroll.class;

select price as "C 수강료"
from summerprice
where class='C';

delete from Summerenroll
where sid=200;

select *
from Summerenroll;

insert into summerprice values('java',25000);

select *
from summerprice;

update summerprice
set price=15000
where class='FORTRAN';

select price as "FORTRAN 수강료"
from summerprice
where class='FORTRAN';






