[add-session]
insert into sys_session 
(sessionid, username, host, dtaccessed) 
values ($P{sessionid}, $P{username}, $P{host}, $P{dtaccessed})

[remove-session]
delete from sys_session where sessionid = $P{sessionid}

[remove-host-sessions]
delete from sys_session where host=?

[list-username-sessions]
select sessionid from sys_session where username in (${usernames})

[list-session-usernames]
select username from sys_session where sessionid in (${sessionids})

[list-session-byuser]
select sessionid from sys_session where username = $P{username}
