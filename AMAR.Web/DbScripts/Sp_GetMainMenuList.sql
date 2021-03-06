USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetMainMenuList]    Script Date: 6/29/2017 4:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Sp_GetMainMenuList]
@Type varchar(max)
as 
begin
if @Type='All'
begin
SELECT
	RefNo
   ,MenuName
FROM tblMainMenu
ORDER BY MenuName

END
ELSE IF (@type = 'Active')
BEGIN
SELECT
	RefNo
   ,MenuName
FROM tblMainMenu
WHERE MenuStatus = 'Active'
ORDER BY MenuName

END
ELSE IF (@type = 'InActive')
BEGIN
SELECT
	RefNo
   ,MenuName
FROM tblMainMenu
WHERE MenuStatus = 'Inactive'
ORDER BY MenuName

END
END