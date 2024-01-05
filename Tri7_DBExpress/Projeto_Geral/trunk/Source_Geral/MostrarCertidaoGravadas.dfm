inherited frmMostrarCertidaoGravada: TfrmMostrarCertidaoGravada
  Left = 306
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeable
  Caption = 'Certid'#245'es Gravadas'
  ClientHeight = 440
  ClientWidth = 701
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 717
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 701
    Height = 440
    ExplicitWidth = 701
    ExplicitHeight = 440
    inherited Shape1: TShape
      Width = 689
      Height = 428
      ExplicitWidth = 697
      ExplicitHeight = 426
    end
    inherited btnCancelar: TcxButton
      Left = 577
      Top = 399
      LookAndFeel.SkinName = ''
      ModalResult = 2
      TabOrder = 2
      ExplicitLeft = 577
      ExplicitTop = 399
    end
    object btnConfirmar: TcxButton
      Left = 478
      Top = 399
      Width = 95
      Height = 22
      Caption = 'Selecionar'
      Colors.Default = clWhite
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE7E8E7D0D2D1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEEEEEE8E8F8E515452B9BBBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
        AAABAA3D3E3D232423565756E5E7E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCECD4A4C4A27
        2827292B29282928848785F7F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E5E35253522929292F2F2F2E2E
        2E2E2E2E353635A1A2A1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEBECEB797B792A2B2A2F302F2D2D2D2E2E2E303130
        2C2E2C4F514FC3C4C3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF0F1F0979897393A392F302F3334335252524546452F312F31323133
        3433707270DEDFDEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9F9
        B3B5B34B4C4B323332333433747574CECFCEB6B7B6484948323232323332393B
        39919391F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDCED0CF5A5C5A34
        35342D2E2D7C7D7CEAEAEAFEFEFEFAFAFABFBFBF343534333533353535444544
        B9BABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E8E76D6E6D3233323A3A3A8D8D
        8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC4546453536353536354F5250DD
        DFDEFFFFFFFFFFFFFFFFFFFFFFFFA6A8A63B3D3B4547459A9A9AF4F4F4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8ACACAC494A493839383636367A7C7BECED
        ECFFFFFFFFFFFFFFFFFF5A5C5B545554ADADADF2F2F2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF3F3F3A7A7A7494A49393A39444544A1A2A2F4F5F5
        FFFFFFFFFFFFB9B9B9CCCCCCF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF2F2F2A2A3A23F403F3D3D3D595B5AC2C3C3FCFCFCFF
        FFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF6F6F6A1A2A1343634404140737573E0E0E0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9999994041404142418C8F8CEFF0EFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF3F3F39797974647464C4D4CBABABAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFECECEC9494944647465C5E5CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFECECEC9C9C9C7E7F7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF5F5F5EFF0EF}
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarClick
    end
    object Panel3: TPanel
      Left = 6
      Top = 6
      Width = 691
      Height = 35
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 0
      object edtDescricao: TcxTextEdit
        Left = 120
        Top = 7
        ParentFont = False
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 0
        OnKeyDown = edtDescricaoKeyDown
        Width = 346
      end
      object cxLabel26: TcxLabel
        Left = 9
        Top = 10
        Caption = 'Descri'#231#227'o da Certid'#227'o:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object btnPesquisarDoc: TcxButton
        Left = 470
        Top = 5
        Width = 95
        Height = 22
        Cursor = crHandPoint
        Caption = 'Pesquisar'
        Colors.Default = clWhite
        OptionsImage.Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000130B0000130B00000001000000000000000000000101
          0100020202000303030004040400050505000606060007070700080808000909
          09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
          1100121212001313130014141400151515001616160017171700181818001919
          19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
          4100424242004343430044444400454545004646460047474700484848004949
          49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
          5100525252005353530054545400555555005656560057575700585858005959
          59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
          6100626262006363630064646400656565006666660067676700686868006969
          69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
          7100727272007373730074747400757575007676760077777700787878007979
          79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
          8100828282008383830084848400858585008686860087878700888888008989
          89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
          9100929292009393930094949400959595009696960097979700989898009999
          99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
          A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
          A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
          B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
          B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
          C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
          C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
          D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
          D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
          E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
          E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
          F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
          F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA3379E
          F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAC20022C9EF5FFFFFFFFFFFFFFFFFFFF
          FFFFFCAA2900000146E6FFFFFFFFFFFFFFFFFFFFFFFCAC290200002FB7FAFFFF
          FFFFFFFFFFFFFFFFF7A31E00000338C1FFFFFFFFFFFFFFEAE0E0E7F1A6210000
          0038BEFFFFFFFFFFFFEFAE5F51515B761F0000002CC2FFFFFFFFFFFFEB7E2139
          7175511100000030B7FFFFFFFFFFFFF68E1672E3F1F2E9AF150130B9FBFFFFFF
          FFFFFEC83571F0FFFFFFFFFFB41382F8FFFFFFFFFFFFFA9D2DC0FEFFFFFFFFFF
          E9535DE6FFFFFFFFFFFFF78B3FD4FFFFFFFFFFFFF27651E0FFFFFFFFFFFFF88E
          39D0FFFFFFFFFFFFF17252E0FFFFFFFFFFFFFCA927AEFDFFFFFFFFFFE23864EB
          FFFFFFFFFFFFFFDF543ECEFDFFFFFEF07222AEFEFFFFFFFFFFFFFFFDB6343FAC
          D1D2BD6F147EF0FFFFFFFFFFFFFFFFFFF8B553233B3D2A378BECFFFFFFFFFFFF
          FFFFFFFFFFFCDEA88F8C9BCAF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F8FAFE
          FFFFFFFFFFFFFFFFFFFF}
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnPesquisarDocClick
      end
    end
    object pgcVisualizacao: TcxPageControl
      Left = 7
      Top = 41
      Width = 683
      Height = 354
      TabOrder = 3
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.SkinName = 'Black'
      OnChange = pgcVisualizacaoChange
      ClientRectBottom = 354
      ClientRectRight = 683
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = 'Visualiza'#231#227'o Horizontal'
        ImageIndex = 0
        object pnlTexto: TPanel
          Left = 0
          Top = 139
          Width = 683
          Height = 191
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          inline fmeEditorSimples: TfmeEditorSimples
            Left = 2
            Top = 2
            Width = 679
            Height = 187
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 679
            ExplicitHeight = 187
            inherited wptFerramentas: TWPToolbar
              Width = 679
              Height = 28
              Visible = False
              ExplicitWidth = 686
              ExplicitHeight = 28
            end
            inherited WPReguaHorizontal: TWPRuler
              Top = 28
              Width = 679
              ExplicitTop = 29
              ExplicitWidth = 686
            end
            inherited wptTexto: TWPRichText
              Top = 54
              Width = 679
              Height = 133
              LayoutMode = wplayNormal
              EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpMoveCPOnPageUpDown]
              TabOrder = 1
              ExplicitTop = 54
              ExplicitWidth = 686
              ExplicitHeight = 132
            end
            inherited popMinuta: TPopupMenu
              Left = 587
              Top = 87
            end
          end
        end
        object cxGridBasica: TcxGrid
          Left = 0
          Top = 0
          Width = 683
          Height = 139
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          ExplicitWidth = 690
          object cxGridBasicaDB: TcxGridDBTableView
            OnDblClick = cxGridBasicaDBDblClick
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
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridBasicaDBDescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 316
            end
            object cxGridBasicaDBData: TcxGridDBColumn
              Caption = 'Data da '#218'ltima Altera'#231#227'o'
              DataBinding.FieldName = 'DATA'
              PropertiesClassName = 'TcxDateEditProperties'
              Width = 180
            end
            object cxGridBasicaDBUsuario: TcxGridDBColumn
              Caption = 'Usu'#225'rio'
              DataBinding.FieldName = 'USUARIO_ID'
              RepositoryItem = dtmLookup.Lista_UsuarioSistema
              Width = 154
            end
          end
          object cxGridBasicaLevel1: TcxGridLevel
            GridView = cxGridBasicaDB
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Visualiza'#231#227'o Vertical'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 690
        ExplicitHeight = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 308
          Height = 324
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          ExplicitHeight = 330
          object cxGridDBTableView1: TcxGridDBTableView
            OnDblClick = cxGridBasicaDBDblClick
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
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 272
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object cxSplitterTexto: TcxSplitter
          Left = 308
          Top = 0
          Width = 8
          Height = 324
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.SizePercent = 59
          DragThreshold = 2
          NativeBackground = False
          PositionAfterOpen = 135
          MinSize = 135
          Control = cxGrid1
          Color = 14807280
          ParentColor = False
          ExplicitHeight = 330
        end
        object Panel2: TPanel
          Left = 316
          Top = 0
          Width = 360
          Height = 324
          Align = alClient
          TabOrder = 2
          ExplicitWidth = 374
          ExplicitHeight = 330
          object wptTexto: TWPRichText
            Left = 1
            Top = 27
            Width = 358
            Height = 296
            Cursor = crIBeam
            RTFVariables = <>
            WPRuler = WPReguaHorizontal
            LayoutMode = wplayNormal
            ColorDesktop = clSkyBlue
            EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpMoveCPOnPageUpDown]
            ProtectedProp = [ppParProtected, ppProtected, ppAllowEditAtTextEnd, ppProtectSelectedTextToo]
            InsertPointAttr.TextColor = clRed
            InsertPointAttr.UseTextColor = True
            HyperlinkTextAttr.Underline = tsTRUE
            HyperlinkTextAttr.UnderlineColor = clBlue
            HyperlinkTextAttr.TextColor = clTeal
            HyperlinkTextAttr.UseUnderlineColor = True
            HyperlinkTextAttr.UseTextColor = True
            HyperlinkTextAttr.HotUnderlineColor = clTeal
            HyperlinkTextAttr.HotTextColor = clTeal
            HyperlinkTextAttr.HotUnderline = tsFALSE
            HyperlinkTextAttr.HotStyleIsActive = True
            BookmarkTextAttr.Bold = tsTRUE
            BookmarkTextAttr.StrikeOutColor = clTeal
            BookmarkTextAttr.NotUsedForSpellAsYouGo = True
            BookmarkTextAttr.TextColor = clBlue
            BookmarkTextAttr.BackgroundColor = 14737632
            BookmarkTextAttr.UseTextColor = True
            BookmarkTextAttr.HotTextColor = clRed
            BookmarkTextAttr.HotStyleIsActive = True
            HiddenTextAttr.Hidden = True
            AutomaticTextAttr.TextColor = clBlue
            ProtectedTextAttr.Bold = tsTRUE
            ProtectedTextAttr.Italic = tsFALSE
            ProtectedTextAttr.StrikeOutColor = clTeal
            ProtectedTextAttr.UseStrikeOutColor = True
            ProtectedTextAttr.TextColor = clBlue
            ProtectedTextAttr.BackgroundColor = 14737632
            ProtectedTextAttr.HotStyleIsActive = True
            ProtectedTextAttr.OnHintEventIsActive = True
            ProtectedTextAttr.UseOnGetAttrColorEvent = True
            WriteObjectMode = wobRTFNoBinary
            ClickableCodes = []
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 372
            ExplicitHeight = 302
          end
          object WPReguaHorizontal: TWPRuler
            Left = 1
            Top = 1
            Width = 358
            Height = 26
            Design = wpRulerBlue
            DrawOptions = []
            Options = [wrShowTabSelector, wrShowTabStops, wrShowIndents, wpUseIntervalls]
            ColorMargin = clSkyBlue
            ColorBack = clBtnFace
            ColorBorder = clSilver
            Align = alTop
            ExplicitWidth = 372
          end
        end
      end
    end
  end
  inherited DataSetAncestral: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM T_CERTIDAO_GRAVADA'#13#10'ORDER BY DESCRICAO'
    Left = 499
    Top = 239
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 531
    Top = 239
  end
  inherited ClientAncestral: TClientDataSet
    BeforeOpen = ClientAncestralBeforeOpen
    AfterOpen = ClientAncestralAfterOpen
    AfterScroll = ClientAncestralAfterScroll
    Left = 563
    Top = 239
    object ClientAncestralCERTIDAO_GRAVADA_ID: TFMTBCDField
      FieldName = 'CERTIDAO_GRAVADA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ClientAncestralDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
      Size = 1
    end
    object ClientAncestralUSUARIO_ID: TFMTBCDField
      FieldName = 'USUARIO_ID'
      Precision = 15
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 595
    Top = 239
  end
end
