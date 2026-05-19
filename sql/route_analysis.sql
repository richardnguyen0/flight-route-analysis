CREATE OR REPLACE TABLE `flight-route-analysis.bts.route_metrics` AS

WITH competitor_count AS (
  SELECT
    CONCAT(ORIGIN, '-', DEST) AS route,
    COUNT(DISTINCT REPORTING_CARRIER) AS carrier_count
  FROM (
    SELECT ORIGIN, DEST, REPORTING_CARRIER
    FROM `flight-route-analysis.bts.db1b_market`
    WHERE MARKET_FARE > 10
      AND PASSENGERS > 0
    GROUP BY 1, 2, 3
  )
  GROUP BY 1
)

SELECT
  m.YEAR,
  m.QUARTER,
  m.ORIGIN,
  m.ORIGIN_STATE_NM,
  m.DEST,
  m.DEST_STATE_NM,
  m.REPORTING_CARRIER,
  SUM(m.PASSENGERS) AS total_passengers,
  ROUND(AVG(m.MARKET_FARE), 2) AS avg_fare,
  ROUND(AVG(m.MARKET_DISTANCE), 0) AS avg_distance,
  ROUND(
    SUM(m.MARKET_FARE * m.PASSENGERS) / NULLIF(SUM(m.PASSENGERS), 0),
    2
  ) AS revenue_per_passenger,
  CONCAT(CAST(m.YEAR AS STRING), ' Q', CAST(m.QUARTER AS STRING)) AS year_quarter,
  CONCAT(m.ORIGIN, '-', m.DEST) AS route,
  c.carrier_count

FROM `flight-route-analysis.bts.db1b_market` m
LEFT JOIN competitor_count c
  ON CONCAT(m.ORIGIN, '-', m.DEST) = c.route

WHERE m.MARKET_FARE > 10
  AND m.PASSENGERS > 0

GROUP BY
  m.YEAR,
  m.QUARTER,
  m.ORIGIN,
  m.ORIGIN_STATE_NM,
  m.DEST,
  m.DEST_STATE_NM,
  m.REPORTING_CARRIER,
  c.carrier_count
