
select COUNT(*) as cancelled_cnt, scheduled_date
       from [FIDS].dbo.FIDS where  status_ = 'Cancelled' group by scheduled_date order by cancelled_cnt desc



select sum(delay_) as delayAmount, dow
       from [FIDS].dbo.FIDS  group by dow order by delayAmount desc
