ALTER procedure [dbo].[Marze] AS 
SELECT dateadd(month, datediff(month, 0, [SprzedazData]),0) AS RokMiesiac,
sum(ZakupKwota) as ZakupKwotaSuma,
sum(SrzedazKwota) as SprzedazKwotaSuma,
Count(*) as LiczbaAut, 
round(sum(SrzedazKwota-ZakupKwota),2) as MarzaBrutto,
round(sum(SrzedazKwota-ZakupKwota-PCCKwota-VAT2),2) as MarzaNetto1,
round(sum(SrzedazKwota-ZakupKwota-PCCKwota-VAT2-30-20-50),2) as MarzaNetto2

FROM auta.auta
where [Numer faktury] is not NULL
   GROUP BY  dateadd(month, datediff(month, 0, [SprzedazData]),0)

UNION
SELECT  
NULL as RokMiesiac,
sum(ZakupKwota) as ZakupKwotaSuma,
sum(SrzedazKwota) as SprzedazKwotaSuma,
Count(*) as liczba_aut, 
round(sum(SrzedazKwota-ZakupKwota),2) as MarzaBrutto,
round(sum(SrzedazKwota-ZakupKwota-PCCKwota-VAT2),2) as MarzaNetto1,
round(sum(SrzedazKwota-ZakupKwota-PCCKwota-VAT2-30-20-50),2) as MarzaNetto2


FROM auta.auta
where [Numer faktury] is not NULL
order by dateadd(month, datediff(month, 0, [SprzedazData]),0) desc