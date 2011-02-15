[getCurrentSeries]
SELECT nextSeries AS currentSeries FROM sys_sequence WHERE objid = $P{objid} 

[incrementNextSeries]
UPDATE sys_sequence SET nextSeries = nextSeries + 1 WHERE objid = $P{objid} 

[updateNextSeries]
UPDATE sys_sequence SET nextSeries = $P{nextSeries} WHERE objid = $P{objid} 

