use SQLFINALPROJECT;
Go
/****Create Library Branch Table***/
 create table Library_Branch 
 (BranchID int primary key not null identity (1,1),
 BranchName varchar (50)not null, Address varchar(50));

 Insert into Library_Branch
 (BranchName, Address)
 values
 ('Central','Washington'),
 ('Sharpstown','Seattle'),
 ('Local','Auburn'),
 ('City','Algona');

 Go
 Select * from Library_Branch;

 /*****End of Table*****/

 /*****Start of Table Publish****/

 create table Publisher
 (PublisherName varchar(70) primary key not null,
 Address_publisher varchar(50), Phone varchar(50));

 Insert into Publisher
 (PublisherName, Address_publisher,Phone)
 values
 ('DiggyPod_0','Auburn','234-456-7655'),
 ('DiggyPod_1','Algona','234-456-7654'),
 ('DiggyPod_2','seattle','234-456-7656'),
 ('DiggyPod_3','Tocoma','234-456-7657'),
 ('DiggyPod_4','Renton','234-456-7658'),
 ('DiggyPod_5','Auburn','234-456-7659');

 /*************End of Table*************/
 
 /*******Start of Boooks table*****/

 create table Books
 (BookID int primary key not null identity(100,1),
 BookTitle varchar(70), 
 publisher_name varchar(70) foreign key references Publisher(PublisherName) on update cascade on delete cascade);

 insert into  Books
(BookTitle,publisher_name)
values
('To Kill a Mockingbird','DiggyPod_1'),
('On the Road','DiggyPod_0'),
('Tell Me a Riddle','DiggyPod_1'),
('Great Expectations','DiggyPod_5'),
('All Quiet on the Western Front','DiggyPod_5'),
('War and Peace','DiggyPod_3'),
('The Heart is a Lonely Hunter','DiggyPod_1'),
('Native Son','DiggyPod_0'),
('The Lost Tribe','DiggyPod_2'),
('The Road','DiggyPod_3'),
('Frankenstein ','DiggyPod_5'),
('A Good Man Is Hard to Find','DiggyPod_3'),
('The Catcher in the Rye','DiggyPod_2'),
('The Chronicles of Narnia','DiggyPod_0'),
('The Adventures of Huckleberry Finn','DiggyPod_1'),
('Murder on the Orient Express','DiggyPod_5'),
('Of Mice and Men','DiggyPod_2'),
('The Da Vinci Code','DiggyPod_4'),
('Pride and Prejudice','DiggyPod_3'),
('The Odyssey','DiggyPod_1');

Go
  select * from books;

  /*****End of Table******/

 /*********Start Book Authors Table*****/

  create table Book_Authors
  (Book_ID int foreign key references Books(BookID) on update  cascade on delete cascade,
  AuthorName varchar(70));

  insert into Book_Authors
  (Book_ID,AuthorName)
  values
  (100,'Stephen King'),
  (101,'Harper Lee'),
  (102,'Jack'),
  (103,'Stephen King'),
  (104,'Tillie Olsen'),
  (105,'Charles'),
  (106,'Erich'),
  (107,'Leo Tolstoy'),
  (108,'Carson'),
  (109,'Richard'),
  (110,'Stephen King'),
  (111,'McCharthy');


  Go
  select * from Book_Authors;
/*****End Table ******/
 
  /************Start Table **********/
  Create Table Book_copies
  (Book_ID int foreign key references Books(BookID) on update  cascade on delete cascade,
  Branch_id int foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
  number_of_copies varchar(100));
 /** sp_rename 'Book_copies.number_of_copies','Titles','COLUMN'; **/
  Insert into Book_Copies
(Book_ID,Branch_id,number_Of_Copies)
values
(100,1,'To kill a Mockingbird'),
(100,2,'To kill a Mockingbird'),
(100,3,'To kill a Mockingbird'),
(101,1,'On the Road'),
(101,3,'On the Road'),
(101,3,'On the Road'),
(102,1,'Tell Me a Riddle'),
(102,2,'Tell Me a Riddle'),
 (102,3,'Tell Me a Riddle'),
