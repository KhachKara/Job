UPDATE clients 
SET 
    FIO = 'Смирнов Олег Петрович'
WHERE
    clientId = (SELECT 
            cards.CardId
        FROM
            cards
        WHERE
            cardNumber = '1234567890123458');
