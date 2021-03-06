USE [AMIS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSubMenuList]    Script Date: 6/29/2017 4:10:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Sp_GetSubMenuList]
@MainMenuRefNo varchar(max),
@Type varchar(max)
as 
begin
if @Type='All'
begin
SELECT
	RefNo,SMName
FROM tblSubMenu
where MenuRef=@MainMenuRefNo
ORDER BY SMName

END
ELSE IF (@type = 'Active')
BEGIN
SELECT
	RefNo,SMName
FROM tblSubMenu

WHERE SMStatus = 'Active' and MenuRef=@MainMenuRefNo
ORDER BY SMName

END
ELSE IF (@type = 'InActive')
BEGIN
SELECT
	RefNo,SMName
FROM tblSubMenu

WHERE SMStatus = 'Inactive' and MenuRef=@MainMenuRefNo
ORDER BY SMName

END
END