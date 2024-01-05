unit FrameEditor;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WPRTEDefs, WPCTRMemo, WPCTRRich, WPRuler, WPTbar,
  ActnList, cxControls, cxContainer, cxEdit,
  cxLabel, StdCtrls, cxButtons, ExtCtrls, Menus, Buttons, WPPanel, ComCtrls,
  WPUtil, WpPagPrp, ExtDlgs,
  ad3SpellBase, ClipBrd, ImgList,
  WpParPrp, WPRTEDefsConsts, System.Actions, WPRTEEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, WPOBJ_Image, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary;
{$WARN SYMBOL_DEPRECATED OFF}
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
    btnVerificarMarcacao: TcxButton;
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
    procedure btnVerificarMarcacaoClick(Sender: TObject);
    procedure wptTextoBeforeCopyText(Sender: TObject; var doIt: Boolean);
  private

  public
    constructor Create(
      AOwner: TComponent); override;

    function VerificarEdicao(vpEditar : Boolean):Boolean;

    procedure GravarParametrosConfig(vpGrupo, vpSessao : String);
    procedure FormatarColuna(vpNumColuna : Integer);
    procedure HabilitarEdicao;
    procedure DesabilitarEdicao;
    // Rotinas para Controle do Texto

    destructor Destroy; override;
  end;

implementation


uses
  ControleVariaveis,
  Types,
  Controles,
  ComObj,
  Rotinas,
  ValidarPermissaoUsuario,
  WPTAddict,
  MarcacaoTipo,
  Cadastro,
  InserirImagemTexto,
  RotinasImagem;

{$R *.dfm}

procedure TfmeEditor.wptTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if vgAtivarTravarTexto then
    if Key=VK_RETURN then Key := 0;

  if (ssCtrl in Shift) and (Key=Ord('L')) then //Ctrl+L
    wptTexto.FindDialog;

end;

