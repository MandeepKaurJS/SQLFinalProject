use SQLFINALPROJECT
Go
/***Create Stored Procedure**********/
create Procedure GetCopiesofbooks
as
Begin
	/***How many copies of the book titled "The Lost Tribe"
 are owned by each library branch****/
 select count(Titles) as Title,BranchName from Book_copies
inner join Library_Branch  on Book_copies.Branch_id=
Library_Branch.BranchID where Titles='The Lost Tribe'
group by BranchName
end
Go
execute[dbo].[GetCopiesofbooks]