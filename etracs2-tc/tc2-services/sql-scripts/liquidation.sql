CREATE TABLE liquidation (             
objid varchar(50) NOT NULL,          
schemaname varchar(50) NOT NULL,     
schemaversion varchar(20) NOT NULL,  
docstate varchar(20) NOT NULL,       
dtposted date NOT NULL,              
info text NOT NULL,                  
PRIMARY KEY  (objid)                 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE liquidationlist (                                                        
objid varchar(50) NOT NULL,                                                         
docstate varchar(50) NOT NULL,                                                      
txnno varchar(20) NOT NULL,                                                         
txndate date NOT NULL,                                                              
iyear int(11) default NULL,                                                         
imonth int(11) default NULL,                                                        
iday int(11) default NULL,                                                          
liquidatingofficerid varchar(50) NOT NULL,                                          
liquidatingofficername varchar(100) NOT NULL,                                       
amount decimal(10,2) default NULL,                                                  
totalcash decimal(10,2) default NULL,                                               
totalotherpayment decimal(10,2) default NULL,                                       
depositedid varchar(50) NOT NULL,                                      
depositedbyname varchar(100) NOT NULL,                                      
depositedbytitle varchar(100) NOT NULL,                                      
PRIMARY KEY  (objid),                                                               
CONSTRAINT FK_liquidation FOREIGN KEY (objid) REFERENCES liquidation (objid)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1
