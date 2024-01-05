unit FrameEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WPRTEDefs, WPCTRMemo, WPCTRRich, WPRuler, WPTbar,
  cxLookAndFeelPainters, ActnList, cxControls, cxContainer, cxEdit, WPObj_image,
  cxLabel, StdCtrls, cxButtons, ExtCtrls, Menus, Buttons, WPPanel, ComCtrls,
  frxClass, frxExportImage, frxRich, WPUtil, WpPagPrp, ExtDlgs,
  ad3SpellBase, ad3Spell, ad3Configuration, WPRTEPaint, ClipBrd, ImgList,
  WpParPrp, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxGraphics, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinDevExpressDarkStyle;

type
  TfmeEditor = class(TFrame)
    wptFerramentas: TWPToolBar;
    WPReguaHorizontal: TWPRuler;
    wptTexto: TWPRichText;
    PanelMarcacao: TPanel;
    chkShowMarcacaoInterna: TCheckBox;
    lblInfoMarcacaoInterna: TcxLabel;
    actListMinuta: TActionList;
    actDicionarioGramatical: TAction;
    actMarcacaoManual: TAction;
    actMarcacaoAutomatica: TAction;
    popMinuta: TPopupMenu;
    mniMarcacaoManual: TMenuItem;
    mniMarcacaoAutomatica: TMenuItem;
    mniDicionarioGramatical: TMenuItem;
    N1: TMenuItem;
    mniMarcacaoAvancao: TMenuItem;
    mniRetornarMarcacao: TMenuItem;
    N2: TMenuItem;
    mniMarcacaoDesfazer: TMenuItem;
    mniMarcacaoExcluir: TMenuItem;
    mniRetirarProtecao: TMenuItem;
    WPPagePropDlg1: TWPPagePropDlg;
    WPVertRuler1: TWPVertRuler;
    SaveDialog1: TSaveDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    mniMaisZoom: TMenuItem;
    mniMenosZoom: TMenuItem;
    mniFormatarPalavra: TMenuItem;
    N3: TMenuItem;
    mniRedefinirTamanho: TMenuItem;
    N4: TMenuItem;
    mniImportarTextoExterno: TMenuItem;
    OpenDialog: TOpenDialog;
    StatusBar: TStatusBar;
    WPToolPanel1: TWPToolPanel;
    btnSaveImagem: TWPToolButton;
    btnInserirImagem: TWPToolButton;
    btnConfigPagina: TWPToolButton;
    btnSalvarConfiguracao: TWPToolButton;
    ImglIcones: TImageList;
    Zoom1: TMenuItem;
    Formatar1: TMenuItem;
    Ma1: TMenuItem;
    Minscula1: TMenuItem;
    Pargrafo1: TMenuItem;
    Colunas1: TMenuItem;
    WPParagraphPropDlg1: TWPParagraphPropDlg;
    ColumnsOff: TMenuItem;
    Col21: TMenuItem;
    Col31: TMenuItem;
    Col41: TMenuItem;
    btnGravacaoAutomatica: TSpeedButton;
    cxLabel7: TcxLabel;
    speNumColunas: TcxSpinEdit;
    btnDicionarioGramatical: TcxButton;
    btnMarcacaoAutomatica: TcxButton;
    btnMarcacaoManual: TcxButton;
    procedure wptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure actDicionarioGramaticalExecute(Sender: TObject);
    procedure actMarcacaoAutomaticaExecute(Sender: TObject);
    procedure actMarcacaoManualExecute(Sender: TObject);
    procedure chkShowMarcacaoInternaClick(Sender: TObject);
    procedure mniMarcacaoDesfazerClick(Sender: TObject);
    procedure mniMarcacaoAvancaoClick(Sender: TObject);
    procedure mniRetornarMarcacaoClick(Sender: TObject);
    procedure mniMarcacaoExcluirClick(Sender: TObject);
    procedure mniRetirarProtecaoClick(Sender: TObject);
    procedure btnConfigPaginaClick(Sender: TObject);
    procedure btnSaveImagemClick(Sender: TObject);
    procedure btnInserirImagemClick(Sender: TObject);
    procedure mniMaisZoomClick(Sender: TObject);
    procedure mniMenosZoomClick(Sender: TObject);
    procedure mniRedefinirTamanhoClick(Sender: TObject);
    procedure mniFormatarPalavraClick(Sender: TObject);
    procedure mniImportarTextoExternoClick(Sender: TObject);
    procedure wptTextoUpdateExternScrollbar(Sender: TWPCustomRtfEdit;
      ScrollBar: TScrollStyle; Range, Page, Pos: Integer);
    procedure wptTextoCharacterAttrChange(Sender: TObject;
      Attribute: TWPSetModeControl);
    procedure Pargrafo1Click(Sender: TObject);
    procedure Ma1Click(Sender: TObject);
    procedure Minscula1Click(Sender: TObject);
    procedure ColumnsOffClick(Sender: TObject);
    procedure Col21Click(Sender: TObject);
    procedure Col41Click(Sender: TObject);
    procedure Col31Click(Sender: TObject);
    procedure wptTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wptTextoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public
    procedure GravarParametrosConfig(vpGrupo, vpSessao : String);
    procedure AtivarCorretorOrtografico;
    function VerificarEdicao(vpEditar : Boolean):Boolean;
    procedure FormatarColuna(vpNumColuna : Integer);
    // Rotinas para Controle do Texto
  end;

