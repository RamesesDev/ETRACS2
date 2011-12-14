
ALTER TABLE rptpaymentmanual add column municity varchar(200) not null;
ALTER TABLE rptpaymentmanual add column municityid varchar(50) not null;
ALTER TABLE rptpaymentmanual add column municityname varchar(100) not null; 


-- update for municipality 
UPDATE rptpaymentmanual r, lgu l, lgu m  SET
	r.municityid = m.objid,
	r.municityname = m.lguname,
	r.municity = CONCAT('[objid:"', m.objid, '",lgutype:"', m.lgutype, '",lguname:"', m.lguname, '"]')
WHERE r.barangay = l.lguname 
  AND l.parentid = m.objid ;
  

-- update for city 
UPDATE rptpaymentmanual r, lgu l   SET
	r.municityid = l.objid,
	r.municityname = l.lguname,
	r.municity = CONCAT('[objid:"', l.objid, '",lgutype:"', l.lgutype, '",lguname:"', l.lguname, '"]')
WHERE l.lgutype = 'CITY';


