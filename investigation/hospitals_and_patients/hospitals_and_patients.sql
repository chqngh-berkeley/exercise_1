-- Pearson's Coefficient for Avg Score and Survey Score
SELECT corr(t.score, t.HCAHPSBase)
FROM
(
  select procedure_t.ProviderID,
        avg(SurveyResults.HCAHPSBase) as HCAHPSBase,
        avg(procedure_t.TimelyAndEffectiveCareScore) as score
  FROM procedure_t join SurveyResults
  ON procedure_t.ProviderID = SurveyResults.ProviderID
  WHERE double(procedure_t.TimelyAndEffectiveCareScore) is not null
  and double(procedure_t.TimelyAndEffectiveCareScore) < 200
  and int(SurveyResults.HCAHPSBase) is not null
  group by procedure_t.ProviderID
) t;

-- Pearson's Coefficient for Avg Score and Procedure Standard Deviation
-- SELECT corr(t.stdev, t.HCAHPSBase)
-- FROM
-- (
--   SELECT avg(SurveyResults.HCAHPSBase) as HCAHPSBase,
--   stddev_pop(procedure_t.TimelyAndEffectiveCareScore) as stdev
--   FROM procedure_t join SurveyResults
--   ON procedure_t.ProviderID = SurveyResults.ProviderID
--   WHERE double(procedure_t.TimelyAndEffectiveCareScore) is not null
--         and double(procedure_t.TimelyAndEffectiveCareScore) < 200
--   group by procedure_t.TimelyAndEffectiveCareMeasureID
-- ) t;
