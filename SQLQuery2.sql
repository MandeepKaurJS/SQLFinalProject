use SQLFINALPROJECT
Go
/***Create Stored Procedure**********/
create Procedure GetLibraryInfo
as
Begin

/***How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown" ****/

select number_of_copies,BranchName from Book_copies
inner join Library_Branch  on Book_copies.Branch_id=
Library_Branch.BranchID where number_of_copies='The Lost Tribe' and Branch_id=2
select COUNT(number_of_copies)as Copies from Book_copies
where number_of_copies='The Lost Tribe';

/***How many copies of the book titled "The Lost Tribe"
 are owned by each library branch****/
 select number_of_copies,BranchName from Book_copies
inner join Library_Branch  on Book_copies.Branch_id=
Library_Branch.BranchID where number_of_copies='The Lost Tribe'

/*****Retrieve the names of all borrowers who do not have any books checked out****/

select Borrower_name, BookID  from Book_loans
inner join Borrower on Book_loans.Book_CardNo=Borrower.CardNo
where Book_CardNo=233445555555554;

/****For each book that is loaned out from the "Sharpstown" 
branch and whose DueDate is today, retrieve the book title, 
the borrower's name, and the borrower's address. *****/

select book1.Branchid,b2.BranchName,b1.BookTitle,n1.Borrower_name,n1.B_address 
	from Book_loans book1
		inner join Library_Branch b2 on book1.Branchid=
		b2.BranchID
		inner join Books b1 on book1.BookID=b1.BookID
		inner join Borrower n1 on book1.Book_CardNo=
		n1.CardNo
		where BranchName='Sharpstown' and DateDue='2019-04-20'

/**********For each library branch, retrieve the branch name and 
the total number of books loaned out from that branch. *****/

select b1.BranchName ,COUNT(*)as numberOfBooksOUt from 
	Book_loans b2
	inner join Library_Branch b1 on b1.Branchid=b2.BranchID
	GROUP BY
	b1.BranchName
/**********Retrieve the names, addresses, and the number of books 
checked out for all borrowers who have more than five books checked out.***/
	select count(Borrower_name) as borrower,B_address, number_of_copies from 
	(Book_loans
		inner join Borrower on Book_loans.Book_CardNo=
		Borrower.CardNo
		inner join Book_copies on Book_loans.BookID=
		Book_copies.Book_ID)
		group by B_Address,number_of_copies
		having COUNT(Borrower_name)>5
		  
select * from Book_loans;
/*******For each book authored (or co-authored) by "Stephen King", 
retrieve the title and the number of copies owned by
 the library branch whose name is "Central". *******/
 select name.AuthorName,id.BookID,copies.number_of_copies
,Branch.BranchName
from Book_copies copies
	inner join Book_Authors name on copies.Book_ID=name.Book_ID
	inner join books id on copies.Book_ID=id.BookID
	inner join Library_Branch Branch on copies.Branch_id=
	Branch.BranchID
	where Branch_id=1 and AuthorName='Stephen King'
end

execute[dbo].[GetLibraryInfo]