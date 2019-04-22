use SQLFINALPROJECT
Go
/***Create Stored Procedure**********/
create Procedure GetBranchInfo
as
Begin

/***How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown" ****/

select number_of_copies,BranchName from Book_copies
inner join Library_Branch  on Book_copies.Branch_id=
Library_Branch.BranchID where number_of_copies='The Lost Tribe' and Branch_id=2
select COUNT(number_of_copies)as Copies from Book_copies
where number_of_copies='The Lost Tribe';

end

execute[dbo].[GetBranchInfo]