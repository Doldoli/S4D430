@AbapCatalog.sqlViewName: 'Z16CUSTASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'übung 13: Customer with path'
define view Z16_CUSTOMER_WITH_PATH

  as select from Z16_Assosiation as c 
{
  key customid                          as id,
      c._Customer.CustomerName,
      c._Customer.street,
      c._Customer.postcode,
      c._Customer.city,
      c._Customer.country,
      @EndUserText.label: 'Total Amount'
      sum(amount)                       as Totalamount @<Semantics.amount.currencyCode: 'currency',

      currency,
      avg(days_ahead as abap.dec(16,0)) as days_ahead2




}
group by
  customid,
 c._Customer.CustomerName,
      c._Customer.street,
      c._Customer.postcode,
      c._Customer.city,
      c._Customer.country,
  currency
