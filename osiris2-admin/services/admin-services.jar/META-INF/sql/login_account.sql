[reactivate]
update login_account set accessdate = NULL,active=1 where uid=$P{uid}

[find-uid-by-userid]
select uid from login_account where userid=$P{userid}
