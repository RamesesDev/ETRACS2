[getList]
SELECT * FROM machines ORDER BY machinecode

[getListByCode]
SELECT * FROM machines WHERE machinecode LIKE $P{machinecode} ORDER BY machinecode

[getListByDescription]
SELECT * FROM machines WHERE machinedesc LIKE $P{machinedesc} ORDER BY machinecode

[getById]
SELECT * FROM machines WHERE objid = $P{objid}

[checkDuplicateDescription]
SELECT COUNT(*) AS count FROM machines WHERE machinedesc = $P{machinedesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM machines WHERE machinecode = $P{machinecode}

