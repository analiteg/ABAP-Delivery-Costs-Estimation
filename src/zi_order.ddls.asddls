@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interface View'
define root view entity ZI_ORDER
  as select from zaorder2 as Orders


  composition [1..1] of ZI_ORDER_ALL     as _AllOrders
  composition [1..1] of ZI_WAREHOUSE_ADD as _WarehouseAdd
  association [0..1] to ZI_WAREHOUSES    as _Warehouses on $projection.Uuidw = _Warehouses.Uuidw
  association [0..1] to I_Currency       as _Currency   on $projection.CurrencyCode = _Currency.Currency
  association [0..*] to ZI_RATES         as _Rates      on $projection.DelZone = _Rates.DelZone
{
  key uuid                                    as Uuid,
      uuid_w                                  as Uuidw,
      cname                                   as Cname,
      address                                 as Address,
      del_status                              as DelStatus,
      vaddress                                as Vaddress,
      cast( longitude as abap.dec( 17, 14 ) ) as Longitude,
      cast( latitude  as abap.dec( 17, 14 ) ) as Latitude,
      uom_distance                            as UomDistance,
      @Semantics.quantity.unitOfMeasure : 'UomDistance'
      del_distance                            as DelDistance,
      uom_time                                as UomTime,
      @Semantics.quantity.unitOfMeasure : 'UomTime'
      del_time                                as DelTime,
      del_zone                                as DelZone,
      currency_code                           as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      del_cost                                as DelCost,
      @Semantics.user.createdBy: true
      created_by                              as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                              as CreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by                   as LocalLastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      local_last_changed_at                   as LocalLastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at                         as LastChangedAt,
      _Currency,
      _Rates,
      _Warehouses,
      _AllOrders,
      _WarehouseAdd
}
