CREATE TABLE deposit (                    
	objid varchar(50) NOT NULL,             
	schemaname varchar(25) NOT NULL,        
	schemaversion varchar(5) NOT NULL,      
	docstate varchar(20) NOT NULL,          
	txnno varchar(10) NOT NULL,             
	txndate date NOT NULL,                  
	dtposted datetime NOT NULL,             
	depositedbyid varchar(50) NOT NULL,     
	depositedbyname varchar(50) NOT NULL,   
	depositedbytitle varchar(25) NOT NULL,  
	cash decimal(12,2) NOT NULL,            
	noncash decimal(12,2) NOT NULL,         
	amount decimal(12,2) NOT NULL,          
	fundsummaries text NOT NULL,            
	liquidations text NOT NULL,             
PRIMARY KEY  (objid)                    
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE INDEX ix_deposit_txnno ON deposit( txnno );
CREATE INDEX ix_deposit_docstate ON deposit( docstate );
CREATE INDEX ix_deposit_depositedbyname ON deposit( depositedbyname );