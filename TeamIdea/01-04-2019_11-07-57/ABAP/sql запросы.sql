/* Полная семья */
select a.fullname as "Супружеская пара", a.peopleId, a.spouse 
from family a, family b
where b.peopleId = a.spouse;

/* Не полная семья */
select peopleId,fullname,spouse, age from family 
where spouse is null
and father is null
and mother is null;

/* Дети из неполных семей (нет отца) */
select peopleId, fullname, age, father 
from family
where spouse is null
and mother is null
and father is not null;

/* Все дети из полных семей */
select peopleid, fullname, age, father, mother 
from family 
where spouse is null and father is not null and mother is not null;

/* Отец наибольшего количества детей */
select count(peopleId) 
from family
where spouse is null and father is not null and mother is not null;

/* Отцы детей из полных семей */
select peopleid, fullname, age, father, mother
from family
where spouse is null and father is not null and mother is not null
group by father;
