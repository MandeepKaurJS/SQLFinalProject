use SQLFINALPROJECT
Go
create procedure GetDueDate
as
begin

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
end
Go
execute[dbo].[GetDueDate]