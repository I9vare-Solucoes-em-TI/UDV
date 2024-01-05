object fmeImagem: TfmeImagem
  Left = 0
  Top = 0
  Width = 720
  Height = 509
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 492
    Height = 446
    Align = alClient
    TabOrder = 0
    object ImageEnMView1: TImageEnMView
      Left = 1
      Top = 1
      Width = 140
      Height = 444
      Background = clBtnFace
      ParentCtl3D = False
      StoreType = ietNormal
      ThumbWidth = 100
      ThumbHeight = 100
      HorizBorder = 4
      VertBorder = 4
      TextMargin = 0
      OnImageSelect = ImageEnMView1ImageSelect
      MouseInteract = [mmiScroll, mmiSelect]
      GridWidth = 1
      Style = iemsACD
      ThumbnailsBackground = clBtnFace
      ThumbnailsBackgroundSelected = clBtnFace
      EnableMultiSelect = True
      MultiSelectionOptions = []
      ThumbnailsBorderWidth = 0
      ThumbnailsBorderColor = clBlack
      Align = alLeft
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDblClick = ImageEnMView1DblClick
    end
    object cxSplitter1: TcxSplitter
      Left = 141
      Top = 1
      Width = 8
      Height = 444
      HotZoneClassName = 'TcxMediaPlayer9Style'
      PositionAfterOpen = 140
      MinSize = 140
      Control = ImageEnMView1
    end
    object ImageView: TImageEnView
      Left = 149
      Top = 1
      Width = 342
      Height = 444
      Cursor = crDefault
      Background = clBlack
      ParentCtl3D = False
      ZoomFilter = rfFastLinear
      OnImageChange = ImageViewImageChange
      MouseInteract = [miZoom, miScroll]
      EnableInteractionHints = True
      Align = alClient
      TabOrder = 2
    end
  end
  object sbxPropriedades: TScrollBox
    Left = 492
    Top = 44
    Width = 228
    Height = 446
    Align = alRight
    TabOrder = 5
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Configura'#231#245'es'
      ParentColor = False
      Style.BorderStyle = ebsOffice11
      Style.Color = clSilver
      Style.TextStyle = [fsBold]
      Properties.Alignment.Horz = taCenter
      AnchorX = 112
    end
    object cxGroupBox1: TcxGroupBox
      Left = 9
      Top = 23
      Caption = 'Selecionar Scanner'
      ParentFont = False
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2007Black'
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2007Black'
      TabOrder = 1
      Height = 49
      Width = 203
      object cbxScanner: TcxComboBox
        Left = 6
        Top = 17
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbxScannerPropertiesChange
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 0
        Width = 191
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 9
      Top = 80
      Caption = 'Op'#231#245'es Scanner'
      ParentFont = False
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2007Black'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2007Black'
      TabOrder = 2
      Height = 130
      Width = 205
      object chxDialog: TcxCheckBox
        Left = 8
        Top = 15
        Caption = 'Scanner dialog visivel'
        ParentFont = False
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        State = cbsChecked
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 0
        Width = 179
      end
      object chxProgressBar: TcxCheckBox
        Left = 8
        Top = 32
        Caption = 'Scanner barra de progresso visivel'
        ParentFont = False
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        State = cbsChecked
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 1
        Width = 188
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 72
        Caption = 'DPIX:'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
      end
      object edtDPIX: TcxTextEdit
        Left = 44
        Top = 72
        ParentFont = False
        TabOrder = 3
        Width = 46
      end
      object cxLabel4: TcxLabel
        Left = 8
        Top = 97
        Caption = 'Cores:'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
      end
      object cbxCores: TcxComboBox
        Left = 44
        Top = 96
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 5
        Width = 153
      end
      object chxDuplex: TcxCheckBox
        Left = 8
        Top = 49
        Caption = 'Duplex'
        ParentFont = False
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 6
        Width = 65
      end
      object cxLabel3: TcxLabel
        Left = 94
        Top = 72
        Caption = 'DPIY:'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
      end
      object edtDPIY: TcxTextEdit
        Left = 130
        Top = 72
        ParentFont = False
        TabOrder = 8
        Width = 46
      end
    end
    object btnSalvarConfig: TcxButton
      Left = 9
      Top = 301
      Width = 95
      Height = 25
      Caption = 'Salvar'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000002B2B
        2BB73C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF2B2B2BB700000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF0000000000000000000000000000000000000000000000000000
        00000000000000000000000000003C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF0000000000000000000000000000000000000000000000000000
        00000000000000000000000000003C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF0000000000000000000000000000000000000000000000000000
        00000000000000000000000000003C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF0000000000000000000000000000000000000000000000000000
        00000000000000000000000000003C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF0000000000000000000000000000000000000000000000000000
        00000000000000000000000000003C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
        000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000
        00003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF00000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000
        00003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF00000000000000002C2C
        2CBD3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF2C2C2CBD00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 3
      OnClick = btnSalvarConfigClick
    end
    object btnCancelarConfig: TcxButton
      Left = 126
      Top = 302
      Width = 95
      Height = 25
      Caption = 'Cancelar'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
        2FC72121218D1010104600000000000000000000000000000000000000000000
        0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
        0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000002121
        218C3C3C3CFF3C3C3CFF3C3C3CFF2D2D2DBE3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF2D2D2DBE3C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000101010463939
        39F33C3C3CFF3C3C3CFF1E1E1E7E000000001E1E1E7E3C3C3CFF3C3C3CFF1E1E
        1E7E000000001E1E1E7E3C3C3CFF3C3C3CFF393939F3101010462121218D3C3C
        3CFF3C3C3CFF2D2D2DBF0000000000000000000000001E1E1E7E1E1E1E7E0000
        000000000000000000002D2D2DBF3C3C3CFF3C3C3CFF2121218D2F2F2FC73C3C
        3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
        0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC7383838F03C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E810000000000000000000000000000
        00001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF383838F0383838F03C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E0000000000000000000000000000
        00001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF383838F02F2F2FC73C3C
        3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000000000000000000000000000
        0000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF2F2F2FC72121218D3C3C
        3CFF3C3C3CFF2D2D2DBF0000000000000000000000001E1E1E811E1E1E810000
        000000000000000000002D2D2DBF3C3C3CFF3C3C3CFF2121218D101010463939
        39F33C3C3CFF3C3C3CFF1E1E1E81000000001E1E1E813C3C3CFF3C3C3CFF1E1E
        1E81000000001E1E1E813C3C3CFF3C3C3CFF393939F310101046000000002121
        218C3C3C3CFF3C3C3CFF3C3C3CFF2D2D2DC13C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF2D2D2DC13C3C3CFF3C3C3CFF3C3C3CFF2121218C00000000000000000808
        0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
        0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
        00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
        2FC72121218D1010104600000000000000000000000000000000}
      TabOrder = 4
      OnClick = btnCancelarConfigClick
    end
    object cxGroupBox3: TcxGroupBox
      Left = 9
      Top = 216
      Caption = 'Op'#231#245'es Padr'#227'o'
      ParentFont = False
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2007Black'
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2007Black'
      TabOrder = 5
      Height = 80
      Width = 203
      object chxMiniatura: TcxCheckBox
        Left = 8
        Top = 15
        Caption = 'Imagens em miniatura visivel'
        ParentFont = False
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 0
        OnClick = chxMiniaturaClick
        Width = 161
      end
      object chxDigitalizacaoColorida: TcxCheckBox
        Left = 8
        Top = 32
        Caption = 'Padr'#227'o de Imagem Colorida'
        ParentFont = False
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 1
        OnClick = chxDigitalizacaoColoridaClick
        Width = 161
      end
      object chxImagemAutoFit: TcxCheckBox
        Left = 8
        Top = 49
        Caption = 'Auto Fit'
        ParentFont = False
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.LookAndFeel.SkinName = 'Office2007Black'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
        StyleHot.LookAndFeel.SkinName = 'Office2007Black'
        TabOrder = 2
        OnClick = chxImagemAutoFitClick
        Width = 161
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 490
    Width = 720
    Height = 19
    Panels = <
      item
        Text = 'Dimens'#245'es:'
        Width = 70
      end
      item
        Width = 100
      end
      item
        Text = 'Tamanho Arquivo:'
        Width = 110
      end
      item
        Width = 150
      end
      item
        Text = 'P'#225'ginas:'
        Width = 60
      end
      item
        Width = 70
      end
      item
        Width = 50
      end>
  end
  object ActionList: TActionList
    Left = 232
    Top = 80
    object actScanner: TAction
      Category = 'Arquivo'
      Caption = 'Scanner'
      Hint = 'Scanner'
      ShortCut = 16452
      OnExecute = actScannerExecute
    end
    object actCopiar: TAction
      Category = 'Editar'
      Caption = 'Copiar Imagem'
      Hint = 'Copiar Imagem'
      OnExecute = actCopiarExecute
    end
    object actSelecionarArea: TAction
      Category = 'Editar'
      Caption = 'Selecionar'
      Hint = 'Selecionar'
      ShortCut = 16449
      OnExecute = actSelecionarAreaExecute
    end
    object actImportar: TAction
      Category = 'Arquivo'
      Caption = 'Importar'
      Hint = 'Importar'
      ShortCut = 16457
      OnExecute = actImportarExecute
    end
    object actExportar: TAction
      Category = 'Arquivo'
      Caption = 'Exportar PDF'
      Hint = 'Exportar'
      ShortCut = 16453
      OnExecute = actExportarExecute
    end
    object actSalvar: TAction
      Category = 'Arquivo'
      Caption = 'Salvar'
      Hint = 'Salvar'
      ShortCut = 16467
      OnExecute = actSalvarExecute
    end
    object actDeletarArquivo: TAction
      Category = 'Arquivo'
      Caption = 'Deletar Arquivo'
      Hint = 'Deletar Aquivo'
      OnExecute = actDeletarArquivoExecute
    end
    object actDeletarPagina: TAction
      Category = 'Editar'
      Caption = 'Excluir Selecionada(s)'
      Hint = 'Excluir Selecionada(s)'
      OnExecute = actDeletarPaginaExecute
    end
    object actGirarEsquerda: TAction
      Category = 'Imagem'
      Caption = 'Girar para Esquerda'
      Hint = 'Girar para Esquerda'
      OnExecute = actGirarEsquerdaExecute
    end
    object actGirarDireita: TAction
      Category = 'Imagem'
      Caption = 'Girar para Direita'
      Hint = 'Girar para Direita'
      OnExecute = actGirarDireitaExecute
    end
    object actAutoAjuste: TAction
      Category = 'Imagem'
      Caption = 'Auto Ajuste'
      Hint = 'Auto Ajuste'
      OnExecute = actAutoAjusteExecute
    end
    object actConfig: TAction
      Category = 'Imagem'
      Caption = 'Configura'#231#227'o'
      Hint = 'Configura'#231#227'o'
      OnExecute = actConfigExecute
    end
    object actZoomMais: TAction
      Category = 'Imagem'
      Caption = 'Zoom +'
      Hint = 'Zoom +'
      OnExecute = actZoomMaisExecute
    end
    object actZoomMenos: TAction
      Category = 'Imagem'
      Caption = 'Zoom -'
      Hint = 'Zoom -'
      OnExecute = actZoomMenosExecute
    end
    object actImprimir: TAction
      Category = 'Arquivo'
      Caption = 'Imprimir'
      Hint = 'Imprimir'
      ShortCut = 16464
      OnExecute = actImprimirExecute
    end
    object actPagPrior: TAction
      Category = 'Imagem'
      Caption = 'Anterior'
      Hint = 'Anterior'
      OnExecute = actPagPriorExecute
    end
    object actPagNext: TAction
      Category = 'Imagem'
      Caption = 'Pr'#243'ximo'
      Hint = 'Pr'#243'ximo'
      OnExecute = actPagNextExecute
    end
    object actFit: TAction
      Category = 'Imagem'
      Caption = 'Fit'
      Hint = 'Fit'
      OnExecute = actFitExecute
    end
    object actMover: TAction
      Category = 'Editar'
      Caption = 'Mover Imagem'
      Hint = 'Mover P'#225'gina'
      OnExecute = actMoverExecute
    end
    object actRescanner: TAction
      Category = 'Arquivo'
      Caption = 'Redigitalizar'
      Hint = 'Redigitalizar'
      OnExecute = actRescannerExecute
    end
    object actImagemEmBranco: TAction
      Category = 'Imagem'
      Caption = 'Criar Imagem Vazia'
      Hint = 'Criar Imagem Vazia'
      OnExecute = actImagemEmBrancoExecute
    end
    object actUndo: TAction
      Category = 'Editar'
      Caption = 'Desfazer Altera'#231#227'o'
      Hint = 'Desfazer'
      OnExecute = actUndoExecute
    end
    object actCopiarSelecao: TAction
      Category = 'Editar'
      Caption = 'Copiar Sele'#231#227'o'
      Hint = 'Copiar Sele'#231#227'o'
      ShortCut = 16451
      OnExecute = actCopiarSelecaoExecute
    end
    object actColarSelecao: TAction
      Category = 'Editar'
      Caption = 'Colar Sele'#231#227'o'
      Hint = 'Colar'
      ShortCut = 16470
      OnExecute = actColarSelecaoExecute
    end
    object actCortarImagem: TAction
      Category = 'Editar'
      Caption = 'Cortar Imagem'
      Hint = 'Cortar Imagem'
      OnExecute = actCortarImagemExecute
    end
    object actMergeSelecao: TAction
      Category = 'Editar'
      Caption = 'Fixar Imagem'
      Hint = 'Fixar Imagem'
      OnExecute = actMergeSelecaoExecute
    end
    object actDeletarLayer: TAction
      Category = 'Editar'
      Caption = 'Deletar Layer'
      Hint = 'Deletar Layer'
      ShortCut = 16430
      OnExecute = actDeletarLayerExecute
    end
    object actCheckBoxesImagem: TAction
      Category = 'Editar'
      Caption = 'Selecionar Imagens'
      Hint = 'Selecionar Imagens'
      OnExecute = actCheckBoxesImagemExecute
    end
    object actExportTiff: TAction
      Category = 'Arquivo'
      Caption = 'Exportar TIFF'
      OnExecute = actExportTiffExecute
    end
    object actHistorico: TAction
      Category = 'Arquivo'
      Caption = 'Hist'#243'rico'
      OnExecute = actHistoricoExecute
    end
    object actVisualizar: TAction
      Category = 'Arquivo'
      Caption = 'Visualizar'
      OnExecute = actVisualizarExecute
    end
    object actResize: TAction
      Category = 'Imagem'
      Caption = 'Reduzir'
      Hint = 'Reduzir Tamanho da Imagem'
      OnExecute = actResizeExecute
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LookAndFeel.SkinName = 'Office2007Black'
    PopupMenuLinks = <>
    ShowHintForDisabledItems = False
    Style = bmsFlat
    UseSystemFont = True
    Left = 176
    Top = 80
    DockControlHeights = (
      0
      0
      44
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 776
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton25'
        end
        item
          Visible = True
          ItemName = 'btnConfig'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'ckbAutoFit'
        end
        item
          ViewLayout = ivlGlyphControlCaption
          Visible = True
          ItemName = 'ckbImagemColorida'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ProgressBarFile'
        end
        item
          Visible = True
          ItemName = 'lblConvertendo'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarManager1Bar2: TdxBar
      AllowClose = False
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Atalhos'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 22
      DockingStyle = dsTop
      FloatLeft = 776
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnBarScanner'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnBarSalvar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnPDF'
        end
        item
          Visible = True
          ItemName = 'dxBarButton29'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end
        item
          Visible = True
          ItemName = 'dxBarButton20'
        end
        item
          Visible = True
          ItemName = 'dxBarButton22'
        end
        item
          Visible = True
          ItemName = 'dxBarButton23'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnBarPagPrior'
        end
        item
          Visible = True
          ItemName = 'btnBarPagNext'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 32
          Visible = True
          ItemName = 'edtBarPagina'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 31
          Visible = True
          ItemName = 'edtBarTotalPagina'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Arquivo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnScanner'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton14'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnSalvar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnExportar'
        end
        item
          Visible = True
          ItemName = 'dxBarButton27'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton28'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDeletar'
        end>
    end
    object btnScanner: TdxBarButton
      Action = actScanner
      Category = 0
    end
    object btnDeletar: TdxBarButton
      Action = actDeletarArquivo
      Category = 0
    end
    object btnExportar: TdxBarButton
      Action = actExportar
      Category = 0
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Edit'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton13'
        end
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator4'
        end
        item
          Visible = True
          ItemName = 'btnCopiar'
        end
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton26'
        end
        item
          Visible = True
          ItemName = 'btnDeletarPagina'
        end>
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'Imagem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator2'
        end
        item
          Visible = True
          ItemName = 'btnGirarDireita'
        end
        item
          Visible = True
          ItemName = 'btnGirarEsqueda'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnAutoAjuste'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton15'
        end
        item
          Visible = True
          ItemName = 'dxBarButton21'
        end
        item
          Visible = True
          ItemName = 'dxBarButton24'
        end>
    end
    object btnImportar: TdxBarButton
      Action = actImportar
      Category = 0
    end
    object btnSalvar: TdxBarButton
      Action = actSalvar
      Category = 0
    end
    object btnCopiar: TdxBarButton
      Action = actCopiar
      Category = 0
    end
    object btnDeletarPagina: TdxBarButton
      Action = actDeletarPagina
      Category = 0
    end
    object btnGirarDireita: TdxBarButton
      Action = actGirarDireita
      Category = 0
    end
    object btnGirarEsqueda: TdxBarButton
      Action = actGirarEsquerda
      Category = 0
    end
    object btnAutoAjuste: TdxBarButton
      Action = actAutoAjuste
      Category = 0
    end
    object btnBarScanner: TdxBarButton
      Action = actScanner
      Category = 0
      Description = 'Scanner'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000002828284D223B
        484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF223B484D0000000000000000848484FF2828
        284D223B484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF223B484D00000000848484FF0000
        00002828284D223B484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF223B484D848484FF0000
        0000848484FF4D4D4D4D223B484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF848484FF0000
        0000848484FFFFFFFFFF4D4D4D4D000000000000000000000000223B484D72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF223B484D848484FF0000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D4D0000
        0000000000000000000000000000000000000000000000000000848484FF0000
        0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFFFFFFFFF848484FF000000000000000000000000848484FF0000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000848484FF0000
        0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFFFFFFFFF848484FF000000000000000000000000848484FF0000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000002828284D0000
        0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFFFFFFFFF848484FF000000000000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDFFFFFFFFFF848484FF000000000000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object btnBarSalvar: TdxBarButton
      Action = actSalvar
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000946332CC160453BFF644A41FFB87D4EFFB97A4AFFB474
        44FFB06C3DFFA76436FF593E37FF5C4037FF3B2823C20000000A000000090000
        000E0000000F0000001C6F5347FF947869FF6A4F46FFD8B07BFFD7AE77FFD7AB
        74FFD6A970FFD5A66DFF5F443CFF694C42FF553A32FF0000000E7B5043C0AB70
        5CFFAB6F5AFFA36B58FF73574AFF987D6EFF70564BFFFFFFFFFFF6EFEAFFF6EF
        E9FFF6EEE9FFF5EEE9FF644A41FF72544AFF583D34FF0000000EAD735FFFFDFB
        F9FFFBF5F2FFEFEAE7FF785C4EFF9D8273FF765C50FFFFFFFFFFF7F0EBFFF7F0
        EBFFF7EFEBFFF6EFEAFF6A5046FF73554BFF5B4037FF0000000DB07762FFFDFB
        FAFFF7EDE6FFEDE3DCFF7C6050FFA28777FF7B6154FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF6F564BFF74584EFF5E4339FF0000000CB07966FFFDFB
        FBFFF8EEE8FFEEE6DFFF7F6354FFA78E7DFF977A6AFF967969FF957967FF8469
        5CFF785D53FF775C51FF775C51FF775A50FF62463CFF0000000BB37C69FFFEFC
        FBFFF8F0EAFFF0E8E1FF836757FFAB9382FF634A41FF614740FF5E463DFF5C44
        3CFF5B433BFF594139FF584037FF795C52FF654A3FFF0000000AB67F6CFFFEFD
        FCFFF9F0EBFFF2E9E4FF866A59FFAF9788FF674E44FFF3EAE4FFE7D5C8FFE7D4
        C6FFE6D3C5FFE6D3C5FF5B433AFF7A5F54FF694E42FF00000009B98371FFFEFD
        FCFFFAF3EEFFF3ECE7FF886D5CFFB39C8CFF6B5248FFF4ECE6FFE9D9CDFFE8D7
        CAFFE7D5C8FFE6D4C6FF5E463EFF7C6156FF6C5145FF00000008BC8877FFFEFE
        FDFFFBF4EFFFF5EEEAFF8B705EFFB7A091FF70564DFFF6EFEAFFF5EDE8FFF4EC
        E6FFF4EBE4FFF3EAE3FF634A41FF7E6358FF715549FF00000007BF8C7AFFFEFE
        FDFFFBF6F1FFF8F2EEFFA79183FF8C715FFF755A50FF8D766CFF897369FF856D
        65FF81695FFF7C645BFF674D45FF775B4DFF564239C100000004C18F7FFFFEFE
        FEFFFAF6F3FFF9F4F2FFF9F4F0FFF7F1EDFFF7F1ECFFF7F1ECFFF6F0EBFFF5EF
        E9FFF8F4F3FFDABFB6FF00000010000000050000000300000001C49382FFFFFE
        FEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5F1FFFBF5
        F0FFFDFBF9FFBF8C7BFF0000000B000000000000000000000000C79985FFFFFE
        FEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6
        F2FFFDFCFAFFC28F7FFF0000000A000000000000000000000000C99A89FFFFFF
        FEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFEFDFFFEFD
        FDFFFEFDFDFFC49382FF00000008000000000000000000000000977567C0CA9C
        8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A88FFC99987FFC798
        87FFC89886FF927163C200000005000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object btnBarPagPrior: TdxBarButton
      Action = actPagPrior
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0002000000080000001200000012000000050000000000000000000000000000
        0000000000000000000000000000000000000000000000000002000000060000
        001332180C6E813C1CE0AC5A2DFF000000130000000000000000000000000000
        000000000000000000000000000000000001000000050000000F231209527E40
        20D4B67042FFDAA66DFFAE5E30FF000000170000000000000000000000000000
        00000000000000000001000000030000000C180E083C733E24BFB66F42FFD6A4
        6DFFE4B77BFFE4B77BFFB06034FF000000160000000000000000000000000000
        000100000002000000090F090529673E25A8B57548FDD7A674FFE7BF89FFE6BB
        80FFE5B87CFFE6B97FFFB26537FF000000150000000000000000000000010000
        00070906041C5B3B2590B4774EF7D8A87CFFECCA9AFFEAC38EFFE9C089FFE8BD
        84FFE7BA81FFE7BE86FFB4693AFF000000140000000000000000000000065139
        2978B17B54ECD7AA82FFEFD1A9FFEFCFA0FFEDC996FFECC793FFEBC490FFE9C1
        8AFFE7BE86FFE9C38FFFB56B3FFF00000013000000000000000000000009CB97
        6FFFF1DCC1FFF3DCB8FFF3D8AEFFF0D2A4FFF0CFA0FFEFD0A1FFEFCF9FFFEDCC
        9BFFEDC996FFEECDA0FFB87043FF000000120000000000000000000000044433
        2661AF815BE1DDB693FFF5E0C3FFF8E3C3FFF6DFB9FFF4DAAFFFF2D5AAFFF0D2
        A4FFEECE9DFFF1D5ABFFBA7648FF000000110000000000000000000000010000
        000405040311533D2B78BF8D67F1E3C2A2FFF8EACEFFF8E6C5FFF5DDB6FFF2D6
        ABFFF0D2A4FFF3DBB5FFBD784CFF000000100000000000000000000000000000
        000000000001000000050C09061B6B4E3894C79772F8E6C9AAFFFAEBCEFFF6E2
        BEFFF2D7ACFFF5E0BCFFBF7C52FF0000000F0000000000000000000000000000
        00000000000000000000000000010000000618120C2B7C583FA7D2A17BFFEBD2
        B4FFF8E6C8FFF8E7C9FFC18456FF0000000E0000000000000000000000000000
        0000000000000000000000000000000000000000000200000007261C133E9167
        4AC0D5A881FFEFDABDFFC3875BFF0000000E0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000020000
        000936281C54A37453D5C68C63FF0000000A0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000030000000800000008000000020000000000000000}
    end
    object btnBarPagNext: TdxBarButton
      Action = actPagNext
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00040000000F0000000F00000007000000010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000EB0683FFF834324E131190D6A000000110000000600000001000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0011B37045FFDEAF77FFB47247FF773C20D2201009500000000F000000050000
        0001000000000000000000000000000000000000000000000000000000000000
        0010B6764BFFECC38FFFE8BA7DFFD8A66FFFAD693FFF6A371CBE170C06400000
        000D000000040000000100000000000000000000000000000000000000000000
        000FBB7C51FFEFCD9CFFE9BB7FFFE8BC80FFEABE83FFD39D6CFFA7623BFD5B30
        1AA90D07032C0000000B00000003000000010000000000000000000000000000
        000EBE8257FFF1D5ACFFEBC087FFE9BF85FFE8BD81FFE9BF82FFE9C087FFCD97
        65FF9F5933F74E29169408040221000000090000000200000000000000000000
        000DC0855EFFF5DEBBFFEDC68FFFEDC58DFFEBC289FFEAC084FFE8BC80FFE9BD
        82FFE8BB87FFC78E60FF965430EE4223137E0000000900000000000000000000
        000CC59067FFF9E9CFFFF3D4A3FFF2D09FFFF0CC98FFEEC890FFEBC088FFE9BE
        83FFEAC38AFFECC693FFE3B889FFA65B33FF0000000D00000000000000000000
        000BC9956EFFFAEFDAFFF4DAAEFFF5D8AAFFF2D5A6FFF1D1A1FFF1D0A2FFF1D2
        A8FFEDCDA1FFCC956BFF9A5D39E33A2314680000000700000000000000000000
        000ACC9B73FFFCF4E3FFF8E0B7FFF6DDB4FFF6DEB4FFF7E2C0FFF6E1C1FFD9B2
        8CFFB0754EF14D301F7E04030216000000060000000100000000000000000000
        0009CDA077FFFEF7E9FFFBE7C2FFFBEBCCFFFBEFD6FFE3C5A7FFC08B65F96544
        2E960B07051E0000000600000002000000000000000000000000000000000000
        0008D0A47CFFFEFBEFFFFDF4E0FFEEDAC1FFD1A07DFF78553CA717100B2C0000
        0007000000020000000000000000000000000000000000000000000000000000
        0007D2A77FFFF5EADBFFD8B291FF916D50BE261C143C00000007000000020000
        0000000000000000000000000000000000000000000000000000000000000000
        0005D5AA83FFA98462D3372B204F000000070000000200000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000040000000500000002000000010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object edtBarPagina: TdxBarEdit
      Caption = 'P'#225'ginas'
      Category = 0
      Hint = 'P'#225'gina'
      Visible = ivAlways
      OnExit = edtBarPaginaExit
      OnKeyPress = edtBarPaginaKeyPress
      ShowCaption = True
    end
    object edtBarTotalPagina: TdxBarEdit
      Caption = 'de'
      Category = 0
      Enabled = False
      Hint = 'Total de P'#225'ginas'
      Visible = ivAlways
      ShowCaption = True
      ReadOnly = True
    end
    object btnSelecionar: TdxBarButton
      Action = actSelecionarArea
      Category = 0
    end
    object btnPDF: TdxBarButton
      Action = actExportar
      Caption = 'PDF'
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000020000
        00090000000E0000000F00000010000000100000001100000011000000110000
        001200000012000000110000000C000000030000000000000000000000087B50
        43C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D59FFAA6C
        59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000000CAD73
        5FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1EDFFF8F1
        ECFFF8F0EBFFF8F0EAFFD5B6ADFF0000001100000000000000000000000CB077
        62FFFDFBFAFF7674D8FF3737D1FF3334CDFF3131CBFF2F2FC9FF2B2BC5FF2929
        C4FF2626C2FF2425BFFF2222BCFF2020BBFF1E1EB8FF14147CAD0000000BB079
        66FFFDFBFBFF3C3DD3FFFAF6F6FF3636D0FF3233CCFF3030CAFFF8F2F1FFF7F2
        EFFF6B69D1FF2526C2FFF6EEEBFF2121BCFF1F1FBBFF1D1EB9FF0000000AB37C
        69FFFEFCFBFF3E3ED4FFFBF7F6FF3738D2FF3536D0FF3232CCFFF8F4F2FF2D2E
        C7FFF7F2EFFF2728C2FFF6F0ECFF2223BDFF2121BCFF1E1EB9FF00000009B67F
        6CFFFEFDFCFF4040D7FFFBF8F7FFFBF7F6FF7574DCFF3435CDFFF9F5F2FF2F2F
        CAFFF8F3F0FF292AC4FFF6F1EEFFF6EFECFF2222BDFF2020BBFF00000009B983
        71FFFEFDFCFF4042D9FFFCF8F8FF3C3CD3FFFBF7F6FF3637D0FFFAF5F3FF3030
        CAFFF8F3F1FF2B2BC5FFF7F1EFFF2526C2FF2323BFFF2121BCFF00000008BC88
        77FFFEFEFDFF4243D9FFFBFAF9FFFCF8F8FF7878DFFF3838D2FFFAF7F5FFFAF5
        F4FF706FD7FF2D2EC7FFF8F2F0FFF7F2EFFFF6F0EDFF2222BDFF00000007BF8C
        7AFFFEFEFDFF7F7DE1FF4242D8FF4040D7FF3D3ED4FF3A3AD3FF3737D0FF3435
        CDFF3132CBFF2F2FC9FF2B2CC7FF292AC4FF2727C2FF181982AD00000006C18F
        7FFFFEFEFEFFFAF6F3FFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
        EFFFFAF4EEFFFDF9F8FFDEC3BAFF0000000B000000000000000000000006C493
        82FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
        F1FFFBF5F0FFFDFBF9FFBF8C7BFF0000000B000000000000000000000005C799
        85FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
        F3FFFCF6F2FFFDFCFAFFC28F7FFF0000000A000000000000000000000004C99A
        89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFE
        FDFFFEFDFDFFFEFDFDFFC49382FF000000080000000000000000000000029775
        67C0CA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A88FFC999
        87FFC79887FFC89886FF927163C2000000050000000000000000000000010000
        0002000000030000000400000004000000050000000500000005000000060000
        0006000000060000000600000005000000010000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object btnConfig: TdxBarButton
      Action = actConfig
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000605030901010001000000000000000000000000000000000000
        0000573E257992673DCA251A0F33000000000000000000000000000000000000
        00003B2A1952B27D4AF68A613ABF020201030000000000000000000000000101
        0102B47F4BFAB8824DFFAD7A48F0281D11380000000000000000000000003F2D
        1B58B5804CFBB8824DFFB17D4AF50906040C0000000000000000000000000000
        00004C362069B7814DFEB8824DFFAE7B49F12B1F123C0000000044301C5EB680
        4CFCB8824DFFB27D4AF634251648000000000000000000000000000000000000
        00000000000049331E65B7814DFEB8824DFFB07C4AF430221442835C37B5B882
        4DFFB17D4AF53022144300000000000000000000000000000000000000000000
        0000000000000000000045311D60B6804CFCB8824DFFB17D4AF53727174C7955
        32A72C1F123D0000000000000000000000000000000000000000000000000000
        000000000000000000000000000045301D5FB6804CFCB8824DFFB37E4BF83727
        174C000000000000000000000000000000000000000000000000000000003F2D
        1B589A6D40D5B8824DFFA87746E9986C40D347321E63B47F4BF9B8824DFFB47F
        4BF93B2A19520000000000000000010100010000000000000000422F1C5CB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF90663CC83828184EB47F4BF9B882
        4DFFB5804CFB3E2C1A56020201037351309F67492B8F010100019D6F42D9B27D
        4AF6543B237471502F9CB8824DFFB8824DFFB47F4BF90B08050F34251648B27D
        4AF6B8824DFFB6804CFC8E643BC5B8824DFFB8824DFF6C4C2D95B17D4AF53022
        144300000000000000006C4C2D96B8824DFFB8824DFF21170E2E000000003123
        1544B17D4AF5B8824DFFB8824DFFB8824DFFB7814CFD47321E6220170E2D0000
        00000000000000000000523A2271B8824DFFB47F4BF90A07040E000000000A07
        040E93683ECCB8824DFFB8824DFFB6804CFC45311D6000000000000000000000
        0000000000003828184EB47F4BF9B8824DFF5E422782000000000E0A06139267
        3DCBB8824DFFB8824DFFB6804CFC432F1C5D0000000000000000000000000000
        00002A1E123AB27D4AF69F7042DC523A227101010001120D0819996C40D4B882
        4DFFB8824DFFB6804CFC422E1B5B000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object ProgressBarFile: TdxBarProgressItem
      Category = 0
      Visible = ivAlways
      BorderStyle = sbsNone
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000090C1B202130
        687B354DA8C64260D2F8354DA8C62130687B090C1B2000000000000000000000
        00000000000000000000000000000000000000000000090C1B202C408CA52A3E
        879F131C3C470304080A131C3C472A3E879F2C408CA5090C1B20000000000000
        000000000000000000000000000000000000000000002130687B2A3E879F0203
        0607000000000000000000000000020306072A3E879F2130687B000000000000
        00000000000000000000000000000000000000000000354DA8C6131C3C470000
        000000000000000000000000000000000000131C3C47354DA8C6B8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF000000004260D2F80304080A0000
        000000000000848484FF848484FF848484FF0304080A4260D2F8B8824DFF0000
        00000000000000000000000000000000000000000000354DA8C6131C3C470000
        000000000000848484FF0000000000000000131C3C47354DA8C6B8824DFF0000
        000000000000000000000000000000000000000000002130687B2A3E879F0203
        060700000000848484FF00000000020306072A3E879F2130687BB8824DFF0000
        00000000000000000000000000000000000000000000090C1B202C408CA52A3E
        879F131C3C470304080A131C3C472A3E879F2C408CA50D0F1C25B8824DFF0000
        0000000000000000000000000000000000000000000000000000090C1B202130
        687B354DA8C64260D2F8354DA8C62130687B090C1B204B351F68B8824DFF0000
        000000000000B8824DFF0000000000000000B8824DFF00000000000000002419
        0F320000000000000000060503090000000000000000B8824DFFB8824DFF0000
        000000000000B8824DFF0000000000000000B8824DFF0000000000000000B882
        4DFF0000000000000000B8824DFF0000000000000000B8824DFFB8824DFF0000
        000000000000B8824DFF0000000000000000B8824DFF0000000000000000B882
        4DFF0000000000000000B8824DFF0000000000000000B8824DFFB8824DFF0000
        000000000000B8824DFF0000000000000000B8824DFF0000000000000000B882
        4DFF0000000000000000B8824DFF0000000000000000B8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Height = 21
      ShowCaption = False
      Width = 115
      Step = 1
    end
    object dxBarButton1: TdxBarButton
      Action = actMover
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actRescanner
      Category = 0
    end
    object dxBarSeparator1: TdxBarSeparator
      Caption = '-'
      Category = 0
      Hint = '-'
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Action = actImagemEmBranco
      Category = 0
    end
    object dxBarSeparator2: TdxBarSeparator
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarButton4: TdxBarButton
      Action = actImportar
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
        94FFD4B494FFD4B494FFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
        94FFD4B494FFD4B494FFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
        94FFD4B494FFD4B494FFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
        94FFD4B494FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB8824DFFB8824DFF0000000000000000000000000000
        0000848484FFFFFFFFFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFFFFFF
        FFFFFFFFFFFFFFFFFFFFB8824DFFB8824DFF0000000000000000000000000000
        0000848484FFFFFFFFFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFFFFFF
        FFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
        0000848484FFFFFFFFFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFFFFFF
        FFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB8824DFFB8824DFF0000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FFFFFFFFFFB8824DFFB8824DFF0000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton5: TdxBarButton
      Action = actImprimir
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000030000000C000000120000001400000014000000150000
        0015000000140000000D00000003000000000000000000000000000000000000
        00000000000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD89
        78FFBE8978FF876356C30000000B000000000000000000000000000000030000
        000E0000001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4EC
        E8FFF5ECE7FFBF8D7BFF00000026000000180000000F000000040000000C7B50
        42C5A76E5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE
        72FFF6EEEAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E
        6BFFECD9CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B1
        76FFF7F0EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE85
        71FFF1E5DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
        35FF7A4835FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B
        78FFF5EEE7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7
        DDFFF2E7DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC793
        7FFFFAF4F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D
        32FF5D3D34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC99
        86FFFDFAFAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D
        42FF724C41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F
        8DFFFFFFFFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5
        DEFFF6EFEBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE95
        84E9F5ECE8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7
        E1FFF8F2EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA00000008000000023429
        2545A78375CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EA
        E3FFF9F5F3FF977263FF876658FFA68072CE3428234800000003000000000000
        0001000000030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5EC
        E7FFFBF7F6FFC59685FF00000011000000040000000200000000000000000000
        00000000000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EF
        EAFFFCFAF8FFC89A89FF00000009000000000000000000000000000000000000
        00000000000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFC
        FBFFFDFBFAFFCB9F8DFF00000007000000000000000000000000000000000000
        000000000000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA3
        91FFCDA391FF98786BC100000004000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton6: TdxBarButton
      Action = actZoomMais
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA36EFFE4C693FFEFD9ABFFEAD2A8FFD4B284FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99966FFE8C085FFE9C388FF8F4B24FFF1D8B1FFF3DDB8FFD6B3
        8AFFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF1D2B5FF8F4524FFEDC99EFFF1D4B2FFECCF
        AEFFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FF682612FF8A3F22FF8C4024FF8F4225FF924427FFF1CE
        AEFFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FF8B3C23FFF1CEB6FFEBB78FFFE7BC
        9AFFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FF6A2213FFF1C8B2FFEBB08AFFCA8F
        6FFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88967FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton7: TdxBarButton
      Action = actFit
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000B8824DFF000000000000000000000000000000000000
        0000000000000000000000000000B8824DFF0000000000000000000000000000
        00000000000000000000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        00000000000000000000B8824DFF000000000000000000000000000000000000
        0000000000000000000000000000B8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000B8824DFFB882
        4DFFB8824DFF00000000848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FF848484FF848484FF848484FF000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A33000000000000000000000000B882
        4DFF0000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000B8824DFFB882
        4DFFB8824DFF00000000848484FF848484FF848484FF848484FF848484FF8383
        83FE848484FF1A1A1A3300000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton8: TdxBarButton
      Action = actZoomMenos
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA36EFFE4C693FFEFD9ABFFE9D0A4FFD4B284FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99966FFE8C085FFE9C388FFEDCB99FFF0D6ADFFF3DDB8FFD6B3
        8AFFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF4DBC3FFF2D6B6FFF1D4B0FFF4DDC1FFF0D9
        BDFFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FF682612FF8A3F22FF8C4024FF8F4225FF924427FFF1CE
        AEFFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78FFFE7BC
        9AFFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBB08AFFCA8F
        6FFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88967FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton9: TdxBarButton
      Action = actSelecionarArea
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000583D
        25FF563E24FF563A22FF0000000000000000533920FF523820FF51371FFF4F38
        1DFF00000000000000004E341CFF4D331BFF4C341DFF0000000000000000583E
        26FF000000020000000A0000000F000000110000001100000012000000120000
        001200000013000000120000000C000000034E341CFF0000000000000000593F
        27FF00000008905C34C1C67F47FFC57D45FFC37B43FFC27942FFC07740FFBF76
        3FFFBE743EFFBC733CFF87512AC40000000C4F341CFF00000000000000000000
        00000000000CCA834AFFF3CCA6FFF1C398FFEFC196FFEEC093FFEDBE91FFEBBC
        8EFFEBBA8DFFEBB98BFFBD733CFF000000110000000000000000000000000000
        00000000000BCB854CFFF4CFAAFFF1C59AFFF1C398FFEFC195FFEEBF93FFEDBD
        90FFECBC8FFFEBBA8DFFBE743EFF000000110000000000000000000000005E43
        2BFF0000000ACC874EFFF6D1ADFFF2C79CFFF1C59AFFF0C398FFEFC195FFEEBF
        93FFEDBD91FFECBC8EFFC0753FFF0000000F533820FF00000000000000005F44
        2BFF00000009CE8850FFF7D4B1FFF3C99FFFF3C79DFFF1C59AFFF1C398FFEFC1
        95FFEFC093FFEDBD91FFC07740FF0000000E543921FF00000000000000006046
        2DFF00000008CF8A51FFF8D6B4FFF5CBA1FFF4C99FFFF3C79CFFF2C59AFFF0C3
        97FFEFC296FFEEBF94FFC27942FF0000000D543A22FF00000000000000006047
        2EFF00000007D08B52FFF9D8B8FFF6CDA3FFF5CBA1FFF4C99EFFF2C79DFFF2C5
        9AFFF0C398FFEFC196FFC37B44FF0000000C563C24FF00000000000000000000
        000000000005D18D53FFFADBBBFFF7CEA5FFF6CCA3FFF5CBA1FFF3C99EFFF3C7
        9DFFF2C59AFFF0C397FFC57D45FF0000000A0000000000000000000000000000
        000000000004D28E54FFFADCBDFFFADABBFFF9D9B9FFF8D7B7FFF7D6B5FFF6D4
        B1FFF5D2AFFFF4CFACFFC77F47FF000000080000000000000000000000006449
        30FF000000029D6A3FBFD28F55FFD18D53FFD08C52FFCF8A51FFCE884FFFCD87
        4EFFCB854CFFCA834AFF945F36C2000000055A3F27FF0000000000000000644A
        32FF000000000000000200000003000000040000000400000004000000050000
        0005000000050000000500000004000000015A4329FF0000000000000000654A
        32FF664C30FF644932FF000000000000000062482FFF62472FFF60472EFF6046
        2EFF00000000000000005E432BFF5D432BFF5C4229FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton10: TdxBarButton
      Action = actCortarImagem
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00030000000E00000018000000180000000F0000000400000000000000000000
        00030000000E00000018000000180000000F0000000400000000000000030402
        011A512408A5833A0BEE81380AEF4F2105A70301001C00000003000000030302
        001A512408A5833A0BEE81380AEF4F2105A70301001C00000003000000095931
        159BB8763BFFF1BF6EFFF1BD6BFFB56F33FF52280DA10000000C00000009552C
        129BB76F34FFEEA457FFEDA354FFB3672CFF52280DA10000000C0000000CA868
        37EEF6CE8FFFC08B57FFD2A26DFFF3C983FF985525F00000001400000010A05E
        2FEFF4B775FFB57A47FFC8905BFFF0B06AFF995425EF0000001000000009B77C
        48EDFAE3BFFFA26638FFAE7545FFF8DEB5FFAC6A38FF0000002A0000002AB777
        44FFF9D4A9FF97592FFFA3663AFFF7CFA0FFA56735EE0000000D000000047251
        3290DFAE7EFFF4DDC1FFF3DDC0FFDEB58BFFCB9C76FF67372BFF603226FFD0A1
        7AFFE1B58AFFF4D5B3FFF3D4B1FFD49F6EFF68462A9300000006000000010504
        030B7356378ECD9762F2D69F69FFE0BA94FFE6CBB4FFF0DED4FF9E796DFFCAAB
        94FFDDB591FFD29964FFC28C5AF36D4E33910504020D00000001000000000000
        0000000000030000000A35241F66AD8577FBF9F4F2FFF2E2D9FFE4CDC4FF9772
        68FF865B4EFB23120D6F00000010000000040000000100000000000000000000
        000000000000000000010000000C5B3B32B2B58B7EFFFAF5F3FFF4E5DCFFB799
        8EFF43241CB40000000F00000001000000000000000000000000000000000000
        000000000000000000031E141142A07567FDDECAC2FFB89388FFF8F3F1FFF3E7
        DFFF8A6054FD150B093F00000003000000000000000000000000000000000000
        0000000000010403020F82584BD8E6D1C9FFEFE5E1FF795144E0885E53DFF6F1
        EEFFDFCFC6FF61382ED70201010E000000010000000000000000000000000000
        0000000000045339318ACCAEA3FFF0E5E1FF734D41C80805041E0A0605197550
        45C5F4EEECFFB99B93FF39201988000000040000000000000000000000000000
        00022219153BB68D7EFBEEE2DDFF68473DB00402021000000002000000010403
        020C644237ACF2EAE7FF92695DFD170D0A390000000200000000000000010403
        030B946C5FD6EBDED9FF5C413894000000070000000200000000000000000000
        00010000000454372E91ECE3E0FF683F34D50301010A00000001000000025E45
        3B85EBDCD6FF4B362E7200000005000000010000000000000000000000000000
        000000000000000000023F2A236FE9DFDCFF3E231D8400000002000000028965
        58BB3D2D27590000000300000001000000000000000000000000000000000000
        000000000000000000000000000131201B57654236BA00000001}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton11: TdxBarButton
      Action = actUndo
      Category = 0
    end
    object dxBarSeparator3: TdxBarSeparator
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarButton13: TdxBarButton
      Action = actSelecionarArea
      Category = 0
    end
    object dxBarButton12: TdxBarButton
      Action = actUndo
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000002000000090000000B000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000020000000E542F18A08A491EDD000000000000
        0000000000000000000000000000000000010000000500000008000000030000
        000000000000000000030000000E553019A0C79A6AFF975125EC000000000000
        0000000000000000000000000002000000092D180B63A06136EC0000000A0000
        0004000000091009052C683C1FBAC69561FFDFC295FF7D4824C8000000000000
        000000000001000000040F09042762371BB7B07A4AFFB27243FF140C07362D1B
        0F5B5C371EA69D643BF9D2A66FFFEECD94FFCCA37AFF472B177B000000000000
        0002000000073922126B996239F3D7AE77FFF3D597FFB57A4CFFA66D42FFB47F
        51FFCEA26EFFEECC90FFEFCD92FFEEDEB6FFA36C43E90805031A00000002150E
        0829764B2CBFC19262FFF2D49AFFF5DA9FFFF6DA9DFFF4D79DFFF4D79CFFF4D6
        9AFFF3D59AFFF3D89FFFF5ECC5FFCAA177FF3825175E0000000500000003B185
        5DEBEADDBCFFFBF7D4FFFCF3CCFFFCF3CEFFFCF2CAFFFAECC0FFF8E6B6FFF6E3
        B2FFF6ECC3FFF1EBCAFFCDA981FF5139257D0000000800000001000000011C16
        0F2A947251C4DABE99FFFAF7D8FFFDFAD9FFFDF7D4FFFDFDE1FFF5EFD0FFEADB
        BAFFD6B892FFAE825CE83D2D1F5E000000070000000100000000000000000000
        0001000000054D3D2C6AC19D78F2ECDFBDFFFEFDDFFFB48359FFAB845EE18A6A
        4CBB4E3C2A700705041300000004000000010000000000000000000000000000
        0000000000000000000315110D21896E51B3DABF9AFFBC8D64FF0000000B0000
        0005000000030000000100000000000000000000000000000000000000000000
        0000000000000000000000000001000000044336285BB08865E80706040E0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000200000003000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton16: TdxBarButton
      Action = actColarSelecao
      Category = 0
    end
    object dxBarSeparator4: TdxBarSeparator
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarButton17: TdxBarButton
      Action = actCopiarSelecao
      Category = 0
    end
    object dxBarButton18: TdxBarButton
      Action = actCortarImagem
      Category = 0
    end
    object dxBarButton19: TdxBarButton
      Action = actCopiarSelecao
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0002000000090000000E0000000F0000000F0000001000000010000000110000
        0011000000100000000B00000003000000000000000000000000000000000000
        00087C5345C0AD725EFFAC725DFFAC715DFFAC6F5BFFAB705CFFAB705CFFAB6E
        5CFFAB6E5AFF7A4E41C30000000B000000000000000000000000000000000000
        000BAF7462FFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
        EEFFFAF2ECFFAC715DFF0000000F000000000000000000000000000000000000
        000BB17964FFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
        E5FFFAF2EEFFAE7260FF01010120010101100101010B00000003000000000000
        000BB37C69FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
        E6FFFAF3EFFFB07863FFC19D92FFB57D6AFF815A4EC30101010B000000000000
        000AB57F6CFFFEFCFBFFF9F0EAFFF8F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EE
        E7FFFBF5F1FFB27A66FFEBE6E2FFFAF3EDFFB6806DFF0101010F000000000000
        0009B98270FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
        E9FFFBF6F3FFB37D6AFFE9E1DAFFFAF3EFFFB88170FF01010110000000000000
        0008BB8775FFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
        EBFFFCF8F5FFB6806DFFEAE1DBFFFAF4F0FFB98673FF0101010F000000000000
        0007BF8B78FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
        EDFFFCF9F7FFBA8471FFECE4DDFFFBF5F2FFBB8876FF0101010E000000000000
        0007C18E7EFFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
        EFFFFDFAF8FFBC8978FFEDE7E0FFFBF6F4FFBC8B7AFF0101010D000000000000
        0006C49382FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
        F1FFFDFBF9FFBF8C7CFFEFE8E3FFFCF8F5FFBF8E7CFF0101010D000000000000
        0005C49785FFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFDFDFFFEFD
        FDFFFEFDFCFFC2907FFFF0EBE6FFFCF9F7FFC29180FF0101010C000000000000
        0003967265C0C89988FFC99887FFC79887FFC59786FFC79785FFC79784FFC596
        84FFC59683FFCDA79AFFF4EFEAFFFDFAF8FFC49686FF0101010B000000000000
        000100000003000000040000000BD8BBB0FFF8F8F8FFF5F0EFFFF5F0EFFFF5EF
        EDFFF5EFEDFFF7F0EEFFFAF4F1FFFDFBF9FFC7998AFF0000000A000000000000
        0000000000000000000000000005CCA392FFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFDFFFEFDFDFFFEFDFDFFFEFDFCFFCA9D8DFF00000009000000000000
        00000000000000000000000000039A7B6FC0CEA495FFCFA494FFCDA494FFCCA3
        93FFCDA392FFCDA391FFCCA291FFCCA290FF97776BC200000006}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton20: TdxBarButton
      Action = actColarSelecao
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000030000000C00000010000000110000
        0011000000120000001200000013000000130000001000000004000000000000
        00000000000000000000000000000000000BA97563FFA87462FFA77261FFA571
        5FFFA5705EFFA36F5DFFA36D5CFFA26D5BFFA26C5AFF0000000F000000000000
        00000000000000000000000000000000000DAB7866FFFDFBF8FFF7EFE8FFF6EF
        E6FFF6EEE6FFF5EEE5FFF5EDE4FFF5EDE4FFA36D5CFF00000013000000000000
        0000265080B7336CB1FF326BB0FF2E63A6FFAD7C6AFFFDFCFAFFF7F0E9FFF7F0
        E8FFF7EFE7FFF6EFE7FFF6EEE6FFF5EEE5FFA46F5DFF00000012000000000000
        00003976B8FF91D2F4FF66BEEEFF60B5E4FFB07F6DFFFEFDFCFFF7F2EAFFF8F1
        E9FFF7F0E9FFF6F0E8FFF6EFE7FFF6EFE6FFA67260FF00000011000000000000
        00003F7DBCFF9AD6F5FF6CC3F0FF66B8E5FFB28070FFFEFEFDFFF8F3ECFFF8F2
        EBFFF7F1EAFFF7F1E9FFF7F0E8FFF7EFE8FFA87563FF00000010000000000000
        00004384C1FFA4DBF6FF73C7F1FF6CBEE8FFB48473FFFFFFFEFFF9F3EEFFF9F3
        EDFFF9F2ECFFF8F2EBFFF7F1EAFFF7F0E9FFAB7766FF0000000F000000000000
        0000488BC5FFADE1F8FF7ACCF2FF73C3E9FFB68676FFFFFFFFFFF9F5EEFFF9F4
        EEFFF9F3EDFFF8F3ECFFF8F2EBFFF7F2EBFFAC7A6AFF0000000E000000000000
        00004C92CAFFB6E6FAFF81D2F4FF7AC9EBFFB88878FFFFFFFFFFFAF5F0FFF9F5
        EFFFF9F5EFFFF9F4EEFFF9F3EDFFF9F3ECFFAF7E6CFF0000000D000000000000
        00005098CDFFBEE9FAFF88D6F6FF81CEEEFFBB8B7BFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFAFFB1816FFF0000000C000000000000
        0000539DD1FFC5EDFBFF8FDBF7FF89D5F2FFBD8D7DFFBB8C7CFFBA8B7BFFB989
        79FFB98977FFB78876FFB68674FFB58373FFB38371FF00000009000000000000
        000056A1D4FFCBF0FCFF95E0F8FF82CBE9FF72B7D9FF71B7D9FF70B7DAFF70B8
        DBFF6FB7DBFF4385BBFF00000009000000090000000800000002000000000000
        000058A5D7FFCBEDF8FF73B2D0FF5792B7FF5893B7FF5995BAFF5B99BDFF62A3
        C9FF69AFD4FF4184BBFF00000000000000000000000000000000000000000000
        000059A8D9FFBCDBE7FF8E7875FF9B7061FF946A5BFF8F6456FF885D50FF7B65
        63FF97BCD3FF488EC4FF00000000000000000000000000000000000000000000
        0000437EA2BD4A90BFFFB48E7FFFF3EDE7FFDEC9B8FFDDC8B5FFDBC4B2FF9770
        60FF3B7BAEFF40799EBD00000000000000000000000000000000000000000000
        00000000000000000000876B60BDB69181FFB69080FFB58E7FFFB28C7DFF7D60
        54BD000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton22: TdxBarButton
      Action = actMergeSelecao
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFB8824DFFFFFFFFFF848484FF848484FF848484FF8484
        84FFFFFFFFFFB8824DFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFF848484FF848484FF848484FF8484
        84FFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFB8824DFFFFFFFFFF848484FF848484FF848484FF8484
        84FFFFFFFFFFB8824DFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFF
        FFFF848484FF848484FF848484FF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A330000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8383
        83FE848484FF1A1A1A3300000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton23: TdxBarButton
      Action = actDeletarLayer
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00020000000900000012000000180000001A0000001A00000018000000100000
        0005000000010000000000000000000000000000000000000000000000020000
        000D3524146A936338E5A56B3AFFA36938FFA16736FF9D6233FB633E20B70805
        022800000006000000010000000000000000000000000000000000000008442F
        1D78C18B59FEE1AC76FFE4C296FFB5793BFFB5793CFFB5793CFFAD7239FF7E50
        2AD80302042A00000006000000010000000000000000000000000000000DB07D
        4EF3E6B17AFFE9B47DFFE9B47DFFE7C79DFFB67A3DFFB57A3DFFB57A3DFF6953
        7BFF090E5ED50001052800000006000000010000000000000000000000086A4E
        329DEFD7B3FFE9B47DFFE9B47DFFE9B47DFFEACDA4FFB57B3EFF735C86FF313F
        CCFF2935B8FF0B1161D501010627000000050000000100000000000000010000
        000C745538A5F2DDBBFFE9B47DFFE9B47DFFE9B47DFFD1CEE1FF3443CEFF3443
        CDFF3443CEFF2C39BAFF0D1463D4010106260000000500000001000000000000
        00020000000B76583BA4F5E2C1FFE9B47DFFB5A9B8FF829FF1FFB1C9F5FF3949
        D1FF3A4AD1FF3A49D1FF303FBDFF111767D30101062500000005000000000000
        0000000000010000000B785B3DA3E9E1D2FF87A3F2FF87A4F1FF87A3F2FFB9D0
        F7FF3E50D5FF3E50D5FF3F50D5FF3545C2FF141B6AD201010622000000000000
        000000000000000000010000000A2C386FA2C9E2F9FF8CA8F3FF8DA8F3FF8CA8
        F3FFC0D8F9FF4457D9FF4356D9FF4456D9FF3949C2FF141A61C2000000000000
        000000000000000000000000000100000009303D74A1CFE7FBFF92ADF3FF91AD
        F4FF92ADF4FFC6DEFAFF495EDBFF495DDCFF475AD7FF232F8BF0000000000000
        00000000000000000000000000000000000100000008334177A0D4ECFCFF97B2
        F5FF97B2F4FF97B3F5FFCCE4FBFF4A5FDAFF3141A4F6090C214A000000000000
        000000000000000000000000000000000000000000010000000736457A9FD8F0
        FDFF9DB7F5FF9CB7F5FFD9F1FEFF6B81CAF50B0E234700000006000000000000
        0000000000000000000000000000000000000000000000000001000000063947
        7D9EDBF3FEFFDBF3FFFF677FCFF513192C440000000500000001000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        00053543728E4F63AACD151A2D40000000040000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000030000000400000002000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton14: TdxBarButton
      Action = actImportar
      Category = 0
    end
    object ckbAutoFit: TcxBarEditItem
      Caption = 'Auto Fit'
      Category = 0
      Hint = 'Auto Fit'
      Visible = ivAlways
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      InternalEditValue = 'N'
    end
    object dxBarButton15: TdxBarButton
      Action = actZoomMais
      Category = 0
    end
    object dxBarButton21: TdxBarButton
      Action = actZoomMenos
      Category = 0
    end
    object dxBarButton24: TdxBarButton
      Action = actFit
      Category = 0
    end
    object ckbImagemColorida: TcxBarEditItem
      Caption = 'Imagem Colorida'
      Category = 0
      Hint = 'Imagem Colorida'
      Visible = ivAlways
      OnChange = ckbImagemColoridaChange
      ShowCaption = True
      Width = 0
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
    end
    object dxBarButton25: TdxBarButton
      Action = actCheckBoxesImagem
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000C0E0A1500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000031362652909F70F32D32234C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000003136265293A373F997A776FF93A373F92B3022490000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000003136265293A373F997A776FF97A776FF97A776FF93A273F82B2F
        2148000000000000000000000000000000000000000000000000000000000000
        00003136265393A373F997A776FF91A071F54951397B93A273F897A776FF93A2
        73F82B2F21480000000000000000000000000000000000000000000000000506
        0409839166DD97A776FF91A071F5262A1E40000000002B2F214893A273F897A7
        76FF93A273F82B30224900000000000000000000000000000000000000000000
        000015171023808D64D8262A1E400000000000000000000000002B2F214893A2
        73F897A776FF93A273F82B302249000000000000000000000000000000000000
        0000000000000202010300000000000000000000000000000000000000002B2F
        214893A273F897A776FF93A273F82B3022490000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00002B2F214893A273F897A776FF93A273F82B30224900000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000002B2F214893A273F897A776FF76825CC701010001000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000002B2F214875825CC60B0C081200000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000010100010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionInMenu
    end
    object dxBarButton26: TdxBarButton
      Action = actCheckBoxesImagem
      Category = 0
    end
    object lblConvertendo: TcxBarEditItem
      Caption = 'Importando Aguarde...'
      Category = 0
      Hint = 'Convertendo Arquivos Aguarde.'
      Visible = ivNever
      PropertiesClassName = 'TcxLabelProperties'
    end
    object dxBarButton27: TdxBarButton
      Action = actExportTiff
      Category = 0
    end
    object dxBarButton28: TdxBarButton
      Action = actHistorico
      Category = 0
    end
    object dxBarButton29: TdxBarButton
      Action = actExportTiff
      Category = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF000000000000
        00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FF97A776FF97A776FF97A776FF97A776FF97A776FF97A776FF97A776FF97A7
        76FF97A776FF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FFFFFFFFFF97A776FFFFFFFFFF97A776FFFFFFFFFF97A776FFCBD3BAFFFFFF
        FFFFFFFFFFFF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FFFFFFFFFF97A776FFFFFFFFFF97A776FFFFFFFFFF97A776FFFFFFFFFF97A7
        76FFFFFFFFFF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FFFFFFFFFF97A776FFFFFFFFFF97A776FFFFFFFFFF97A776FFFFFFFFFF97A7
        76FF97A776FF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FFFFFFFFFF97A776FFFFFFFFFFFFFFFFFFFFFFFFFF97A776FFFFFFFFFF97A7
        76FF97A776FF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FFFFFFFFFF97A776FFFFFFFFFF97A776FFFFFFFFFF97A776FFCBD3BAFFFFFF
        FFFFFFFFFFFF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF97A776FF97A7
        76FF97A776FF97A776FF97A776FF97A776FF97A776FF97A776FF97A776FF97A7
        76FF97A776FF97A776FF97A776FFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000
        00000000000000000000848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF}
      PaintStyle = psCaptionInMenu
    end
    object dxBarSubItem4: TdxBarSubItem
      Action = actResize
      Category = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton30'
        end
        item
          Visible = True
          ItemName = 'dxBarButton32'
        end
        item
          Visible = True
          ItemName = 'dxBarButton31'
        end>
    end
    object dxBarButton30: TdxBarButton
      Tag = 10
      Caption = 'Em 10%'
      Category = 0
      Hint = 'Em 10%'
      Visible = ivAlways
      OnClick = dxBarButton30Click
    end
    object dxBarButton31: TdxBarButton
      Tag = 50
      Caption = 'Em 50%'
      Category = 0
      Hint = 'Em 50%'
      Visible = ivAlways
      OnClick = dxBarButton30Click
    end
    object dxBarButton32: TdxBarButton
      Tag = 25
      Caption = 'Em 25%'
      Category = 0
      Hint = 'Em 25%'
      Visible = ivAlways
      OnClick = dxBarButton30Click
    end
  end
  object SaveDialogPDF: TSaveDialog
    DefaultExt = '*.PDF'
    Filter = 'PDF|*.pdf'
    Title = 'Exportar PDF'
    Left = 128
    Top = 80
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 
      'All (*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.pdf)|*.png;*.jpg;*.jpeg;*.' +
      'bmp;*.tif;*.pdf|Portable Network Graphics (*.png)|*.png|Tif Imag' +
      'e (*.tif)|*.tif|Bitmaps (*.bmp)|*.bmp|JPEG Image File (*.jpg)|*.' +
      'jpg|JPEG Image File (*.jpeg)|*.jpeg|PDF (*.pdf)|*.pdf'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 280
    Top = 80
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 40
    Top = 256
    object CopiarPgina1: TMenuItem
      Action = actCopiar
    end
    object Deletar1: TMenuItem
      Action = actMover
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Redigitalizar1: TMenuItem
      Action = actRescanner
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object DeletarPgina1: TMenuItem
      Action = actDeletarPagina
    end
  end
end
