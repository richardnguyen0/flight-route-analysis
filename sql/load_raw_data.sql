CREATE OR REPLACE TABLE `flight-route-analysis.bts.db1b_market` AS
  
SELECT * FROM `flight-route-analysis.bts.db1b_market_2022_q1`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2022_q2`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2022_q3`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2022_q4`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2023_q1`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2023_q2`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2023_q3`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2023_q4`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2024_q1`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2024_q2`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2024_q3`
UNION ALL
SELECT * FROM `flight-route-analysis.bts.db1b_market_2024_q4`
