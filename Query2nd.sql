use SQLFINALPROJECT
Go
/***Create Stored Procedure**********/
create Procedure GetCopiesofbooks
as
Begin
	/***How many copies of the book titled "The Lost Tribe"
 are owned by each library branch****/
 select number_of_copies,BranchName from Book_copies
inner join Library_Branch  on Book_copies.Branch_id=
Library_Branch.BranchID where number_of_copies='The Lost Tribe'
end
execute[dbo].[GetCopiesofbooks]