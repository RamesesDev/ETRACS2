[getRPTParameter]
SELECT 
    objid AS paramid, paramname, paramcaption, paramdesc AS description, 
    paramtype AS datatype,  parammin AS minvalue, parammax AS maxvalue 
FROM rptparameters WHERE paramname = $P{name} 

[getParamaterList]
SELECT objid AS paramid, paramname AS name, paramcaption AS caption FROM rptparameters 

