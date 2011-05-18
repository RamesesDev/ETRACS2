CREATE TABLE remittance (                            
  objid varchar(50) NOT NULL,                        
  schemaname varchar(50) NOT NULL,                   
  schemaversion varchar(20) NOT NULL,                
  info text NOT NULL,                                
  docstate varchar(20) NOT NULL,                     
  dtposted date NOT NULL,                            
  liquidationid varchar(50) default NULL,            
  liquidationno varchar(20) default NULL,            
  liquidationdate date default NULL,                 
  liquidatingofficerid varchar(50) default NULL,     
  liquidationofficername varchar(100) default NULL,  
  liquidatingofficertitle varchar(50) default NULL,  
  PRIMARY KEY  (objid)                               
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE remittancelist (                                                           
objid varchar(50) NOT NULL,                                                           
docstate varchar(20) NOT NULL,                                                        
txnno varchar(20) NOT NULL,                                                           
txndate date NOT NULL,                                                                
iyear int(11) NOT NULL,                                                               
imonth int(11) NOT NULL,                                                              
iday int(11) NOT NULL,                                                                
collectorname varchar(50) NOT NULL,                                                   
amount decimal(10,2) default NULL,                                                    
collectorid varchar(50) NOT NULL,                                                     
totalcash decimal(10,2) default NULL,                                                 
totalotherpayment decimal(10,2) default NULL,                                         
liquidationid varchar(50) default NULL,                                               
PRIMARY KEY  (objid),                                                                 
CONSTRAINT FK_remittancelist FOREIGN KEY (objid) REFERENCES remittance (objid)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE remittedform (                                                                
objid varchar(50) NOT NULL,                                                              
afcontrolid varchar(50) NOT NULL,                                                        
afid varchar(50) NOT NULL,                                                               
receivedfrom int(11) default NULL,                                                       
receivedto int(11) default NULL,                                                         
receivedqty int(11) default NULL,                                                        
beginfrom int(11) default NULL,                                                          
beginto int(11) default NULL,                                                            
beginqty int(11) default NULL,                                                           
issuedfrom int(11) default NULL,                                                         
issuedto int(11) default NULL,                                                           
issuedqty int(11) default NULL,                                                          
endingfrom int(11) default NULL,                                                         
endingto int(11) default NULL,                                                           
endingqty int(11) default NULL,                                                          
remittanceid varchar(50) NOT NULL,                                                       
stubno varchar(20) NOT NULL,                                                             
PRIMARY KEY  (objid),                                                                    
KEY FK_remittance (remittanceid),                                                      
KEY FK_afcontrol (afcontrolid),                                                        
KEY FK_af (afid),                                                                      
CONSTRAINT FK_af FOREIGN KEY (afid) REFERENCES af (objid),                         
CONSTRAINT FK_afcontrol FOREIGN KEY (afcontrolid) REFERENCES afcontrol (objid),    
CONSTRAINT FK_remittance FOREIGN KEY (remittanceid) REFERENCES remittance (objid)  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
