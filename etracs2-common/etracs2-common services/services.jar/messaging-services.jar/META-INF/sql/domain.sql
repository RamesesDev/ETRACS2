[getList]
SELECT * FROM domain ORDER BY domainid 

[getDomainById]
SELECT * FROM domain WHERE domainid = $P{domainid} 

[insertDomain]
INSERT INTO domain 
	(domainid, domainname, domaintype, dtlastconnected)
VALUES
	( $P{domainid}, $P{domainname}, $P{domaintype}, NOW() )
	
	
[updateLastConnected]
UPDATE domain SET dtlastconnected = NOW() WHERE domainid = $P{domainid}
