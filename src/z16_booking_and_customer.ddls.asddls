@AbapCatalog.sqlViewName: 'Z16BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'übung 8: booking and customer'
define view Z16_BOOKING_AND_CUSTOMER 
as select from Z16_Booking as b inner join Z16_Customer as c on b.customid = c.id  
{
    //b
    key CarrierID,
    key ConnectionID,
    key FlightDate,
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
    //c
    
    CustomerName,
    street,
    postcode,
    city,
    country,
    Discount
}
