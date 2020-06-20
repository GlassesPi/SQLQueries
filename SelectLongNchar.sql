select	right(html,len(html))	from
configuration.DocumentTemplateConfiguration
where id = 5


-- This script is for getting all of a field's text
-- suitable for reading html

select CAST(CAST(html as nvarchar(max)) AS xml) from
scheam.table