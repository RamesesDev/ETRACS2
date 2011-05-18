CREATE TABLE collectiontype (                                                  
  objid varchar(50) NOT NULL,                                                  
  schemaname varchar(50) NOT NULL,                                             
  schemaversion varchar(5) NOT NULL,                                           
  name varchar(100) NOT NULL,                                                  
  appcode varchar(25) NOT NULL,                                                
  payorrequired int(11) NOT NULL,                                              
  afid varchar(50) NOT NULL,                                                   
  sys_lastupdate varchar(25) NOT NULL,                                         
  sys_lastupdateby varchar(25) NOT NULL,                                       
  PRIMARY KEY  (objid),                                                        
  KEY FK_collectiontype (afid),                                              
  CONSTRAINT FK_collectiontype FOREIGN KEY (afid) REFERENCES af (objid)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE UNIQUE INDEX ux_collectiontype_name ON collectiontype( name );
CREATE INDEX ix_collectiontype_afid ON collectiontype( afid );