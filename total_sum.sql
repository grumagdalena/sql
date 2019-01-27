select 
a.[NrRejAuta], 
d.[CarBrandName], 
a.[Model], 
a.[SaleDate], 
b.SumCostAmount
from [dbo].[Cars] as a 
left join [dbo].[CarBrands] as d on d.[Id]=[CarBrandId]
join 
(select [NrRejAuta], sum([CostAmount]) as SumCostAmount
from [dbo].[BillModels] group by [NrRejAuta]) b 

on b.[NrRejAuta]=a.[NrRejAuta]

where 
a.[SaleDate] is not null

order by SumCostAmount desc