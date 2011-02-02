[list]
select objid,code,name,country,timezone,'partner' as type from partner ${filter}

[get-objid-by-code]
select objid from partner where code=$P{code}
