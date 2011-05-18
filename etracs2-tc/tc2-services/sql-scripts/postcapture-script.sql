CREATE TABLE postcapture (              
   objid varchar(50) NOT NULL,           
   schemaname varchar(50) NOT NULL,      
   schemaversion varchar(5) NOT NULL,    
   docstate varchar(25) NOT NULL,        
   dtposted date NOT NULL,               
   collectorid varchar(50) NOT NULL,     
   collectorname varchar(75) NOT NULL,   
   collectortitle varchar(25) NOT NULL,  
   postedbyid varchar(50) NOT NULL,      
   postedbyname varchar(75) NOT NULL,    
   postedbytitle varchar(25) NOT NULL,   
   amount decimal(12,2) NOT NULL,        
   summaries text NOT NULL,              
   PRIMARY KEY  (objid)                  
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1   