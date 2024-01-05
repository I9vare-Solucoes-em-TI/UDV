object dtmLookupBoleto: TdtmLookupBoleto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 351
  Width = 603
  object ACBrBoleto1: TACBrBoleto
    Banco.Numero = 341
    Banco.TamanhoMaximoNossoNum = 8
    Banco.TipoCobranca = cobItau
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Banco.DensidadeGravacao = '0'
    Cedente.TipoCarteira = tctRegistrada
    Cedente.TipoInscricao = pJuridica
    DirArqRemessa = 'c:\TEMP\REMESSA_TESTE.TXT'
    NumeroArquivo = 0
    LayoutRemessa = c240
    Configuracoes.Arquivos.LogRegistro = False
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = taHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 153
    Top = 119
  end
  object sqlRemessa: TSimpleDataSet
    Aggregates = <>
    Connection = dtmControles.DB
    DataSet.CommandText = 
      'SELECT BO.VALOR, BO.BOLETA_ID, BO.PESSOA_ID, BO.PESSOA_GRUPO_ID,' +
      #13#10'             BO.DATA_VENCIMENTO, BO.DATA_EMISSAO,'#13#10'           ' +
      '  BO.REMESSA_SITUACAO'#13#10'FROM T_BOLETA BO'#13#10'WHERE (((NOT REMESSA_SI' +
      'TUACAO IS NULl) AND (BO.SITUACAO = '#39'1'#39')) OR'#13#10'      ((NOT REMESSA' +
      '_SITUACAO IS NULl) AND (BO.SITUACAO = '#39'3'#39') AND (NOT BO.REMESSA_I' +
      'D IS NULL)))'#13#10'   AND FATURA_TIPO = '#39'B'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 338
    Top = 96
    object sqlRemessaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 20
      Size = 3
    end
    object sqlRemessaBOLETA_ID: TFMTBCDField
      FieldName = 'BOLETA_ID'
      Required = True
      Precision = 20
      Size = 2
    end
    object sqlRemessaPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      Precision = 20
      Size = 3
    end
    object sqlRemessaDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
    end
    object sqlRemessaDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object sqlRemessaREMESSA_SITUACAO: TStringField
      FieldName = 'REMESSA_SITUACAO'
      Size = 1
    end
    object sqlRemessaPESSOA_GRUPO_ID: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
  end
  object dtsRemessa: TDataSource
    DataSet = sqlRemessa
    Left = 339
    Top = 152
  end
  object frxPDFExport1: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EmbeddedFonts = True
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 387
    Top = 216
  end
end
