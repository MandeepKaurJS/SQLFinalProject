use SQLFINALPROJECT
Go
/***Create Stored Procedure**********/
create Procedure GetBranchInfo
as
Begin

/***How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown" ****/

select COUNT(Titles)as Title,BranchName from Book_copies
	inner join Library_Branch on Book_copies.Branch_id=
	Library_Branch.BranchID
	where BranchName='SharpsTown' and Titles='The Lost Tribe'
	group by BranchName
end

execute[dbo].[GetBranchInfo]