object frmEditorTexto: TfrmEditorTexto
  Left = 237
  Top = 209
  Caption = 'Editor'
  ClientHeight = 439
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 439
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 704
      Height = 53
      Align = alTop
      Color = 16247513
      ParentBackground = False
      TabOrder = 0
      object PanelBotaoFechar: TPanel
        Left = 632
        Top = 1
        Width = 71
        Height = 51
        Align = alRight
        BevelOuter = bvNone
        Color = 14807280
        ParentBackground = False
        TabOrder = 0
        object cxBtnFechar: TcxButton
          Left = 6
          Top = 2
          Width = 60
          Height = 45
          Cursor = crHandPoint
          Caption = 'Sair'
          Colors.Default = clWhite
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            080000000000400200009B0E00009B0E0000000100000000000000000000D7D7
            D7007D7D7D0033333300C3C3C300FFFFFF004C4C4C00A0A0A000181818007777
            7700EDEDED0099999900BCBCBC00444444006666660041414100CCCCCC00DEDE
            DE0026262600F0F0F000A5A5A500030303005252520037373700FBFBFB00ADAD
            AD00DDDDDD00E5E5E500828282003D3D3D00C7C7C7009C9C9C00575757004E4E
            4E00C1C1C100E3E3E3000909090047474700000000001A1A1A00A3A3A300EFEF
            EF005050500049494900C5C5C500C9C9C9000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000005050505130D
            0000000000000000000000000024090505050505050A06000000000000000000
            000000000000001C05050505050E00212D1010101010101010101010100C0800
            0A050505051D0007050505050505050505050505050525001A050505050F000B
            05050505050505050505050505050D001A050505050F000B0505050505050505
            050505050505170011050505050F000B0505050505050505052D061B05051415
            01050505050F000B0505050505050505051F00271E05050423050505050F000B
            0505050505050505051900001528050505050505050F000B0505050B16161616
            160300000000020505050505050F000B05050527000000000000000000000020
            18050505050F000B0505051200000000000000000000000003220505050F000B
            0505051200000000000000000000000003220505050F000B0505052700000000
            000000000000002018050505050F000B0505050B161616161603000000000205
            05050505050F000B0505050505050505051900001528050505050505050F000B
            0505050505050505051F00271E05050423050505050F000B0505050505050505
            052C2B1B0505141501050505050F000B05050505050505050505050505051700
            11050505050F000B05050505050505050505050505050D001A050505051D0007
            050505050505050505050505050525001A050505050E00212D10101010101010
            10101010100C08000A050505050A06000000000000000000000000000000001C
            050505050505130D000000000000000000000000002409050505}
          OptionsImage.Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = cxBtnFecharClick
        end
      end
      object pnlTeste: TPanel
        Left = 1
        Top = 1
        Width = 631
        Height = 51
        Align = alClient
        BevelOuter = bvNone
        Color = 14807280
        ParentBackground = False
        TabOrder = 1
        object lblInformacao: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          AutoSize = False
          Caption = 'Editor de Texto Simplificado'
          ParentColor = False
          Style.BorderStyle = ebsSingle
          Style.Color = 4210688
          Style.Shadow = True
          Style.TextColor = clWhite
          Style.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Height = 24
          Width = 631
          AnchorX = 316
          AnchorY = 12
        end
        object pnlDados: TPanel
          Left = 10
          Top = 27
          Width = 631
          Height = 22
          BevelOuter = bvNone
          Color = 14807280
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object cxLabel3: TcxLabel
            Left = -3
            Top = 2
            Caption = 'Quantidade:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cbxQtd: TcxImageComboBox
            Left = 60
            Top = 0
            ParentFont = False
            Properties.Items = <
              item
                Description = '1 Parte'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = '2 Partes ou mais'
                Value = '2'
              end>
            Properties.OnChange = cbxQtdPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 1
            Width = 121
          end
          object cxLabel1: TcxLabel
            Left = 189
            Top = 2
            Caption = 'Sexo:'
            ParentFont = False
            Style.StyleController = dtmControles.cxStyleLabel
          end
          object cbxSexo: TcxImageComboBox
            Left = 221
            Top = 0
            ParentFont = False
            Properties.Items = <
              item
                Description = 'Masculino'
                ImageIndex = 0
                Value = 'M'
              end
              item
                Description = 'Feminino'
                Value = 'F'
              end>
            Properties.OnChange = cbxQtdPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 3
            Width = 121
          end
        end
      end
    end
    inline fmeEditor: TfmeEditor
      Left = 4
      Top = 57
      Width = 704
      Height = 374
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 57
      ExplicitWidth = 704
      ExplicitHeight = 374
      inherited wptFerramentas: TWPToolbar
        Width = 704
        ExplicitWidth = 704
        inherited btnGravacaoAutomatica: TSpeedButton
          Left = 492
          Visible = False
          ExplicitLeft = 492
        end
        inherited WPToolPanel1: TWPToolPanel
          Left = 515
          Visible = False
          ExplicitLeft = 515
          inherited btnSaveImagem: TWPToolButton
            Caption = '1'
          end
        end
        inherited speNumColunas: TcxSpinEdit
          ExplicitHeight = 19
        end
      end
      inherited WPReguaHorizontal: TWPRuler
        Width = 704
        ExplicitWidth = 704
      end
      inherited PanelMarcacao: TPanel
        Width = 704
        ExplicitWidth = 704
        inherited lblInfoMarcacaoInterna: TcxLabel
          AnchorX = 657
          AnchorY = 14
        end
        inherited btnDicionarioGramatical: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited btnMarcacaoAutomatica: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited btnMarcacaoManual: TcxButton
          LookAndFeel.SkinName = ''
        end
        inherited btnVerificarMarcacao: TcxButton
          LookAndFeel.SkinName = ''
        end
      end
      inherited wptTexto: TWPRichText
        Width = 678
        Height = 246
        ExplicitWidth = 678
        ExplicitHeight = 246
      end
      inherited WPVertRuler1: TWPVertRuler
        Height = 246
        ExplicitHeight = 246
      end
      inherited StatusBar: TStatusBar
        Top = 355
        Width = 704
        ExplicitTop = 355
        ExplicitWidth = 704
      end
      inherited popMinuta: TPopupMenu
        object VoltarTelaAnterior1: TMenuItem
          Caption = 'Voltar Tela Anterior'
          ShortCut = 121
          OnClick = VoltarTelaAnterior1Click
        end
      end
    end
  end
end
