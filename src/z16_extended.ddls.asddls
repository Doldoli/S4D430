@AbapCatalog.sqlViewName: 'Z16EXTENDED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'übung 12: assosiation'
define view Z16_Extended
  as select from Z16_Booking as b
  association [1..1] to Z16_Customer as _Customer on b.customid = _Customer.id
{
      //b
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookID,

      
      amount,
      currency,
      luggweight,
      wunit,
      days_ahead,
      order_date,
      agencynum,
      customid,
      _Customer
      //c

      //    CustomerName,
      //    street,
      //    postcode,
      //    city,
      //    country,
      //    Discount

}
