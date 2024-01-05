inherited frmUsuario: TfrmUsuario
  Left = 278
  Top = 239
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 442
  ClientWidth = 703
  OldCreateOrder = True
  ExplicitWidth = 719
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 703
    ExplicitWidth = 703
    inherited PanelBotoesBasicos: TPanel
      Width = 621
      ExplicitWidth = 621
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Visible = False
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 623
      ExplicitLeft = 623
    end
  end
  inherited StatusBar: TStatusBar
    Top = 422
    Width = 703
    ExplicitTop = 422
    ExplicitWidth = 703
  end
  inherited PanelGeral: TPanel
    Width = 703
    Height = 366
    ExplicitWidth = 703
    ExplicitHeight = 366
    inherited PanelData: TPanel
      Width = 701
      Height = 0
      ExplicitWidth = 701
      ExplicitHeight = 0
    end
    object pagPrincipal: TcxPageControl
      Left = 1
      Top = 1
      Width = 701
      Height = 364
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tbsUsuario
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
      OnChange = pagPrincipalChange
      ClientRectBottom = 364
      ClientRectRight = 701
      ClientRectTop = 24
      object tbsUsuario: TcxTabSheet
        Caption = 'Usu'#225'rio'
        ImageIndex = 0
        object grdUsuario: TcxGrid
          Left = 0
          Top = 89
          Width = 701
          Height = 251
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object grdUsuarioDBTableView1: TcxGridDBTableView
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
            DataController.DetailKeyFieldNames = 'USUARIO_ID'
            DataController.KeyFieldNames = 'USUARIO_ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total:0'
                Kind = skCount
                FieldName = 'USUARIO_ID'
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
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object grdUsuarioDBTableView1LOGIN: TcxGridDBColumn
              Caption = 'Login'
              DataBinding.FieldName = 'LOGIN'
              Width = 534
            end
            object grdUsuarioDBTableView1SITUACAO: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'SITUACAO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = dtmControles.imgCadBasicos
              Properties.Items = <
                item
                  Description = 'Ativo'
                  ImageIndex = 0
                  Value = 'A'
                end
                item
                  Description = 'Inativo'
                  ImageIndex = 1
                  Value = 'I'
                end>
              Width = 362
            end
          end
          object grdUsuarioLevel1: TcxGridLevel
            GridView = grdUsuarioDBTableView1
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 701
          Height = 89
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object pnlDadosUsuarios: TPanel
            Left = 0
            Top = 0
            Width = 701
            Height = 89
            Align = alTop
            BevelOuter = bvNone
            Color = 14807280
            ParentBackground = False
            TabOrder = 0
            object cxLabel7: TcxLabel
              Left = 244
              Top = 28
              Caption = 'Grupo'
              Style.TextColor = 4210688
              Transparent = True
            end
            object cxGroupBox2: TcxGroupBox
              Left = 3
              Top = 11
              Caption = 'Dados de Acesso'
              Style.BorderStyle = ebsNone
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = 4210688
              Style.TextStyle = [fsBold]
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
              Height = 78
              Width = 243
              object cxLabel24: TcxLabel
                Left = 2
                Top = 16
                Caption = 'Login'
                ParentColor = False
                Style.Color = clBtnFace
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Transparent = True
              end
              object cxLabel4: TcxLabel
                Left = 124
                Top = 17
                Caption = 'Senha'
                Style.TextColor = 4210688
                Style.TextStyle = [fsUnderline]
                Transparent = True
              end
              object edtLogin: TcxDBTextEdit
                Left = 2
                Top = 34
                DataBinding.DataField = 'LOGIN'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
                TabOrder = 2
                Width = 118
              end
              object edtSenha: TcxDBTextEdit
                Left = 124
                Top = 35
                DataBinding.DataField = 'SENHA'
                DataBinding.DataSource = SourceAncestral
                Enabled = False
                ParentFont = False
                Properties.EchoMode = eemPassword
                Properties.MaxLength = 8
                Properties.PasswordChar = '#'
                Style.StyleController = dtmControles.cxEsc_EditsNormal
                TabOrder = 3
                Width = 112
              end
              object chbTrocarSenha: TcxDBCheckBox
                Left = -2
                Top = 55
                AutoSize = False
                Caption = 'Trocar Senha ao logar no sistema'
                DataBinding.DataField = 'TROCARSENHA'
                DataBinding.DataSource = SourceAncestral
                ParentFont = False
                Properties.DisplayChecked = 'S'
                Properties.DisplayGrayed = 'N'
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Style.BorderStyle = ebsUltraFlat
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'MS Sans Serif'
                Style.Font.Style = [fsBold]
                Style.TextColor = 4210688
                Style.IsFontAssigned = True
                TabOrder = 4
                OnClick = chbTrocarSenhaClick
                Height = 21
                Width = 219
              end
            end
            object lbxGrupoSistema: TcxLookupComboBox
              Left = 245
              Top = 46
              ParentFont = False
              Properties.ClearKey = 46
              Properties.DropDownListStyle = lsFixedList
              Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRICAO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dtsGrupoUsuario
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 2
              Width = 216
            end
            object btnCadGrupo: TcxButton
              Left = 464
              Top = 44
              Width = 28
              Height = 23
              Cursor = crHandPoint
              Colors.Default = clWhite
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = ''
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
                FFF5DCD4D4D4E0F8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
                FFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00
                000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFF
                FFFFFFFFFFC62F00000047D9FFFFFFFFFFFFFFF2D8D8D8D8D8AB2A00000040BA
                D8D8D8D8D8F9FFC14545454545350C000000133A4545454545E0FFAA00000000
                00000000000000000000000000D5FFAA00000000000000000000000000000000
                00D5FFAA0000000000000000000000000000000000D5FFB92E2E2E2E2E230800
                00000D272E2E2E2E2EDDFFECC5C5C5C5C59B2600000039A9C5C5C5C5C5F5FFFF
                FFFFFFFFFFC73000000048DAFFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8
                FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFF
                FFC42E00000045D8FFFFFFFFFFFFFFFFFFFFFFFFFFC42E00000045D8FFFFFFFF
                FFFFFFFFFFFFFFFFFFEBB9AAAAAAC1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF}
              SpeedButtonOptions.Flat = True
              SpeedButtonOptions.Transparent = True
              TabOrder = 3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnCadGrupoClick
            end
            object btnExcluir: TcxButton
              Left = 495
              Top = 44
              Width = 28
              Height = 23
              Cursor = crHandPoint
              Colors.Default = clWhite
              Enabled = False
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = False
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
                F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFEE8E9FF
                FFFFFFFFFFFFFFFFFFF8E2F5FFFFFFFEDC5753E5FFFFFFFFFFFFFFFFFCA3379F
                F5FFFDD6610D0467DFFFFFFFFFFFFFFBAB20022D9EF5FAA31500000A62DDFFFF
                FFFFFCAA2900000146E6FEE2660800000A65E4FFFFFCAC290200002FB7FAFFFF
                EF760F00000259DDF7A21D00000338C1FFFFFFFFFFEC72070000005F9A210000
                0038BEFFFFFFFFFFFFFFED690C000008110000002CC2FFFFFFFFFFFFFFFFFFE3
                6F0D000000000332B7FFFFFFFFFFFFFFFFFFFFFEDF56000000001CADFBFFFFFF
                FFFFFFFFFFFFFFF7A52100000000095EDDFFFFFFFFFFFFFFFFFFFCA521000000
                0200000056E4FFFFFFFFFFFFFFFBAB1D000000315A0C00000265DFFFFFFFFFFF
                FCAA2900000030BBDE6E0A00000A62DDFFFFFFFCAC290200002DB8FBFEE26608
                00000A67E5FFFAAD1F00000338C1FFFFFFFFEF750F00000256EAFBB831030038
                BEFFFFFFFFFFFFEC720700136DEDFFF8B23630C2FFFFFFFFFFFFFFFFEC6A1F77
                E7FFFFFFF8BDC7FFFFFFFFFFFFFFFFFFFFE5B1E7FFFFFFFFFFFCFEFFFFFFFFFF
                FFFFFFFFFFFEFCFFFFFF}
              SpeedButtonOptions.Flat = True
              SpeedButtonOptions.Transparent = True
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object chbSituacao: TcxDBCheckBox
              Left = 241
              Top = 66
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
              Style.BorderStyle = ebsUltraFlat
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = 4210688
              Style.IsFontAssigned = True
              TabOrder = 5
              Height = 21
              Width = 55
            end
          end
        end
      end
      object tbsPermissao: TcxTabSheet
        Caption = 'Permiss'#245'es'
        ImageIndex = 1
        TabVisible = False
        ExplicitTop = 0
        ExplicitWidth = 898
        ExplicitHeight = 409
        object grdRotinas: TcxGrid
          Left = 252
          Top = 78
          Width = 442
          Height = 256
          Align = alClient
          PopupMenu = PopupMenu2
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          ExplicitWidth = 646
          ExplicitHeight = 331
          object grdRotinasDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = True
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            Navigator.Visible = True
            OnCellClick = grdRotinasDBTableView1CellClick
            OnCustomDrawCell = grdRotinasDBTableView1CustomDrawCell
            DataController.DataSource = dsRotina
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsData.Appending = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            OnCustomDrawGroupCell = grdRotinasDBTableView1CustomDrawGroupCell
            object grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn
              Caption = 'Rotina'
              DataBinding.FieldName = 'DESCROTINA'
              MinWidth = 320
              Options.Editing = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Width = 320
            end
            object grdRotinasDBTableView1pIncluir: TcxGridDBColumn
              Caption = 'Inc.'
              DataBinding.FieldName = 'pIncluir'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pAlterar: TcxGridDBColumn
              Caption = 'Alt.'
              DataBinding.FieldName = 'pAlterar'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pExcluir: TcxGridDBColumn
              Caption = 'Exc.'
              DataBinding.FieldName = 'pExcluir'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pPesquisar: TcxGridDBColumn
              Caption = 'Pes.'
              DataBinding.FieldName = 'pPesquisar'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pRelatorio: TcxGridDBColumn
              Caption = 'Imp.'
              DataBinding.FieldName = 'pRelatorio'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1pEspecial: TcxGridDBColumn
              Caption = 'Esp.'
              DataBinding.FieldName = 'pEspecial'
              RepositoryItem = dtmLookup.Combo_Permissao
              MinWidth = 40
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.IncSearch = False
              Options.Grouping = False
              Options.Moving = False
              Options.Sorting = False
              Width = 40
            end
            object grdRotinasDBTableView1DBColumn1: TcxGridDBColumn
              Caption = 'Chave Rotina'
              DataBinding.FieldName = 'CHAVE_ROTINA'
              Visible = False
              Options.Editing = False
              Options.Focusing = False
              Options.Grouping = False
              Width = 120
            end
          end
          object grdRotinasLevel1: TcxGridLevel
            GridView = grdRotinasDBTableView1
          end
        end
        object cxGridBasica: TcxGrid
          Left = 0
          Top = 78
          Width = 252
          Height = 256
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          RootLevelStyles.TabsBackground = dtmControles.cxStyle1
          ExplicitHeight = 331
          object gridMenus: TcxGridDBTableView
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
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dtsMenu
            DataController.Filter.Active = True
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ColumnHeaderHints = False
            OptionsData.CancelOnExit = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Background = dtmControles.cxStyle1
            Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
            object gridMenusDESCRICAO: TcxGridDBColumn
              Caption = 'Menu'
              DataBinding.FieldName = 'DESCRICAO'
              MinWidth = 0
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringMRUItemsList = False
              Options.Focusing = False
              Options.Grouping = False
              Options.Moving = False
              Width = 160
            end
          end
          object cxGridBasicaLevel1: TcxGridLevel
            GridView = gridMenus
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 694
          Height = 40
          Align = alTop
          BevelInner = bvLowered
          Color = 13034466
          ParentBackground = False
          TabOrder = 2
          ExplicitWidth = 898
          object Label1: TLabel
            Left = 13
            Top = 14
            Width = 39
            Height = 13
            Caption = 'Grupo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lcbGrupos: TcxLookupComboBox
            Left = 66
            Top = 12
            ParentFont = False
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.GridMode = True
            Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
            Properties.ListColumns = <
              item
                Caption = 'Descri'#231#227'o'
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsGrupo
            Properties.OnChange = lcbGruposPropertiesChange
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 393
          end
          object btnAtualizaGrupo: TcxButton
            Left = 466
            Top = 11
            Width = 95
            Height = 22
            Caption = 'Atualizar'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            OptionsImage.Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              08000000000090010000120B0000120B0000000100000000000000000000D4D4
              D4006C6C6C003E3E3E00ACACAC0028282800FFFFFF001C1C1C00838383005555
              5500F3F3F300BBBBBB000E0E0E00E0E0E00030303000C6C6C600959595004646
              46006262620072727200232323000808080014141400EBEBEB00363636007C7C
              7C0050505000F7F7F70006060600D9D9D9002C2C2C00D0D0D0008B8B8B002626
              2600B2B2B20044444400191919001E1E1E00E7E7E70066666600F1F1F100DBDB
              DB005B5B5B00F9F9F900707070007676760089898900CCCCCC002A2A2A001111
              11000B0B0B00B1B1B1003A3A3A00999999006666660054545400E5E5E5004B4B
              4B00B6B6B600DFDFDF00F5F5F5003333330000000000D7D7D700FBFBFB004040
              4000BDBDBD00202020006E6E6E005D5D5D001A1A1A0058585800858585003838
              38007F7F7F000000000000000000000000000000000000000000000000000000
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
              0000000000000000000000000000000000000000000000000000060606060606
              1D2C240000242C3F060606060606062A0B06064825000000000000074A1B0606
              0606061C1C13231C1C1C073434071C1C1C492606060606151515151541332806
              0628331815153D3C0606063232323232130606060606061B093232190606060C
              0C0C0C0C0C1E1F06060606062B180C07010606313131313130023F0606060606
              0622313127060616160745330A06060606060606060A07163D06060210380606
              0606060606060606060604022F06060606060606060606060606060606060606
              06060606060606060606060606060606060606060606061F1333060606060606
              06060606060626351306060343300A06060606060606060A3A2705434306062C
              14140B0606060606061D2D34141414141406061D3D2139400606060606014121
              2121212121060606200505021B0606060606060805050505050606061B1A1E1E
              1A0B0A06060A0B2A1E1E1E1E1E0606060617471E1E1E414747411E1E1E122E1E
              1E06060606062B10110E0E0E0E0E0E113506060F2D060606060606063B20113D
              3D11200D060606060606}
            TabOrder = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnAtualizaGrupoClick
          end
        end
        object pnlCopiarPermissoa: TPanel
          Left = 0
          Top = 40
          Width = 694
          Height = 38
          Align = alTop
          BevelInner = bvLowered
          Color = 13034466
          ParentBackground = False
          TabOrder = 3
          Visible = False
          ExplicitWidth = 898
          object Label4: TLabel
            Left = 13
            Top = 13
            Width = 48
            Height = 13
            Caption = 'Destino:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210688
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbxGrupoDestino: TcxLookupComboBox
            Left = 66
            Top = 10
            ParentFont = False
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
            Properties.ListColumns = <
              item
                Caption = 'Descri'#231#227'o'
                FieldName = 'DESCRICAO'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsGrupo
            Style.StyleController = dtmControles.cxEsc_EditsNormal
            TabOrder = 0
            Width = 393
          end
          object btnCancelarCopia: TcxButton
            Left = 564
            Top = 8
            Width = 95
            Height = 22
            Caption = 'Cancelar'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
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
              F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFDE7
              B55F180101185FB5E7FDFFFFFFFFFFFFFFF4BB56160209131309021656BBF4FF
              FFFFFFFFEE93290A2859829A9A825823092993EEFFFFFFF49420081275E4F8FE
              FEF8E3B854092094F4FFFEBD2A0B0B0D35B7FEFFFFFFFFFDE9550B2BBEFEE95E
              1118100E0E2CAEF9FFFFFFFFFFE8550F5EE9BB212F783A10101031AFFEFFFFFF
              FFFDB82A21BB691363E5BA3112121230BAFEFFFFFFFFE561126A2B1D8CF9FEB1
              351515153FB5FEFFFFFFF88A1C2B1B29A3FFFFF9B23619191B41BBFEFFFFFEA2
              291B1C2AA4FFFFFFFEBB421D1B1B39B4F9FFFEA32A1C332591F9FFFFFFFDB746
              1E1E1E3EB5FEF98E253372206BE6FFFFFFFFFEBD3C2020203DBDE76C2173BF32
              3BC0FEFFFFFFFFFEB54022222248823E32C0EB6D2765EBFFFFFFFFFFF9B54025
              25272D276DEBFEC5442969EBFDFFFFFFFFFEBF4D2A282944C5FEFFF5A33F2B6C
              C2E8F9FFFEF9E888332B3FA3F5FFFFFFF1A3492F467396ABAB96734A304AA3F1
              FFFFFFFFFFF5C6733F2F353E3E352F3F73C6F5FFFFFFFFFFFFFFFDECC47E4534
              34447CC3ECFDFFFFFFFF}
            TabOrder = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnCancelarCopiaClick
          end
          object btnConfirmarCopiaGrupo: TcxButton
            Left = 465
            Top = 8
            Width = 95
            Height = 22
            Caption = 'Confirmar'
            Colors.Default = clWhite
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
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
            TabOrder = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnConfirmarCopiaGrupoClick
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 521
    Top = 15
  end
  inherited DataSetAncestral: TI9Query
    SQL.Strings = ('select * from '#13#10'G_USUARIO '#13#10'order by NOME_COMPLETO')
    Left = 551
    Top = 15
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 583
    Top = 15
  end
  inherited ClientAncestral: TClientDataSet
    BeforeOpen = ClientAncestralBeforeOpen
    AfterOpen = ClientAncestralAfterOpen
    AfterScroll = ClientAncestralAfterScroll
    Left = 615
    Top = 15
    object ClientAncestralUSUARIO_ID: TBCDField
      FieldName = 'USUARIO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object ClientAncestralTROCARSENHA: TStringField
      FieldName = 'TROCARSENHA'
      Size = 1
    end
    object ClientAncestralLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object ClientAncestralSENHA: TStringField
      FieldName = 'SENHA'
      Size = 60
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 647
    Top = 15
  end
  object sqlGrupo: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT DISTINCT UG.* FROM G_USUARIO_SISTEMA US'#13#10'LEFT JOIN G_USUA' +
      'RIO_GRUPO UG ON'#13#10'   US.USUARIO_GRUPO_ID = UG.USUARIO_GRUPO_ID'#13#10'W' +
      'HERE US.SISTEMA_ID = :SISTEMA_ID AND'#13#10'               UG.SITUACAO' +
      ' =  '#39'A'#39'        '#13#10'ORDER BY UG.DESCRICAO')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'SISTEMA_ID'
        ParamType = ptInput
        Value = '7'
      end>
    Params = <>
    Left = 439
    Top = 309
    object sqlGrupoUSUARIO_GRUPO_ID: TBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlGrupoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dsGrupo: TDataSource
    DataSet = sqlGrupo
    Left = 471
    Top = 309
  end
  object dsRotina: TDataSource
    DataSet = sqlRotina
    Left = 401
    Top = 308
  end
  object sqlGrupoUsuario: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'select * from G_USUARIO_GRUPO'#13#10'where SITUACAO = '#39'A'#39#13#10'order by DE' +
      'SCRICAO')
    ParamData = <>
    Params = <>
    Left = 509
    Top = 309
    object FMTBCDField1: TBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object dtsGrupoUsuario: TDataSource
    DataSet = sqlGrupoUsuario
    Left = 541
    Top = 309
  end
  object ImageList1: TImageList
    Left = 316
    Top = 88
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001094CE001094CE001094CE001094CE001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD0042ADBD0042CEEF005ADEFF005ADEFF005ADEFF0042CEEF001094
      CE001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE00000000000000000000000000000000000000000042AD
      BD0042CEEF009CE7FF009CE7FF009CE7FF00000000005ADEFF005ADEFF005ADE
      FF0042CEEF001094CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE0000000000000000000000000042ADBD0042CE
      EF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF005ADE
      FF005ADEFF0042CEEF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF009CE7FF009CE7FF009CE7FF009CE7FF00000000009CE7FF009CE7FF009CE7
      FF005ADEFF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF00ADF7FF009CE7FF009CE7FF000000000000000000000000009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE0000000000000000000000000042ADBD00ADF7
      FF00ADF7FF00ADF7FF009CE7FF008484840000000000848484009CE7FF009CE7
      FF009CE7FF005ADEFF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE0000000000000000000000000042ADBD0042CE
      EF00ADF7FF00ADF7FF00ADF7FF00ADF7FF009CE7FF009CE7FF009CE7FF009CE7
      FF009CE7FF0042CEEF001094CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD00000000000000000000000000000000000000000042AD
      BD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042ADBD0042AD
      BD0042ADBD0042ADBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001094CE001094CE001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD009CE7FF001094CE0000000000000000000000000042ADBD009CE7
      FF001094CE000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042ADBD0042CEEF0042CEEF001094CE001094CE001094CE0042CEEF0042CE
      EF001094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042ADBD0042CEEF009CE7FF009CE7FF009CE7FF0042CEEF001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042ADBD0042ADBD0042ADBD0042ADBD001094CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC1FFC1F00000000F007F00700000000
      E003E00300000000C001C00100000000C001C00100000000C001C00100000000
      C001C00100000000C001C00100000000E003E00300000000FFC7F1C700000000
      F1C7F1C700000000F1C7F00700000000F1C7F80F00000000F007FC1F00000000
      F80FFFFF00000000FC1FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object sqlMenu: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'select * from G_SISTEMA_MENU '#13#10'where SISTEMA_ID = :SISTEMA_ID'#13#10'o' +
      'rder by DESCRICAO')
    ParamData = <
      item
        DataType = ftBCD
        Name = 'SISTEMA_ID'
        ParamType = ptInput
      end>
    Params = <>
    BeforeOpen = sqlMenuBeforeOpen
    AfterOpen = sqlMenuAfterOpen
    AfterScroll = sqlMenuAfterScroll
    Left = 583
    Top = 309
    object sqlMenuSISTEMA_MENU_ID: TBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlMenuDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object sqlMenuSISTEMA_ID: TBCDField
      FieldName = 'SISTEMA_ID'
      Precision = 15
      Size = 2
    end
  end
  object dtsMenu: TDataSource
    DataSet = sqlMenu
    Left = 615
    Top = 309
  end
  object PopupMenu1: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 731
    Top = 42
    object CopirarPermisso1: TMenuItem
      Caption = 'Copirar Permiss'#227'o'
      ImageIndex = 2
      OnClick = CopirarPermisso1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 491
    Top = 250
    object MarcarEste1: TMenuItem
      Caption = 'Marcar Este'
      ImageIndex = 6
      OnClick = MarcarEste1Click
    end
    object DesmarcarEste1: TMenuItem
      Caption = 'Desmarcar Este'
      ImageIndex = 7
      OnClick = DesmarcarEste1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MarcarTodos1: TMenuItem
      Caption = 'Marcar Todos'
      ImageIndex = 0
      OnClick = MarcarTodos1Click
    end
    object DesmarcarTodos1: TMenuItem
      Caption = 'Desmarcar Todos'
      ImageIndex = 1
      OnClick = DesmarcarTodos1Click
    end
  end
  object sqlRotina: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'SELECT R.SISTEMA_ROTINA_ID,'#13#10'       R.DESCRICAO DESCROTINA,'#13#10'   ' +
      '    R.SISTEMA_MENU_ID,'#13#10'       R.CHAVE_ROTINA,'#13#10'       PG.PERMIS' +
      'SAO'#13#10'FROM G_SISTEMA_ROTINA R'#13#10'LEFT JOIN G_PERMISSAO_GRUPO PG ON'#13 +
      #10'     R.SISTEMA_ROTINA_ID = PG.SISTEMA_ROTINA_ID AND'#13#10'     PG.US' +
      'UARIO_GRUPO_ID = :USUARIO_GRUPO_ID'#13#10'WHERE R.SISTEMA_MENU_ID = :S' +
      'ISTEMA_MENU_ID'#13#10'ORDER BY  R.DESCRICAO')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USUARIO_GRUPO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SISTEMA_MENU_ID'
        ParamType = ptInput
      end>
    Params = <>
    BeforePost = sqlRotinaBeforePost
    AfterPost = sqlRotinaAfterPost
    OnCalcFields = sqlRotinaCalcFields
    Left = 366
    Top = 308
    object sqlRotinaCHAVE_ROTINA: TStringField
      FieldName = 'CHAVE_ROTINA'
      Size = 30
    end
    object sqlRotinaSISTEMA_MENU_ID: TBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Precision = 15
      Size = 2
    end
    object sqlRotinaDESCROTINA: TStringField
      FieldName = 'DESCROTINA'
      Size = 60
    end
    object sqlRotinaSISTEMA_ROTINA_ID: TBCDField
      FieldName = 'SISTEMA_ROTINA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlRotinaPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 10
    end
    object sqlRotinapIncluir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pIncluir'
      Size = 1
    end
    object sqlRotinapAlterar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pAlterar'
      Size = 1
    end
    object sqlRotinapExcluir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pExcluir'
      Size = 1
    end
    object sqlRotinapPesquisar: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pPesquisar'
      Size = 1
    end
    object sqlRotinapRelatorio: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pRelatorio'
      Size = 1
    end
    object sqlRotinapEspecial: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pEspecial'
      Size = 1
    end
  end
  object SimpleDataSet1: TI9Query
    Aggregates = <>
    Connection = dtmControles.DB
    SQL.Strings = (
      'select * from G_USUARIO_GRUPO'#13#10'where SITUACAO = '#39'A'#39#13#10'order by DE' +
      'SCRICAO')
    ParamData = <>
    Params = <>
    Left = 369
    Top = 253
    object FMTBCDField3: TBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 401
    Top = 253
  end
end
