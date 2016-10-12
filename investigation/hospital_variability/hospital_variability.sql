
SELECT *
FROM
(
  SELECT
  TimelyAndEffectiveCareMeasureID,
  TimelyAndEffectiveCareMeasureName,
  stddev_pop(TimelyAndEffectiveCareScore) as stdev
  FROM Procedure_T
  WHERE
  int(TimelyAndEffectiveCareScore) IS NOT NULL
  GROUP BY TimelyAndEffectiveCareMeasureID, TimelyAndEffectiveCareMeasureName
  LIMIT 10
) as t
ORDER BY stdev desc
LIMIT 10
