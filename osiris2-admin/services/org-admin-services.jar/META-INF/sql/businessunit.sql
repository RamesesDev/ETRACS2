[list]
select objid,code,name from business_unit where parentid=$P{parentid} ${filter}
