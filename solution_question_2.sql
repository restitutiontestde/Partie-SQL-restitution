
with CTE_PRODUCT_NMC as
-- garder uniquement les colonnes requises pour la jointure. 
(
	select 
		pn.product_id,
		pn.product_type
	FROM PRODUCT_NOMENCLATURE as pn
),
CTE_FILTER_TRANSACTION AS
-- calculer les ventes et filtrer sur les dates.
(
	SELECT 
		trs.client_id,
		trs.prop_id,
		trs.prod_price * trs.prod_qty AS ventes
	FROM TRANSACTIONS AS trs
	where trs.date >= '01-01-2019' 
	and   trs.date <'01-01-2020'
),
joinned_data AS
-- réaliser la jointure avec filtre sur deco et meuble
(
	select 
		transac.client_id as client_id,
		nmc.product_type as product_type, 
		transac.ventes as ventes
	FROM 
		CTE_FILTER_TRANSACTION AS transac
	INNER JOIN CTE_PRODUCT_NMC AS nmc ON nmc.product_id = transac.prop_id
	where nmc.product_type IN ('MEUBLE', 'DECO')
)
-- Opération pivot du résultat de la jointure 
select 
	client_id,
	MEUBLE AS ventes_meuble,
	DECO AS ventes_deco
FROM 
joinned_data AS d
PIVOT
(
	max(ventes)
	FOR product_type IN ([MEUBLE], [DECO])
) PIVOT_TABLE

