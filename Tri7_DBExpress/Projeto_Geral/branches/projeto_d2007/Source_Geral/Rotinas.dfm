object dtmRotinas: TdtmRotinas
  OldCreateOrder = False
  Left = 217
  Top = 178
  Height = 278
  Width = 372
  object sqlRotinas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = frmPrincipal.sqlConnection
    Left = 40
    Top = 24
  end
  object sqlAuxiliar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = frmPrincipal.sqlConnection
    Left = 120
    Top = 24
  end
end
