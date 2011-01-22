[incrementNextSeries]
UPDATE sys_sequence SET nextSeries = nextSeries + 1 WHERE objid = $P{objid}
