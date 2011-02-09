[getList]
SELECT t.taskid, t.scriptname, t.method, t.startdate, t.enddate, t.duration , 'NEW' AS status 
FROM task_info t 
WHERE NOT EXISTS(SELECT * FROM task_interim WHERE taskid = t.taskid)
  AND NOT EXISTS(SELECT * FROM task_processing WHERE taskid = t.taskid)
  AND NOT EXISTS(SELECT * FROM task_queue WHERE taskid = t.taskid)
  AND NOT EXISTS(SELECT * FROM task_suspended WHERE taskid = t.taskid)

[getInterimList] 
SELECT t.taskid, t.scriptname, t.method, t.startdate, t.enddate, t.duration , 'PROCESSING' AS status 
FROM task_info t, task_interim ti 
WHERE t.taskid = ti.taskid 
  AND NOT EXISTS(SELECT * FROM task_suspended WHERE taskid = t.taskid)

[getProcessingList] 
SELECT t.taskid, t.scriptname, t.method, t.startdate, t.enddate, t.duration , 'PROCESSING' AS status 
FROM task_info t, task_processing ti 
WHERE t.taskid = ti.taskid 
  AND NOT EXISTS(SELECT * FROM task_suspended WHERE taskid = t.taskid)

[getQueuedList] 
SELECT t.taskid, t.scriptname, t.method, t.startdate, t.enddate, t.duration , 'PROCESSING' AS status 
FROM task_info t, task_queue ti 
WHERE t.taskid = ti.taskid 
  AND NOT EXISTS(SELECT * FROM task_suspended WHERE taskid = t.taskid)

[getSuspendedList] 
SELECT t.taskid, t.scriptname, t.method, t.startdate, t.enddate, t.duration , 'SUSPENDED' AS status 
FROM task_info t, task_suspended ti 
WHERE t.taskid = ti.taskid 

[deleteTaskById]
DELETE FROM task_info WHERE taskid = $P{taskid}

[deleteInterim]
DELETE FROM task_interim WHERE taskid = $P{taskid}

[deleteProcessing]
DELETE FROM task_processing WHERE taskid = $P{taskid}

[deleteQueued]
DELETE FROM task_queue WHERE taskid = $P{taskid}

[deleteSuspended]
DELETE FROM task_suspended WHERE taskid = $P{taskid}
