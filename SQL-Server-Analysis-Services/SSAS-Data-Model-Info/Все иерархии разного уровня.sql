-- Все иерархии разного уровня

SELECT 
    [CATALOG_NAME] as [DATABASE],
    CUBE_NAME AS [CUBE],
    [DIMENSION_UNIQUE_NAME] AS [DIMENSION],
    HIERARCHY_DISPLAY_FOLDER AS [FOLDER],
    HIERARCHY_CAPTION AS [HIERARCHY],
    HIERARCHY_IS_VISIBLE AS [VISIBLE]
FROM $system.MDSchema_hierarchies
WHERE CUBE_NAME  = '<Имя куба>' -- Измените отбор здесь
AND HIERARCHY_ORIGIN=3
ORDER BY [DIMENSION_UNIQUE_NAME]