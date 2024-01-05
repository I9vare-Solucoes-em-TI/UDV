object PropertiesDlg: TPropertiesDlg
  Left = 316
  Top = 207
  BorderStyle = bsDialog
  Caption = 'Informa'#231#245'es'
  ClientHeight = 172
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object OKBtn: TButton
    Left = 300
    Top = 6
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 285
    Height = 155
    Caption = 'Propriedades'
    TabOrder = 1
    object txtFilename: TLabel
      Left = 22
      Top = 24
      Width = 56
      Height = 13
      Caption = 'txtFilename'
    end
    object txtSize: TLabel
      Left = 22
      Top = 43
      Width = 33
      Height = 13
      Caption = 'txtSize'
    end
    object txtColors: TLabel
      Left = 22
      Top = 62
      Width = 44
      Height = 13
      Caption = 'txtColors'
    end
    object txtmem: TLabel
      Left = 22
      Top = 82
      Width = 36
      Height = 13
      Caption = 'txtmem'
    end
    object txtFileType: TLabel
      Left = 22
      Top = 101
      Width = 54
      Height = 13
      Caption = 'txtFileType'
    end
    object txtDPI: TLabel
      Left = 22
      Top = 121
      Width = 31
      Height = 13
      Caption = 'txtDPI'
    end
  end
end
