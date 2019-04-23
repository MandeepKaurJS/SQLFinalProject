use SQLFINALPROJECT
Go
create procedure countBorrower
as
begin
/**********Retrieve the names, addresses, and the number of books 
checked out for all borrowers who have more than five books checked out.***/
	select count(Titles) as CheckedOutBooks,B_address,Borrower_name from 
	(Book_loans
		inner join Borrower on Book_loans.Book_CardNo=
		Borrower.CardNo
		inner join Book_copies on Book_loans.BookID=
		Book_copies.Book_ID)
		group by B_Address,Titles,Borrower_name
		having COUNT(Borrower_name)>5
end
Go
execute[dbo].[countBorrower]