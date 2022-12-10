select CONVERT(VARCHAR,b.EffectiveDate,103) EffectiveDate,b.productcategory,b.productcode ItemCode,b.ProductName ItemName, 
CASE WHEN b.IsImport=0 THEN 'Local' ELSE 'Import' END AS [Type],ISNULL(b.NewCost,0) NewCost,b.ActualCost,b.Expenses MarkUp,
  ISNULL(ExpensesPercentage,0) MarkUpPercentage,
b.AgentFee,b.OtherCost Expenses, ISNULL(OtherCostPercentage,0) ExpensesPercentage,b.UnitCost,
(select c.Currencycode from ExportCostSetup ec join currency c on c.CurrencyID= ec.CurrencyId) ExportCostCurrencyCode
,[dbo].[RoundUp50Cents](b.ExportCost) ExportCost
, b.ContainerCost,containercostmarkup ContainerCostMarkUpPercentage
from 
(
select effectivedate,productcategory,productcode,ProductName,IsImport,CAST(ROUND(a.ActualCost,2) as Decimal(18,2)) ActualCost,CAST(ROUND(a.expenses,2) as Decimal(18,2)) Expenses,
CAST(ROUND(a.ActualCost,2) as Decimal(18,2))+ CAST(ROUND(a.OtherCost,2) as Decimal(18,2)) OthersMarkUpPrice,
CAST(ROUND(a.AgentFee,2) as Decimal(18,2)) AgentFee,
CAST(ROUND(a.NewCost,2) as Decimal(18,2)) NewCost,
CAST(ROUND(a.OtherCost,2) as Decimal(18,2)) OtherCost,CAST(ROUND(a.unitcost,2) as Decimal(18,2)) unitcost,a.unitcost*1.35 rf,CAST(ROUND(((a.unitcost*1.35)/3),2)  AS Decimal(18,2)) exportcost
, CAST(ROUND(a.unitcost+(a.unitcost*a.containercostmarkup/100),2) as decimal(18,2)) ContainerCost,containercostmarkup ,ExpensesPercentage,OtherCostPercentage
from 
(
select cm.[Desc] ProductCategory, pc.EffectiveDate,p.productcode,p.ProductName,pi.IsImport,actualcost,ROUND(isnull(expenses,0),2) expenses,
 pc.NewCost,
ROUND(isnull(AgentFee,0),2) AgentFee,ROUND(isnull(OtherCost,0),2) OtherCost,actualcost+ROUND(isnull(expenses,0),2)+ROUND(isnull(agentfee,0),2)+ROUND(isnull(othercost,0),2) unitcost 
,  (select cs.MarkupPercentage from ContainerCostSetup cs where cs.ContainerCostSetupId=pc.ContainerCostSetupId) containercostmarkup ,
ExpensesPercentage, OtherCostPercentage
from 
ProductCostPrice pc
join product p on p.productid=pc.productid
join productinfo pi on pi.ProductInfoID=p.ProductInfoID
left join CodeMaster cm on cm.CodeMasterID=pi.ProductCategoryCID
)a
)b      
order by b.ProductCode

--(Unit Cost + Markup 35.00%) / Rate 3.00
 
--unit cost  ActualCost + (Expenses ?? 0) + (AgentFee ?? 0) + (OtherCost ?? 0);
--markup 
  