implementation

uses ControleVariaveis, Types, Controles, WPTAddict, ComObj, Rotinas,
  ValidarPermissaoUsuario;

{$R *.dfm}

procedure TfmeEditor.wptTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if vgAtivarTravarTexto then
    if Key=VK_RETURN then Key := 0;

end;

procedure TfmeEditor.wptTextoKeyPress(Sender: TObject; var Key: Char);
begin
  AtalhosStylo(wptTexto, key);
  if (afsProtected in wptTexto.CPAttr.Style) then
  begin
    key := #0;
    Exit;
  end
  else
  begin
    wptTexto.CurrAttr.DeleteStyle([afsProtected]);
    vgMarcacaoSelecionada := '';
  end;
end;

procedure TfmeEditor.wptTextoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  vgMarcacaoSelecionada := '';
end;

procedure TfmeEditor.actDicionarioGramaticalExecute(Sender: TObject);
begin
  Marcacao_Adicionar(wptTexto,'GRAMATICAL');
end;

procedure TfmeEditor.actMarcacaoAutomaticaExecute(Sender: TObject);
begin
  Marcacao_Adicionar(wptTexto,'AUTOMATICA');
end;

procedure TfmeEditor.actMarcacaoManualExecute(Sender: TObject);
begin
  Marcacao_Adicionar(wptTexto,'MANUAL');
end;

procedure TfmeEditor.chkShowMarcacaoInternaClick(Sender: TObject);
begin
  if chkShowMarcacaoInterna.Checked then
       wptTexto.FormatOptions := [wpShowBookmarkCodes,wpShowHyperlinkCodes]
  else wptTexto.FormatOptions := [];
end;

procedure TfmeEditor.mniMarcacaoDesfazerClick(Sender: TObject);
begin
  Marcacao_Desfazer(wptTexto, vgTipoMarcacao);
end;

procedure TfmeEditor.mniMarcacaoAvancaoClick(Sender: TObject);
begin
  lblInfoMarcacaoInterna.Caption := Marcacao_AvancarRetornar(wptTexto, wptTexto.CPMoveNext);
end;

procedure TfmeEditor.mniRetornarMarcacaoClick(Sender: TObject);
begin
  lblInfoMarcacaoInterna.Caption := Marcacao_AvancarRetornar(wptTexto, wptTexto.CPMoveBack);
