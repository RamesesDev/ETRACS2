[check-count]
select count(*) as count from active_session where uid = $P{uid} 

[active]
select sessionid from active_session where uid = $P{uid} 

