[getSender]
SELECT senderid, sendername FROM sys_inbox 
WHERE objid = $P{msgid} 

[getReceiver]
SELECT receiverid, receivername FROM sys_inbox 
WHERE objid = $P{msgid} 

[getMessageInfo]
SELECT 
	objid, schemaname, schemaversion, docstate, action, 
	senderid, sendername, receiverid, receivername, message 
FROM sys_inbox 
WHERE objid = $P{objid}	



[getInboxMessageId]
SELECT objid FROM sys_inbox WHERE receiverid = $P{receiverid}  

[getOtherDestinationMessages]
SELECT objid FROM sys_inbox WHERE receiverid <> $P{receiverid}  

[getOutboxMessageId]
SELECT objid FROM sys_outbox 

[getOutboxMessageByReceiverId]
SELECT objid FROM sys_outbox WHERE receiverid = $P{receiverid} 


#--------------------------------------------
# Response Data
#--------------------------------------------

[getResponseData]
SELECT * FROM sys_responsedata WHERE sessionid = $P{sessionid}

[deleteResponseDataBySessionId]
DELETE FROM sys_responsedata WHERE sessionid = $P{sessionid} 

[insertResponseData]
INSERT INTO sys_responsedata 
	(objid, sessionid, status, data, senderid, sendername, receiverid, receivername ) 
VALUES ($P{objid}, $P{sessionid}, $P{status}, $P{data}, $P{senderid}, $P{sendername}, $P{receiverid}, $P{receivername} )


