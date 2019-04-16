SELECT 
    f2.peopleid AS 'ID Ребенка',
    f2.age AS 'Возраст ребенка',
    f2.fullname AS 'Ребенок',
    f1.fullname AS 'Отец',
    f1.peopleid AS 'ID Отца',
    f1.age AS 'Возраст отца'
FROM
    family f1
        JOIN
    family f2 ON f1.peopleid = f2.father;