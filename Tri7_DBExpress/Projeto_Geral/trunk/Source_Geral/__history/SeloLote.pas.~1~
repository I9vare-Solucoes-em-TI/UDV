unit SeloLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  FrameEditorSimples, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxImageComboBox, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxTextEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxCheckBox, FrameEditor, Menus,
  cxCalendar, cxGroupBox, SimpleDS, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinsCore, dxSkinsDefaultPainters, cxPC, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxRadioGroup,
  cxLookAndFeels, cxPCdxBarPopupMenu, cxNavigator, dxSkinWhiteprint,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010;

type
  TfrmCadSeloLote = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    sqlSeloLivro: TSimpleDataSet;
    dtsSeloLivro: TDataSource;
    ClientAncestralSELO_LOTE_ID: TFMTBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralDATA_LOTE: TSQLTimeStampField;
    ClientAncestralNUMERO_INICIAL: TFMTBCDField;
    ClientAncestralNUMERO_FINAL: TFMTBCDField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralSELO_GRUPO_ID: TFMTBCDField;
    sqlSeloGrupo: TSimpleDataSet;
    dtsSeloGrupo: TDataSource;
    sqlSeloLivroSELO_LIVRO_ID: TFMTBCDField;
    sqlSeloLivroNUMERO: TFMTBCDField;
    sqlSeloLivroSELO_SITUACAO_ID: TFMTBCDField;
    sqlSeloLivroOBSERVACAO: TStringField;
    sqlSeloLivroSELO_LOTE_ID: TFMTBCDField;
    sqlSeloGrupoSELO_GRUPO_ID: TFMTBCDField;
    sqlSeloGrupoDESCRICAO: TStringField;
    sqlSeloGrupoSITUACAO: TStringField;
    cxLabel7: TcxLabel;
    edtData: TcxDBDateEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    icxSituacao: TcxDBImageComboBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel3: TcxLabel;
    edtSigla: TcxDBTextEdit;
    edtNumeroInicial: TcxDBTextEdit;
    edtNumeroFinal: TcxDBTextEdit;
    pgcControle: TcxPageControl;
    tbcLote: TcxTabSheet;
    tbcSelos: TcxTabSheet;
    sqlSeloLivroSIGLA: TStringField;
    cxGridSelos: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnlBotoes: TPanel;
    sqlSeloSituacao: TSimpleDataSet;
    dtsSeloSituacao: TDataSource;
    sqlSeloSituacaoSELO_SITUACAO_ID: TFMTBCDField;
    sqlSeloSituacaoDESCRICAO: TStringField;
    sqlSeloSituacaoSITUACAO: TStringField;
    sqlSeloLivroDATA: TSQLTimeStampField;
    sqlSeloGrupoNUMERO: TFMTBCDField;
    sqlSeloLivroTABELA: TStringField;
    sqlSeloLivroCAMPO_ID: TFMTBCDField;
    sqlSeloLivroUSUARIO_ID: TFMTBCDField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    sqlSeloLivrocalc_Vinculo: TBooleanField;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGroupBox2: TcxGroupBox;
    lblDisponivel: TcxLabel;
    lblUtilizado: TcxLabel;
    lblExtraviado: TcxLabel;
    lblInutilizado: TcxLabel;
    chxProximoSelo: TcxCheckBox;
    ClientAncestralCALC_NUMERO_INI: TStringField;
    ClientAncestralCALC_NUMERO_FIM: TStringField;
    sqlSeloLivroCALC_NUMERO: TStringField;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    ClientAncestralNOTA_FISCAL: TStringField;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    PopupMenu: TPopupMenu;
    mniAlterarNumeroNota: TMenuItem;
    sqlSeloGrupoTIPO_CARTORIO: TStringField;
    sqlSeloGrupoDESCRICAO_TIPO_CARTORIO: TStringField;
    sqlSeloGrupoDESCRICAO_COMPLETA: TStringField;
    ClientAncestralSIGLA: TStringField;
    sqlSeloLivroDESCRICAO: TStringField;
    Panel1: TPanel;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDDGrupo: TcxGridDBColumn;
    grdBasicaDBTableView1SELO_GRUPO_ID: TcxGridDBColumn;
    grdBasicaDBTableView1TIPO_CARTORIO: TcxGridDBColumn;
    grdBasicaDBTableView1DATA_LOTE: TcxGridDBColumn;
    grdBasicaDBTableView1SIGLA: TcxGridDBColumn;
    grdBasicaDBTableView1CALC_NUMERO_INI: TcxGridDBColumn;
    grdBasicaDBTableView1CALC_NUMERO_FIM: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaDBTableView1NOTA_FISCAL: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    rdbAtivos: TcxRadioButton;
    rdbFechados: TcxRadioButton;
    btnRegistrarSelo: TcxButton;
    btnAtivarLote: TcxButton;
    btnDesativarLote: TcxButton;
    btnFecharLote: TcxButton;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure btnRegistrarSeloClick(Sender: TObject);
    procedure edtSeloNumInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeloNumFinalKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure sqlSeloLivroCalcFields(DataSet: TDataSet);
    procedure pgcControleChange(Sender: TObject);
    procedure btnFecharLoteClick(Sender: TObject);
    procedure btnAtivarLoteClick(Sender: TObject);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure mniAlterarNumeroNotaClick(Sender: TObject);
    procedure ClientAncestralBeforeDelete(DataSet: TDataSet);
    procedure btnDesativarLoteClick(Sender: TObject);
    procedure rdbFechadosClick(Sender: TObject);
    procedure rdbAtivosClick(Sender: TObject);
  private
    { Private declarations }
  public
    vgSeloDisponivel, vgSeloUltimo, vgSeloProximo : Integer;
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    procedure FecharLotes;
  end;

