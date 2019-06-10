#1

select headquarter, description, max(C) as Frequency
from
(SELECT description, count(*) as C, headquarter
FROM business_family left outer join business on business_family.b_id=business.b_id
left outer join family on business_family.f_id=family.f_id
group by description
order by headquarter) as S
group by headquarter;


#2
select description, sum(salary)
from members left outer join family on members.f_id=family.f_id
left outer join business_family on business_family.f_id=family.f_id
left outer join business on business_family.b_id=business.b_id
group by description
order by sum(salary) desc limit 1;

select description, avg(salary)
from members left outer join family on members.f_id=family.f_id
left outer join business_family on business_family.f_id=family.f_id
left outer join business on business_family.b_id=business.b_id
group by description
order by avg(salary) desc limit 1;

#3

select f_id, count(memb)
from(

WITH RECURSIVE categories_with_roots AS (
  SELECT family.f_id, owned_by, m_id, 1 memb
  FROM members left outer join family on family.f_id=members.f_id
 
  UNION ALL
 
  SELECT cat.f_id, cat.owned_by, members.m_id, memb+1
  FROM members left outer join family cat on cat.f_id=members.f_id
  inner join categories_with_roots cwr on cwr.owned_by=cat.f_id
)
SELECT * FROM categories_with_roots cwr

) as Q
group by f_id
order by count(memb) DESC limit 1;