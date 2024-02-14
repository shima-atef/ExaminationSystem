SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 create    proc [dbo].[DataDictionary1]
    @tableName VARCHAR(128) as
	begin
SELECT
Distinct
    schemas.name AS SchemaName,
	 tables.name AS TableName,
	  indexes.name AS PrimaryKey,
	   ISNULL(ep.value, '') AS TableDescription
  
FROM sys.tables
INNER JOIN sys.columns
    ON tables.object_id = columns.object_id
INNER JOIN sys.types
    ON types.user_type_id = columns.user_type_id
INNER JOIN sys.schemas
    ON schemas.schema_id = tables.schema_id
LEFT JOIN sys.index_columns
    ON columns.object_id = index_columns.object_id AND columns.column_id = index_columns.column_id
LEFT JOIN sys.indexes
    ON index_columns.object_id = indexes.object_id AND index_columns.index_id = indexes.index_id
LEFT JOIN sys.foreign_key_columns
    ON columns.object_id = foreign_key_columns.parent_object_id AND columns.column_id = foreign_key_columns.parent_column_id
LEFT JOIN sys.foreign_keys AS fk
    ON foreign_key_columns.constraint_object_id = fk.object_id
LEFT JOIN sys.tables AS ref_tables
    ON fk.referenced_object_id = ref_tables.object_id
LEFT JOIN sys.extended_properties AS ep
    ON tables.object_id = ep.major_id AND ep.minor_id = 0 AND ep.class = 1
WHERE tables.name= @tableName



SELECT
   
    
    columns.name AS ColumnName,
    types.name AS DataTypeName,
   
    indexes.is_primary_key,
    fk.name AS ForeignKeyName,
    ref_tables.name AS ReferencedTableName

FROM sys.tables
INNER JOIN sys.columns
    ON tables.object_id = columns.object_id
INNER JOIN sys.types
    ON types.user_type_id = columns.user_type_id
INNER JOIN sys.schemas
    ON schemas.schema_id = tables.schema_id
LEFT JOIN sys.index_columns
    ON columns.object_id = index_columns.object_id AND columns.column_id = index_columns.column_id
LEFT JOIN sys.indexes
    ON index_columns.object_id = indexes.object_id AND index_columns.index_id = indexes.index_id
LEFT JOIN sys.foreign_key_columns
    ON columns.object_id = foreign_key_columns.parent_object_id AND columns.column_id = foreign_key_columns.parent_column_id
LEFT JOIN sys.foreign_keys AS fk
    ON foreign_key_columns.constraint_object_id = fk.object_id
LEFT JOIN sys.tables AS ref_tables
    ON fk.referenced_object_id = ref_tables.object_id
LEFT JOIN sys.extended_properties AS ep
    ON tables.object_id = ep.major_id AND ep.minor_id = 0 AND ep.class = 1
WHERE tables.name= @tableName
ORDER BY tables.name,  columns.name;

end

GO
