@AbapCatalog.sqlViewName: 'Z16EXP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Expressions'
define view Z16_Expressions 
as select from sbook as b inner join scustom as c on b.customid = c.id 
{
    key b.carrid as CarrierID,
    key b.connid as ConnectionID,
    key b.fldate as FlightDate,
    key b.bookid as BookID,
    
    @EndUserText: {
            label: 'Flight Class',
            quickInfo: 'Flight Class'
      }
    case b.class 
        when 'Y' then 'Economy Class'
        when 'C' then 'Business Class'
        when 'F' then 'First Class'
        else ' '
        end          as class_txt,
    
    
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
    c.country,
      @EndUserText: {
            label: 'Discount',
            quickInfo: 'Discount'
      }
    cast(c.discount as abap.fltp) / 100.0 as discount 
    
    
        
    
}
where cancelled <>'X'
