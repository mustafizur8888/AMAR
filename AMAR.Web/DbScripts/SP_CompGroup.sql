USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[SP_CompGroup]    Script Date: 7/5/2017 8:31:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SP_CompGroup]
@Action varchar(10)='select',
@CGCode varchar(10)='AMAR', 
@CGName varchar(50)='Amar', 
@CGAddress varchar(250)='Dhaka',
@CGCountry varchar(10)='BD',
@CGPerson varchar(50)='Mr. Anik',
@CGCell varchar(50)='01748919303',
@CGEmail varchar(100)='arafat@amarmis.com',
@CGWeb varchar(100)='www.amarmis.com',
@CGUser varchar(10)='ADM',
@CGPCIP varchar(50)='192.168.1.239',
@CGPCName varchar(100)='Arafat-PC', 
@CGPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13', 
@CGStatus varchar(10)='Active', 
@CGRemarks varchar(250)='',
@CGRef varchar(max)=''
as
BEGIN
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
SELECT CGRef, CGCode, CGName, CGAddress, CGCountry, CGPerson, CGCell, CGEmail, CGWeb, CGUser, CGDate, CGPCIP, CGPCName, CGPCMac, CGStatus, CGRemarks FROM tblCompGroup 
where CGRef LIKE '%'+@CGRef+'%'
order by CGName
END
if @Action='Insert'
BEGIN
insert into tblCompGroup(CGRef, CGCode, CGName, CGAddress, CGCountry, CGPerson, CGCell, CGEmail, CGWeb, CGUser, CGDate, CGPCIP, CGPCName, CGPCMac, CGStatus, CGRemarks)
VALUES(NEWID(), @CGCode, @CGName, @CGAddress, @CGCountry, @CGPerson, @CGCell, @CGEmail, @CGWeb, @CGUser, GETDATE(), @CGPCIP, @CGPCName, @CGPCMac, @CGStatus, @CGRemarks)
END
if @Action='Update'
Begin
update tblCompGroup set CGCode=@CGCode, CGName=@CGName, CGAddress=@CGAddress, CGCountry=@CGCountry, CGPerson=@CGPerson, CGCell=@CGCell, CGEmail=@CGEmail, CGWeb=@CGWeb, 
CGUser=@CGUser, CGDate=GETDATE(), CGPCIP=@CGPCIP, CGPCName=@CGPCName, CGPCMac=@CGPCMac, CGStatus=@CGStatus, CGRemarks=@CGRemarks where CGCode=@CGCode
end
if @Action='Delete'
BEGIN
delete from tblCompGroup where CGCode=@CGCode
end
END

