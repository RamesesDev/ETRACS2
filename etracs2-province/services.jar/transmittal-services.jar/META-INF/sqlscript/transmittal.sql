CREATE TABLE transmittal (                 
	objid varchar(100) NOT NULL,             
	schemaName varchar(100) NOT NULL,        
	schemaVersion varchar(50) NOT NULL,      
	state varchar(25) NOT NULL,              
	docNo varchar(100) NOT NULL,             
	lgu varchar(50) NOT NULL,                
	rpuCount int(11) NOT NULL,               
	dtTransmitted date NOT NULL,             
	transmittedBy varchar(50) default NULL,  
	PRIMARY KEY  (objid)                     
 ) 
 
 CREATE TABLE transmittalitem (          
	objid varchar(100) NOT NULL,          
	transmittalId varchar(100) NOT NULL,  
	schemaName varchar(100) NOT NULL,     
	schemaVersion varchar(50) NOT NULL,   
	tdNo varchar(25) NOT NULL,            
	pin varchar(25) NOT NULL,             
	taxpayerName varchar(1000) NOT NULL,  
	faas text NOT NULL,                   
	type varchar(20) NOT NULL,            
	txnType varchar(5) NOT NULL,          
	state varchar(25) NOT NULL,           
	faasId varchar(100) NOT NULL,         
	remarks varchar(2000) default NULL,   
	PRIMARY KEY  (objid)                  
)

CREATE TABLE transmittalattachment (       
	objid varchar(100) NOT NULL,             
	schemaName varchar(100) default NULL,    
	schemaVersion varchar(50) default NULL,  
	refId varchar(100) default NULL,         
	documentType varchar(50) default NULL,   
	remarks varchar(2000) default NULL,      
	fileName varchar(100) default NULL,      
	fileType varchar(100) default NULL,      
	fileSize bigint(20) default NULL,        
	PRIMARY KEY  (objid)                     
)
