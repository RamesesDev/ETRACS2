[getOutboxMessageId]
SELECT objid FROM sys_outbox 

[getOutboxMessageTo]
SELECT objid FROM sys_outbox WHERE tolguindex = $P{tolguindex} 

[getInboxMessageId]
SELECT objid FROM sys_inbox WHERE tolguindex = $P{tolguindex}  

[getOutboxMessageByRefId]
SELECT objid FROM sys_outbox WHERE refid = $P{refid} 

[getOtherDestinationMessages]
SELECT objid FROM sys_inbox WHERE tolguindex <> $P{tolguindex}  