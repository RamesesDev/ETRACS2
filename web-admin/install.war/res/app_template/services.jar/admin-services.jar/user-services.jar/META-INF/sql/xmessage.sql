[last-dtposted]
select dtposted from message where objid = ?

#notes: 
# use bitwise mask
# 2 = if mask exists, read private only to subscribers or author
# 4 = if mask exists, post private only to subscribers or author

[messages]
select nf.*, (select count(objid) from message_response where msgid = nf.objid) as replies 
from 
(select *, 1 as cancomment from message m  
   where m.channelid = $P{channelid} 
   and m.msgtype=$P{msgtype} and m.dtposted < $P{lastdtposted} 
   and (
	   (m.userid = $P{userid}) or 
	   m.privacy = 0 or
	   (exists (select * from message_subscriber ms where ms.msgid=m.objid and ms.userid=$P{userid}) ) 
   ) 
) nf 
order by nf.dtposted desc  
limit $P{limit} 

[thread-messages]
select nf.*, (select count(objid) from message_response where msgid = nf.objid) as replies 
from 
(select *, 1 as cancomment from message m  
   where m.threadid = $P{threadid} 
   and m.msgtype=$P{msgtype} and m.dtposted < $P{lastdtposted} 
   and (
	   (m.userid = $P{userid}) or 
	   m.privacy = 0 or
	   (exists (select * from message_subscriber ms where ms.msgid=m.objid and ms.userid=$P{userid}) ) 
   ) 
) nf 
order by nf.dtposted desc  
limit $P{limit} 


[responses]
select msg.*  from message_response msg 
where msg.msgid=$P{objid} 
${filter} 

[subscribers]
select userid from message_subscriber where msgid = ?

[add-subscriber]
insert ignore into message_subscriber(msgid, userid) values($P{msgid}, $P{userid})

[remove-subscribers]
delete from message_subscriber where msgid=$P{objid}


[remove-message]
delete from message where objid=$P{objid}

[remove-responses]
delete from message_response where msgid=$P{objid}




