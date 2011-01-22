[deleteById]
DELETE FROM tmcr WHERE objid = $P{objid}

[findUnpostedFAASToTMCR]
SELECT objid FROM faas WHERE sys_dtApproved BETWEEN $P{startDate} AND $P{endDate}

