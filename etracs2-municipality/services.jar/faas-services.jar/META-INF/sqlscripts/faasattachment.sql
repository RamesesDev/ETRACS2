CREATE TABLE `faasattachment` (              
	`objid` varchar(50) NOT NULL,              
	`refId` varchar(50) default NULL,          
	`documentType` varchar(50) default NULL,   
	`remarks` varchar(1000) default NULL,      
	`fileName` varchar(100) default NULL,      
	`fileSize` bigint(20) default NULL,        
	`fileType` varchar(100) default NULL,      
	`schemaName` varchar(100) default NULL,    
	`schemaVersion` varchar(50) default NULL,  
	PRIMARY KEY  (`objid`)                     
)


CREATE TABLE faasattachment (              
	objid varchar(100) NOT NULL,
	schemaName varchar(100) default NULL,    
	schemaVersion varchar(50) default NULL,            
	refId varchar(100) default NULL,          
	documentType varchar(50) default NULL,   
	remarks varchar(2000) default NULL,      
	fileName varchar(100) default NULL,      
	fileSize bigint default NULL,        
	fileType varchar(100) default NULL,      
	tmpFilename varchar(100) default NULL, 
	PRIMARY KEY  (objid)                     
)