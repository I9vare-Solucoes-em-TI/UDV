object frmPermissaogrupo: TfrmPermissaogrupo
  Left = 342
  Top = 213
  Caption = 'Permiss'#245'es por Grupo'
  ClientHeight = 304
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 108
    Width = 681
    Height = 177
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 684
    object grdRotinas: TcxGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 175
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitWidth = 682
      object grdRotinasDBTableView1: TcxGridDBTableView
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
        OnCellClick = grdRotinasDBTableView1CellClick
        DataController.DataSource = dsRotina
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
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dtmControles.GridTableViewStyleSheetDevExpress
        OnCustomDrawGroupCell = grdRotinasDBTableView1CustomDrawGroupCell
        object grdRotinasDBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = ImageList1
          Properties.Items = <
            item
              ImageIndex = 1
            end>
          MinWidth = 25
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 25
        end
        object grdRotinasDBTableView1DESCMENU: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'DESCMENU'
          Visible = False
          GroupIndex = 0
        end
        object grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn
          Caption = 'Rotinas'
          DataBinding.FieldName = 'DESCROTINA'
          Width = 400
        end
        object grdRotinasDBTableView1SISTEMA_ROTINA_ID: TcxGridDBColumn
          Caption = 'Rotinas'
          DataBinding.FieldName = 'SISTEMA_ROTINA_ID'
          Visible = False
        end
        object grdRotinasDBTableView1SISTEMA_MENU_ID: TcxGridDBColumn
          DataBinding.FieldName = 'SISTEMA_MENU_ID'
          Visible = False
        end
      end
      object grdRotinasLevel1: TcxGridLevel
        GridView = grdRotinasDBTableView1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 681
    Height = 67
    Align = alTop
    Color = 14807280
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 684
    object GroupBox1: TcxGroupBox
      Left = 7
      Top = 3
      Caption = 'Permiss'#245'es'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.StyleController = dtmControles.cxEditStyleGroup
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 58
      Width = 665
      object CheckBox6: TcxCheckBox
        Left = 34
        Top = 16
        Caption = 'Todas'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Transparent = True
        OnClick = CheckBox6Click
        Width = 88
      end
      object CheckBox1: TcxCheckBox
        Left = 34
        Top = 32
        Caption = 'Nenhuma'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Transparent = True
        OnClick = CheckBox1Click
        Width = 88
      end
      object CheckBox2: TcxCheckBox
        Left = 138
        Top = 15
        Caption = 'Incluir'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Transparent = True
        OnClick = CheckBox2Click
        Width = 88
      end
      object CheckBox3: TcxCheckBox
        Left = 138
        Top = 31
        Caption = 'Alterar'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Transparent = True
        OnClick = CheckBox2Click
        Width = 88
      end
      object CheckBox4: TcxCheckBox
        Left = 241
        Top = 15
        Caption = 'Excluir'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Transparent = True
        OnClick = CheckBox2Click
        Width = 88
      end
      object CheckBox5: TcxCheckBox
        Left = 241
        Top = 31
        Caption = 'Pesquisar'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Transparent = True
        OnClick = CheckBox2Click
        Width = 88
      end
      object CheckBox7: TcxCheckBox
        Left = 343
        Top = 15
        Caption = 'Administrador'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Transparent = True
        OnClick = CheckBox2Click
        Width = 112
      end
      object CheckBox8: TcxCheckBox
        Left = 343
        Top = 31
        Caption = 'Relat'#243'rio'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Transparent = True
        OnClick = CheckBox2Click
        Width = 88
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 285
    Width = 681
    Height = 19
    Panels = <>
    ExplicitWidth = 684
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 41
    Align = alTop
    Color = 13034466
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 684
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 39
      Height = 13
      Caption = 'Grupo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lcbGrupos: TcxLookupComboBox
      Left = 58
      Top = 11
      ParentFont = False
      Properties.KeyFieldNames = 'USUARIO_GRUPO_ID'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsGrupo
      Properties.OnEditValueChanged = lcbGruposPropertiesEditValueChanged
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 385
    end
    object btnAtualiza: TcxButton
      Left = 457
      Top = 8
      Width = 106
      Height = 25
      Caption = 'Atualizar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        FEFEFEF9F9F9F3F3F3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFCFCF4F4F4FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5D1
        D1D1E5E5E5D3D3D3DDDDDDF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2DBDBDB
        CFCFCFE8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDBDEDEDEFFFF
        FFE6E6E6C4C4C4CACACAE1E1E1E3E3E3E3E3E3DFDFDFC9C9C9C5C5C5E6E6E6FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFE1E1E1848484535353535353828282DCDCDCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777B9B9B9FFFFFFE9E9E96767671D
        1D1D1D1D1D1D1D1D1D1D1D1E1E1E1C1C1C676767ECECECFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF5050501D1D1DACACAC181818191919646464C2C2
        C2DCDCDCDADADAB9B9B95757571A1A1A1A1A1AC7C7C7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF7A7A7A1919191818183B3B3BD7D7D7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFBDBDBD1818181B1B1BEFEFEFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF757575191919191919787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD4D4D41B1B1B404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        6464641B1B1B1919191A1A1A7C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7E7E7E1B1B1BCDCDCDFFFFFFFFFFFFFFFFFFFFFFFF92929245
        4545494949464646393939D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDFDFDF191919878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FDFD1A1A1A444444FFFFFFFFFFFFFFFFFFFFFFFF7878787C7C7CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBE
        BEC4C4C4FFFFFFFFFFFFFFFFFFFFFFFF232323191919FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEC2C2C2D3D3D3D6D6D6D7D7D7FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF939393191919D0D0D0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFE8B8B8B1A1A1A1919191919191A1A1AB5B5B5FFFFFFFF
        FFFFFFFFFFFFFFFFF9F9F9191919313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF9D9D9D1E1E1E191919191919B8B8B8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB1B1B11818185F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF282828191919191919BBBBBBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF878787181818323232A4A4A4F2F2F2FFFFFFFFFFFFEAEAEA9A9A
        9A1D1D1D1919195555551A1A1ABABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB0B0B01919191919191919191919191919191919191919192C2C2C
        CECECEFFFFFF424242909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFCFCABABAB6767674343434646466C6C6CB6B6B6FFFFFFFFFFFFFF
        FFFFF1F1F1D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnAtualizaClick
    end
    object btnCancelar: TcxButton
      Left = 566
      Top = 8
      Width = 106
      Height = 25
      Caption = 'Fechar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      OptionsImage.Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        080000000000900100009B0E00009B0E0000000100000000000000000000D7D7
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
        0000000000000000000000000000000000000000000000000000050505130D00
        000000000000000000002405050505050A06000000000000000000000000001C
        050505050E00212D101010101010101010100C000A0505050F000B0505050505
        05050505050505001A0505050F000B0505050505050505050505050011050505
        0F000B050505050505052D061B050515010505050F000B050505050505051F00
        271E0504230505050F000B05050505050505190000152805050505050F000B05
        052700000000000000000020180505050F000B05051200000000000000000000
        032205050F000B05051200000000000000000000032205050F000B0505270000
        0000000000000020180505050F000B05050B1616161603000000000505050505
        0F000B050505050505051F00271E0504230505050F000B050505050505052C2B
        1B050515010505050F000B05050505050505050505050500110505050F000B05
        0505050505050505050505001A0505051D000705050505050505050505050500
        1A0505050A06000000000000000000000000001C0505050505130D0000000000
        00000000000024050505}
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object sqlRotina: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      
        'SELECT R.SISTEMA_ROTINA_ID,'#13#10'               R.DESCRICAO DESCROTI' +
        'NA,'#13#10'               R.SISTEMA_MENU_ID,'#13#10'               M.DESCRIC' +
        'AO DESCMENU'#13#10'FROM G_SISTEMA_ROTINA R'#13#10'LEFT JOIN G_SISTEMA_MENU M' +
        ' ON'#13#10'     R.SISTEMA_MENU_ID = M.SISTEMA_MENU_ID'#13#10'WHERE SISTEMA_I' +
        'D = :SISTEMA_ID'#13#10'ORDER BY M.DESCRICAO, R.DESCRICAO')
    Left = 208
    Top = 176
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlRotinaSISTEMA_ROTINA_ID: TBCDField
      FieldName = 'SISTEMA_ROTINA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlRotinaDESCROTINA: TStringField
      FieldName = 'DESCROTINA'
      Size = 60
    end
    object sqlRotinaSISTEMA_MENU_ID: TBCDField
      FieldName = 'SISTEMA_MENU_ID'
      Precision = 15
      Size = 2
    end
    object sqlRotinaDESCMENU: TStringField
      FieldName = 'DESCMENU'
      Size = 60
    end
  end
  object sqlGrupo: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      
        'SELECT UG.* FROM G_USUARIO_SISTEMA US'#13#10'LEFT JOIN G_USUARIO_GRUPO' +
        ' UG ON'#13#10'   US.USUARIO_GRUPO_ID = UG.USUARIO_GRUPO_ID'#13#10'WHERE US.S' +
        'ISTEMA_ID = :SISTEMA_ID AND'#13#10'               UG.SITUACAO =  '#39'A'#39'  ' +
        '      '#13#10'ORDER BY UG.DESCRICAO')
    Left = 328
    Top = 7
    ParamData = <
      item
        Name = 'SISTEMA_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
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
    Left = 360
    Top = 7
  end
  object ImageList1: TImageList
    Left = 536
    Top = 128
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
  object sqlPermgrupo: TI9Query
    Connection = dtmControles.DB
    SQL.Strings = (
      
        'select * '#13#10'from G_PERMISSAO_GRUPO'#13#10'where USUARIO_GRUPO_ID = :USU' +
        'ARIO_GRUPO_ID')
    Left = 208
    Top = 145
    ParamData = <
      item
        Name = 'USUARIO_GRUPO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object sqlPermgrupoUSUARIO_GRUPO_ID: TBCDField
      FieldName = 'USUARIO_GRUPO_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlPermgrupoSISTEMA_ROTINA_ID: TBCDField
      FieldName = 'SISTEMA_ROTINA_ID'
      Required = True
      Precision = 15
      Size = 2
    end
    object sqlPermgrupoPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 10
    end
  end
  object dsRotina: TDataSource
    DataSet = sqlRotina
    Left = 248
    Top = 179
  end
end
