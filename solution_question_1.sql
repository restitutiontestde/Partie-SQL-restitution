-- CTE pour filtrer au niveau de la date
WITH CTE_FILTER_TRANSACTION AS
(
	SELECT 
		trs.date,
		trs.prod_price,
		trs.prod_qty
	FROM TRANSACTIONS AS trs
	where trs.date >= '01-01-2019' 
	and   trs.date <'01-01-2020'
), 
-- CTE pour calculer la vente par produit par jour sur la table filtré 
CTE_VENTES_OVER_FILTER AS
(
	SELECT
		cft.date,
		cft.prod_price * cft.prod_qty AS vente
	FROM CTE_FILTER_TRANSACTION AS cft
),
-- CTE calculer les agrégations
CTE_AGG AS
(
	SELECT
		cvef.date,
		SUM(cvef.vente) AS ventes
	FROM
	CTE_VENTES_OVER_FILTER AS cvef
	GROUP BY cvef.date
)
-- select tous les elèments de l'agrégation
SELECT
	*
FROM CTE_AGG as ca
ORDER BY ca.date ASC











