SELECT ME.MeetingID, M.name, M.time, M.duration,
group_concat(concat(E.name,
'(', IF(D.name IS NULL,'',D.name), ')')) Participants
from ((Employee E left join Depart D on E.DepartID = D.ID)
join MeetingEmployee ME on ME.EmployeeID = E.ID), Meeting M 
where M.ID = ME.MeetingID
group by (MeetingID)