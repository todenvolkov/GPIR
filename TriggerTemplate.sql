



set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
alter TRIGGER [dbo].[PlannedManualValueTrigger] ON [dbo].[PlannedManualValue]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS
BEGIN
 set nocount on;

  declare @insertedCount int, @deletedCount int, @IntelliRecordState varchar(30),
	@SYSTEM_USER varchar(500),@CurrentDate datetime
  
  select @insertedCount = count(id) from inserted
  select @deletedCount = count(id) from deleted

  set @IntelliRecordState=dbo.[GetRecordStatus](@insertedCount,@deletedCount); 
  set @SYSTEM_USER=SYSTEM_USER;
  set @CurrentDate=GETDATE();
    
  
if @IntelliRecordState = 'Удален'

  insert into [PlannedManualValueJournal] (
      [BudgetGUID]
      ,[BudgetArticleGUID]
      ,[Price]
      ,[StageGUID]
      ,[GUID]
      ,[TypeCalc]
      ,[OldGUID]
      ,[OrganisationGUID]
      ,[ContractNumber]  
					,version, UsernameChange, DateChange, IntelliRecordState)
    select 
      i.[BudgetGUID]
      ,i.[BudgetArticleGUID]
      ,i.[Price]
      ,i.[StageGUID]
      ,i.[GUID]
      ,i.[TypeCalc]
      ,i.[OldGUID]
      ,i.[OrganisationGUID]
      ,i.[ContractNumber],
   (select COALESCE(max(Version),0) from [PlannedManualValueJournal] where GUID = i.GUID), @SYSTEM_USER, @CurrentDate , @IntelliRecordState from Deleted i

else  -- Обновлен или вставлен

  insert into [PlannedManualValueJournal] (
      [BudgetGUID]
      ,[BudgetArticleGUID]
      ,[Price]
      ,[StageGUID]
      ,[GUID]
      ,[TypeCalc]
      ,[OldGUID]
      ,[OrganisationGUID]
      ,[ContractNumber]
					,version, UsernameChange, DateChange, IntelliRecordState)
    select 
      i.[BudgetGUID]
      ,i.[BudgetArticleGUID]
      ,i.[Price]
      ,i.[StageGUID]
      ,i.[GUID]
      ,i.[TypeCalc]
      ,i.[OldGUID]
      ,i.[OrganisationGUID]
      ,i.[ContractNumber],
    (select COALESCE(max(Version),0) from [PlannedManualValueJournal] where GUID = i.GUID)+1,@SYSTEM_USER, @CurrentDate,  @IntelliRecordState from Inserted i


END






-- TEMPLATE FOR TABLES

--	version bigint, 
--	UsernameChange varchar(1000), 
--	DateChange datetime, 
--	IntelliRecordState varchar(30),