end;

procedure TfmeEditor.mniMarcacaoExcluirClick(Sender: TObject);
var
  viFlag1, viFlag2 : Integer;
  viFlagContinuar  : Boolean;
  viWptAuxiliar    : TWPRichText;

  Function BuscarMarcador(vpMarcador : String; var vpContador : Integer):Boolean;
  begin
    if viWptAuxiliar.Finder.Next(vpMarcador) then
    begin
      inc(vpContador);
      Result := True
    end
    else Result := False;
  end;

begin

  // Primeira Valida��o
  viFlag1 := 0;
  viFlag2 := 0;

  viWptAuxiliar := TWPRichText.Create(nil);
  viWptAuxiliar.Text := wptTexto.SelText;
  viWptAuxiliar.CPPosition := $0;
  repeat
    viFlagContinuar := BuscarMarcador(#2,viFlag1);
  until not viFlagContinuar;

  viWptAuxiliar.HideSelection;
  viWptAuxiliar.Finder.ToStart;
  repeat
    viFlagContinuar := BuscarMarcador(#3,viFlag2);
  until not viFlagContinuar;

  if (viFlag1 <> viFlag2) and (not vgExcluirMarcacao) then
  begin
    FreeAndNil(viWptAuxiliar);
    if Application.MessageBox('Sele��o de texto inv�lida para exclus�o. Deseja apagar assim mesmo?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
      exit;
    if (LiberarPermissaoUsuario('ESP_ATOCONTROLEMASTER')[6] = '0') then
      exit;
    // Final de Primeira Valida��o
  end
  else
  begin
    // Segunda Valida��o
    viFlag1 := pos(#2, viWptAuxiliar.text);
    viFlag2 := pos(#3, viWptAuxiliar.text);
    if ((viFlag1 > viFlag2) and (viFlag1 <> 0)) and (not vgExcluirMarcacao) then
    begin
      FreeAndNil(viWptAuxiliar);
      if Application.MessageBox('Sele��o de texto inv�lida para exclus�o. Deseja apagar assim mesmo?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
        exit;
      if (LiberarPermissaoUsuario('ESP_ATOCONTROLEMASTER')[6] = '0') then
        exit;
    end
    else FreeAndNil(viWptAuxiliar);
  end;

  vgExcluirMarcacao := False;

  if not (wptTexto.Readonly) then
    Marcacao_Excluir(wptTexto, vgTipoMarcacao);

end;

procedure TfmeEditor.mniRetirarProtecaoClick(Sender: TObject);
var
  viTexto : string;
begin
  inherited;
  viTexto := lblInfoMarcacaoInterna.Caption;
  if viTexto = '' then
  begin
    wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    wptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
    wptTexto.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  end;
end;

procedure TfmeEditor.btnConfigPaginaClick(Sender: TObject);
begin
  WPPagePropDlg1.Execute;
end;

procedure TfmeEditor.btnSaveImagemClick(Sender: TObject);
begin
 if SaveDialog1.Execute then
   dtmControles.CriarImagem(wptTexto, SaveDialog1.FileName, SaveDialog1.FilterIndex);
end;

procedure TfmeEditor.btnInserirImagemClick(Sender: TObject);
var Img : TImage;
begin
  if OpenPictureDialog1.Execute then
  begin
    Img := TImage.Create(nil);
    Img.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    wptTexto.TextObjects.InsertCopy(Img.Picture.Graphic);
    Img.Free;
  end;
end;

procedure TfmeEditor.AtivarCorretorOrtografico;
begin
  dtmControles.AddictSpell31.Configuration.SpellOptions := dtmControles.AddictSpell31.Configuration.SpellOptions + [soLiveSpelling];
  dtmControles.AddictSpell31.ConfigDictionaryDir.Clear;
  dtmControles.AddictSpell31.ConfigDictionaryDir.Add(vgDiretorioCorrente + '\Dic');
  WPAddict.AddictSpell := dtmControles.AddictSpell31;
  WPAddict.AddLiveControl(wptTexto);
end;

procedure TfmeEditor.mniMaisZoomClick(Sender: TObject);
begin
  wptTexto.AutoZoom  := wpAutoZoomOff;
  wptTexto.Zooming   := wptTexto.Zooming + 5;
end;

procedure TfmeEditor.mniMenosZoomClick(Sender: TObject);
begin
  wptTexto.AutoZoom  := wpAutoZoomOff;
  wptTexto.Zooming := wptTexto.Zooming - 5;
end;

procedure TfmeEditor.mniRedefinirTamanhoClick(Sender: TObject);
var
  viFonteS : string;
  viFonteI : Integer;
begin
  if not InputQuery('Fonte do Texto', 'Digite o tamanho da Fonte:',viFonteS) then
    exit;
  try
    viFonteI := StrToInt(viFonteS);
  except
    ShowMessage('Tamanho da Fonte inv�lido!!!');
    exit;
  end;

  wptTexto.SelectAll;
  wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  wptTexto.CurrAttr.Size := viFonteI;
  wptTexto.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  wptTexto.HideSelection;
  vgConfigEditor.FonteTamanho := viFonteI;
end;

procedure TfmeEditor.mniFormatarPalavraClick(Sender: TObject);
begin
  if wptTexto.IsSelected then
    wptTexto.SelectionAsString := MaiusculoMinusculo(wptTexto.SelText);
end;

procedure TfmeEditor.mniImportarTextoExternoClick(Sender: TObject);
var
  Word: OleVariant;
begin
  if OpenDialog.Execute then
  begin
    Screen.Cursor := crHourGlass;
    wptTexto.CPPosition := 0;
    if OpenDialog.FileName <> '' then
    begin
      wptTexto. LoadFromFile(OpenDialog.FileName);
      Word := CreateOleObject('Word.Application');
      try
        Word.Documents.Open(OpenDialog.FileName);
        Word.Selection.WholeStory;
        Word.Selection.Copy;
        Word.Quit;
      finally
      end;
      wptTexto.PasteFromClipboard;
    end;
    Screen.Cursor := crDefault;
    Clipboard.Clear;
  end;
end;

procedure TfmeEditor.GravarParametrosConfig(vpGrupo, vpSessao : String);
  procedure AtualizarParametro(vpCampo, vpValor : string);
  begin
    ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpValor)+
                       ' WHERE NOME            = '+ QuotedStr(vpCampo)+
                       '   AND SECAO           = '+ QuotedStr(vpSessao)+
                       '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                       '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                       '                            AND SISTEMA_ID = '+ IntToStr(vgId)+')',2);
    dtmControles.sqlAuxiliar.ExecSQL(FALSE);
  end;
begin
  Screen.Cursor := crSQLWait;
  try
    dtmControles.StartTransaction;
    AtualizarParametro('MARGEM_DIREITA', IntToStr(wptTexto.Header.RightMargin));
    AtualizarParametro('MARGEM_ESQUERDA', IntToStr(wptTexto.Header.LeftMargin));
    AtualizarParametro('MARGEM_INFERIOR', IntToStr(wptTexto.Header.BottomMargin));
    AtualizarParametro('MARGEM_SUPERIOR', IntToStr(wptTexto.Header.TopMargin));
    AtualizarParametro('MARGEM_CABECALHO', IntToStr(wptTexto.Header.MarginHeader));
    AtualizarParametro('MARGEM_RODAPE', IntToStr(wptTexto.Header.MarginFooter));
    AtualizarParametro('PAGINA_ALTURA', IntToStr(wptTexto.Header.PageHeight));
    AtualizarParametro('PAGINA_LARGURA', IntToStr(wptTexto.Header.PageWidth));
    dtmControles.Commit;
  except
    dtmControles.Roolback;
    Application.MessageBox('Opera��o N�o Efetuada!' + #10#13 +
      'Favor Verificar.', 'Erro', MB_OK + MB_ICONERROR);
  end;
  Screen.Cursor := crDefault;
  Application.MessageBox('Configura��o Salva!!!','Informa��o', MB_OK + MB_ICONINFORMATION);
end;

procedure TfmeEditor.wptTextoUpdateExternScrollbar(
  Sender: TWPCustomRtfEdit; ScrollBar: TScrollStyle; Range, Page,
  Pos: Integer);
begin
//  StatusBar.Panels[0].Text := '      Linha '+ inttostr(wpttexto.CPLineNr+1) + '  -  Coluna '+ inttostr(wpttexto.CPColNr+1);
end;

function TfmeEditor.VerificarEdicao(vpEditar: Boolean): Boolean;
begin
  if not vpEditar then
    Application.MessageBox('Registro deve estar em edi��o!!!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
  Result := vpEditar;
end;

procedure TfmeEditor.wptTextoCharacterAttrChange(Sender: TObject;
  Attribute: TWPSetModeControl);
begin
  if not wptTexto.Focused then
    exit;

  if PanelMarcacao.Visible then
  begin
    if wptTexto.SelText = '' then
      lblInfoMarcacaoInterna.Caption := Marcacao_TipoDescricao(wptTexto);

    if lblInfoMarcacaoInterna.Caption <> '' then
    begin
      actMarcacaoAutomatica.Enabled   := False;
      actMarcacaoManual.Enabled       := False;
      actDicionarioGramatical.Enabled := False;
      mniMarcacaoDesfazer.Enabled     := True;
    end
    else
    begin
      actMarcacaoAutomatica.Enabled   := True;
      actMarcacaoManual.Enabled       := True;
      actDicionarioGramatical.Enabled := True;
      mniMarcacaoDesfazer.Enabled     := False;
    end;
  end;
end;

procedure TfmeEditor.Pargrafo1Click(Sender: TObject);
begin
  if wptTexto <> nil then
  begin
    WPParagraphPropDlg1.EditBox := wptTexto;
    WPParagraphPropDlg1.Execute;
  end;

end;

procedure TfmeEditor.Ma1Click(Sender: TObject);
begin
  if wptTexto <> nil then
  begin
    with wptTexto.TextCursor.CurrAttribute do
    begin
      BeginUpdate;
      ExcludeStyle(afsLowercaseStyle);
      IncludeStyle(afsUppercaseStyle);
      EndUpdate;
    end;
    wptTexto.Refresh;
  end;
end;

procedure TfmeEditor.Minscula1Click(Sender: TObject);
begin
  if wptTexto <> nil then
  begin
    with wptTexto.TextCursor.CurrAttribute do
    begin
      BeginUpdate;
      ExcludeStyle(afsUppercaseStyle);
      IncludeStyle(afsLowercaseStyle);
      EndUpdate;
    end;
    wptTexto.Refresh;
  end;
end;

procedure TfmeEditor.ColumnsOffClick(Sender: TObject);
begin
  FormatarColuna(1)
end;

procedure TfmeEditor.Col21Click(Sender: TObject);
begin
  FormatarColuna(2);
end;

procedure TfmeEditor.FormatarColuna(vpNumColuna : Integer);
begin
  if wptTexto <> nil then
  begin
    wptTexto.ActiveParagraph.ASet(WPAT_COLUMNS, (vpNumColuna));
    if vpNumColuna > 0 then
      wptTexto.ActiveParagraph.ASet(WPAT_COLUMNS_X, 144); // 14 Twips space
    wptTexto.ReformatAll(false, true);
  end;
end;

procedure TfmeEditor.Col41Click(Sender: TObject);
begin
  FormatarColuna(4)
end;

procedure TfmeEditor.Col31Click(Sender: TObject);
begin
  FormatarColuna(3);
end;

end.


