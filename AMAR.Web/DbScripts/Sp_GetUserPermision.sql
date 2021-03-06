USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserPermision]    Script Date: 7/8/2017 10:09:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[Sp_GetUserPermision]
@SMRef varchar(max),
@MMRef varchar(max),
@userRef varchar(max),
@UserCGRef varchar(max),
@UserCPRef varchar(max)

as 

begin
Select M.[RefNo] MRefNo,M.[MdName]
,M.[SMCode]
,M.[MMRef]
,M.[SMRef]
,M.[MdUrl]		
,p.[RefNo] PRefNo
,p.[CompRefNo]
,p.[CompCode]
,p.[UserRefNo]
,p.[UserCode]
,p.[ModuleRefNo]
,p.[ModuleCode]
,isnull(p.[Insert],0)[Insert]
,isnull(p.[Update],0)[Update]
,isnull(p.[Delete],0)[Delete]
,isnull(p.[Select],0)[Select]
,isnull(p.[Import],0)[Import]
,isnull(p.[Export],0)[Export]
,p.[Date]
,p.[CPCGRef] from [AMIS].[dbo].[tblUserPer] P 
Right JOIN tblModules M   ON
M.RefNo = P.ModuleRefNo and 
M.SMRef = P.SMRef and 
M.MMRef = P.MMRef and  
convert(varchar(max),P.UserRefNo)=convert(varchar(max),@userRef) and convert(varchar(max),P.CPCGRef)=convert(varchar(max),@UserCGRef) and convert(varchar(max),P.CompRefNo)=convert(varchar(max),@UserCPRef)

where convert(varchar(max),M.SMRef)=convert(varchar(max),@SMRef) and convert(VARCHAR(MAX),M.MMRef)=convert(VARCHAR(MAX), @MMRef)

order by M.[MdName]


	end

