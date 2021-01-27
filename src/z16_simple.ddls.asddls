@AbapCatalog.sqlViewName: 'Z16SIMP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'einfache cds view'
define view Z16_Simple 
    as select from sbook {


    key carrid,
    key connid,
    key fldate,
    key bookid,
    class,
    forcuram,
    forcurkey,
    luggweight,
    wunit,
    order_date, 
    agencynum, 
    counter,
    customid
}
