[country-list]
select code, name from country

[currency-list]
select code,name from currency

[timezone-list]
select timezone from timezone where country =$P{country} order by timezone