bankaccount CREATE TABLE 'bankaccount' (
   'objid' varchar(50) NOT NULL,
   'schemaname' varchar(50) NOT NULL,
   'schemaversion' varchar(50) NOT NULL,
   'docstate' varchar(50) NOT NULL,
   'accttype' varchar(50) NOT NULL,
   'acctno' varchar(50) NOT NULL,
   'fund' varchar(50) NOT NULL,
   'bankid' varchar(50) NOT NULL,
   'bankcode' varchar(50) NOT NULL,
   'bankname' varchar(50) NOT NULL,
   'branchname' varchar(50) NOT NULL,
   'fundid' varchar(50) NOT NULL,
   PRIMARY KEY ('objid')
) ENGINE=MyISAM DEFAULT CHARSET=latin1
