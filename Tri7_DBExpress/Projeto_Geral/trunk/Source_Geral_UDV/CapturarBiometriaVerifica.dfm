object frmCapturarBiometriaVerifica: TfrmCapturarBiometriaVerifica
  Left = 597
  Top = 242
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Captura Digital'
  ClientHeight = 261
  ClientWidth = 181
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 32
    Width = 181
    Height = 229
    Align = alClient
    Brush.Color = clWindow
    Pen.Color = 10775558
    Pen.Width = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 181
    Height = 229
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object pnlDigital: TPanel
      Left = 2
      Top = 19
      Width = 177
      Height = 178
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object pnlPrimeiraCaptura: TPanel
        Left = 2
        Top = 2
        Width = 173
        Height = 174
        Align = alClient
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 0
      end
    end
    object lblDedo: TcxLabel
      Left = 2
      Top = 197
      Cursor = crHandPoint
      Align = alBottom
      AutoSize = False
      Caption = 'Coloque o Dedo...'
      ParentColor = False
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TextStyle = [fsBold]
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleDisabled.TextColor = clRed
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.Color = clCream
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      StyleHot.TextColor = clRed
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Height = 30
      Width = 177
      AnchorX = 91
      AnchorY = 212
    end
    object Progress: TPanel
      Left = 2
      Top = 2
      Width = 177
      Height = 17
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clWindow
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ProgressClick
    end
  end
  object lblInformacao: TcxLabel
    Left = 0
    Top = 0
    Cursor = crHandPoint
    Align = alTop
    AutoSize = False
    Caption = 'Pressione para 1'#170' Captura (F5)'
    ParentColor = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Color = clCream
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -9
    Style.Font.Name = 'Arial'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.TextColor = clBlue
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.Color = clCream
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Height = 32
    Width = 181
    AnchorX = 91
    AnchorY = 16
  end
end
