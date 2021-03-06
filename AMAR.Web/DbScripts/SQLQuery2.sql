USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[SP_Company]    Script Date: 7/6/2017 10:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SP_Company]
@Action varchar(10)='select',
@CPCode varchar(10)='BPKW', 
@CPName varchar(50)='Blue Planet Knitwear Ltd', 
@CPAddress varchar(250)='Dhaka', 
@CPCountry varchar(50)='BD',
@CPPerson varchar(50)='Mr. Arafat', 
@CPCell varchar(50)='01777769591',
@CPEmail varchar(100)='arafat@amarmis.com',
@CPWeb varchar(100)='www.amarmis.com',
@CPCGRef uniqueidentifier='FC81836B-ACE5-4674-8453-18FBD7AE9B5B',
@CPCGCode varchar(10)='BPG',
@CPUser varchar(10)='ADM',
@CPPCIP varchar(100)='192.168.1.239', 
@CPPCName varchar(100)='Arafat-PC',
@CPPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13', 
@CPStatus varchar(10)='Active', 
@CPRemarks varchar(250)='',
@CPRef uniqueidentifier='FC81836B-ACE5-4674-8453-18FBD7AE9B5B'
as
BEGIN
if @Action='FCompGroup'
BEGIN
select CGCode,CGName from tblCompGroup order by CGName
END
if @Action='FCGRef'
BEGIN
select CGRef,CGName from tblCompGroup  order by CGName
END
if @Action='FCountry'
BEGIN
select ItemCode,ItemName from tblItemMaster where TCode='Country' order by ItemName
END
if @Action='FStatus'
BEGIN
select ItemCode,ItemName from tblItemMaster where TCode='Status' order by ItemName
END
if @Action='select'
BEGIN
SELECT CPRef, CPCode, CPName, CPAddress, CPCountry, CPPerson, CPCell, CPEmail, CPWeb, CPCGRef, CPCGCode, CPUser, CPDate, CPPCIP, CPPCName, CPPCMac, CPStatus, CPRemarks FROM tblCompany 
where (convert(varchar(max),CPCGRef) LIKE '%'+convert(varchar(max),@CPCGRef)+'%' or convert(varchar(max),CPRef) LIKE '%'+convert(varchar(max),@CPRef)+'%' )
order by CPName
END
if @Action='Edite'
BEGIN
SELECT CPRef, CPCode, CPName, CPAddress, CPCountry, CPPerson, CPCell, CPEmail, CPWeb, CPCGRef, CPCGCode, CPUser, CPDate, CPPCIP, CPPCName, CPPCMac, CPStatus, CPRemarks FROM tblCompany 
where  convert(varchar(max),CPRef) LIKE '%'+convert(varchar(max),@CPRef)+'%' 
order by CPName
END
if @Action='Insert'
BEGIN
Insert into tblCompany(CPRef, CPCode, CPName, CPAddress, CPCountry, CPPerson, CPCell, CPEmail, CPWeb, CPCGRef, CPCGCode, CPUser, CPDate, CPPCIP, CPPCName, CPPCMac, CPStatus, CPRemarks)
VALUES(NEWID(), @CPCode, @CPName, @CPAddress, @CPCountry, @CPPerson, @CPCell, @CPEmail, @CPWeb, @CPCGRef, @CPCGCode, @CPUser, GETDATE(), @CPPCIP, @CPPCName, @CPPCMac, @CPStatus, @CPRemarks)
END
if @Action='update'
BEGIN
update tblCompany set CPCode=@CPCode, CPName=@CPName, CPAddress=@CPAddress, CPCountry=@CPCountry, CPPerson=@CPPerson, CPCell=@CPCell, CPEmail=@CPEmail, CPWeb=@CPWeb, CPCGRef=@CPCGRef, CPCGCode=@CPCGCode, CPUser=@CPUser, CPDate=GETDATE(), CPPCIP=@CPPCIP, CPPCName=@CPPCName, CPPCMac=@CPPCMac, CPStatus=@CPStatus, CPRemarks=@CPRemarks where CPCode=@CPCode
END
if @Action='Delete'
BEGIN
Delete from tblCompany where CPCode=@CPCode
END
END