
[getFaas]
SELECT objid, rpu FROM faas  

[updateBearings]
UPDATE faas 
SET rpu = $P{rpu} 
WHERE objid = $P{objid} 

