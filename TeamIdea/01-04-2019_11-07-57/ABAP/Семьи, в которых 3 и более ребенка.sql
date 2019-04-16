/*	b)	Семьи, в которых 3 и более ребенка */
SELECT 
    f1.fullname as 'Отец',
    count(f2.PeopleID) as 'Кол. детей'
FROM
    family f1
        JOIN
    family f2 ON f1.peopleid = f2.father
    group by f1.fullname
    limit 1;