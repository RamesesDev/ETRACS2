[getOutboxMessageId]
SELECT objid FROM sys_outbox 

[getInboxMessageId]
SELECT objid FROM sys_inbox 

[getOutboxMessageByRefId]
SELECT objid FROM sys_outbox WHERE refid = $P{refid} 
