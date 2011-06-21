[getList]
SELECT * FROM rptparameters ORDER BY paramname

[getListByName]
SELECT * FROM rptparameters WHERE paramname LIKE $P{paramname} ORDER BY paramname

[getListByCaption]
SELECT * FROM rptparameters WHERE paramcaption LIKE $P{paramcaption} ORDER BY paramname

[getListByType]
SELECT * FROM rptparameters WHERE paramtype LIKE $P{paramtype} ORDER BY paramname

[getById]
SELECT * FROM rptparameters WHERE objid = $P{objid}

[checkDuplicateCaption]
SELECT COUNT(*) AS count FROM rptparameters WHERE paramcaption = $P{paramcaption}

[checkDuplicateName]
SELECT COUNT(*) AS count FROM rptparameters WHERE paramname = $P{paramname}

