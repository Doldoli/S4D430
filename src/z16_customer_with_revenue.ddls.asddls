@AbapCatalog.sqlViewName: 'Z16CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 9: customer with revenue'
define view Z16_Customer_With_Revenue
  as select from Z16_BOOKING_AND_CUSTOMER
{
  key customid                          as id,
      CustomerName,
      street,
      postcode,
      city,
      country,
      @EndUserText.label: 'Total Amount'
      sum(amount)                       as Totalamount @<Semantics.amount.currencyCode: 'currency',

      currency,
      avg(days_ahead as abap.dec(16,0)) as days_ahead2




}
group by
  customid,
  CustomerName,
  street,
  postcode,
  city,
  country,
  currency
