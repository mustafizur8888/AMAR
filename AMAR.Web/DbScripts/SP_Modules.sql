
Alter proc [dbo].[SP_Modules]
@Action varchar(10)='Select',
@MdCode varchar(10)='Inventory',
@MdName varchar(50)='Inventory',
@MdUser varchar(100)='ADM',
@MdPCIP varchar(100)='192.168.1.239',
@MdPCName varchar(100)='Arafat-PC',
@MdPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13',
@MdStatus varchar(100)='Active',
@MdRemarks varchar(100)='',
@SmCode varchar(100)='',
@SmRef varchar(100)='',
@MdUrl varchar(100)='',
@MMRef varchar(100)=''

as
BEGIN

if @Action='Select'
BEGIN

SELECT RefNo, [MdCode],[MdName],[SMCode],[SMRef],[MdUrl],[MdDate],[MdUser],[MdPCIP],[MdPCName],[MdPCMac],[MdStatus],[MdRemarks],MMRef FROM tblModules 
where cast(SMRef as VARCHAR(MAX))=@SmRef and cast(MMRef as VARCHAR(MAX))=@MMRef
order by MdName
END
if @Action='Insert'
BEGIN
INSERT INTO [tblModules]
           ([RefNo],[MdCode],[MdName],[SMCode],[SMRef],[MdUrl],[MdDate],[MdUser],[MdPCIP],[MdPCName],[MdPCMac],[MdStatus],[MdRemarks],MMRef)
     VALUES(NEWID() ,@MdCode,@MdName,@SMCode ,@SMRef,@MdUrl,getdate(),@MdUser,@MdPCIP,@MdPCName,@MdPCMac,@MdStatus ,@MdRemarks,@MMRef)

END
if @Action='Update'
BEGIN
update [tblModules] set MdCode=@MdCode, MdName=@MdName, MdDate=GETDATE(), MdUser=@mduser, MdPCIP=@mdPCIP, MdPCName=@MdPCName,MMRef=@MMRef ,
MdPCMac=@MdPCMac, MdStatus=@MdStatus, MdRemarks=@MdRemarks where MdCode=@MdCode
END
if @Action='Delete'
BEGIN
delete from tblModules where MdCode=@MdCode 
END
END

