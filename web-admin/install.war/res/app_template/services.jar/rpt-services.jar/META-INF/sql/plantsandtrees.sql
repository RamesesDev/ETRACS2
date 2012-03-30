[getList]
SELECT * FROM plantsandtrees ORDER BY planttreecode

[getListByCode]
SELECT * FROM plantsandtrees WHERE planttreecode LIKE $P{planttreecode} ORDER BY planttreecode

[getListByDescription]
SELECT * FROM plantsandtrees WHERE planttreedesc LIKE $P{planttreedesc} ORDER BY planttreecode

[getById]
SELECT * FROM plantsandtrees WHERE objid = $P{objid}

[checkDuplicateDescription]
SELECT COUNT(*) AS count FROM plantsandtrees WHERE planttreedesc = $P{planttreedesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM plantsandtrees WHERE planttreecode = $P{planttreecode}

