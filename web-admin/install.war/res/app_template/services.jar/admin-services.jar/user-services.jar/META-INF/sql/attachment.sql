[remove-attachment]
delete from attachment where objid=$P{objid}

[remove-attachments]
delete from attachment where refid=$P{refid}

[list]
select a.* from attachment a where a.refid=$P{refid} and 
(
	a.userid = $P{userid} or 
	exists (select userid from attachment_subscriber where attachmentid = a.objid and userid = $P{userid} ) or 
	not exists (select userid from attachment_subscriber where attachmentid = a.objid)
)


