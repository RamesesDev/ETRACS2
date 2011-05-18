CREATE TABLE receipt (                    
   objid varchar(50) NOT NULL,             
   schemaname varchar(100) NOT NULL,       
   schemaversion varchar(25) NOT NULL,     
   docstate varchar(25) NOT NULL,          
   doctype varchar(50) NOT NULL,           
   opener varchar(50) NOT NULL,            
   collectorid varchar(50) NOT NULL,     
   remittanceid varchar(50) default NULL,  
   remittanceno varchar(25) default NULL,  
   remittancedate date default NULL,       
   info text NOT NULL,                     
   items text NOT NULL,                    
   payments text NOT NULL,                 
   extended text,                          
   voided int(11) NOT NULL,                
   voidreason varchar(50) default NULL,    
   PRIMARY KEY  (objid)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;
 
 CREATE INDEX ix_receipt_remid ON receipt(remittanceid);
 CREATE INDEX ix_receipt_remno ON receipt(remittanceno);
 
 
CREATE TABLE receiptlist (                                      
   objid varchar(50) NOT NULL,                                   
   docstate varchar(25) NOT NULL,                                
   doctype varchar(25) NOT NULL,                                 
   opener varchar(50) NOT NULL,                                  
   remittanceid varchar(50) default NULL,                        
   remittanceno varchar(25) default NULL,                        
   remittancedate date default NULL,                             
   txndate date NOT NULL,                                        
   dtposted datetime NOT NULL,                                   
   iyear int(11) NOT NULL,                                       
   iqtr int(11) NOT NULL,                                        
   imonth int(11) NOT NULL,                                      
   iday int(11) NOT NULL,                                        
   mode varchar(25) NOT NULL,                                    
   afid varchar(50) NOT NULL,                                    
   afcontrolid varchar(50) NOT NULL,                             
   serialno varchar(25) default NULL,                            
   stubno varchar(25) NOT NULL,                                  
   collectiontypeid varchar(50) NOT NULL,                        
   collectiontype varchar(50) NOT NULL,                          
   collectorid varchar(50) NOT NULL,                             
   collectorname varchar(100) NOT NULL,                          
   collectortitle varchar(50) NOT NULL,                          
   payorid varchar(50) default NULL,                             
   payorname varchar(500) NOT NULL,                              
   payoraddress varchar(75) NOT NULL,                            
   paidby varchar(100) NOT NULL,                                 
   paidbyaddress varchar(75) NOT NULL,                           
   amount decimal(10,2) NOT NULL,                                
   cash decimal(10,2) NOT NULL,                                  
   otherpayment decimal(10,2) NOT NULL,                          
   voided int(11) NOT NULL,                                      
   voidreason varchar(100) default NULL,  
   postcaptureid varchar(50) default NULL,                       
   PRIMARY KEY  (objid)               
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;
 
 CREATE INDEX ix_receiptlist_docstatecolid ON receiptlist(collectorid, docstate);
 CREATE INDEX ix_receiptlist_remid ON receiptlist(remittanceid);
 CREATE INDEX ix_receiptlist_remno ON receiptlist(remittanceno);
 CREATE INDEX ix_receiptlist_iyear ON receiptlist(iyear);
 CREATE INDEX ix_receiptlist_iqtr ON receiptlist(iyear, iqtr);
 CREATE INDEX ix_receiptlist_imonth ON receiptlist(iyear, imonth);
 CREATE INDEX ix_receiptlist_iday ON receiptlist(iyear, imonth, iday);
 CREATE INDEX ix_receiptlist_serialno ON receiptlist(serialno);
 CREATE INDEX ix_receiptlist_stubno ON receiptlist(stubno);
 CREATE INDEX ix_receiptlist_collectorname ON receiptlist(collectorname);
 CREATE INDEX ix_receiptlist_payorname ON receiptlist(payorname);
 CREATE INDEX ix_receiptlist_colidvoided ON receiptlist(collectorid, voided);
 
 
 CREATE TABLE receiptitem (            
   objid varchar(50) NOT NULL,         
   receiptid varchar(50) NOT NULL,     
   acctid varchar(50) NOT NULL,        
   acctno varchar(25) NOT NULL,        
   accttitle varchar(150) NOT NULL,    
   fundid varchar(50) NOT NULL, 
   fundname varchar(50) NOT NULL,       
   amount decimal(10,2) NOT NULL,      
   remarks varchar(100) default NULL,  
   PRIMARY KEY  (objid)                
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1  ;
 
 CREATE INDEX ix_receiptitem_rctid ON receiptitem( receiptid );
 CREATE INDEX ix_receiptitem_acctid ON receiptitem( acctid );
 CREATE INDEX ix_receiptitem_accttitle ON receiptitem( accttitle);
 
 
 CREATE TABLE paymentitem (            
   objid varchar(50) NOT NULL,         
   receiptid varchar(50) NOT NULL,     
   paytype varchar(25) NOT NULL,       
   particulars varchar(50) NOT NULL,   
   amount decimal(10,2) NOT NULL,      
   extended text,                      
   PRIMARY KEY  (objid)                
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1  ;
 
 CREATE INDEX ix_paymentitem_rctid ON paymentitem( receiptid );
 CREATE INDEX ix_paymentitem_rctid_paytype ON paymentitem( receiptid, paytype  );
 
 
 
 
