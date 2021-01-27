@AbapCatalog.sqlViewName: 'Z16CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Übung 11: customer with parameter'
define view Z16_Customer_With_Parameter 
 with parameters
 @EndUserText.label: 'Consider flights up to this date'
    FlightsBefore: abap.dats
 as select from Z16_BOOKING_AND_CUSTOMER
{ 
  
  key CarrierID,
  key ConnectionID,
  key FlightDate ,
  key BookID,
  FlightClass,
  amount,
  currency,
  luggweight,
  wunit,
  days_ahead,
  order_date,
  agencynum,
  counter,
  customid,
  CustomerName,
  street,
  postcode,
  city,
  country,
  Discount
  

    
}
where FlightDate > $parameters.FlightsBefore

