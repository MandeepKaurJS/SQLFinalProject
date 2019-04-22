use SQLFINALPROJECT
Go
/***Create Stored Procedure**********/
create Procedure GetInfo
as
Begin
	/*****Retrieve the names of all borrowers who do not have any books checked out****/

select * from Borrower
full outer join Book_loans on
Book_loans.Book_CardNo=Borrower.CardNo

end 
execute[dbo].[GetInfo]