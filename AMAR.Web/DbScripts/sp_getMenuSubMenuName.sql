USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[sp_getMenuSubMenuName]    Script Date: 06/29/17 8:11:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_getMenuSubMenuName] 

  @type nvarchar(50)='menu',
  @ref nvarchar(50)=''
AS
BEGIN

	SET NOCOUNT ON;

  if(@type='menu' and @ref='')
	begin
		select Mname,RefNo from(SELECT     [MenuName] as Mname, m.RefNo as RefNo, 
		s.SMName
		 FROM [AMIS].[dbo].[tblMainMenu] m
		 left outer join [AMIS].[dbo].[tblSubMenu] s
		 on m.RefNo = s.MenuRef
		 		 where s.SMName is not null 
		 group by m.RefNo,[MenuName],s.SMName) z
		 group by Mname,RefNo
		

	end

else if(@type='noSubmenu' and @ref='')
	begin

	select Mname,RefNo from(SELECT     [MenuName] as Mname, m.RefNo as RefNo, 
		s.SMName
		 FROM [AMIS].[dbo].[tblMainMenu] m
		 left outer join [AMIS].[dbo].[tblSubMenu] s
		 on m.RefNo = s.MenuRef
		 		 where s.SMName is  null
		 group by m.RefNo,[MenuName],s.SMName) z
		 --group by Mname,RefNo
	end
 else if (@type='menu' and @ref!='')
 begin
		SELECT    SMName FROM [AMIS].[dbo].[tblSubMenu]
		where MenuRef=@ref
	end
END
