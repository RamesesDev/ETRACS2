[getOutboxMessageId]
SELECT objid FROM sys_outbox WHERE tolguindex = $P{tolguindex} 

[getInboxMessageId]
SELECT objid FROM sys_inbox 

