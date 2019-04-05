Create Table Clients(
	Clinetid int not null auto_increment,
	FIO varchar(30),
	Primary key(`Clinetid`)
);

Create Table Cards(
	CardId int not null auto_increment,
	Number int,
	Clientid int,
	Primary key(Cardid),
	Foreign key(Clientid) references Clients(Clinetid)
);

Create Table Transactions(
	CardId  int,
	Date date not null,
	Summa int not null,
	Foreign key(CardId) references Cards(CardId)  
);

insert into Clients(FIO)
	values ('Иванов Иван Иванович');

insert into Clients(FIO)
	values ('Петров Петр Петрович');

insert into Clients(FIO)
	values ('Сидоров Сидор Сидорович');