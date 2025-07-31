Select * from salespeople
select * from Customers
select cnum, cname from Customers wher 
rating=100
select * from Orders
select snum, odate, max(amt) as max_order from 
Orders group by odate, snum
order by odate, snum
select * from Orders order by cnum
desc
select distinct s.* from salespeople s
join Orders o on s.snum=o.snum
select c.cname, s.sname from Customers c
join salespeople s on c.snum=s.snum
select s.sname, s.snum from salespeople
s join Customers c on s.snum=c.snum 
group by s.snum,s.sname 
having count(c.cnum)>1
select snum, count(onum) as orders
from Orders group by snum order by
orders desc
--or 
select s.sname, count(o.onum) as orders
from salespeople s join Orders o on 
s.snum=o.snum group by s.sname order by
orders desc
select * from Customers where exists
(select 1 from Customers where city='Sanjose')
--select s.sname,c.cname,c.city from 
--Customers c join salespeople s on 
--c.snum=s.snum- gives what cities they served in.
select s.sname,c.cname from salespeople
s join Customers c on s.city=c.city
select * from Customers where
city='Sanjose' and rating>200
select sname, comm from salespeople
where city='London'
select o.onum from Orders o join 
salespeople s on o.snum=s.snum where
s.sname='MotiKa'
--or
select * from Orders where snum=(select
snum from salespeople where sname='MotiKa' )
select c.cname, o.* from Orders o join
Customers c on c.cnum=o.cnum where
o.odate='1990-10-03'
select odate, sum(amt) as Amounts from
Orders group by odate having sum(amt)>=
2000+(select max(amt) from Orders)
--upto 2000 gives the amounts that are
--higher than 2000, after the + we have
--higher the maximum amount by 2000
--which is none, taking the max per date
--into consideration use the one below
select odate, sum(amt) as Amounts, 
max(amt)as Max_amt from Orders group by
odate having sum(amt)>=2000+max(amt)
select * from Orders where amt>any(select
amt from Orders where odate='1990-10-06')
select * from salespeople s where exists(
select 1 from Customers c where c.rating
=300 and c.snum=s.snum)
select c.* from Customers c join salespeople
s on c.snum=s.snum where c.cnum>=1000+(select snum 
from salespeople where sname='Serres')
--or, the most simplest
select * from Customers where cnum>=1000
+(select snum from salespeople where 
sname='Serres')
select * from salespeople
select *, comm*100 as Comm_percent
from salespeople 
select snum, odate,max(amt) from 
Orders group by snum, odate having 
max(amt)>=3000
select snum, max(amt) from Orders where
odate='1990-10-03' group by snum
select * from Customers where city in(
select city from Customers where snum=
(select snum from salespeople where
sname='Serres')) 
select * from Customers where rating>200
select count(distinct snum) from orders
select c.cname, s.sname, s.comm from 
salespeople s join Customers c on 
s.snum=c.snum where s.comm>12
select s.sname from salespeople s join 
Customers c on s.snum=c.snum group by 
s.snum, s.sname having count(distinct
cnum)>1
select s.sname from salespeople s join 
Customers c on s.snum=c.snum where 
s.city=c.city
select * from salespeople where sname
like 'P__l%'
select o.* from Orders o join Customers
c on o.cnum=c.cnum where o.cnum=(select
cnum from Customers where cname='Cisneros')
--or
select * from Orders where cnum=(select
cnum from Customers where cname='Cisneros')
select s.sname,max(o.amt)from Orders 
o join salespeople s on o.snum=s.snum
where o.snum in(select snum from salespeople 
where sname in('Serres','Rifkin')) 
group by s.sname
select * from salespeople order by
snum,sname,comm,city
select * from Customers where cname
between 'A' and 'G'
select c1.cname as Cust_1, c2.cname as
Cust_2,c3.cname as Cust_3, c4.cname as
Cust_4, c5.cname as Cust_5, c6.cname as
Cust_6, c7.cname as Cust_7 from 
Customers c1,Customers c2,Customers c3,
Customers c4, Customers c5, Customers c6,
Customers c7
select * from Orders where amt>
(select avg(amt) from Orders
where odate='1990-10-04')
select c1.cname,c1.cnum from Customers
c1 where c1.rating=(select max
(c2.rating)from Customers c2 where 
c2.city=c1.city)
select odate, sum(amt) as Totals
from Orders group by odate order by
Totals desc
select rating, cname from Customers 
where city='Sanjose'
select * from Orders where amt<any(
select o.amt from Orders o join 
Customers c on o.cnum=c.cnum where
c.city='Sanjose')
--for all< all the amounts
select * from Orders where amt<all(
select o.amt from Orders o join 
Customers c on o.cnum=c.cnum where
c.city='Sanjose')
select * from Orders where amt>(select
 avg(amt)from Orders)
