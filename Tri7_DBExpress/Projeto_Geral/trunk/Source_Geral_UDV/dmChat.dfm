object dtmChat: TdtmChat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 197
  Width = 320
  object sqlChat: TI9Query
    Aggregates = <>
    SQL.Strings = ('SELECT * FROM R_ATUALIZA_CHAT_NOVO(:USUARIO_ID)')
    ParamData = <
      item
        DataType = ftString
        ParamType = ptInput
        Size = 7
        Value = '123456'
      end>
    Params = <>
    OnCalcFields = sqlChatCalcFields
    Left = 57
    Top = 8
    object sqlChatNomeUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeUsuario'
      Calculated = True
    end
    object sqlChatCHAT_ID: TBCDField
      FieldName = 'CHAT_ID'
      Precision = 15
      Size = 2
    end
    object sqlChatDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sqlChatUSUARIO_RECEBEU_ID: TBCDField
      FieldName = 'USUARIO_RECEBEU_ID'
      Precision = 15
      Size = 2
    end
    object sqlChatUSUARIO_ENVIOU_ID: TBCDField
      FieldName = 'USUARIO_ENVIOU_ID'
      Precision = 15
      Size = 2
    end
    object sqlChatRECEBEU: TStringField
      FieldName = 'RECEBEU'
      Size = 15
    end
    object sqlChatMENSAGEM_BLOB: TBlobField
      FieldName = 'MENSAGEM_BLOB'
      Size = 1
    end
  end
  object timerChat: TTimer
    Interval = 90000
    OnTimer = timerChatTimer
    Left = 56
    Top = 56
  end
  object msnChatEmail: TMSNPopUp
    Text = 'Voc'#234' recebeu uma nova mensagem'
    URL = 'http://www.url.com/'
    IconLeft = 8
    IconTop = 8
    TimeOut = 1000
    Width = 148
    Height = 121
    GradientColor1 = 8454143
    GradientColor2 = clWhite
    ScrollSpeed = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HoverFont.Charset = DEFAULT_CHARSET
    HoverFont.Color = clBlue
    HoverFont.Height = -11
    HoverFont.Name = 'MS Sans Serif'
    HoverFont.Style = [fsUnderline]
    Title = 'title'
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Options = [msnAutoOpenURL, msnCascadePopups, msnAllowScroll, msnAllowHyperlink]
    TextCursor = crDefault
    PopupMarge = 2
    PopupStartX = 16
    PopupStartY = 2
    DefaultMonitor = dmDesktop
    Left = 56
    Top = 104
  end
  object sqlTimerChat: TI9Query
    Params = <>
    Left = 126
    Top = 8
  end
  object sqlAuxiliarChat: TI9Query
    Params = <>
    Left = 127
    Top = 56
  end
  object SimpleAuxiliarChat: TI9Query
    Aggregates = <>
    ParamData = <>
    Params = <>
    Left = 193
    Top = 8
  end
end
