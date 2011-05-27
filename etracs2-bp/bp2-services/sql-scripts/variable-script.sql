CREATE TABLE variable (                   
	objid varchar(50) NOT NULL,             
	schemaname varchar(20) NOT NULL,        
	schemaversion varchar(5) NOT NULL,      
	name varchar(50) NOT NULL,              
	datatype varchar(20) NOT NULL,          
	caption varchar(50) NOT NULL,           
	description varchar(100) default NULL,  
	arrayvalues text,                       
	PRIMARY KEY  (objid),                   
	UNIQUE KEY ux_variable_name (name)    
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1      