(103,1,'The Lost Tribe'),
(103,2,'The Lost Tribe'),
(103,3,'The Lost Tribe'),
(104,1,'Great Expectations'),
(104,2,'Great Expectations'),
(104,3,'Great Expectations'),
(105,1,'All Quiet on the Western Front'),
(105,2,'All Quiet on the Western Front'),
(105,3,'All Quiet on the Western Front'),
(106,1,'War and Peace'),
(106,2,'War and Peace'),
(106,3,'War and Peace'),
(107,1,'The Heart is a Lonely Hunte'),
(107,2,'The Heart is a Lonely Hunte'),
(107,3,'The Heart is a Lonely Hunte'),
(108,1,'Pride and Prejudice'),
(108,2,'Pride and Prejudice'),
(108,3,'Pride and Prejudice'),
(109,1,'The Native Son'),
(109,2,'The Native Son'),
(109,3,'The Native Son'),
(110,1,'The Road '),
(110,2,'The Road '),
(110,3,'The Road '),
(111,1,'Frankenstein'),
(111,2,'Frankenstein'),
(111,3,'Frankenstein'),
(112,1,'A Good Man Is Hard to Find'),
(112,2,'A Good Man Is Hard to Find'),
(112,3,'A Good Man Is Hard to Find'),
(113,1,'The Catcher in the Rye'),
(113,2,'The Catcher in the Rye'),
(113,3,'The Catcher in the Rye'),
(114,2,'The Chronicles of Narnia');

Go
select * from Book_copies;
/*****End of table***/
/****Start of Table Borrower****/

create Table Borrower
(CardNo Bigint primary key not null,
Borrower_name varchar(50),B_Address varchar(50),
Borrower_phone varchar(50));

insert into Borrower
(CardNo,Borrower_name,B_Address,Borrower_phone)
values
(2345364523732343,'Smith','Auburn','234-234-5678'),
(2345364523726433,'Bob','Tocoma','345-654-6754'),
(2345364523736000,'Leela','Sea Tac','342-123-2341'),
(2345364523736133,'Navi','Algona','234-123-7654'),
(2345364523736211,'Jassi','Seattle','345-987-6543'),
(2345364523736223,'Mani','Pacific','231-432-1234'),
(2345364523736300,'Vrin','Bellevue','234-231-2345'),
(2345364523736333,'Deep','Algona','231-098-8790'),
(1223345432111244,'Paaro','Sea Tac','345-654-6754'),
(233445555555554,'Liza','LakeLand','321-123-1234'),
(2345364523726419,'Nancy','Auburn','234-567-0987');
 
 Go
 Select * from Borrower;
/****End OF Table****/

/*****Books Loan table ****/
Create Table Book_loans
(BookID int foreign key references Books(BookID) on update  cascade on delete cascade,
  Branchid int foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
  Book_CardNo BigInt foreign key references Borrower(CardNo) on update cascade on delete cascade,
  DateOut date,DateDue date);

  insert into Book_Loans
  (BookID,Branchid,Book_CardNo,DateOut,DateDue)
  values
(100,1,2345364523732343,'2018-12-12','2018-12-30'),
(101,2,2345364523726433,'2018-12-12','2018-12-30'),
(102,1,2345364523732343,'2018-12-12','2018-12-30'),
(103,2,2345364523732343,'2018-12-12','2018-12-30'),
(101,3,2345364523732343,'2018-12-12','2018-12-30'),
(102,2,2345364523732343,'2018-12-12','2018-12-30'),
(104,2,2345364523732343,'2018-12-12','2018-12-30'),
(104,3,2345364523736000,'2018-12-11','2018-12-30'),
(105,2,2345364523736000,'2018-12-10','2018-10-30'),
(114,1,2345364523736000,'2018-12-11','2018-11-30'),
(111,1,2345364523736000,'2018-12-12','2018-12-30'),
(112,2,2345364523736000,'2018-12-10','2018-10-30'),
(110,1,2345364523736133,'2018-12-09','2018-09-30'),
(109,1,2345364523736211,'2018-12-10','2018-10-30'),
(108,1,2345364523736211,'2018-12-08','2018-08-30'),
(107,2,2345364523736211,'2018-12-08','2018-08-30'),
(109,3,2345364523736211,'2018-12-08','2018-08-30'),
(105,3,2345364523736211,'2018-12-08','2018-08-30'),
(106,2,2345364523736223,'2018-12-06','2018-06-30'),
(103,3,2345364523736223,'2018-12-12','2018-12-30'),
(107,2,2345364523736300,'2018-12-12','2018-12-30'),
(null,2,233445555555554,'2019-03-04','2019-04-30'),
(110,1,2345364523736333,'2019-12-04','2019-04-30'),
(110,3,null,'2018-12-12','2018-12-31'),
(102,2,2345364523726419,'2019-04-02','2019-04-20'),
(103,2,2345364523726419,'2019-04-12','2019-04-30');
select * from Book_loans;
insert into Book_loans
(BookID,Branchid,Book_CardNo,DateOut,DateDue)
  values
(100,1,2345364523732343,'2018-12-12','2018-12-30'),
(101,1,2345364523732343,'2018-12-12','2018-12-30'),
(102,1,2345364523732343,'2018-12-12','2018-12-30'),
(103,1,2345364523732343,'2018-12-12','2018-12-30'),
(104,1,2345364523732343,'2018-12-12','2018-12-30');

Go
select * from Book_loans;

/***********End of All Tables*****/