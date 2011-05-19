CREATE TABLE afcontrol (                                                    
	 objid varchar(50) NOT NULL,                                               
	 schemaname varchar(50) NOT NULL,                                          
	 schemaversion varchar(5) NOT NULL,                                        
	 docstate varchar(25) NOT NULL,                                            
	 active int(11) NOT NULL,                                                  
	 mode varchar(25) NOT NULL,                                                
	 afinventorycreditid varchar(50) NOT NULL,                                 
	 dtissued date NOT NULL,                                                   
	 collectorid varchar(50) NOT NULL,                                         
	 collectorname varchar(75) NOT NULL,                                       
	 collectortitle varchar(50) NOT NULL,                                      
	 stubno varchar(20) NOT NULL,                                              
	 aftype varchar(25) NOT NULL,                                              
	 afid varchar(50) NOT NULL,                                                
	 qtyreceived int(11) NOT NULL,                                             
	 startseries int(11) NOT NULL,                                             
	 endseries int(11) NOT NULL,                                               
	 currentseries int(11) NOT NULL,                                           
	 beginseries int(11) NOT NULL,                                             
	 beginqty int(11) NOT NULL,                                                
	 qtyissued int(11) NOT NULL,                                               
	 issuedfrom int(11) NOT NULL,                                              
	 issuedto int(11) NOT NULL,                                                
	 balance int(11) NOT NULL,                                                 
	 prefix varchar(10) default NULL,                                          
	 suffix varchar(10) default NULL,                                          
	 serieslength int(11) NOT NULL,                                            
	 receiptformat varchar(50) default NULL,
	 cancelledseries text,
	 PRIMARY KEY  (objid)
   ) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE INDEX ix_afcontrol_collectorid ON afcontrol(collectorid);
CREATE INDEX ix_afcontrol_collectorname ON afcontrol(collectorname);
CREATE INDEX ix_afcontrol_afid ON afcontrol(afid);
CREATE INDEX ix_afcontrol_colid_afid ON afcontrol(collectorid, afid);
CREATE INDEX ix_afcontrol_colafstatemode ON afcontrol(collectorid, afid,docstate,mode);
