SELECT 
    CardNumber AS 'Номер карты',
    sum(Summa) AS 'Общая сумма транзакций'
FROM
    Transactions
        JOIN
    Cards ON Transactions.CardId = Cards.CardId
        JOIN
    Clients ON Cards.ClientId = Clients.ClientId
WHERE
    FIO = 'Сидоров Сидор Сидорович'
    group by cardnumber
;