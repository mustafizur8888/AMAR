USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMenuName]    Script Date: 06/29/17 8:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,iftekhar>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMenuName] 
	-- Add the parameters for the stored procedure here
	@Type nvarchar(50)=''
AS
BEGIN


	SET NOCOUNT ON;

	if(@type = 'getmenu')
   
	begin
		select RefNo,MenuCode from tblMainMenu where MenuStatus='Active'
	end

END
