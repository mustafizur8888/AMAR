/****** Script for SelectTopNRows command from SSMS  ******/

Create Proc SP_GetUserList
@UserCGRef uniqueidentifier,
@UserCPRef uniqueidentifier
as

begin
SELECT   [UserRef]     
      ,[UserName]

  FROM [AMIS].[dbo].[tblUsers]
  where UserCGRef=@UserCGRef and UserCPRef=@UserCPRef
  order by UserName
  END
