CREATE TABLE lob (                                                                             
  objid varchar(50) NOT NULL,                                                                  
  schemaname varchar(25) NOT NULL,                                                             
  schemaversion varchar(5) NOT NULL,                                                           
  docstate varchar(10) NOT NULL,                                                               
  name varchar(100) NOT NULL,                                                                  
  classificationid varchar(50) NOT NULL,                                                       
  classification varchar(50) NOT NULL,                                                         
  attributes text,                                                                             
  PRIMARY KEY  (objid),                                                                        
  UNIQUE KEY ux_lob_name (name),                                                             
  KEY FK_lob (classificationid),                                                             
  CONSTRAINT FK_lob FOREIGN KEY (classificationid) REFERENCES lobclassification (objid)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1         