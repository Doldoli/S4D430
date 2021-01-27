@AbapCatalog.sqlViewName: 'Z16FUNC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'übung 7:eingebaute Funktionen'
define view Z16_Functions
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{
  key b.carrid                              as CarrierID,
  key b.connid                              as ConnectionID,
  key b.fldate                              as FlightDate,
  key b.bookid                              as BookID,

      @EndUserText: {
              label: 'Flight Class',
              quickInfo: 'Flight Class'
        }
      case b.class
          when 'Y' then 'Economy Class'
          when 'C' then 'Business Class'
          when 'F' then 'First Class'
          else ' '
          end                               as FlightClass,


      
         @Semantics.amount.currencyCode: 'Currency'                      
      currency_conversion( amount => b.forcuram, 
                          source_currency => b.forcurkey, 
                          target_currency => cast('USD' as abap.cuky),
                          exchange_rate_type => 'M', 
                           exchange_rate_date => b.order_date) as amount,
//                           error_handling => 'SET_TO_NULL' as amount,
                           
                           
      
      
      @Semantics.currencyCode: true

      cast('USD' as abap.cuky)                           as currency,
      @Semantics.quantity.unitOfMeasure: 'WUNIT'
      b.luggweight,
      @Semantics.unitOfMeasure: true
      b.wunit,
      
      dats_days_between(b.order_date, b.fldate) as days_ahead,
      b.order_date,
      b.agencynum,
      b.counter,
      b.customid,
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
where
  cancelled <> 'X'
