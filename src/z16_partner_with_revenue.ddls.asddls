@AbapCatalog.sqlViewName: 'Z16PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 10: partner with revenue'
define view Z16_Partner_With_Revenue 
as select from Z16_Customer_With_Revenue 
{
key id,
'C'as type,
CustomerName as name,
street,
postcode,
city,
country,
Totalamount as amount,
currency,
days_ahead2 as days_ahead
    
}


 union select from  S4d430_Agency_With_Revenue
{key id,
'A' as type,
name,
street,
postcode,
city,
country,
amount,
currency,
days_ahead

}

