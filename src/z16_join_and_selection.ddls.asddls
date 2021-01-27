@AbapCatalog.sqlViewName: 'Z16JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'join and selection'
define view Z16_Join_And_Selection 
as select from sbook as b inner join scustom as c on b.customid = c.id 
{
    key b.carrid as CarrierID,
    key b.connid as ConnectionID,
    key b.fldate as FlightDate,
    key b.bookid as BookID,
    b.class,
    b.forcuram as amount,
    b.forcurkey as currency,
    b.luggweight,
    b.wunit,
    b.order_date, 
    b.agencynum, 
    b.counter,
    b.customid,
    c.name,
    c.street,
    c.postcode,
    c.city,
    c.country
    
    
}
where cancelled <>'X'