select city, max(rating) as max_rating from 
Customers group by city
select o.onum, o.amt*s.comm/100 as Comm
from Orders o join salespeople s on
o.snum=s.snum join Customers c on 
s.snum=c.snum where c.rating> 100

select count(*) from Customers where
rating>(select avg(rating) from Customers
where city='Sanjose')
select * from salespeople where city
in('Barcelona','London')
select s.sname from salespeople s join 
Customers c on s.snum=c.snum group by
s.sname having count(distinct c.cnum)=1
select c1.cname as Cust_1, c2.cname as
Cust_2 from Customers c1 join Customers
c2 on c1.snum=c2.snum and c1.cnum<>c2.cnum
select * from Orders where amt>1000 
select o.onum,c.cname from Orders o
join Customers c on o.cnum=c.cnum
Select * from Customers where rating>=
any(select rating from Customers where
snum=(select snum from salespeople
where sname='Serres'))
select * from Orders where odate in
('1990-10-03','1990-10-04')
--select onum from Orders group by onum
--having odate=('1990-10-03','1990-10-03')
select * from Customers where rating>
all(select rating from Customers where
city='Rome')
select * from Customers where rating>100
or city='Rome'
select * from Customers where
snum=1001
select snum,sum(amt) as Totals from 
Orders group by snum having sum(amt)>(
select max(amt) from Orders)
select * from Orders where amt!=0 
--or below, which also includes not null
select * from Orders where amt is not 
null and amt<>0
select s.sname, c.cname from salespeople
s,Customers c where s.sname<c.cname and
c.rating<200
select sname, comm from salespeople
select cname, city from Customers where
rating=(select rating from Customers where 
cnum=(select cnum from Customers where
cname='Hoffman'))
select distinct  s.sname from salespeople s,
Customers c where s.sname<c.cname
--or
select s.sname from salespeople s where
exists(select 1 from Customers c where
 s.sname<c.cname)
