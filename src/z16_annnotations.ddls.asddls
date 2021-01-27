@AbapCatalog.sqlViewName: 'Z16ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'join and selection'
define view Z16_Annnotations 
as select from sbook as b inner join scustom as c on b.customid = c.id 
{
    key b.carrid as CarrierID,
    key b.connid as ConnectionID,
    key b.fldate as FlightDate,
    key b.bookid as BookID,
    b.class,
    @Semantics.amount.currencyCode: 'Currency'
    b.forcuram as amount,
    @Semantics.currencyCode: true
 
    b.forcurkey as currency,
    @Semantics.quantity.unitOfMeasure: 'WUNIT'  
    b.luggweight,
    @Semantics.unitOfMeasure: true
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
