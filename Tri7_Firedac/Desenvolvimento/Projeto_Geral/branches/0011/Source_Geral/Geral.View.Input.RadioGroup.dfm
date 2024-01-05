inherited FrmInputRadiogroup: TFrmInputRadiogroup
  Caption = 'T'#237'tulo'
  ClientHeight = 91
  Position = poMainFormCenter
  ExplicitWidth = 375
  ExplicitHeight = 120
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    Height = 54
    ExplicitTop = 0
    ExplicitHeight = 54
    object rgpOpcoes: TcxRadioGroup
      AlignWithMargins = True
      Left = 10
      Top = 10
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = ' Texto '
      ParentFont = False
      Properties.Items = <>
      Style.StyleController = dtmControles.cxEditStyleGroup
      TabOrder = 0
      Height = 34
      Width = 349
    end
  end
  inherited PnlBotoes: TPanel
    Top = 54
    ExplicitTop = 54
  end
end
