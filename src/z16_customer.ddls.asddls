@AbapCatalog.sqlViewName: 'Z16CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'übung 8: customer'
define view Z16_Customer 

as select from scustom as c 

{
 key id,
 
      concat_with_space(c.form, c.name, 1)  as CustomerName,
      c.street,
      c.postcode,
      c.city,
      c.country,
      @EndUserText: {
            label: 'Discount',
            quickInfo: 'Discount'
      }
      division(cast(c.discount as abap.int4), 100, 2)   as Discount




}

