use SQLFINALPROJECT
Go
create procedure GetAuthorName
as
Begin
	
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

execute[dbo].[GetAuthorName]