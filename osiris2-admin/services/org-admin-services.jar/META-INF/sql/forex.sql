[list]
select * from forex where parentid=$P{parentid} ${filter}

[rate]
select * from forex where currency = $P{currency}