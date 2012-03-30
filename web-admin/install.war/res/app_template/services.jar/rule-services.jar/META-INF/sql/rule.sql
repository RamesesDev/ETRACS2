[getList]
SELECT objid, docstate, agendagroup, rulename, description, author, salience, opener  
FROM rule 
WHERE ruleset = $P{ruleset}
ORDER BY agendagroup, rulename  

[getListByName]
SELECT objid, docstate, agendagroup, rulename, description, author, salience, opener  
FROM rule 
WHERE ruleset = $P{ruleset} 
  AND rulename LIKE $P{name} 
ORDER BY agendagroup, rulename  

[getRuleGroups]
SELECT * FROM rulegroup ORDER BY sortorder 

[getTaxFeeRuleGroups]
SELECT * FROM rulegroup WHERE objid <> 'APPINFO' ORDER BY sortorder 

[checkDuplicateRuleName]
SELECT objid FROM rule WHERE objid <> $P{objid} AND rulename = $P{rulename}


[getRuleConditions]
SELECT 
 conditions 
FROM rule 



