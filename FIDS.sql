

select COUNT(*) as cancelled_cnt, scheduled_date
       from [FIDS].dbo.FIDS 
	   where  status_ = 'Cancelled' or replace(status_,' ','') = 'باطلشد' or replace(status_,' ','') = 'باطلشد' 
	   group by scheduled_date 
	   order by cancelled_cnt desc




select replace(dow,' ','') as day_name, sum(delay_) as delayAmount
       from [FIDS].dbo.FIDS  
	   group by day_name
	   order by delayAmount desc
