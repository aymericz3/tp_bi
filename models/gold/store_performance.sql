WITH revenue AS (
	SELECT storeid, SUM(total_amount) AS revenue
	FROM {{ ref('fact_orders') }}
	GROUP BY storeid
)
SELECT r.storeid, r.revenue, t.SalesTarget, r.revenue - t.SalesTarget as gap, ROUND(100 * (r.revenue - t.SalesTarget) / t.SalesTarget, 1) as gap_pct
FROM revenue r
JOIN {{ ref('salestarget') }} t ON r.storeid = t.storeID