procedure TfmeEditor.wptTextoKeyPress(Sender: TObject; var Key: Char);
begin
  AtalhosStylo(wptTexto, key);

  if (afsProtected in wptTexto.CPAttr.Style) and (Key <> #3) then
  begin
    key := #0;
    Exit;
  end
  else
  begin
    wptTexto.CurrAttr.DeleteStyle([afsProtected]);
    vgMarcacaoSelecionadaTexto := '';
  end;
end;

procedure TfmeEditor.wptTextoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  vgMarcacaoSelecionadaTexto := '';
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

  // Primeira Validação
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
    if Application.MessageBox('Seleção de texto inválida para exclusão. Deseja apagar assim mesmo?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
      exit;
    if (LiberarPermissaoUsuario('ESP_ATOCONTROLEMASTER')[6] = '0') then
      exit;
    // Final de Primeira Validação
  end
  else
  begin
    // Segunda Validação
    viFlag1 := pos(#2, viWptAuxiliar.text);
    viFlag2 := pos(#3, viWptAuxiliar.text);
    if ((viFlag1 > viFlag2) and (viFlag1 <> 0)) and (not vgExcluirMarcacao) then
    begin
      FreeAndNil(viWptAuxiliar);
      if Application.MessageBox('Seleção de texto inválida para exclusão. Deseja apagar assim mesmo?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
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
   ConvertTextToJpeg(wptTexto, SaveDialog1.FileName);
end;

procedure TfmeEditor.btnVerificarMarcacaoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  vgMarcacaoBuscar := vgQualificar.MarcacaoIdentificada;
  CadMarcacaoTipo;
  Screen.Cursor := crDefault;
end;

procedure TfmeEditor.btnInserirImagemClick(Sender: TObject);
begin
  TfrmInserirImagemTexto.InserirImagemTexto(wptTexto);
end;

//procedure TfmeEditor.btnInserirImagemClick(Sender: TObject);
//{$REGION 'Constantes'}
//const
//  UmKB = 1024;
//  UmMB = UmKB * UmKB;
//  CI_TAMANHO_MAXIMO_MB = 0.2;
//{$ENDREGION}
//
//{$REGION 'Variáveis'}
//var
//  viArquivosComprimidos: TStrings;
//  I: Integer;
//  viArquivo: string;
//  viSearchRec: TSearchRec;
//  viTamanhoMegabytes: Double;
//  viNovoArquivo: string;
//  viResult : TModalResult;
//  viObjectModes : TWPTextObjModes;
//  viImg: TWPOImage;
//{$ENDREGION}
//begin
//  {if OpenPictureDialog1.Execute then
//  begin
//    wptTexto.Changing;
//    viImg := TWPOImage.Create(wptTexto.Memo.RTFData);
//    viImg.LoadFromFile(OpenPictureDialog1.FileName);
//
//    wptTexto.TextObjects.Insert(viImg);
//    wptTexto.ChangeApplied;
//  end;}
//
//  viResult := MensagemPersonalizada('Inserir imagem', 'Posição: ', 'Fixa', 'Dinâmica');
//
//  case viResult of
//    mrYes    : viObjectModes := [wpobjLockedPos];
//    mrNo     : viObjectModes := [wpobjPositionAtRight];
//    else Exit;
//  end;
//
//  if not OpenPictureDialog1.Execute then
//    Exit;
//
//  viArquivosComprimidos := TStringList.Create;
//  try
//    {
//      1º Passo - Verificar se alguma das imagens selecionadas
//      ultrapassa o tamanho de 1 MB
//    }
//    for I := 0 to Pred(
//      OpenPictureDialog1.Files.Count) do
//    begin
//      viArquivo := OpenPictureDialog1.Files[I];
//
//      if FindFirst(
//        viArquivo,
//        faAnyFile,
//        viSearchRec) <> 0 then
//      begin
//        TMensagemUtils.ExibirMensagemAtencao(
//          string.Format(
//            'Arquivo %s não existe.',
//            [viArquivo]));
//
//        Exit;
//      end;
//
//      try
//        repeat
//          viTamanhoMegabytes := viSearchRec.Size / UmMB;
//          if viTamanhoMegabytes > CI_TAMANHO_MAXIMO_MB then
//          begin
//            viNovoArquivo := ExtractFilePath(
//              viArquivo) + TPath.GetRandomFileName + '.jpeg';
//
//            viArquivosComprimidos.Add(
//              viNovoArquivo);
//
//            FormatImageWPtools.ImageConverteTo(
//              viArquivo,
//              viNovoArquivo);
//
//            OpenPictureDialog1.Files[I] := viNovoArquivo;
//          end;
//        until
//          FindNext(
//            viSearchRec) <> 0;
//      finally
//        FindClose(
//          viSearchRec);
//      end;
//    end;
//
//    // 2º Passo - Incluir as imagens selecionadas
//   // wptTexto.Changing;
//    try
//      for viArquivo in OpenPictureDialog1.Files do
//      begin
////        viImg := TWPOImage.Create(
////          wptTexto.Memo.RTFData);
////
////        viImg.LoadFromFile(
////          viArquivo);
////
////        wptTexto.TextObjects.Insert(
////          viImg);
//
//         wptTexto.InsertGraphic(
//             viArquivo,
//             false,
//             [wpobjLockedPos]).;
//      end;
//    finally
//     // wptTexto.ChangeApplied;
//    end;
//  finally
//    for viArquivo in viArquivosComprimidos do
//      DeleteFile(
//        viArquivo);
//
//    viArquivosComprimidos.Free;
//  end;
//end;

constructor TfmeEditor.Create(
  AOwner: TComponent);
begin
  inherited;

  WPAddict.AddLiveControl(
    wptTexto);
end;

procedure TfmeEditor.DesabilitarEdicao;
begin
  wptTexto.Readonly := True;
  wptTexto.CaretDisabled := False;
  wptTexto.PopupMenu := nil;
  wptFerramentas.Enabled := False;
  WPReguaHorizontal.Enabled := False;
  WPVertRuler1.Enabled := False;
  WPToolPanel1.Enabled := False;
  Application.ProcessMessages;
end;

destructor TfmeEditor.Destroy;
begin
  WPAddict.RemoveLiveControl(
    wptTexto);

  inherited;
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
    ShowMessage('Tamanho da Fonte inválido!!!');
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
      finally
        Word.Quit;
      end;
      wptTexto.PasteFromClipboard;
    end;
    Screen.Cursor := crDefault;
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
    dtmControles.sqlAuxiliar.ExecSQL;
  end;
begin
  Screen.Cursor := crSQLWait;
  dtmControles.StartTransaction;
  try
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
    dtmControles.Rollback;
    Application.MessageBox('Operação Não Efetuada!' + #10#13 +
      'Favor Verificar.', 'Erro', MB_OK + MB_ICONERROR);
  end;
  Screen.Cursor := crDefault;
  Application.MessageBox('Configuração Salva!!!','Informação', MB_OK + MB_ICONINFORMATION);
end;

procedure TfmeEditor.HabilitarEdicao;
begin
  wptTexto.Readonly := False;
  wptTexto.CaretDisabled := False;
  wptTexto.PopupMenu := popMinuta;
  wptFerramentas.Enabled := True;
  WPReguaHorizontal.Enabled := True;
  WPVertRuler1.Enabled := True;
  WPToolPanel1.Enabled := True;
  Application.ProcessMessages;
end;

function TfmeEditor.VerificarEdicao(vpEditar: Boolean): Boolean;
begin
  if not vpEditar then
    Application.MessageBox('Registro deve estar em edição!!!', 'Informação', MB_OK + MB_ICONINFORMATION);
  Result := vpEditar;
end;

procedure TfmeEditor.wptTextoBeforeCopyText(Sender: TObject; var doIt: Boolean);
var
  wptMemoria: TWPRichText;
begin
  wptMemoria := TWPRichText.Create(nil);
  wptMemoria.Parent  := wptTexto;
  wptMemoria.Visible := False;
  wptMemoria.Clear;
  try
    wptMemoria.SelectionAsString := wptTexto.SelectionAsString;
    wptMemoria.SelectAll;
    wptMemoria.CurrAttr.DeleteStyle([ afsProtected ]);
    RedefinirPadraoFonte(wptMemoria,False,False);
    wptMemoria.CopyToClipboard(True);
  finally
    FreeAndNil(wptMemoria);
    doIt := False;
  end;
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
  btnVerificarMarcacao.Visible := vgQualificar.MarcacaoAutomatica and (vgQualificar.MarcacaoIdentificada <> '');
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
