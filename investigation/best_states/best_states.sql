SELECT *
FROM
(
  select State,
        avg(TimelyAndEffectiveCareScore) as score
  FROM procedure_t
  WHERE double(TimelyAndEffectiveCareScore) is not null
  and double(TimelyAndEffectiveCareScore) < 200
  group by State
) t
where double(t.score) is not null
order by t.score desc
LIMIT 10;
