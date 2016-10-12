SELECT *
FROM
(
  select ProviderID,
        HospitalName,
        avg(TimelyAndEffectiveCareScore) as score
  FROM procedure_t
  WHERE double(TimelyAndEffectiveCareScore) is not null
  and double(TimelyAndEffectiveCareScore) < 200
  group by ProviderID,HospitalName
) t
where t.score is not null
order by t.score desc
LIMIT 10;
