@AbapCatalog.sqlViewAppendName: 'Z16EXTENSION'
@EndUserText.label: 'übung 14: extension'
extend view Z16_Extended with Z16_Extension 

    association [1] to spfli as _connection on b.carrierid = _connection.carrid
    and b.connectionid = _connection.connid

{
    
    FlightClass,
    counter, 
    
    _connection
}
