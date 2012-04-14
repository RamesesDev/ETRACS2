[getList]
SELECT objid, docstate, agendagroup, rulename, description, author, salience  
FROM rule 
WHERE ruleset = $P{ruleset}
ORDER BY agendagroup, rulename  

[rule-sets]
SELECT * FROM ruleset ORDER BY sortorder 

[rule-groups]
SELECT * FROM rulegroup where ruleset=$P{ruleset} ORDER BY sortorder 



[checkDuplicateRuleName]
SELECT objid FROM rule WHERE objid <> $P{objid} AND rulename = $P{rulename}


[getRuleConditions]
SELECT 
 conditions 
FROM rule 



