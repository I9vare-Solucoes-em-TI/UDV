inherited frmCadPessoaUDV: TfrmCadPessoaUDV
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 340
  ClientWidth = 804
  ExplicitWidth = 810
  ExplicitHeight = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Width = 804
    ExplicitWidth = 804
    inherited PanelBotoesBasicos: TPanel
      Width = 615
      ExplicitWidth = 615
      inherited PanelBasicoBotoes: TPanel
        inherited cxBtnPesquisar: TcxButton
          Left = 325
          Visible = False
          ExplicitLeft = 325
        end
        inherited cxBtnCancelar: TcxButton
          Left = 133
          ExplicitLeft = 133
        end
        inherited cxBtnGravar: TcxButton
          Left = 69
          ExplicitLeft = 69
        end
        inherited cxBtnExcluir: TcxButton
          Left = 261
          ExplicitLeft = 261
        end
        inherited cxBtnAlterar: TcxButton
          Left = 197
          ExplicitLeft = 197
        end
        inherited cxBtnIncluir: TcxButton
          Left = 5
          ExplicitLeft = 5
        end
      end
    end
    inherited PanelBotaoFechar: TPanel
      Left = 617
      Width = 185
      ExplicitLeft = 617
      ExplicitWidth = 185
      inherited cxBtnFechar: TcxButton
        Left = 129
        Top = 7
        ExplicitLeft = 129
        ExplicitTop = 7
      end
      object btnUltimo: TcxButton
        Left = 88
        Top = 29
        Width = 29
        Height = 23
        Cursor = crHandPoint
        Hint = #218'ltimo Registro'
        Colors.Default = clBlue
        Colors.Normal = 15513994
        Colors.Hot = 8421440
        Colors.Pressed = clGreen
        Colors.Disabled = clBtnFace
        OptionsImage.Glyph.Data = {
          CA050000424DCA05000000000000360000002800000015000000110000000100
          20000000000094050000120B0000120B00000000000000000000E7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FF009900FF009900FF009900FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFECCD
          B7FFE8C9AAFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FF009900FF009900FF0099
          00FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFAFC295FF50AB57FF88AE74FFE8C5A7FFE7C6
          A5FFE7C6A5FFE7C6A5FF009900FF009900FF009900FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE9C6
          ADFF4BA453FF56E385FF40BD5DFF98B587FFE7C7A7FFE7C6A5FFE7C6A5FF0099
          00FF009900FF009900FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFEACDB0FF6BA66CFF61DD87FF67EC
          96FF3FB255FFAAA77DFFE7C6A5FFE7C6A5FF009900FF009900FF009900FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C7A6FFCCC39AFF9CBC84FF82B26DFF77B2
          6AFF75B56BFF8BBE7FFF4E8D4BFF4BC96DFF76EEA0FF72EF9EFF4AAE5AFFC7BC
          9BFFE7C6A5FF009900FF009900FF009900FFE7C6A5FFE7C6A5FFE7C6A5FFD0C8
          A4FF6DB563FF3CB34AFF32BD53FF2EC55BFF30CB62FF3CD06AFF4BD273FF46C8
          68FF64E18CFF77ED9FFF7EF2A6FF6CE793FF56A85EFFDBC5A9FF009900FF0099
          00FF009900FFE7C6A5FFE7C6A5FFB8BA87FF40AD49FF40C15CFF3ACB63FF34CC
          66FF35CF6AFF3AD36DFF4DDC7DFF63E590FF6DED9BFF74EC9DFF7BEEA1FF7FF1
          A6FF91FDB8FF66E08BFF6BA263FF0A9908FF009900FF009900FFE7C6A5FFD7C4
          A3FF40AB46FF3DC259FF2AC04FFF25C354FF33CF69FF38D670FF3DDB75FF50E0
          81FF64E691FF69EA96FF73ED9CFF7DEFA3FF85F5ABFF8AF6ADFF94FFBDFF58BF
          70FF44A440FF009900FF009900FFE7C6A5FF85B977FF2DB645FF28BE4BFF21C4
          4CFF1EC045FF22B343FF1EA83CFF26AF46FF32BE56FF4DDB76FF69EE94FF74F1
          9FFF7DF3A6FF84F7AAFF92FFB8FF75F19CFF4A9152FF70B26EFF009900FF0099
          00FFE3C8A7FF3BA83FFF1DB63EFF14BA34FF189627FF437644FF6B7D67FF7B85
          77FF768072FF637961FF4F784FFF30913AFF68EB92FF76F4A2FF8CFFB7FF69E5
          8BFF3C8243FF9F9C9AFF35AD35FF009900FF009900FFD1C5A1FF26A832FF10B6
          2CFF1A8C21FF888883FFCFBAC0FFE2CBC0FFE8D3C4FFE9CFBEFFE4CBBFFFC2B3
          ACFF49A255FF71F19CFF7EFDAEFF52D374FF3F7A44FFB2ABAFFFEFD7C7FF0199
          01FF009900FF009900FFC8C8A9FF19A828FF0B9B19FF929A8FFFEED2C8FFE7C6
          A6FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FF98B274FF59D87BFF74FBA6FF44C9
          65FF386C37FFBEABB0FFF1DDCDFFE7C6A5FF009900FF009900FF009900FFCBCB
          B5FF0F9F19FF48994DFFE9CCCAFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE8C8A8FF98B58CFF3EB858FF33B44EFF537A52FFC8B9BDFFE8CAACFFE7C6
          A5FFE7C6A5FF019901FF009900FF009900FFE1D3C7FF1B971FFF78AB76FFEBCF
          B5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C7A7FFDBC6B8FF8190
          69FF697D66FFD0C4C8FFEBD0B5FFE7C6A5FFE7C6A5FFE7C6A5FF009900FF0099
          00FF009900FFEDD0BCFF509E50FF78AE6FFFE7C6A6FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFEAC9B2FFE9CAACFFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FF009900FF009900FF009900FFE8C7A7FFA7B1
          9EFF99B99AFFE9CCAEFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FF009900FF009900FF009900FF}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnUltimoClick
      end
      object btnProximo: TcxButton
        Left = 60
        Top = 29
        Width = 29
        Height = 23
        Cursor = crHandPoint
        Hint = 'Pr'#243'ximo N'#250'mero'
        Colors.Default = clBlue
        Colors.Normal = 15513994
        Colors.Hot = 8421440
        Colors.Pressed = clGreen
        Colors.Disabled = clBtnFace
        OptionsImage.Glyph.Data = {
          CA050000424DCA05000000000000360000002800000015000000110000000100
          20000000000094050000120B0000120B00000000000000000000E7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFECCDB7FFE8C9AAFFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFAFC295FF50AB57FF88AE74FFE8C5A7FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE9C6ADFF4BA453FF56E385FF40BD
          5DFF98B587FFE7C7A7FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFEACDB0FF6BA66CFF61DD87FF67EC96FF3FB255FFAAA77DFFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C7A6FFCCC39AFF9CBC84FF82B26DFF77B26AFF75B56BFF8BBE7FFF4E8D
          4BFF4BC96DFF76EEA0FF72EF9EFF4AAE5AFFC7BC9BFFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFD0C8A4FF6DB563FF3CB34AFF32BD
          53FF2EC55BFF30CB62FF3CD06AFF4BD273FF46C868FF64E18CFF77ED9FFF7EF2
          A6FF6CE793FF56A85EFFDBC5A9FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFB8BA87FF40AD49FF40C15CFF3ACB63FF34CC66FF35CF6AFF3AD36DFF4DDC
          7DFF63E590FF6DED9BFF74EC9DFF7BEEA1FF7FF1A6FF91FDB8FF66E08BFF6BA2
          63FFE6C4A5FFE7C6A5FFE7C6A5FFE7C6A5FFD7C4A3FF40AB46FF3DC259FF2AC0
          4FFF25C354FF33CF69FF38D670FF3DDB75FF50E081FF64E691FF69EA96FF73ED
          9CFF7DEFA3FF85F5ABFF8AF6ADFF94FFBDFF58BF70FFCFBFA3FFE7C6A5FFE7C6
          A5FFE7C6A5FF85B977FF2DB645FF28BE4BFF21C44CFF1EC045FF22B343FF1EA8
          3CFF26AF46FF32BE56FF4DDB76FF69EE94FF74F19FFF7DF3A6FF84F7AAFF92FF
          B8FF75F19CFF4A9152FFDBC7BAFFE7C6A5FFE7C6A5FFE3C8A7FF3BA83FFF1DB6
          3EFF14BA34FF189627FF437644FF6B7D67FF7B8577FF768072FF637961FF4F78
          4FFF30913AFF68EB92FF76F4A2FF8CFFB7FF69E58BFF3C8243FF9F9C9AFFECD0
          B7FFE7C6A5FFE7C6A5FFD1C5A1FF26A832FF10B62CFF1A8C21FF888883FFCFBA
          C0FFE2CBC0FFE8D3C4FFE9CFBEFFE4CBBFFFC2B3ACFF49A255FF71F19CFF7EFD
          AEFF52D374FF3F7A44FFB2ABAFFFEFD7C7FFE7C6A5FFE7C6A5FFE7C6A5FFC8C8
          A9FF19A828FF0B9B19FF929A8FFFEED2C8FFE7C6A6FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FF98B274FF59D87BFF74FBA6FF44C965FF386C37FFBEABB0FFF1DD
          CDFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFCBCBB5FF0F9F19FF48994DFFE9CC
          CAFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE8C8A8FF98B58CFF3EB8
          58FF33B44EFF537A52FFC8B9BDFFE8CAACFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE1D3C7FF1B971FFF78AB76FFEBCFB5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C7A7FFDBC6B8FF819069FF697D66FFD0C4C8FFEBD0
          B5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFEDD0BCFF509E
          50FF78AE6FFFE7C6A6FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFEAC9B2FFE9CAACFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE8C7A7FFA7B19EFF99B99AFFE9CCAEFFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE8CFBDFFE3CFBFFFE8C8A8FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FF}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnProximoClick
      end
      object btnAnterior: TcxButton
        Left = 32
        Top = 29
        Width = 29
        Height = 23
        Cursor = crHandPoint
        Hint = 'N'#250'mero Anterior'
        Colors.Default = clBlue
        Colors.Normal = 15513994
        Colors.Hot = 8421440
        Colors.Pressed = clGreen
        Colors.Disabled = clBtnFace
        OptionsImage.Glyph.Data = {
          CA050000424DCA05000000000000360000002800000015000000110000000100
          20000000000094050000120B0000120B00000000000000000000E7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE8C9AAFFECCDB7FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C5A7FF89AF75FF50AB57FFAFC295FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C7A6FF9AB588FF41BD5DFF56E3
          85FF4AA452FFE8C6ADFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFACA77EFF40B155FF67EC96FF61DD87FF6AA66BFFEACDB0FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFC8BC9BFF4AAD5AFF72EF
          9DFF76EEA0FF4BC96DFF4E8D4BFF8BBE80FF76B56CFF78B26AFF83B36DFF9DBC
          84FFCCC39AFFE7C7A6FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFDCC5AAFF57A85EFF6CE692FF7EF2A6FF77ED9FFF64E18CFF46C8
          68FF4BD273FF3CD06AFF30CB62FF2EC55BFF32BD53FF3CB34BFF6DB563FFD0C8
          A4FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE6C4A5FF6DA264FF66DF
          8AFF91FDB8FF7FF1A6FF7BEEA1FF74EC9DFF6DED9BFF63E590FF4DDC7DFF3AD3
          6DFF35CF6AFF34CC66FF3ACB63FF40C15CFF40AD49FFB8BA87FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFCFBFA3FF59BF70FF94FFBDFF8AF6ADFF85F5ABFF7DEF
          A3FF73ED9CFF69EA96FF64E691FF50E081FF3DDB75FF38D670FF33CF69FF25C3
          54FF2AC04FFF3DC259FF40AB46FFD7C4A3FFE7C6A5FFE7C6A5FFE7C6A5FFDBC7
          BAFF4A9152FF75F19CFF92FFB8FF84F7AAFF7DF3A6FF74F19FFF69EE95FF4DDC
          76FF32BF56FF26AF46FF1EA83CFF22B343FF1EC045FF21C44CFF28BE4BFF2DB6
          45FF85B977FFE6C6A5FFE7C6A5FFE7C6A5FFECD1B8FF9F9C9AFF3C8243FF69E5
          8BFF8CFFB7FF76F4A2FF68EB92FF30923BFF4F784FFF627961FF758072FF7A85
          77FF6B7D67FF437644FF189627FF14BA34FF1DB63EFF3AA83EFFE3C8A7FFE7C6
          A5FFE7C6A5FFE7C6A5FFEFD7C7FFB2ABAFFF3F7A44FF52D374FF7EFDAEFF71F1
          9CFF49A255FFC1B2ACFFE4CBBFFFE8CFBEFFE8D2C4FFE1CCC0FFCFBAC0FF8888
          83FF1A8C21FF10B62CFF25A832FFD1C5A1FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFF1DDCDFFBEABB0FF386C37FF44C965FF74FBA6FF58D87BFF98B273FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A6FFEED2C8FF929A8FFF0B9B19FF19A8
          28FFC8C8A9FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE8CAACFFC8B9
          BDFF537A52FF33B44EFF3EB858FF97B58BFFE8C8A8FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFEACCCAFF48994DFF0F9F19FFCBCBB5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFEBD0B5FFD0C4C8FF687D65FF808F
          68FFDBC6B8FFE7C7A7FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFEBCF
          B5FF78AB76FF1B971FFFE1D2C7FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE9CAACFFEAC9B2FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A6FF78AF6FFF4F9E4FFFECD0
          BBFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE9CCAEFF99B99AFFA7B19EFFE7C7A7FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE8C8A8FFE3CF
          BFFFE8CFBDFFE7C6A5FFE7C6A5FF}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnAnteriorClick
      end
      object btnPrimeiro: TcxButton
        Left = 4
        Top = 29
        Width = 29
        Height = 23
        Cursor = crHandPoint
        Hint = 'Primeiro Registro'
        Colors.Default = clBlue
        Colors.Normal = 15513994
        Colors.Hot = 8421440
        Colors.Pressed = clGreen
        Colors.Disabled = clBtnFace
        OptionsImage.Glyph.Data = {
          CA050000424DCA05000000000000360000002800000015000000110000000100
          20000000000094050000120B0000120B00000000000000000000009900FF0099
          00FF009900FFE7C6A5FFE7C6A5FFE7C6A5FFE8C9AAFFECCDB7FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FF009900FF009900FF009900FFE7C6A5FFE7C6
          A5FFE7C5A7FF89AF75FF50AB57FFAFC295FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FF009900FF009900FF009900FFE7C6A5FFE7C7A6FF9AB588FF41BD5DFF56E3
          85FF4AA452FFE8C6ADFFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FF009900FF009900FF0099
          00FFE7C6A5FFACA77EFF40B155FF67EC96FF61DD87FF6AA66BFFEACDB0FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FF009900FF009900FF009900FFC8BC9BFF4AAD5AFF72EF
          9DFF76EEA0FF4BC96DFF4E8D4BFF8BBE80FF76B56CFF78B26AFF83B36DFF9DBC
          84FFCCC39AFFE7C7A6FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FF0099
          00FF009900FF009900FF57A85EFF6CE692FF7EF2A6FF77ED9FFF64E18CFF46C8
          68FF4BD273FF3CD06AFF30CB62FF2EC55BFF32BD53FF3CB34BFF6DB563FFD0C8
          A4FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FF009900FF009900FF009900FF66DF
          8AFF91FDB8FF7FF1A6FF7BEEA1FF74EC9DFF6DED9BFF63E590FF4DDC7DFF3AD3
          6DFF35CF6AFF34CC66FF3ACB63FF40C15CFF40AD49FFB8BA87FFE7C6A5FFE7C6
          A5FFE7C6A5FF009900FF009900FF009900FF94FFBDFF8AF6ADFF85F5ABFF7DEF
          A3FF73ED9CFF69EA96FF64E691FF50E081FF3DDB75FF38D670FF33CF69FF25C3
          54FF2AC04FFF3DC259FF40AB46FFD7C4A3FFE7C6A5FFE7C6A5FF009900FF0099
          00FF009900FF75F19CFF92FFB8FF84F7AAFF7DF3A6FF74F19FFF69EE95FF4DDC
          76FF32BF56FF26AF46FF1EA83CFF22B343FF1EC045FF21C44CFF28BE4BFF2DB6
          45FF85B977FFE6C6A5FFE7C6A5FF009900FF009900FF009900FF3C8243FF69E5
          8BFF8CFFB7FF76F4A2FF68EB92FF30923BFF4F784FFF627961FF758072FF7A85
          77FF6B7D67FF437644FF189627FF14BA34FF1DB63EFF3AA83EFFE3C8A7FFE7C6
          A5FF009900FF009900FF009900FFB2ABAFFF3F7A44FF52D374FF7EFDAEFF71F1
          9CFF49A255FFC1B2ACFFE4CBBFFFE8CFBEFFE8D2C4FFE1CCC0FFCFBAC0FF8888
          83FF1A8C21FF10B62CFF25A832FFD1C5A1FFE7C6A5FF009900FF009900FF0099
          00FFF1DDCDFFBEABB0FF386C37FF44C965FF74FBA6FF58D87BFF98B273FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A6FFEED2C8FF929A8FFF0B9B19FF19A8
          28FFC8C8A9FFE7C6A5FF009900FF009900FF009900FFE7C6A5FFE8CAACFFC8B9
          BDFF537A52FF33B44EFF3EB858FF97B58BFFE8C8A8FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFEACCCAFF48994DFF0F9F19FFCBCBB5FFE7C6A5FF0099
          00FF009900FF009900FFE7C6A5FFE7C6A5FFEBD0B5FFD0C4C8FF687D65FF808F
          68FFDBC6B8FFE7C7A7FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFEBCF
          B5FF78AB76FF1B971FFFE1D2C7FFE7C6A5FF009900FF009900FF009900FFE7C6
          A5FFE7C6A5FFE7C6A5FFE9CAACFFEAC9B2FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A6FF78AF6FFF4F9E4FFFECD0
          BBFFE7C6A5FF009900FF009900FF009900FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE9CCAEFF99B99AFFA7B19EFFE7C7A7FFE7C6A5FF009900FF0099
          00FF009900FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6
          A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE7C6A5FFE8C8A8FFE3CF
          BFFFE8CFBDFFE7C6A5FFE7C6A5FF}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnPrimeiroClick
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 320
    Width = 804
    ExplicitTop = 320
    ExplicitWidth = 804
  end
  inherited PanelGeral: TPanel
    Width = 804
    Height = 264
    ExplicitWidth = 804
    ExplicitHeight = 264
    inherited PanelData: TPanel
      Width = 802
      Height = 262
      Align = alClient
      ExplicitWidth = 802
      ExplicitHeight = 262
      object pgcDados: TcxPageControl
        Left = 1
        Top = 33
        Width = 800
        Height = 228
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet1
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 228
        ClientRectRight = 800
        ClientRectTop = 24
        object cxTabSheet1: TcxTabSheet
          Caption = 'Dados do Associado'
          ImageIndex = 0
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 800
            Height = 204
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            object Bevel1: TBevel
              Left = 12
              Top = 33
              Width = 763
              Height = 25
              Shape = bsBottomLine
            end
            object sbnLimparFiltro: TSpeedButton
              Left = 293
              Top = 82
              Width = 22
              Height = 20
              Cursor = crHandPoint
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF000000B5000000B500FF00FF000000
                B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000B5000000B500FF00FF00FF00FF000000
                B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF000000B5000000B500FF00FF00FF00FF00FF00FF000000
                B5000000B5000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF000000D6000000BD000000B5000000B500FF00FF00FF00FF00FF00FF00FF00
                FF000000B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF000000B5000000B5000000B500FF00FF000000B5000000
                B5000000B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000B5000000C6000000C6000000CE000000
                B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF000000C6000000C6000000DE00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000B5000000D6000000CE000000DE000000
                EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF000000E7000000DE000000D600FF00FF00FF00FF000000
                E7000000EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000FF000000DE000000EF00FF00FF00FF00FF00FF00FF00FF00
                FF000000FF000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF000000F7000000F7000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF000000
                F7000000F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000F700FF00FF00FF00FF000000F7000000
                F7000000F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000F7000000
                F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              OnClick = sbnLimparFiltroClick
            end
            object btnAdGrupo: TSpeedButton
              Left = 272
              Top = 82
              Width = 19
              Height = 20
              Cursor = crHandPoint
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000E7C6A5E7C6A5
                E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6
                A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5D0BF9993AB775293513D
                8B443A8940488C468BA46DCDBC95E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
                E7C6A5B3B78C549A5A40984F7CC18E95D0A595CFA577BD88358C413D873EA9AF
                7FE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5B6B98F539D5F63B377A7DBB486CC9765
                BB7C63B97B85CB97A4D9B357A96A338338A9AF7FE7C6A5E7C6A5E7C6A5D4C29D
                64A66C69B87CA7DBB15FBB765BB97258B76F58B46E57B46E5AB673A4D9B259A9
                6B3E883FCEBC95E7C6A5E7C6A5A2B78A52AA67A9DDB363C0785EBD705FBB76FF
                FFFFFFFFFF58B76F57B46D5BB673A5DAB3378E428AA46DE7C6A5E7C6A573AF7B
                89CC9788D3956AC57962C06F54AA64FFFFFFFFFFFF58B76F58B76F5AB87184CC
                967ABD8C498D47E7C6A5E7C6A569AF7BA8DDB27CCF8974CC80FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF58B76F66BD7C9BD4AA398940E7C6A5E7C6A56CB27E
                B5E2BD8AD59679C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58B76F68C0
                7D9CD4A93D8C45E7C6A5E7C6A57DB787ABDDB5A5DFAE80CB8B7BC9856DBC78FF
                FFFFFFFFFF5AAB695FBB765BB9728AD1987FC491539553E7C6A5E7C6A5ACBF96
                84C796D2EED794D99F89D3937EC888FFFFFFFFFFFF78CD846AC27B6EC77DABDF
                B4449D5694AB79E7C6A5E7C6A5D7C4A17BB989A9DAB6D8F1DC91D89C87CD9283
                CC8D8AD49589D49482D28DAEE0B66AB87C579C5DD1BF9AE7C6A5E7C6A5E7C6A5
                C1C29C74B887AEDCBADCF2E0B5E4BC9ADBA495D99FA4DFAEBFE8C478C189569F
                61B4B88DE7C6A5E7C6A5E7C6A5E7C6A5E7C6A5C1C29C7CB88993CEA3C2E6CBCF
                EBD4C9E9CEAEDDB76CB87E65A76EB7BA90E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5
                E7C6A5E7C6A5D7C4A1ADBF967EB7886FB3816CB17D75B17DA4B88CD4C29DE7C6
                A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7
                C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5E7C6A5}
              OnClick = btnAdGrupoClick
            end
            object cxLabel29: TcxLabel
              Left = 103
              Top = 9
              Caption = 'Nome'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = clNavy
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel1: TcxLabel
              Left = 490
              Top = 9
              Caption = 'Grau'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = clNavy
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel2: TcxLabel
              Left = 637
              Top = 9
              Caption = 'Situa'#231#227'o'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = clNavy
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel4: TcxLabel
              Left = 9
              Top = 64
              Caption = 'Grupo Familiar'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel5: TcxLabel
              Left = 9
              Top = 108
              Caption = 'Email do Grupo'
              ParentColor = False
              Style.Color = clBtnFace
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel6: TcxLabel
              Left = 9
              Top = 9
              Caption = 'Data Cadastro'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              Style.TextColor = clNavy
              Style.TextStyle = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel3: TcxLabel
              Left = 316
              Top = 64
              Caption = 'Boleto por email'
              ParentColor = False
              Style.Color = clBtnFace
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel11: TcxLabel
              Left = 413
              Top = 64
              Caption = 'Email Pessoal'
              ParentColor = False
              Style.Color = clBtnFace
              Style.TextColor = clNavy
              Transparent = True
            end
            object edtData: TcxDBDateEdit
              Left = 11
              Top = 27
              DataBinding.DataField = 'DATA_CADASTRO'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              Properties.SaveTime = False
              Properties.ShowTime = False
              StyleDisabled.TextColor = clBlack
              TabOrder = 8
              Width = 85
            end
            object edtNome: TcxDBTextEdit
              Left = 103
              Top = 27
              DataBinding.DataField = 'NOME'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              ParentFont = False
              Properties.CharCase = ecUpperCase
              Style.Color = clSkyBlue
              Style.Shadow = True
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextColor = clBlue
              Style.TextStyle = [fsBold]
              StyleDisabled.TextColor = clBlack
              TabOrder = 9
              Width = 382
            end
            object icxGrau: TcxDBImageComboBox
              Left = 492
              Top = 27
              RepositoryItem = dtmLookup.Combo_Grau
              DataBinding.DataField = 'GRAU'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextStyle = [fsBold]
              StyleDisabled.TextColor = clBlack
              TabOrder = 10
              Width = 139
            end
            object icxSituacao: TcxDBImageComboBox
              Left = 638
              Top = 27
              RepositoryItem = dtmLookup.Combo_Situacao
              DataBinding.DataField = 'SITUACAO'
              DataBinding.DataSource = SourceAncestral
              Enabled = False
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              Style.TextStyle = [fsBold]
              StyleDisabled.TextColor = clBlack
              TabOrder = 11
              Width = 139
            end
            object cxLabel10: TcxLabel
              Left = 9
              Top = 153
              Caption = 'Observa'#231#227'o:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object lblEmailOutroAssociado: TcxLabel
              Left = 413
              Top = 108
              Caption = 'Associado de Email'
              ParentColor = False
              Style.Color = clBtnFace
              Style.TextColor = clNavy
              Transparent = True
            end
            object lcxGrupo: TcxDBLookupComboBox
              Left = 10
              Top = 82
              RepositoryItem = dtmLookup.Lista_GrupoAssociadoAtivo
              DataBinding.DataField = 'PESSOA_GRUPO_ID'
              DataBinding.DataSource = SourceAncestral
              Properties.DropDownListStyle = lsFixedList
              Properties.GridMode = True
              Properties.ListColumns = <>
              Properties.OnEditValueChanged = lcxGrupoPropertiesEditValueChanged
              TabOrder = 14
              Width = 259
            end
            object edtEmailGrupo: TcxTextEdit
              Left = 10
              Top = 126
              Enabled = False
              Properties.CharCase = ecLowerCase
              Style.BorderStyle = ebsOffice11
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clBlack
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 15
              Width = 395
            end
            object icxBoleto: TcxImageComboBox
              Left = 318
              Top = 82
              RepositoryItem = dtmLookup.Combo_SimNao
              Properties.Items = <>
              StyleDisabled.TextColor = clBlack
              TabOrder = 16
              Width = 85
            end
            object chxEmailOutroAssociado: TcxDBCheckBox
              Left = 612
              Top = 62
              Caption = 'Usar Email de Outro Associado'
              DataBinding.DataField = 'EMAIL_TERCEIRO'
              DataBinding.DataSource = SourceAncestral
              Properties.DisplayChecked = 'S'
              Properties.DisplayUnchecked = 'N'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Properties.OnEditValueChanged = chxEmailOutroAssociadoPropertiesEditValueChanged
              TabOrder = 17
              OnClick = chxEmailOutroAssociadoClick
              Width = 173
            end
            object edtEmail: TcxDBTextEdit
              Left = 412
              Top = 84
              DataBinding.DataField = 'EMAIL'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.CharCase = ecLowerCase
              Style.Shadow = True
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 18
              Width = 368
            end
            object lcxOutroAssociado: TcxDBLookupComboBox
              Left = 412
              Top = 126
              RepositoryItem = dtmLookup.Lista_Pessoas
              DataBinding.DataField = 'PESSOA_TERCEIRO_ID'
              DataBinding.DataSource = SourceAncestral
              Properties.DropDownListStyle = lsFixedList
              Properties.GridMode = True
              Properties.ListColumns = <>
              Properties.OnEditValueChanged = lcxOutroAssociadoPropertiesEditValueChanged
              TabOrder = 19
              Width = 368
            end
            object edtEmailOutroAssociado: TcxTextEdit
              Left = 411
              Top = 148
              Enabled = False
              Style.BorderStyle = ebsNone
              TabOrder = 20
              Width = 369
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 10
              Top = 174
              DataBinding.DataField = 'OBSERVACAO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.BorderStyle = ebsFlat
              Style.LookAndFeel.NativeStyle = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 21
              Width = 771
            end
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Dados Pessoais e Contato'
          ImageIndex = 1
          object pnlDadosPessoais: TPanel
            Left = 0
            Top = 0
            Width = 800
            Height = 204
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = clWindow
            ParentBackground = False
            TabOrder = 0
            object Bevel2: TBevel
              Left = 8
              Top = 36
              Width = 773
              Height = 8
              Shape = bsBottomLine
            end
            object lblEndereco: TcxLabel
              Left = 11
              Top = 56
              Caption = 'End.:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel34: TcxLabel
              Left = 295
              Top = 56
              Caption = 'Bairro:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel35: TcxLabel
              Left = 548
              Top = 56
              Caption = 'Cidade:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel36: TcxLabel
              Left = 11
              Top = 85
              Caption = 'UF:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object lblTelefone: TcxLabel
              Left = 295
              Top = 85
              Caption = 'Telefone(s):'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel38: TcxLabel
              Left = 95
              Top = 85
              Caption = 'Cep:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel30: TcxLabel
              Left = 11
              Top = 16
              Caption = 'Sexo:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel7: TcxLabel
              Left = 143
              Top = 16
              Caption = 'CPF:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object cxLabel8: TcxLabel
              Left = 295
              Top = 16
              Caption = 'Documento:'
              Style.TextColor = clNavy
              Transparent = True
            end
            object icxSexo: TcxDBImageComboBox
              Left = 44
              Top = 13
              RepositoryItem = dtmLookup.Combo_Sexo
              DataBinding.DataField = 'SEXO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.Items = <>
              Style.StyleController = dtmControles.cxEsc_EditsObrigatorio
              TabOrder = 9
              Width = 85
            end
            object edtCPFCNPJ: TcxDBMaskEdit
              Left = 171
              Top = 13
              DataBinding.DataField = 'CPF'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.EditMask = '999\.999\.999\-99;0;_'
              Properties.MaxLength = 0
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 10
              Width = 116
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 357
              Top = 13
              DataBinding.DataField = 'RG'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 11
              Width = 185
            end
            object edtEndereco: TcxDBTextEdit
              Left = 44
              Top = 54
              DataBinding.DataField = 'ENDERECO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 12
              Width = 243
            end
            object cxDBTextEdit15: TcxDBTextEdit
              Left = 357
              Top = 54
              DataBinding.DataField = 'BAIRRO'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 13
              Width = 185
            end
            object cxDBTextEdit16: TcxDBTextEdit
              Left = 591
              Top = 54
              DataBinding.DataField = 'CIDADE'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 14
              Width = 194
            end
            object cxDBComboBox3: TcxDBComboBox
              Left = 44
              Top = 82
              RepositoryItem = dtmLookup.Combo_UF
              DataBinding.DataField = 'UF'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 15
              Width = 45
            end
            object cxDBMaskEdit1: TcxDBMaskEdit
              Left = 124
              Top = 82
              DataBinding.DataField = 'CEP'
              DataBinding.DataSource = SourceAncestral
              ParentFont = False
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.EditMask = '99\.999\-999;0;_'
              Properties.MaxLength = 0
              Style.StyleController = dtmControles.cxEsc_EditsNormal
              TabOrder = 16
              Width = 163
            end
            object edtTelefone: TcxDBMaskEdit
              Left = 357
              Top = 82
              DataBinding.DataField = 'TELEFONES'
              DataBinding.DataSource = SourceAncestral
              Properties.AlwaysShowBlanksAndLiterals = True
              Properties.MaxLength = 0
              TabOrder = 17
              Width = 428
            end
          end
        end
      end
      object lbllInformacao: TcxLabel
        Left = 1
        Top = 1
        Align = alTop
        AutoSize = False
        Caption = 'Existe Boleto Vinculado. Altera'#231#227'o de Grupo n'#227'o permitida!!!'
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsOffice11
        Style.Color = 16247513
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'GlassOceans'
        Style.Shadow = False
        Style.TextColor = clRed
        Style.TextStyle = []
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'GlassOceans'
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'GlassOceans'
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'GlassOceans'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 32
        Width = 800
        AnchorX = 401
        AnchorY = 17
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 605
    Top = 90
  end
  inherited DataSetAncestral: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 'SELECT *'#13#10'FROM T_PESSOA'
    Left = 635
    Top = 90
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 667
    Top = 90
  end
  inherited ClientAncestral: TClientDataSet
    AfterScroll = ClientAncestralAfterScroll
    Left = 699
    Top = 90
    object ClientAncestralPESSOA_ID: TFMTBCDField
      FieldName = 'PESSOA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 20
      Size = 2
    end
    object ClientAncestralNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object ClientAncestralCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object ClientAncestralRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object ClientAncestralENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 120
    end
    object ClientAncestralBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object ClientAncestralCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object ClientAncestralUF: TStringField
      FieldName = 'UF'
      Size = 3
    end
    object ClientAncestralTELEFONES: TStringField
      FieldName = 'TELEFONES'
      Size = 60
    end
    object ClientAncestralEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 90
    end
    object ClientAncestralGRAU: TStringField
      FieldName = 'GRAU'
      Size = 1
    end
    object ClientAncestralSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object ClientAncestralCEDENTE_ID: TFMTBCDField
      FieldName = 'CEDENTE_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object ClientAncestralTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object ClientAncestralOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 90
    end
    object ClientAncestralDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object ClientAncestralBOLETO_EMAIL: TStringField
      FieldName = 'BOLETO_EMAIL'
      Size = 1
    end
    object ClientAncestralCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ClientAncestralPESSOA_GRUPO_ID: TFMTBCDField
      FieldName = 'PESSOA_GRUPO_ID'
      Precision = 20
      Size = 2
    end
    object ClientAncestralCODIGO_UDV: TStringField
      FieldName = 'CODIGO_UDV'
      Size = 10
    end
    object ClientAncestralEMAIL_TERCEIRO: TStringField
      FieldName = 'EMAIL_TERCEIRO'
      Size = 1
    end
    object ClientAncestralPESSOA_TERCEIRO_ID: TFMTBCDField
      FieldName = 'PESSOA_TERCEIRO_ID'
      Precision = 20
      Size = 2
    end
  end
  inherited SourceAncestral: TDataSource
    Left = 731
    Top = 90
  end
end
