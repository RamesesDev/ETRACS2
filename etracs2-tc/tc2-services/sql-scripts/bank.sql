bank CREATE TABLE 'bank' (
   'objid' varchar(50) NOT NULL,
   'schemaname' varchar(50) NOT NULL,
   'schemaversion' varchar(50) NOT NULL,
   'bankcode' varchar(50) NOT NULL,
   'bankname' varchar(50) NOT NULL,
   'branchname' varchar(50) NOT NULL,
   'address' varchar(100) default NULL,
   'manager' varchar(50) default NULL,
   PRIMARY KEY ('objid')
)ENGINE=MyISAM DEFAULT CHARSET=latin1
