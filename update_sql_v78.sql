-- update build 78

create procedure dbo.SprFindDuplicates(@table  nvarchar(40) ,@field_to_find  nvarchar(40))
as
begin

DECLARE @sql as nvarchar(500)        -- переменна€ дл€ sql-скрипта

-- при помощи функции LTRIM() удал€ютс€ все знаки пробела слева от фразы
set @sql = 'select id from ' + @table +
' where ' + @field_to_find
+ ' in (SELECT ' + 's1.' + @field_to_find
+ ' FROM ' + @table + ' s1 INNER JOIN ' + @table + ' s2 ON ' +
'LTRIM(s1.' + @field_to_find+ ') = ' + 'LTRIM(s2.' + @field_to_find + ')'
+ ' GROUP BY ' + 's1.' + @field_to_find +
' HAVING COUNT(*)>1) order by ' + @field_to_find + ''

exec (@sql)

end