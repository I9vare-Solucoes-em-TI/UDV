object fmeEditorSimples: TfmeEditorSimples
  Left = 0
  Top = 0
  Width = 685
  Height = 336
  TabOrder = 0
  object wptFerramentas: TWPToolbar
    Left = 0
    Top = 0
    Width = 685
    Height = 30
    ImageStretch = False
    Color = 14807280
    ColorTo = 15790316
    ParentColor = False
    UseDockManager = False
    KeepGroupsTogether = False
    ShowAllElements = wpSelectedElements
    Align = alTop
    BevelLines = []
    AutoEnabling = True
    WidthBetweenGroups = 4
    MarginBottom = 0
    MarginTop = 0
    sel_ListBoxes = [SelFontName, SelFontSize, SelFontColor]
    sel_StatusIcons = [SelNormal, SelBold, SelItalic, SelUnder, SelSuper, SelSub, SelHidden, SelLeft, SelRight, SelBlock, SelCenter]
    sel_ActionIcons = [SelZoomIn, SelZoomOut]
    sel_DatabaseIcons = []
    sel_EditIcons = [SelCopy, SelCut, SelPaste, SelSelAll]
    sel_TableIcons = []
    FlatButtons = True
    ButtonHeight = 22
  end
  object WPReguaHorizontal: TWPRuler
    Left = 0
    Top = 30
    Width = 685
    Height = 26
    Design = wpRulerBlue
    DrawOptions = []
    Options = [wrShowTabSelector, wrShowTabStops, wrShowIndents, wpUseIntervalls]
    ColorMargin = 13034466
    ColorBack = clBtnFace
    ColorBorder = clSilver
    Align = alTop
  end
  object wptTexto: TWPRichText
    Left = 0
    Top = 56
    Width = 685
    Height = 280
    Cursor = crIBeam
    RTFVariables = <>
    WPToolBar = wptFerramentas
    WPRuler = WPReguaHorizontal
    LayoutMode = wplayShrunkenLayout
    ColorDesktop = 13034466
    EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectSelecting, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpMoveCPOnPageUpDown]
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
    OnChangeCursorPos = wptTextoChangeCursorPos
    Align = alClient
    PopupMenu = popMinuta
    TabOrder = 2
    OnKeyPress = wptTextoKeyPress
  end
  object popMinuta: TPopupMenu
    Images = dtmControles.imgCadBasicos
    Left = 27
    Top = 79
    object AvanarMarcao1: TMenuItem
      Caption = 'Avan'#231'ar Marca'#231#227'o'
      ShortCut = 114
      OnClick = AvanarMarcao1Click
    end
    object RetornarMarcao1: TMenuItem
      Caption = 'Retornar Marca'#231#227'o'
      ShortCut = 115
      OnClick = RetornarMarcao1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniMarcacaoDesfazer: TMenuItem
      Caption = 'Desfazer Marca'#231#227'o'
      ShortCut = 16459
      OnClick = mniMarcacaoDesfazerClick
    end
    object mniMarcacaoExcluir: TMenuItem
      Caption = 'Excluir Marca'#231#227'o'
      ShortCut = 16430
      OnClick = mniMarcacaoExcluirClick
    end
    object mniRetirarProtecao: TMenuItem
      Caption = 'Retirar Prote'#231#227'o Inv'#225'lida'
      Hint = 'Alterar'
      ShortCut = 8238
      OnClick = mniRetirarProtecaoClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object DicionrioGramatical1: TMenuItem
      Caption = 'Dicion'#225'rio Gramatical'
      ShortCut = 16452
      OnClick = DicionrioGramatical1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object AtivarDicionrioPadro1: TMenuItem
      Caption = 'Ativar Dicion'#225'rio (Ortogr'#225'fico)'
      ShortCut = 16463
      OnClick = AtivarDicionrioPadro1Click
    end
  end
end
