CREATE TABLE lobclassification (                 
	 objid varchar(50) NOT NULL,                    
	 schemaname varchar(25) NOT NULL,               
	 schemaversion varchar(5) NOT NULL,             
	 name varchar(100) NOT NULL,                    
	 remarks varchar(100) default NULL,             
	 PRIMARY KEY  (objid),                          
	 UNIQUE KEY ux_lobclassification_name (name)  
   ) ENGINE=InnoDB DEFAULT CHARSET=latin1   