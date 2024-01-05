inherited frmServicoAbertura: TfrmServicoAbertura
  Left = 395
  Top = 335
  Caption = 'Novo Servi'#231'o'
  ClientHeight = 184
  ClientWidth = 579
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 585
  ExplicitHeight = 213
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 26
    Width = 579
    Height = 158
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 26
    ExplicitWidth = 579
    ExplicitHeight = 158
    inherited Shape1: TShape
      Width = 567
      Height = 146
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Brush.Color = 13034466
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 568
      ExplicitHeight = 147
    end
    inherited btnCancelar: TcxButton
      Left = 452
      Top = 111
      Width = 106
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      LookAndFeel.SkinName = ''
      ExplicitLeft = 452
      ExplicitTop = 111
      ExplicitWidth = 106
      ExplicitHeight = 25
    end
    object cxLabel1: TcxLabel
      Left = 17
      Top = 14
      Caption = 'Escrevente/Tabeli'#227'o'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 17
      Top = 59
      Caption = 'Nome Completo da Pessoa que se refere ao Ato'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Style.TextStyle = [fsBold]
      Transparent = True
    end
    object lcxEscrevente: TcxLookupComboBox
      Left = 18
      Top = 31
      RepositoryItem = dtmLookup.Lista_UsuarioAssinante
      ParentFont = False
      Properties.ListColumns = <>
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 3
      OnKeyDown = lcxEscreventeKeyDown
      Width = 540
    end
    object edtDescricao: TcxTextEdit
      Left = 18
      Top = 77
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 100
      Style.StyleController = dtmControles.cxEsc_EditsNormal
      TabOrder = 4
      OnKeyDown = edtDescricaoKeyDown
      Width = 540
    end
    object btnConfirmarItem: TcxButton
      Left = 343
      Top = 111
      Width = 106
      Height = 25
      HelpType = htKeyword
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
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnConfirmarItemClick
    end
    object cxLabel3: TcxLabel
      Left = 297
      Top = 59
      Caption = '(N'#227'o abreviar)'
      ParentFont = False
      Style.StyleController = dtmControles.cxStyleLabel
      Style.TextColor = clRed
      Style.TextStyle = [fsBold]
      Transparent = True
    end
  end
  object Panel4: TPanel [1]
    Left = 0
    Top = 0
    Width = 579
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Color = 4210688
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4210688
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object imgPagar: TImage
      Left = 0
      Top = 0
      Width = 28
      Height = 26
      Align = alLeft
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
        000000180806000000E0773DF80000000467414D410000B18E7CFB5193000000
        206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A
        980000176F925FC546000000097048597300000B0D00000B0D01ED07C02C0000
        05D549444154484BB5957750545714C61F26C620D8828818FE72741C4B6C0C0E
        9811CB685688802018B106155C0C11515940A4875EA4EAD26D34C195B6C02A2E
        2075411041406009A0A83411545C1696FD727705D4A09398999C996FE6DC3BE7
        7EBFDBDE7D1480FF55134999A7CC1496CF462357EB5F4E78D91A1EFF2FF2B4D9
        F57BB8E7C1032B97287F4B8DC738C05287DA8A5E3649878906885E8FE9D558FB
        DF48008CD6E1104DC96ACCFE3DE0204DCE0843AD247D172211A9150362A22F8B
        0198EB29478FD9BF07986C9F6E80A116623C82E70FE2D0916F8616F67EF0739D
        F076A09B9448482254DCAB440EE7B654925CD2073159B544D29A5ED0759523C7
        ECFF061075A0891B86323F1594F82D41FD556DDC0B598B96D2ABA44412438889
        8D859DBDA35431B197489F906890781349F3E7A0EB7C0AA04500237C64FB18E1
        86CD3A545E3587F8910B3A583A6848B7C2B0B01FE2913E8C087B493EAE1E0805
        DD131A16F611AB3698EBCCFFD40A6409A00E85714E68B9E50E74C462A0D014AD
        8934D4B3E818163C2387D20526F302AC4EDBC0C6EE9C540C5B7BA9247DE78343
        8855238EEB7E0EF0A6146F5F3E445F893D864A4CD0C536003F6E1B3A2A63C816
        3FC6A8808F367E09EA6AB8687898F791EA6BB9F8935F468EA49AAC40E93380D7
        B968E4DF47368783F6022FF0B34EE22E3B1AAD2D64A0F02146DFD682579A812C
        76023839491F292B2B0125C599E496971280E264005D57CEE07EF165ECB5BD02
        DFC472B43C798534361761F177E0164966589D430657E2CAA520383B9F83BBBB
        D3843CDC9DE1E2E280C8C820720FF23E0DB0D0973348490C82AA511081C4C321
        2C0F17A312E0EEE50FE33369484F4F24DF5101067BEEE055772EDE74DFC150F7
        5D08BA0AF0A68B8BC1AE7C8CBC2825351CD077284C0698FD2C6BD0FD280A86E6
        17A0B1271286562C98585F03DDC20E5B7787A2AE2A850CBE85E0C03F70D2D21A
        0C860D0C187AD074598B0DDECBB1DE75058CBDF5D0DF198D13BAF322C6EC3F38
        03DA3403F446A1B3F526DCFC63A17B2C0E1B8C13B151DF1FFE81E110F5B120EC
        65E16943020A0A82A14E0C69D1ABE0927B04417936F0CE3F0EE3244DD0988BA1
        BE4DF6B2C45B669ACC7B80A9F63443F17326460752C9D79E8CE6DA7870B2E3D0
        703F11A32F9389F9750CF7A640F0220946D1EB70F8E66624D77821BF2A1DEDED
        6DB85B9583D407C1F0283C8CC54E0BFA158EC9AD503E3DFB3D405B8DD212359D
        027A98187AEC07D1533FA0DB1FE2CE00081E078905EDA4DD190A66D67E6C8DFE
        01171F9821B2DC163955E46CC86BC1294EC5159E3B62AB19B0BEBD130B9C67C7
        CD7798A9340198FA15357DD3CA291EFBB4958B7C6CB7C3C78606078B0D60D037
        C3F5B7A5439ED69B44EE965BF0A3BD0AECF2F5115C6686B0622BA4DD8B91026E
        F1521159E40066D919845498422D60619FA29DFCD109C0787C2D3F47D6D4F562
        FCB5A40CA4B06E23F99A239A721491CECE40444C2234BCD7C0BD601FDABB9A21
        128E92E741F2C81106797E878523E8E9EA414411035B98CB31EFEC0CEF49806F
        E467513B5C98D49190EBBBFC2FE73477369A60B043016C4E26381C1EB69CD784
        77C151DCAEBA81DC8A3454D4174A01B58D95A49D8AEC4216C20B19D00C5D2A9A
        6B27673F09306DC62C6AA72B93DA1578833AE81FFD5D570DAD1A036A28E31D46
        46A617F65E5805CBF4DD08E01D8065DE5AF816FF2ADDA228AE2B4EE6A9C1BBC4
        18FE45E658E4AA54AE78565EF5B300FDC054CA39DC877A9AB151A5AF7059129E
        AD203FB7D5A8AA990B8DC085F0E2198351A10A9FF2BD10BF0422B84E38C35345
        58F511E845AB43D14EEED0F70E1FDCA2F1F810E048004FD26954D34D1DAA3D53
        C34850B3F4095E6F8677B216540317C1346F192C4B97C191AB0546813AAC4B34
        A013BB064A676786AA38CEA124FA07802FD591F113D592AE4D35A5EA514D2C9A
        D2004F2D8CCB76CB3C12E0D4BFC9773534980A508B990AF548452CF198C79F67
        37C39CCC5CE68B01CD693BA8A6345DAA8DA54D45C59CA2760764AEB60D4B6059
        048594AF77DB4357B0955DA37C6EB6DCB8F13BCDA1FE02EADFAA78AC874A8900
        00000049454E44AE426082}
      Transparent = True
    end
    object lblInformacaoCertidao: TcxLabel
      Left = 28
      Top = 0
      Align = alClient
      AutoSize = False
      Caption = '>> Abertura de Novo Servi'#231'o <<'
      ParentColor = False
      ParentFont = False
      Style.Color = 4210688
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold, fsUnderline]
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      Style.TextColor = clWhite
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 26
      Width = 551
      AnchorY = 13
    end
  end
  inherited DataSetAncestral: TI9Query
    Left = 99
    Top = 207
  end
  inherited ProviderAncestral: TDataSetProvider
    DataSet = nil
    Left = 131
    Top = 207
  end
  inherited ClientAncestral: TClientDataSet
    FieldDefs = <
      item
        Name = 'PAGINA_ID'
        DataType = ftInteger
      end
      item
        Name = 'DOCUMENTO_ID'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'NUMERO_REGISTRO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'LIVRO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NUMERO_PAGINAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'NUMERO_VIAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DATA_REGISTRO'
        DataType = ftTimeStamp
      end
      item
        Name = 'APRESENTANTE'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'VALOR_DOCUMENTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 3
      end
      item
        Name = 'TAXA_JUDICIARIA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 3
      end
      item
        Name = 'VALOR_CUSTAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 3
      end
      item
        Name = 'TIPO_DOCUMENTO_ID'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'EMOLUMENTO_ID'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 3
      end
      item
        Name = 'LIVRO_NUMERO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'LIVRO_PAGINA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'NUMERO_PESSOAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end>
    ProviderName = ''
    StoreDefs = True
    Left = 163
    Top = 207
    object ClientAncestralPAGINA_ID: TIntegerField
      FieldName = 'PAGINA_ID'
    end
    object ClientAncestralDOCUMENTO_ID: TBCDField
      FieldName = 'DOCUMENTO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralNUMERO_REGISTRO: TBCDField
      FieldName = 'NUMERO_REGISTRO'
      Precision = 15
      Size = 2
    end
    object ClientAncestralLIVRO: TStringField
      FieldName = 'LIVRO'
      Size = 3
    end
    object ClientAncestralNUMERO_PAGINAS: TBCDField
      FieldName = 'NUMERO_PAGINAS'
      Precision = 15
      Size = 2
    end
    object ClientAncestralNUMERO_VIAS: TBCDField
      FieldName = 'NUMERO_VIAS'
      Precision = 15
      Size = 2
    end
    object ClientAncestralDATA_REGISTRO: TSQLTimeStampField
      FieldName = 'DATA_REGISTRO'
    end
    object ClientAncestralAPRESENTANTE: TStringField
      FieldName = 'APRESENTANTE'
      Size = 120
    end
    object ClientAncestralOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 1
    end
    object ClientAncestralVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Precision = 15
      Size = 3
    end
    object ClientAncestralTAXA_JUDICIARIA: TBCDField
      FieldName = 'TAXA_JUDICIARIA'
      Precision = 15
      Size = 3
    end
    object ClientAncestralVALOR_CUSTAS: TBCDField
      FieldName = 'VALOR_CUSTAS'
      Precision = 15
      Size = 3
    end
    object ClientAncestralTIPO_DOCUMENTO_ID: TBCDField
      FieldName = 'TIPO_DOCUMENTO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralEMOLUMENTO_ID: TBCDField
      FieldName = 'EMOLUMENTO_ID'
      Precision = 15
      Size = 2
    end
    object ClientAncestralVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 15
      Size = 3
    end
    object ClientAncestralLIVRO_NUMERO: TBCDField
      FieldName = 'LIVRO_NUMERO'
      Precision = 15
      Size = 2
    end
    object ClientAncestralLIVRO_PAGINA: TBCDField
      FieldName = 'LIVRO_PAGINA'
      Precision = 15
      Size = 2
    end
    object ClientAncestralNUMERO_PESSOAS: TBCDField
      FieldName = 'NUMERO_PESSOAS'
      Precision = 15
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 195
    Top = 207
  end
end