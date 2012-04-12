[list]
SELECT objid, docstate, agendagroup, rulename, description, author, salience   
FROM rule 
WHERE ruleset = $P{ruleset}
ORDER BY agendagroup, rulename  

[list-byname]
SELECT objid, docstate, agendagroup, rulename, description, author, salience   
FROM rule 
WHERE ruleset = $P{ruleset} 
  AND rulename LIKE $P{name} 
ORDER BY agendagroup, rulename  

[check-duplicate]
SELECT objid FROM rule WHERE objid <> $P{objid} AND rulename = $P{rulename}

[rule-groups]
SELECT * FROM rulegroup where ruleset=$P{ruleset} ORDER BY sortorder 



