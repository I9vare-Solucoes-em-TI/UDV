inherited frmTextroLavrado: TfrmTextroLavrado
  Left = 306
  Top = 186
  BorderIcons = []
  BorderStyle = bsSizeable
  Caption = 'Texto do Ato'
  ClientHeight = 514
  ClientWidth = 794
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 810
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 794
    Height = 514
    ExplicitWidth = 794
    ExplicitHeight = 514
    inherited Shape1: TShape
      Top = 39
      Width = 782
      Height = 467
      ExplicitTop = 39
      ExplicitWidth = 697
      ExplicitHeight = 426
    end
    inherited btnCancelar: TcxButton
      Left = 675
      Top = 472
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.SkinName = ''
      ExplicitLeft = 675
      ExplicitTop = 472
    end
    object pnlPesquisar: TPanel
      Left = 4
      Top = 4
      Width = 782
      Height = 35
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Color = clWindow
      TabOrder = 0
      object cxLabel2: TcxLabel
        Left = 4
        Top = 10
        Caption = 'Protocolo:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel5: TcxLabel
        Left = 115
        Top = 10
        Caption = 'Livro:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object cxLabel6: TcxLabel
        Left = 188
        Top = 10
        Caption = 'Folha:'
        ParentFont = False
        Style.StyleController = dtmControles.cxStyleLabel
      end
      object edtPesqProtocolo: TcxTextEdit
        Left = 57
        Top = 8
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 3
        OnEnter = edtPesqProtocoloEnter
        OnKeyDown = edtPesqProtocoloKeyDown
        OnKeyPress = edtPesqProtocoloKeyPress
        Width = 52
      end
      object edtPesqLivro: TcxTextEdit
        Left = 146
        Top = 8
        ParentFont = False
        Properties.MaxLength = 5
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 4
        OnEnter = edtPesqProtocoloEnter
        OnKeyDown = edtPesqProtocoloKeyDown
        Width = 34
      end
      object edtPesqFolha: TcxTextEdit
        Left = 222
        Top = 8
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 4
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 5
        OnEnter = edtPesqProtocoloEnter
        OnKeyDown = edtPesqProtocoloKeyDown
        Width = 36
      end
      object btnBuscarProtocolo: TcxButton
        Left = 260
        Top = 8
        Width = 25
        Height = 22
        Cursor = crHandPoint
        Hint = 'Registrar Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnBuscarProtocoloClick
        Colors.Default = clWhite
        Glyph.Data = {
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
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
      end
      object icxPesqTipoParte: TcxImageComboBox
        Left = 291
        Top = 8
        ParentFont = False
        Properties.Items = <
          item
            Description = 'Primeiro Outorgante'
            ImageIndex = 0
            Value = 1
          end
          item
            Description = 'Primeiro Outorgado'
            Value = 2
          end
          item
            Description = 'Ambas as partes'
            Value = 3
          end>
        Properties.OnChange = icxPesqTipoPartePropertiesChange
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 7
        Width = 153
      end
      object edtPesqOutorgado: TcxTextEdit
        Left = 450
        Top = 8
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.StyleController = dtmControles.cxEsc_EditsNormal
        TabOrder = 8
        OnEnter = edtPesqOutorgadoEnter
        OnKeyDown = edtPesqOutorgadoKeyDown
        Width = 295
      end
      object btnBuscarParte: TcxButton
        Left = 747
        Top = 8
        Width = 25
        Height = 22
        Cursor = crHandPoint
        Hint = 'Registrar Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = btnBuscarParteClick
        Colors.Default = clWhite
        Glyph.Data = {
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
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        SpeedButtonOptions.Flat = True
        SpeedButtonOptions.Transparent = True
      end
    end
    object pgcVisualizacao: TcxPageControl
      Left = 7
      Top = 41
      Width = 776
      Height = 425
      ActivePage = cxTabSheet1
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
      TabOrder = 2
      OnChange = pgcVisualizacaoChange
      ClientRectBottom = 420
      ClientRectLeft = 2
      ClientRectRight = 771
      ClientRectTop = 25
      object cxTabSheet1: TcxTabSheet
        Caption = 'Visualiza'#231#227'o Horizontal'
        ImageIndex = 0
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 768
        ExplicitHeight = 397
        object pnlTexto: TPanel
          Left = 0
          Top = 133
          Width = 769
          Height = 262
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          ExplicitWidth = 768
          ExplicitHeight = 264
          inline fmeEditorSimples: TfmeEditorSimples
            Left = 2
            Top = 2
            Width = 765
            Height = 258
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 765
            ExplicitHeight = 258
            inherited wptFerramentas: TWPToolBar
              Width = 765
              Height = 28
              Visible = False
              ExplicitWidth = 764
            end
            inherited WPReguaHorizontal: TWPRuler
              Top = 28
              Width = 765
              ExplicitTop = 29
              ExplicitWidth = 764
            end
            inherited wptTexto: TWPRichText
              Top = 54
              Width = 765
              Height = 204
              Readonly = True
              LayoutMode = wplayNormal
              EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpMoveCPOnPageUpDown]
              BookmarkTextAttr.TextColor = clRed
              BookmarkTextAttr.UseHotTextColor = True
              TabOrder = 1
              ExplicitWidth = 764
              ExplicitHeight = 205
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
          Width = 769
          Height = 133
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          ExplicitWidth = 768
          object cxGridBasicaDB: TcxGridDBTableView
            OnDblClick = cxGridBasicaDBDblClick
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.PriorPage.Visible = False
            NavigatorButtons.NextPage.Visible = False
            NavigatorButtons.Insert.Visible = False
            NavigatorButtons.Delete.Visible = False
            NavigatorButtons.Edit.Visible = False
            NavigatorButtons.Post.Visible = False
            NavigatorButtons.Cancel.Visible = False
            NavigatorButtons.Refresh.Visible = False
            NavigatorButtons.SaveBookmark.Visible = False
            NavigatorButtons.GotoBookmark.Visible = False
            NavigatorButtons.Filter.Visible = False
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
            OptionsView.Navigator = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridBasicaDBProtocolo: TcxGridDBColumn
              Caption = 'Protocolo'
              DataBinding.FieldName = 'PROTOCOLO'
              Width = 68
            end
            object cxGridBasicaDBLivro: TcxGridDBColumn
              Caption = 'Livro'
              DataBinding.FieldName = 'NUMERO_LIVRO'
              Width = 62
            end
            object cxGridBasicaDBFolha: TcxGridDBColumn
              Caption = 'Folha Inicial'
              DataBinding.FieldName = 'FOLHA_INICIAL'
              Width = 92
            end
            object cxGridBasicaFolhaFinal: TcxGridDBColumn
              Caption = 'Folha Final'
              DataBinding.FieldName = 'FOLHA_FINAL'
              Width = 85
            end
            object cxGridBasicaPessoaNome: TcxGridDBColumn
              Caption = 'Primeiro Outorgado'
              DataBinding.FieldName = 'PESSOA_NOME'
              Width = 352
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
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 768
        ExplicitHeight = 397
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 308
          Height = 395
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          ExplicitHeight = 397
          object cxGridDBTableView1: TcxGridDBTableView
            OnDblClick = cxGridBasicaDBDblClick
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.PriorPage.Visible = False
            NavigatorButtons.NextPage.Visible = False
            NavigatorButtons.Insert.Visible = False
            NavigatorButtons.Delete.Visible = False
            NavigatorButtons.Edit.Visible = False
            NavigatorButtons.Post.Visible = False
            NavigatorButtons.Cancel.Visible = False
            NavigatorButtons.Refresh.Visible = False
            NavigatorButtons.SaveBookmark.Visible = False
            NavigatorButtons.GotoBookmark.Visible = False
            NavigatorButtons.Filter.Visible = False
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
            OptionsView.Navigator = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = 'Primeiro Outorgado'
              DataBinding.FieldName = 'PESSOA_NOME'
              Width = 210
            end
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'Protocolo'
              DataBinding.FieldName = 'PROTOCOLO'
              Width = 68
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
          Height = 395
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.SizePercent = 59
          DragThreshold = 2
          NativeBackground = False
          PositionAfterOpen = 135
          MinSize = 135
          Control = cxGrid1
          Color = clSkyBlue
          ParentColor = False
          ExplicitHeight = 397
        end
        object Panel2: TPanel
          Left = 316
          Top = 0
          Width = 453
          Height = 395
          Align = alClient
          TabOrder = 2
          ExplicitWidth = 452
          ExplicitHeight = 397
          object wptTexto: TWPRichText
            Left = 1
            Top = 27
            Width = 451
            Height = 367
            Cursor = crIBeam
            RTFVariables = <>
            SpellCheckStrategie = wpspCheckInInit
            WPRuler = WPReguaHorizontal
            XOffset = 144
            YOffset = 144
            XBetween = 144
            YBetween = 144
            LayoutMode = wplayNormal
            ColorDesktop = clSkyBlue
            ScrollBars = ssBoth
            EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpMoveCPOnPageUpDown]
            FormatOptions = [wpDisableAutosizeTables]
            FormatOptionsEx = []
            ProtectedProp = [ppParProtected, ppProtected, ppAllowEditAtTextEnd, ppProtectSelectedTextToo]
            HyperLinkCursor = crArrow
            TextObjectCursor = crHandPoint
            InsertPointAttr.Bold = tsIgnore
            InsertPointAttr.Italic = tsIgnore
            InsertPointAttr.DoubleUnderline = False
            InsertPointAttr.Underline = tsIgnore
            InsertPointAttr.StrikeOut = tsIgnore
            InsertPointAttr.StrikeOutColor = clBlack
            InsertPointAttr.SuperScript = tsIgnore
            InsertPointAttr.SubScript = tsIgnore
            InsertPointAttr.Hidden = False
            InsertPointAttr.UnderlineColor = clBlack
            InsertPointAttr.TextColor = clRed
            InsertPointAttr.BackgroundColor = clBlack
            InsertPointAttr.UseUnderlineColor = False
            InsertPointAttr.UseTextColor = True
            InsertPointAttr.UseBackgroundColor = False
            HyperlinkTextAttr.Bold = tsIgnore
            HyperlinkTextAttr.Italic = tsIgnore
            HyperlinkTextAttr.DoubleUnderline = False
            HyperlinkTextAttr.Underline = tsIgnore
            HyperlinkTextAttr.StrikeOut = tsIgnore
            HyperlinkTextAttr.StrikeOutColor = clBlack
            HyperlinkTextAttr.SuperScript = tsIgnore
            HyperlinkTextAttr.SubScript = tsIgnore
            HyperlinkTextAttr.Hidden = False
            HyperlinkTextAttr.UnderlineColor = clBlue
            HyperlinkTextAttr.TextColor = clTeal
            HyperlinkTextAttr.BackgroundColor = clBlack
            HyperlinkTextAttr.UseUnderlineColor = False
            HyperlinkTextAttr.UseTextColor = True
            HyperlinkTextAttr.UseBackgroundColor = False
            HyperlinkTextAttr.HotUnderlineColor = clTeal
            HyperlinkTextAttr.HotTextColor = clTeal
            HyperlinkTextAttr.HotUnderline = tsFALSE
            HyperlinkTextAttr.HotStyleIsActive = True
            BookmarkTextAttr.Bold = tsTRUE
            BookmarkTextAttr.Italic = tsIgnore
            BookmarkTextAttr.DoubleUnderline = False
            BookmarkTextAttr.Underline = tsIgnore
            BookmarkTextAttr.StrikeOut = tsIgnore
            BookmarkTextAttr.StrikeOutColor = clTeal
            BookmarkTextAttr.SuperScript = tsIgnore
            BookmarkTextAttr.SubScript = tsIgnore
            BookmarkTextAttr.Hidden = False
            BookmarkTextAttr.NotUsedForSpellAsYouGo = True
            BookmarkTextAttr.UnderlineColor = clBlack
            BookmarkTextAttr.TextColor = clBlue
            BookmarkTextAttr.BackgroundColor = 14737632
            BookmarkTextAttr.UseUnderlineColor = False
            BookmarkTextAttr.UseTextColor = True
            BookmarkTextAttr.UseBackgroundColor = False
            BookmarkTextAttr.HotTextColor = clRed
            BookmarkTextAttr.HotStyleIsActive = True
            SPANObjectTextAttr.Bold = tsIgnore
            SPANObjectTextAttr.Italic = tsIgnore
            SPANObjectTextAttr.DoubleUnderline = False
            SPANObjectTextAttr.Underline = tsIgnore
            SPANObjectTextAttr.StrikeOut = tsIgnore
            SPANObjectTextAttr.StrikeOutColor = clBlack
            SPANObjectTextAttr.SuperScript = tsIgnore
            SPANObjectTextAttr.SubScript = tsIgnore
            SPANObjectTextAttr.Hidden = False
            SPANObjectTextAttr.UnderlineColor = clBlack
            SPANObjectTextAttr.TextColor = clBlack
            SPANObjectTextAttr.BackgroundColor = clBlack
            SPANObjectTextAttr.UseUnderlineColor = False
            SPANObjectTextAttr.UseTextColor = False
            SPANObjectTextAttr.UseBackgroundColor = False
            HiddenTextAttr.Bold = tsIgnore
            HiddenTextAttr.Italic = tsIgnore
            HiddenTextAttr.DoubleUnderline = False
            HiddenTextAttr.Underline = tsIgnore
            HiddenTextAttr.StrikeOut = tsIgnore
            HiddenTextAttr.StrikeOutColor = clBlack
            HiddenTextAttr.SuperScript = tsIgnore
            HiddenTextAttr.SubScript = tsIgnore
            HiddenTextAttr.Hidden = True
            HiddenTextAttr.UnderlineColor = clBlack
            HiddenTextAttr.TextColor = clBlack
            HiddenTextAttr.BackgroundColor = clBlack
            HiddenTextAttr.UseUnderlineColor = False
            HiddenTextAttr.UseTextColor = False
            HiddenTextAttr.UseBackgroundColor = False
            AutomaticTextAttr.Bold = tsIgnore
            AutomaticTextAttr.Italic = tsIgnore
            AutomaticTextAttr.DoubleUnderline = False
            AutomaticTextAttr.Underline = tsIgnore
            AutomaticTextAttr.StrikeOut = tsIgnore
            AutomaticTextAttr.StrikeOutColor = clBlack
            AutomaticTextAttr.SuperScript = tsIgnore
            AutomaticTextAttr.SubScript = tsIgnore
            AutomaticTextAttr.Hidden = False
            AutomaticTextAttr.UnderlineColor = clBlack
            AutomaticTextAttr.TextColor = clBlue
            AutomaticTextAttr.BackgroundColor = clBlack
            AutomaticTextAttr.UseUnderlineColor = False
            AutomaticTextAttr.UseTextColor = False
            AutomaticTextAttr.UseBackgroundColor = False
            ProtectedTextAttr.Bold = tsTRUE
            ProtectedTextAttr.Italic = tsFALSE
            ProtectedTextAttr.DoubleUnderline = False
            ProtectedTextAttr.Underline = tsIgnore
            ProtectedTextAttr.StrikeOut = tsIgnore
            ProtectedTextAttr.StrikeOutColor = clTeal
            ProtectedTextAttr.UseStrikeOutColor = True
            ProtectedTextAttr.SuperScript = tsIgnore
            ProtectedTextAttr.SubScript = tsIgnore
            ProtectedTextAttr.Hidden = False
            ProtectedTextAttr.UnderlineColor = clBlack
            ProtectedTextAttr.TextColor = clBlue
            ProtectedTextAttr.BackgroundColor = 14737632
            ProtectedTextAttr.UseUnderlineColor = False
            ProtectedTextAttr.UseTextColor = False
            ProtectedTextAttr.UseBackgroundColor = False
            ProtectedTextAttr.HotStyleIsActive = True
            ProtectedTextAttr.OnHintEventIsActive = True
            ProtectedTextAttr.UseOnGetAttrColorEvent = True
            FieldObjectTextAttr.Bold = tsIgnore
            FieldObjectTextAttr.Italic = tsIgnore
            FieldObjectTextAttr.DoubleUnderline = False
            FieldObjectTextAttr.Underline = tsIgnore
            FieldObjectTextAttr.StrikeOut = tsIgnore
            FieldObjectTextAttr.StrikeOutColor = clBlack
            FieldObjectTextAttr.SuperScript = tsIgnore
            FieldObjectTextAttr.SubScript = tsIgnore
            FieldObjectTextAttr.Hidden = False
            FieldObjectTextAttr.UnderlineColor = clBlack
            FieldObjectTextAttr.TextColor = clBlack
            FieldObjectTextAttr.BackgroundColor = clBlack
            FieldObjectTextAttr.UseUnderlineColor = False
            FieldObjectTextAttr.UseTextColor = False
            FieldObjectTextAttr.UseBackgroundColor = False
            WriteObjectMode = wobRTFNoBinary
            ClickableCodes = []
            OneClickHyperlink = False
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 450
            ExplicitHeight = 369
          end
          object WPReguaHorizontal: TWPRuler
            Left = 1
            Top = 1
            Width = 451
            Height = 26
            Design = wpRulerBlue
            Units = wrCentimeter
            DrawOptions = []
            TabKind = tkLeft
            Options = [wrShowTabSelector, wrShowTabStops, wrShowIndents, wpUseIntervalls]
            ColorMargin = clSkyBlue
            ColorBack = clBtnFace
            ColorBorder = clSilver
            Align = alTop
            ExplicitWidth = 450
          end
        end
      end
    end
    object btnConfirmar: TcxButton
      Left = 574
      Top = 472
      Width = 95
      Height = 22
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnConfirmarClick
      Colors.Default = clWhite
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000120B0000120B0000000100000000000000000000D5D5
        D5007C7C7C0033333300ABABAB001717170052525200FFFFFF0011111100C6C6
        C60020202000999999006B6B6B000C0C0C0043434300909090002A2A2A00E8E8
        E8001616160008080800A5A5A5001C1C1C003E3E3E00B6B6B6005A5A5A008686
        8600D1D1D10014141400060606004A4A4A003C3C3C00B3B3B3003A3A3A002525
        2500303030000E0E0E006E6E6E00616161001E1E1E0004040400D9D9D9004646
        460080808000959595002E2E2E00BBBBBB008A8A8A0000000000222222004040
        40009999990027272700C9C9C9006C6C6C00939393002C2C2C004C4C4C007171
        7100000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000070707070707
        070711351300002706340707070707070707070707092C272727272727051407
        07070707070707071A0D1C1C1C1C1C1C1C1C131F07070707070707071E131313
        1313131313131321070707070707071A0D0D0D0D0D0D0D0D0D0D0D0D07070707
        07070717232323232323232323232323070707070707072D0808080808080808
        0808080807070707070707041B1B1B1B1B1B1B1B1B1B1B1B0707070707070719
        0505050505050505050505050707070707070716050505050505050505050505
        0707070707071F15150322151515151515200E0C070707070728200A0A141D0A
        0A0A0A390601070707070707072530302407160A022E0B070707070707070707
        071A182A070716210B0707070707070707070707070707070707313336070707
        07070707070707070707070707070E102B070707070707070707070707070707
        0707292C2B070707070707070707070707070707070738220B07070707070707
        070707070707070707070F310107070707070707070707070707070707070707
        07070707070707070707}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = (
      'SELECT A.TEXTO, A.PROTOCOLO, A.FOLHA_INICIAL, A.FOLHA_FINAL, A.D' +
      'ATA_LAVRATURA,'#13#10'      VP.PESSOA_NOME, LA.NUMERO_LIVRO, A.ATO_ID'#13 +
      #10'FROM T_ATO A'#13#10'  LEFT OUTER JOIN T_ATO_VINCULOPARTE VP'#13#10'  ON A.A' +
      'TO_ID = VP.ATO_ID'#13#10'  LEFT OUTER JOIN T_LIVRO_ANDAMENTO LA'#13#10'  ON ' +
      'A.LIVRO_ANDAMENTO_ID = LA.LIVRO_ANDAMENTO_ID'#13#10'WHERE A.SITUACAO_A' +
      'TO = 3'#13#10'  AND VP.ORDEM = 1'#13#10'  AND VP.TIPO_VINCULO = '#39'2'#39#13#10'ORDER B' +
      'Y A.PROTOCOLO')
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
    Top = 240
    object ClientAncestralTEXTO: TBlobField
      FieldName = 'TEXTO'
      Size = 1
    end
    object ClientAncestralPROTOCOLO: TBCDField
      FieldName = 'PROTOCOLO'
      Precision = 15
      Size = 2
    end
    object ClientAncestralFOLHA_INICIAL: TBCDField
      FieldName = 'FOLHA_INICIAL'
      Precision = 15
      Size = 2
    end
    object ClientAncestralFOLHA_FINAL: TBCDField
      FieldName = 'FOLHA_FINAL'
      Precision = 15
      Size = 2
    end
    object ClientAncestralDATA_LAVRATURA: TSQLTimeStampField
      FieldName = 'DATA_LAVRATURA'
    end
    object ClientAncestralPESSOA_NOME: TStringField
      FieldName = 'PESSOA_NOME'
      Size = 120
    end
    object ClientAncestralNUMERO_LIVRO: TBCDField
      FieldName = 'NUMERO_LIVRO'
      Precision = 15
      Size = 2
    end
    object ClientAncestralATO_ID: TBCDField
      FieldName = 'ATO_ID'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 595
    Top = 239
  end
end
