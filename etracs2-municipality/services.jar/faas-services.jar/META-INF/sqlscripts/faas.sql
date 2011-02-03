CREATE TABLE `faas` (                            
	`objid` varchar(50) NOT NULL,                  
	`schemaName` varchar(50) NOT NULL,             
	`schemaVersion` varchar(5) NOT NULL,           
	`transmittalId` varchar(50) NOT NULL,          
	`state` varchar(15) NOT NULL,                  
	`barangay` varchar(50) NOT NULL,               
	`rpuId` varchar(50) NOT NULL,                  
	`rpId` varchar(50) NOT NULL,                   
	`info` text NOT NULL,                          
	`rpu` text NOT NULL,                           
	`rp` text NOT NULL,                            
	`remarks` varchar(500) default NULL,           
	`sys_dtCreated` datetime default NULL,         
	`sys_dtApproved` datetime default NULL,        
	`tdNo` varchar(50) default NULL,               
	`previousFaasIds` varchar(2000) default NULL,  
	PRIMARY KEY  (`objid`)                         
)