var
  frmCadSeloLote: TfrmCadSeloLote;

implementation

uses Lookup, Controles, Rotinas, Atualizacao, RegistrarSelo;

{$R *.dfm}

procedure TfrmCadSeloLote.ExecuteGravarExecute(Sender: TObject);
var
  i : Integer;
  viSeloLivroId : Integer;
begin
  VerificarPreenchimentoDTA_DB(edtData.Text, 'Data do Lote', edtData);
  VerificarPreenchimentoEDT_DB(edtSigla.Text, 'Sigla', edtSigla);
  VerificarPreenchimentoEDT_DB(edtNumeroInicial.Text, 'Nº Inicial', edtNumeroInicial);
  VerificarPreenchimentoEDT_DB(edtNumeroFinal.Text, 'Nº Final', edtNumeroFinal);

  // **** Valida o Controle de Numeração
  if ClientAncestralNUMERO_INICIAL.AsInteger > ClientAncestralNUMERO_FINAL.AsInteger then
  begin
    ShowMessage('Número Inicial não pode ser maior que o Número Final!!!');
    edtNumeroInicial.SetFocus;
  end;

  Screen.Cursor := crHourGlass;
  if (ClientAncestralNUMERO_FINAL.AsInteger - ClientAncestralNUMERO_INICIAL.AsInteger) > 30000 then
  begin
    ShowMessage('Intervalo de Númeração Inválido!!!');
    edtNumeroInicial.SetFocus;
    exit;
  end;
  // **** Final de Validação

  inherited;

  if ClientAncestralSITUACAO.AsString = 'A' then
  begin
    try
      dtmControles.StartTransaction;
      Application.CreateForm(TfrmAtualizacao,frmAtualizacao);
      frmAtualizacao.lblTexto.Caption := 'Criando Lote de Selos, Aguarde!!!';
      frmAtualizacao.Show;
      Application.ProcessMessages;

      ExecutaSqlAuxiliar(' DELETE FROM G_SELO_LIVRO '+
                         ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString,1);

      sqlSeloLivro.Active := False;
      sqlSeloLivro.DataSet.ParamByName('SELO_LOTE_ID').AsBCD := ClientAncestralSELO_LOTE_ID.AsCurrency;
      sqlSeloLivro.Active := True;

      Screen.Cursor := crHourGlass;
      viSeloLivroId := dtmControles.GerarSequencia('G_SELO_LIVRO') - 1;
      sqlSeloLivro.DisableControls;
      for i := ClientAncestralNUMERO_INICIAL.AsInteger to ClientAncestralNUMERO_FINAL.AsInteger do
      begin
        inc(viSeloLivroId);
        sqlSeloLivro.Insert;
        sqlSeloLivroSELO_LIVRO_ID.AsCurrency    := viSeloLivroId;
        sqlSeloLivroNUMERO.AsInteger            := i;
        sqlSeloLivroSELO_SITUACAO_ID.AsInteger  := 1; // Selo Disponível
        sqlSeloLivroSELO_LOTE_ID.AsInteger      := ClientAncestralSELO_LOTE_ID.AsInteger;
        sqlSeloLivroSIGLA.AsString              := ClientAncestralSIGLA.AsString;
        sqlSeloLivro.ApplyUpdates(-1);
        frmAtualizacao.lblTexto.Caption := 'Criando Lote de Selos, Aguarde!!! Selo '+ClientAncestralSIGLA.AsString +' '+IntToStr(i);
        frmAtualizacao.Update;
      end;
      dtmControles.Commit;
      ExecutaSqlAuxiliar(' UPDATE G_SEQUENCIA SET SEQUENCIA = '+ IntToStr(viSeloLivroId)+
                         ' WHERE TABELA = '+ QuotedStr('G_SELO_LIVRO'),1);
    except
      dtmControles.Roolback;
      ShowMessage('Erro na criação do Lote. Tente Novamente!!!');
    end;

    sqlSeloLivro.Refresh;
    sqlSeloLivro.EnableControls;    
    Screen.Cursor := crDefault;
    frmAtualizacao.hide;
    frmAtualizacao.free;
  end;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
  ClientAncestral.Refresh;
