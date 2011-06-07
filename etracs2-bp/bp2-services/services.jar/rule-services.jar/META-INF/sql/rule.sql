[getList]
SELECT objid, docstate, agendagroup, rulename, description, author, salience 
FROM rule 
ORDER BY agendagroup, rulename  

[getListByName]
SELECT objid, docstate, agendagroup, rulename, description, author, salience 
FROM rule 
WHERE rulename LIKE $P{name} 
ORDER BY agendagroup, rulename  

[getRuleGroups]
SELECT * FROM rulegroup ORDER BY sortorder 

[getTaxFeeRuleGroups]
SELECT * FROM rulegroup WHERE objid <> 'APPINFO' ORDER BY sortorder 

[checkDuplicateRuleName]
SELECT objid FROM rule WHERE objid <> $P{objid} AND rulename = $P{rulename}



