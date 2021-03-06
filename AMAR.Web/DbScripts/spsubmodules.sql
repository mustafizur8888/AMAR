USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[SP_SubModules]    Script Date: 06/30/17 1:50:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [SP_SubModules] 'Select','37ddb814-03a5-48be-b668-f4f1ee2dcfa8'
ALTER proc [dbo].[SP_SubModules]
@Action varchar(10)='Select',
@MSCode varchar(10)='Inventory',
@MSName varchar(50)='Inventory',
@MdCode varchar(50)='Inventory',
@MdRef varchar(50)='Inventory',
@MsUser varchar(100)='ADM',
@MsPCIP varchar(100)='192.168.1.239',
@MsPCName varchar(100)='Arafat-PC',
@MsPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13',
@MSStatus varchar(100)='Active',
@MSRemarks varchar(100)='',
@MSUpdate varchar(100)='',
@MSDelete varchar(100)='',
@MSInsert varchar(100)='',
@MSSelect varchar(100)='',
@MSImport varchar(100)='',
@MSExport varchar(100)='',
@MSUrl nvarchar(100)=''

as
BEGIN

if @Action='Select'
BEGIN

Select * from tblSubModules where MdRef=@MdRef
END
if @Action='Insert'
BEGIN
INSERT INTO [tblSubModules]
           (
		   RefNo, [MSCode],[MSName],[MdCode],[MdRef],[MSInsert],[MSUpdate] ,[MSDelete] ,[MSSelect] ,[MSImport]  ,[MSExport]
      ,[MSDate],[MSUsers] ,[MSPCIP] ,[MSPCName] ,[MSMACAddress],[MSStatus] ,[MSRemarks], MSUrl	)
     VALUES
	 (NEWID() ,@MSCode,@MSName,@MdCode ,@MdRef,@MSInsert, @MSUpdate,@MSDelete,@MSSelect,@MSImport,@MSExport,getdate(),
	 @MsUser,@MsPCIP,@MsPCName,@MsPCMac,@MSStatus ,@MSRemarks,@MSUrl)

END
if @Action='Update'
BEGIN
update [tblSubModules] set [MSCode]=@MSCode, [MSName]=@MSName, [MdCode]=@MdCode, [MdRef]=@MdRef,[MSInsert]=@MSInsert ,
[MSUpdate]=@MSUpdate, [MSDelete]=@MSDelete,[MSSelect]=@MSSelect ,[MSImport]=@MSExport, [MSDate]=getdate(),
 [MSUsers]=@MsUser , [MSPCIP]=@MsPCIP , [MSPCName]=@MsPCName , [MSMACAddress]=@MsPCMac , [MSStatus]=@MSStatus ,
 [MSRemarks]=@MSRemarks , MSUrl=@MSUrl where [MSCode]=@MSCode
END
if @Action='Delete'
BEGIN
delete from [tblSubModules] where [MSCode]=@MSCode 
END
END