end;

procedure TfrmCadSeloLote.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadSeloLote.mniAlterarNumeroNotaClick(Sender: TObject);
var
  viNumeroNota : String;
begin
  inherited;

  if InputQuery('Alterar Numero da Nota', 'Numero da Nota:', viNumeroNota) then
  begin
    ClientAncestral.edit;
    ClientAncestralNOTA_FISCAL.AsString := viNumeroNota;
    ClientAncestral.ApplyUpdates(-1);
  end;
end;

procedure TfrmCadSeloLote.pgcControleChange(Sender: TObject);

  function PegarSeloDisponivel(vpSituacao : String):String;
  begin
    Result := IntToStr(dtmControles.GetInt(' SELECT COUNT(SELO_LIVRO_ID) FROM G_SELO_LIVRO '+
                                            ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString +
                                            '   AND SELO_SITUACAO_ID = '+ vpSituacao));
  end;

begin
  inherited;
  Screen.Cursor := crHourGlass;
  if pgcControle.ActivePageIndex = 1 then
  begin
    sqlSeloLivro.Active := False;
    sqlSeloLivro.DataSet.ParamByName('SELO_LOTE_ID').AsBCD := ClientAncestralSELO_LOTE_ID.AsCurrency;
    sqlSeloLivro.Active := True;

    vgSeloDisponivel := StrToInt(PegarSeloDisponivel('1'));
    lblDisponivel.Caption  := ' Disponivel = '+ IntToStr(vgSeloDisponivel);
    lblUtilizado.Caption   := ' Utilizado = '+ PegarSeloDisponivel('2');
    lblExtraviado.Caption  := ' Extraviado = '+ PegarSeloDisponivel('3');
    lblInutilizado.Caption := ' Inutilizado = '+ PegarSeloDisponivel('4');

    vgSeloUltimo  := dtmControles.GetInt(' SELECT MAX(NUMERO) FROM G_SELO_LIVRO '+
                                         ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString);

    vgSeloProximo := dtmControles.GetInt(' SELECT MIN(NUMERO) FROM G_SELO_LIVRO '+
                                         ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString+
                                         '   AND SELO_SITUACAO_ID = 1');
    btnRegistrarSelo.Enabled := (not sqlSeloLivro.IsEmpty) and (ClientAncestralSITUACAO.AsString = 'I');
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloLote.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled   := State = dsBrowse;
  mniAlterarNumeroNota.Enabled := State = dsBrowse;
