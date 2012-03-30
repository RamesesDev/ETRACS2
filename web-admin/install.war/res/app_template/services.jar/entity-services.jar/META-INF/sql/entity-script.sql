CREATE TABLE entity
(                         
	objid varchar(50) NOT NULL,                 
	schemaname varchar(100) NOT NULL,           
	schemaversion varchar(10) NOT NULL,         
	entityno varchar(10) NOT NULL,              
	entityname varchar(500) NOT NULL,           
	entityaddress varchar(100) NOT NULL,           
	entitytype varchar(25) NOT NULL,            
	info text NOT NULL,                         
	sys_lastupdate varchar(25) default NULL,    
	sys_lastupdateby varchar(50) default NULL,  
	PRIMARY KEY  (objid)                        
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE INDEX ux_entity_no ON Entity(entityno);
CREATE INDEX ix_entity_name ON Entity(entityname);