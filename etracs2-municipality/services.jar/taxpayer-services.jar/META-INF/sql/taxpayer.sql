[remote.findByName]
SELECT objid, name, primaryaddress as address, mailingaddress as mailAddress 
FROM Payer 
WHERE name LIKE $P{name}