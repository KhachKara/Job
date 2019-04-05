insert into transactions(CardId, Date, Summa)
values ((select CardId from Cards where cardNumber = '1234567890123411'), now(), 1000);
