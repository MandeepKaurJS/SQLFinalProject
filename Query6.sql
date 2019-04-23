use SQLFINALPROJECT
Go
create procedure countBorrower
as
begin
/**********Retrieve the names, addresses, and the number of books 
checked out for all borrowers who have more than five books checked out.***/
	select count(BookId) as CheckedOutBooks,B_address,Borrower_name from 
	(Book_loans
		inner join Borrower on Book_loans.Book_CardNo=
		Borrower.CardNo)
		group by B_Address,Borrower_name
		having COUNT(BookID)>5
end
Go
execute[dbo].[countBorrower]