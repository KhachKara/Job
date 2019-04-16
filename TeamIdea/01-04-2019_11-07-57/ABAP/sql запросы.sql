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
select fullname as "Дети из неполных семей"
from family
where spouse is null
and mother is null
and father is not null
or spouse is null
and mother is not null
and father is null;

/* Все дети из полных семей */
select fullname, father 
from family 
where spouse is null and father is not null and mother is not null;

/* Отцы детей из полных семей */
select peopleid, fullname, age, father, mother
from family
where spouse is null and father is not null and mother is not null
group by father;

/* Отцы и количество детей из полных семей */
select count(peopleid) as "Количество детей в семье", fullname, age, father, mother
from family
where spouse is null and father is not null and mother is not null
group by father;

/*	a)	Отца наибольшего количества детей */
SELECT 
    f1.fullname as 'Отец',
    count(f2.PeopleID) as 'Кол. детей'
FROM
    family f1
        JOIN
    family f2 ON f1.peopleid = f2.father
    group by f1.fullname
    limit 1;

/*	b)	Семьи, в которых 3 и более ребенка */
SELECT 
    f1.fullname AS 'Отец',
    f3.fullname AS 'Мать',
    COUNT(f2.PeopleID) AS 'Кол. детей'
FROM
    family f1
        JOIN
    family f2 ON f1.peopleid = f2.father
        left join
    family f3 ON f1.peopleid = f3.spouse
    group by f1.fullname
    limit 1;


/*	c)	Мать с наименьшей разницей в возрасте с собственным ребенком */
SELECT 
    f1.fullname AS 'Мать',
    f2.fullname AS 'Ребенок',
    f1.age - f2.age AS 'Разница'
FROM
    family f1
        JOIN
    family f2 ON f1.peopleid = f2.mother
ORDER BY 3 DESC
LIMIT 1;
    

/*	d)	Всех детей из неполных семей (у матери нет мужа или у ребенка нет матери) */
SELECT 
    fullname AS 'Дети из неполных семей'
FROM
    family
WHERE
    spouse IS NULL AND mother IS NULL
        AND father IS NOT NULL
        OR spouse IS NULL AND mother IS NOT NULL
        AND father IS NULL
        OR spouse IS NOT NULL AND mother IS NULL
        AND father IS NOT NULL;

