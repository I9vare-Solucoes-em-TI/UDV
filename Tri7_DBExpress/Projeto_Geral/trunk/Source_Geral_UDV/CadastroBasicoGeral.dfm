inherited frmCadastroBasicoGeral: TfrmCadastroBasicoGeral
  Left = 166
  Top = 158
  Caption = 'Cadastro Geral'
  ClientHeight = 516
  ClientWidth = 709
  OldCreateOrder = True
  ExplicitWidth = 725
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 709
    ExplicitWidth = 709
    inherited PanelBotoesBasicos: TPanel
      Width = 489
      ExplicitWidth = 489
    end
    inherited PanelBotaoFechar: TPanel
      Left = 491
      Width = 216
      ExplicitLeft = 491
      ExplicitWidth = 216
      inherited cxBtnFechar: TcxButton
        Left = 147
        ExplicitLeft = 147
      end
      object btnSelecionar: TcxButton
        Left = 84
        Top = 4
        Width = 60
        Height = 45
        Cursor = crHandPoint
        Action = ExecuteFechar
        Caption = 'Selecionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Colors.Default = clWhite
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000120B0000120B0000000100000000000000000000CCCC
          CC007C7C7C00373737001F1F1F00A9A9A900FFFFFF00161616004F4F4F00A0A0
          A000E5E5E5000E0E0E00BDBDBD00606060003030300089898900DDDDDD004444
          4400F3F3F300767676009C9C9C00B5B5B500060606001C1C1C002A2A2A005D5D
          5D00D3D3D300C9C9C9003D3D3D0014141400EDEDED0085858500C7C7C7002424
          2400FBFBFB0066666600AFAFAF00A5A5A500E3E3E30047474700DADADA003C3C
          3C00BBBBBB000B0B0B00000000001818180054545400EBEBEB001E1E1E00D8D8
          D80033333300D0D0D000F1F1F10010101000525252008B8B8B006B6B6B008181
          8100080808003A3A3A0042424200272727004B4B4B002C2C2C00A7A7A700A3A3
          A3001A1A1A002222220040404000ABABAB00B1B1B1003838380050505000BFBF
          BF0063636300F5F5F500787878009F9F9F00B7B7B7005E5E5E00878787004848
          48008D8D8D000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000060624040000
          0000000000000000000000230606062435000000000000000000000000000000
          0D4B101716161744111111111111111111033A3A3A4A143A3A08340606060606
          060606060606150B3A3A4D2B2B15060606060606060606060606063F2B2B090B
          0B1B06060606065013060606060606290B0B41353520060606060F3535410606
          0606061C3535411D1D200606061F1D1D1D2D3306060606031D1D2507071B0606
          3907070707073234060606380707252D2D1B060F2D2D2D2D2D2D2D1906060622
          0D2D251717282A1717171717171717170F0606062252400404331E1104040402
          05180404042A060606060543431B062F51434C06061A3243430E260606060521
          210106062F09060606063147212148220606253D3D2A06060606060606060610
          293D3D0206062518182312060606060606060606261118181E0626443F3F3C2E
          2E2E2E2406060606060A44270606060C290E0E0E0E0E0E0E410606060606261B
          06060606493E323232323232321B060606060606060606060606060606060606
          06060606060606060606}
        OptionsImage.Layout = blGlyphTop
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 496
    Width = 709
    ExplicitTop = 496
    ExplicitWidth = 709
  end
  inherited PanelGeral: TPanel
    Width = 709
    Height = 440
    ExplicitTop = 56
    ExplicitWidth = 709
    ExplicitHeight = 440
    inherited PanelData: TPanel
      Width = 707
      Height = 35
      ExplicitWidth = 707
      ExplicitHeight = 35
      object chbSituacao: TcxDBCheckBox
        Left = 581
        Top = 7
        AutoSize = False
        Caption = 'Ativo'
        DataBinding.DataField = 'SITUACAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Properties.DisplayChecked = 'A'
        Properties.DisplayGrayed = 'I'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'I'
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        Height = 21
        Width = 59
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 8
        Caption = 'Descri'#231#227'o:'
        Style.TextColor = 4210688
      end
      object edtDescricao: TcxDBTextEdit
        Left = 66
        Top = 7
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = SourceAncestral
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
        TabOrder = 2
        Width = 508
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 36
      Width = 707
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      MinSize = 36
      Control = PanelData
      Visible = False
    end
    object grdBasica: TcxGrid
      Left = 1
      Top = 44
      Width = 707
      Height = 178
      Align = alTop
      TabOrder = 2
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object grdBasicaDBTableView1: TcxGridDBTableView
        OnDblClick = grdBasicaDBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = SourceAncestral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total:0'
            Kind = skCount
            FieldName = 'NATUREZA_ID'
            Column = cxGridBasicaDBCodigo
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ColumnHeaderHints = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        object cxGridBasicaDBCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.ValueType = 'FMTBcd'
          Width = 68
        end
        object cxGridBasicaDBDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 419
        end
        object cxGridBasicaDBSituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          RepositoryItem = dtmLookup.Combo_AtivoInativo
          Width = 80
        end
      end
      object grdBasicaLevel1: TcxGridLevel
        GridView = grdBasicaDBTableView1
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 222
      Width = 707
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 60
      AlignSplitter = salTop
      Control = grdBasica
    end
    inline fmeEditorSimples: TfmeEditorSimples
      Left = 1
      Top = 230
      Width = 707
      Height = 209
      Align = alClient
      TabOrder = 4
      ExplicitLeft = 1
      ExplicitTop = 230
      ExplicitWidth = 707
      ExplicitHeight = 209
      inherited wptFerramentas: TWPToolBar
        Width = 707
        ExplicitWidth = 707
      end
      inherited WPReguaHorizontal: TWPRuler
        Width = 707
        ExplicitWidth = 707
      end
      inherited wptTexto: TWPRichText
        Width = 707
        Height = 154
        OnChange = fmeEditorSimpleswptTextoChange
        ExplicitWidth = 707
        ExplicitHeight = 154
      end
      inherited popMinuta: TPopupMenu
        object MarcacaomAnual1: TMenuItem
          Caption = 'Marca'#231#227'o Manual'
          ShortCut = 16461
          OnClick = MarcacaomAnual1Click
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 421
    Top = 170
  end
  inherited DataSetAncestral: TI9Query
    Left = 451
    Top = 170
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 483
    Top = 170
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 515
    Top = 170
  end
  inherited SourceAncestral: TDataSource
    Left = 547
    Top = 170
  end
end
