SELECT 
    CardNumber AS 'Номер карты',
    Date AS 'Дата транзакции',
    Summa AS 'Сумма транзакции'
FROM
    Transactions
        JOIN
    Cards ON Transactions.CardId = Cards.CardId
        JOIN
    Clients ON Cards.ClientId = Clients.ClientId
WHERE
    Date >= '2012.01.01'
        AND Date <= '2015.01.01'
        AND CardNumber = '1234567890123451'
        OR CardNumber = '1234567890123452'
        AND FIO = 'Иванов Иван Иванович'
;