select cname, rating from Customers
where cnum in(select cnum from Orders
group by cnum having avg(amt)=(select
avg(amt) from Orders))
select sum(amt) from Orders
select onum, amt, odate from Orders
select count(rating is not null) from 
Customers
--or
select count(rating) from Customers 
where rating is not null
select o.onum,s.sname, c.cname from 
Orders o join salespeople s on 
o.snum=s.snum join Customers c on
o.cnum=c.cnum
select s.comm from salespeople s where
s.snum in(select snum from Customers
where city='London')
select * from salespeople s where s.city
<> all(select city from Customers c
where s.snum=c.snum)
select sname from salespeople s where
exists(select 1 from Customers c where 
c.city=s.city and c.snum!=s.snum)--you can also use c.snum<>s.snum
select * from Customers where snum in(
select snum from salespeople where 
sname in('Peel','Motika'))
select odate, count(distinct snum)
from Orders group by odate
select * from Orders where snum in(select
snum from salespeople where city='London')
select * from Orders o join Customers c 
on o.cnum=c.cnum join salespeople s on 
o.snum=s.snum where c.city<>s.city
select s.sname from salespeople s
join Customers c on s.snum=c.snum
where c.cnum in(select cnum from Orders
group by cnum having count(*)>1)
select * from Customers c1 where exists
(select 1 from Customers c2 join Orders
o on c2.cnum=o.cnum where c1.snum=c2.snum
and c1.cnum<>c2.cnum)
select city, max(rating) as rating from 
Customers group by city
select distinct snum from Orders where
amt>1000
select rating,cname,cnum from Customers
order by rating desc
select avg(comm) from salespeople where
city='London'
select * from Orders where snum =(
select snum from Customers where 
cnum=2001)--you can also use in instead of=
select * from salespeople where comm
between 10 and 12
select sname,city from salespeople 
where city='london' and comm>10
select cnum,min(amt) as min_order from 
Orders group by cnum
select * from Customers where cname
like 'G%' order by cname asc limit 1
select count(distinct city )from 
Customers where city is not null 
select avg(amt) from Orders
select * from Customers where city!=
'Sanjose' and rating>200
select * from salespeople where comm 
between 12 and 14
select distinct s.sname from salespeople s join
Customers c on s.snum=c.snum where
c.city!=s.city
select  distinct s.sname from salespeople s join
Customers c on s.snum=c.snum where
s.comm>11 and c.rating<250
select distinct s1.sname,s2.sname from
salespeople s1 ,salespeople s2  
where s1.city=s2.city and s1.comm<>
s2.comm and s1.snum<s2.snum
select sname from salespeople where 
comm =(select max(comm) from salespeople)
select case when(select cnum from Orders 
group by cnum order by count(*) desc 
limit 1)=(select cnum from Customers 
order by rating desc limit 1)then 'yes' 
else 'no' end as result
select * from Customers order by rating
desc
select distinct odate from Orders 
where cnum=(select cnum from Customers
where cname='Hoffman')
select * from salespeople where snum
not in(select snum from Orders where 
odate between '1990-10-03' and '1990-10-05')
select count(distinct snum) from Orders
select count(distinct cnum) from Orders
select sname from salespeople where 
snum=max(select sum(amt) from Orders)
select snum,odate, max(amt) from Orders
group by snum,odate
select s.sname from salespeople s join
Orders o on s.snum=o.snum group by s.snum,
s.sname order by sum(o.amt) desc limit 1
select c1.cname,c2.cname,c1.rating from Customers
c1 join Customers c2 on c1.rating=
c2.rating and c1.cnum<>c2.cnum
select * from Orders where amt>(select
avg(amt) from Orders where odate='1990-10-04')
select * from Customers where rating>
(select avg(rating) from Customers where
snum=(select snum from Customers where
cname='Grass'))
select distinct c.cnum, c.cname from Customers c
join Orders o on c.cnum=o.cnum where 
o.amt>(select avg(amt) from Orders)
--or
select * from Customers where cnum in
(select cnum from Orders group by cnum
having avg(amt)>(select avg(amt) from
Orders))
select snum, sum(amt) as Totals from
Orders group by snum having sum(amt)>
(select max(amt) from Orders)
select s.sname,s.snum from salespeople 
s join Customers c on s.snum=c.snum
group by s.sname, s.snum having count
(c.cnum)>1
select s.sname,s.snum from salespeople
s where exists (select 1 from Customers
c where c.city=s.city and c.snum<>s.snum)
select case when(select sum(amt) from
Orders o join Customers c on o.cnum=
c.cnum where city in('Rome','London'))>
5*(select sum(comm) from salespeople where city 
in('London','New York'))then 'Yes' else
'No' end as result
select s.sname, o.odate,o.onum,o.amt,
s.city from salespeople s 
join Orders o on s.snum=o.snum where
(s.snum,o.amt) in (select snum, max(amt)
from Orders group by snum)
select * from salespeople order by
comm asc limit 1
--or
select * from salespeople where comm=
(select min(comm) from salespeople)