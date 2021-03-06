
ALTER proc [dbo].[Sp_UserPermission]

@CompRefNo varchar(max)='',
@UserRefNo varchar(max)='',
@ModuleRefNo varchar(max)='',
@PCIP varchar(max)='',
@PCName varchar(max)='',
@PCMac varchar(max)='',
@CUser varchar(max)='',
@Insert bit=0,
@Update bit=0,
@Delete bit=0,
@Select bit=0,
@Import bit=0,
@Export bit=0,
@SMRef varchar(max)='',
@MMRef varchar(max)='',
@CPCGRef varchar(max)=''
as 


begin

declare @CompCode varchar(max)
set @CompCode = (SELECT CPCode from [dbo].[tblCompany] WHERE CPRef = @CompRefNo)

declare @UserCode varchar(max)
set @UserCode = (SELECT UserCode from [dbo].[tblUsers] WHERE UserRef = @UserRefNo)

declare @ModuleCode varchar(max)
set @ModuleCode = (SELECT MdCode from [dbo].[tblModules] WHERE  RefNo = @ModuleRefNo and MMRef = @MMRef and SMRef =@SMRef )




if not exists (SELECT
		*
	FROM [dbo].[tblUserPer]

	WHERE [SMRef] = @SMRef
	AND [MMRef] = @MMRef
	AND [CPCGRef] = @CPCGRef
	AND [CompRefNo] = @CompRefNo
	AND [UserRefNo] = @UserRefNo
	and ModuleRefNo =@ModuleRefNo
	)

BEGIN

INSERT INTO [dbo].[tblUserPer] ([RefNo]
, [CompRefNo]
, [CompCode]
, [UserRefNo]
, [UserCode]
, [ModuleRefNo]
, [ModuleCode]
, [PCIP]
, [PCName]
, [PCMac]
, [CUser]
, [CDate]
, [Insert]
, [Update]
, [Delete]
, [Select]
, [Import]
, [Export]
, [Date]
, [SMRef]
, [MMRef]
, [CPCGRef])
	VALUES (NEWID(), @CompRefNo, @CompCode, @UserRefNo, @UserCode, @ModuleRefNo, @ModuleCode, @PCIP, @PCName, @PCMac, @CUser, GETDATE(), @Insert, @Update, @Delete, @Select, @Import, @Export, GETDATE(), @SMRef, @MMRef, @CPCGRef)

END

ELSE
BEGIN

UPDATE [dbo].[tblUserPer]
SET [CompRefNo] = @CompRefNo
   ,[CompCode] = @CompCode
   ,[UserRefNo] = @UserRefNo
   ,[UserCode] = @UserCode
   ,[ModuleRefNo] = @ModuleRefNo
   ,[ModuleCode] = @ModuleCode
   ,[PCIP] = @PCIP
   ,[PCName] = @PCName
   ,[PCMac] = @PCMac
   ,[CUser] = @CUser
   ,[CDate] = GETDATE()
   ,[Insert] = @Insert
   ,[Update] = @Update
   ,[Delete] = @Delete
   ,[Select] = @Select
   ,[Import] = @Import
   ,[Export] = @Export
   ,[Date] = GETDATE()
   ,[SMRef] = @SMRef
   ,[MMRef] = @MMRef
   ,[CPCGRef] = @CPCGRef
WHERE [SMRef] = @SMRef
AND [MMRef] = @MMRef
AND [CPCGRef] = @CPCGRef
AND [CompRefNo] = @CompRefNo
AND [UserRefNo] = @UserRefNo
and ModuleRefNo =@ModuleRefNo
END
END