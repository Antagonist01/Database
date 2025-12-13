select OrderID,
CreationTime,
'Day ' + FORMAT (CreationTime, 'ddd MMM') +
' Q'+ datename(quarter, creationtime) + ' ' + Format (CreationTime, 'yyyy hh:mm:ss tt')
as CustomFormat 
from
sales.Orders