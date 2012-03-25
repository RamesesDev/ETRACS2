[getOutboxMessageId]
SELECT objid FROM sys_outbox 

[getOutboxMessageTo]
SELECT objid FROM sys_outbox WHERE tolguindex = $P{tolguindex} 

[getInboxMessageId]
SELECT objid FROM sys_inbox 

[getOutboxMessageByRefId]
SELECT objid FROM sys_outbox WHERE refid = $P{refid} 
