object dtmFD: TdtmFD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 337
  Width = 117
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=ISO8859_1'
      'Port=3050'
      'Database=E:\Base\MORRINHOS.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'fbclient.dll'
    Left = 40
    Top = 88
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 144
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'EXECUTE BLOCK'
      'RETURNS (RES INTEGER)  AS  DECLARE ID INT = 0;'
      'BEGIN'
      'FOR SELECT SELO_LIVRO_ID'
      '  FROM G_SELO_LIVRO SL'
      '  LEFT JOIN R_PEDIDO_ITEM PI ON  SL.CAMPO_ID = PI.PEDIDO_ITEM_ID'
      '  AND SL.TABELA = '#39'R_PEDIDO_ITEM'#39
      '  LEFT JOIN R_PEDIDO PE ON  PI.PEDIDO_ID = PE.PEDIDO_ID'
      '  LEFT JOIN R_PROTOCOLO PR ON  PE.PEDIDO_ID = PR.PEDIDO_ID'
      '  LEFT JOIN G_NATUREZA_TITULO NT  ON'
      '  PI.NATUREZA_TITULO_ID = NT.NATUREZA_TITULO_ID'
      '  LEFT JOIN G_SELO_LOTE ST ON  SL.SELO_LOTE_ID = ST.SELO_LOTE_ID'
      
        '  LEFT JOIN G_SELO_GRUPO SG ON  ST.SELO_GRUPO_ID = SG.SELO_GRUPO' +
        '_ID'
      '  WHERE (PR.TIPO_PROTOCOLO IN('#39'1'#39'))'
      '  AND (PI.EXCLUI_DO_RELATORIO <> '#39'S'#39
      '  OR PI.EXCLUI_DO_RELATORIO IS NULL)'
      '  AND SL.DATA  BETWEEN CAST('#39'2016/08/01'#39' AS TIMESTAMP)'
      '  AND CAST('#39'2016/08/01'#39' AS TIMESTAMP) + 0.9999'
      '  AND SL.SELO_SITUACAO_ID = 2'
      '  INTO :ID  DO'
      
        '  UPDATE G_SELO_LIVRO SET REG_FINANCEIRO = 1  WHERE SELO_LIVRO_I' +
        'D = :ID;  RES = 1;  SUSPEND;  END'
      '')
    Left = 40
    Top = 208
  end
end
