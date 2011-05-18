iraf    CREATE TABLE `iraf` (                               
          `objid` varchar(50) NOT NULL,                     
          `schemaname` varchar(50) NOT NULL,                
          `schemaversion` varchar(10) NOT NULL,             
          `docstate` varchar(25) NOT NULL,                  
          `txnno` varchar(50) NOT NULL,                     
          `txndate` timestamp NULL default NULL,            
          `preparedby` varchar(100) default NULL,           
          `preparedbytitle` varchar(100) default NULL,      
          `info` text NOT NULL,                             
          `requesteditems` text NOT NULL,                   
          `rcvitems` text,                                  
          `rivid` varchar(50) default NULL,                 
          `rivno` varchar(50) default NULL,                 
          `rivrequestedby` varchar(100) default NULL,       
          `rivrequestedbytitle` varchar(100) default NULL,  
          PRIMARY KEY  (`objid`)                            
        ) ENGINE=InnoDB DEFAULT CHARSET=latin1              
