/* Полная семья */
select a.fullname as "Супружеская пара", a.peopleId, a.spouse 
from family a, family b
where b.peopleId = a.spouse;


/* Все дети */
select peopleid, fullname, age, father, mother 
from family 
where spouse is null and father is not null and mother is not null;