end;

procedure TfrmCadSeloLote.sqlSeloLivroCalcFields(DataSet: TDataSet);
begin
  inherited;
  sqlSeloLivrocalc_Vinculo.AsBoolean := sqlSeloLivroCAMPO_ID.AsInteger > 0;
  sqlSeloLivroCALC_NUMERO.AsString   := FormatFloat('000000', sqlSeloLivroNUMERO.AsCurrency);
end;

procedure TfrmCadSeloLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlSeloLivro.Active     := False;
  sqlSeloGrupo.Active     := False;
  sqlSeloSituacao.Active  := False;

  Action         := caFree;
  frmCadSeloLote := nil;
end;

procedure TfrmCadSeloLote.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
  ClientAncestralSITUACAO.AsString := 'A';
  edtData.SetFocus;
end;

procedure TfrmCadSeloLote.btnAtivarLoteClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(Pchar('Ativar Lote da Sequencia '+ ClientAncestralSIGLA.AsString + '  '+
                                   ClientAncestralNUMERO_INICIAL.AsString +' a '+ ClientAncestralNUMERO_FINAL.AsString+'. Confirma?'),'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  ClientAncestral.Edit;
  ClientAncestralSITUACAO.AsString := 'I';
  ClientAncestral.ApplyUpdates(-1);
  pgcControleChange(pgcControle);
end;

procedure TfrmCadSeloLote.btnDesativarLoteClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(Pchar('Desativar Lote da Sequencia '+ ClientAncestralSIGLA.AsString + '  '+
                                   ClientAncestralNUMERO_INICIAL.AsString +' a '+ ClientAncestralNUMERO_FINAL.AsString+'. Confirma?'),'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  ClientAncestral.Edit;
  ClientAncestralSITUACAO.AsString := 'A';
  ClientAncestral.ApplyUpdates(-1);
  pgcControleChange(pgcControle);
end;

procedure TfrmCadSeloLote.btnFecharLoteClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(Pchar('Fechar Lote da Sequencia '+ ClientAncestralSIGLA.AsString + '  '+
                                   ClientAncestralNUMERO_INICIAL.AsString +' a '+ ClientAncestralNUMERO_FINAL.AsString+'. Confirma?'),'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  ClientAncestral.Edit;
  ClientAncestralSITUACAO.AsString := 'F';
  ClientAncestral.ApplyUpdates(-1);
  pgcControleChange(pgcControle);
end;

procedure TfrmCadSeloLote.btnRegistrarSeloClick(Sender: TObject);
begin
  inherited;
  ExibirFormulario(TfrmSeloRegistrar, frmSeloRegistrar, True);
  pgcControleChange(pgcControle);
end;

procedure TfrmCadSeloLote.ClientAncestralAfterScroll(DataSet: TDataSet);
var
  viFechar : Integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  btnAtivarLote.Enabled := ClientAncestralSITUACAO.AsString = 'A';
  if ClientAncestralSELO_LOTE_ID.AsString <> '' then
  begin
    viFechar := dtmControles.GetInt(' SELECT COUNT(*) FROM G_SELO_LIVRO '+
                                    ' WHERE SELO_SITUACAO_ID = 1 '+
                                    ' AND SELO_LOTE_ID = '+ClientAncestralSELO_LOTE_ID.AsString);

    btnDesativarLote.Enabled := (dtmControles.GetInt(' SELECT COUNT(*) FROM G_SELO_LIVRO '+
                                    ' WHERE NOT SELO_SITUACAO_ID = 1 '+
                                    ' AND SELO_LOTE_ID = '+ClientAncestralSELO_LOTE_ID.AsString) = 0) AND
                                (ClientAncestralSITUACAO.AsString = 'I');
  end;
  btnFecharLote.Enabled := (viFechar = 0) and (ClientAncestralSITUACAO.AsString = 'I');
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloLote.ClientAncestralBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  ExecutaSqlAuxiliar(' DELETE FROM G_SELO_LIVRO '+
                     ' WHERE SELO_LOTE_ID = '+ClientAncestralSELO_LOTE_ID.AsString,1);
end;

procedure TfrmCadSeloLote.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
  ClientAncestralCALC_NUMERO_INI.AsString    := FormatFloat('000000', ClientAncestralNUMERO_INICIAL.AsCurrency);
  ClientAncestralCALC_NUMERO_FIM.AsString    := FormatFloat('000000', ClientAncestralNUMERO_FINAL.AsCurrency);
end;

procedure TfrmCadSeloLote.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.RecordViewInfo.GridRecord.Values[2] = 2 then
    ACanvas.Font.Color := clGreen
  else
    if AViewInfo.RecordViewInfo.GridRecord.Values[2] > 2 then
      ACanvas.Font.Color := clRed;

end;

procedure TfrmCadSeloLote.cxGridDBTableView1DblClick(Sender: TObject);
begin
  inherited;
  if btnRegistrarSelo.Enabled then
    btnRegistrarSeloClick(self);
end;

procedure TfrmCadSeloLote.rdbAtivosClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := Nil;
  ClientAncestral.Filtered := False;
  ClientAncestral.Filter   := 'SITUACAO <> '+QuotedStr('F');
  ClientAncestral.Filtered := True;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmCadSeloLote.rdbFechadosClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := Nil;
  ClientAncestral.Filtered := False;
  ClientAncestral.Filter   := 'SITUACAO = '+QuotedStr('F');
  ClientAncestral.Filtered := True;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);

end;

procedure TfrmCadSeloLote.edtSeloNumFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmCadSeloLote.edtSeloNumInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmCadSeloLote.ExecuteAlterarExecute(Sender: TObject);
begin
  if ClientAncestralSITUACAO.AsString <> 'A' then
  begin
    ShowMessage('Alteração não permitida. Este lote já foi ativado pra uso!!!');
    exit;
  end;

  inherited;
  ClientAncestral.AfterScroll := nil;
  edtData.SetFocus;
end;

procedure TfrmCadSeloLote.ExecuteCancelarExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmCadSeloLote.ExecuteExcluirExecute(Sender: TObject);
begin
  if ClientAncestralSITUACAO.AsString <> 'A' then
  begin
    ShowMessage('Exclusão não permitida. Este lote já foi ativado pra uso!!!');
    exit;
  end;
  
  inherited;

end;

procedure TfrmCadSeloLote.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_SELO_LOTE';
  vgChavePrimaria := 'SELO_LOTE_ID';

  ClientAncestral.AfterScroll := nil;
  pgcControle.ActivePageIndex := 0;
  sqlSeloLivro.Connection     := dtmControles.DB;
  sqlSeloGrupo.Connection     := dtmControles.DB;
  sqlSeloSituacao.Connection  := dtmControles.DB;
  sqlSeloLivro.Active     := True;
  sqlSeloGrupo.Active     := True;
  sqlSeloSituacao.Active  := True;
  rdbAtivos.Checked       := True;
  rdbAtivosClick(Self);
end;

procedure TfrmCadSeloLote.FormShow(Sender: TObject);
begin
  inherited;
  FecharLotes;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmCadSeloLote.FecharLotes;
var
  viFechar: Integer;
begin
  ClientAncestral.DisableControls;
  ClientAncestral.AfterScroll := nil;

  ClientAncestral.First;

  while not ClientAncestral.Eof do
  begin
    viFechar := dtmControles.GetInt(' SELECT COUNT(*) FROM G_SELO_LIVRO '+
                                    ' WHERE SELO_SITUACAO_ID = 1 '+
                                    ' AND SELO_LOTE_ID = '+ClientAncestralSELO_LOTE_ID.AsString);

    if (viFechar = 0) and (ClientAncestralSITUACAO.AsString = 'I') then
    begin
      ClientAncestral.Edit;
      ClientAncestralSITUACAO.AsString := 'F';
      ClientAncestral.ApplyUpdates(-1);
    end;

    ClientAncestral.Next;
  end;

  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestral.EnableControls;

  rdbAtivosClick(Self);  
end;

end.
