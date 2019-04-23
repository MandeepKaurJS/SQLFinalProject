use SQLFINALPROJECT
Go
create procedure CountBooks
as 
begin
/**********For each library branch, retrieve the branch name and 
the total number of books loaned out from that branch. *****/

select b1.BranchName ,COUNT(*)as numberOfBooksOUt from 
	Book_loans b2
	inner join Library_Branch b1 on b1.Branchid=b2.BranchID
	GROUP BY
	b1.BranchName
end

Go
execute[dbo].[CountBooks]