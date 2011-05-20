[by-zip]
select zipcode,city,state from us_address where zipcode = $P{zipcode}

[by-city]
select zipcode,city,state from us_address where city = $P{city}
 
[by-state]
select zipcode,city,state from us_address where state = $P{state}
