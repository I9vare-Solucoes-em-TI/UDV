unit CadastroSeloLote;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient, Provider,
  SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxGraphics, cxEdit,
  cxImageComboBox, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxTextEdit,
  cxContainer, cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, cxCheckBox,
  Menus, cxCalendar, cxGroupBox, SimpleDS, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxPC, cxRadioGroup,
  cxMemo, cxProgressBar,
  System.Actions, cxGridExportLink, ComObj, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, DbxDevartInterBase, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinscxPCPainter;

type
  TfrmCadSeloLote = class(TfrmCadBasico)
    sqlSeloLivro: TI9Query;
    dtsSeloLivro: TDataSource;
    ClientAncestralSELO_LOTE_ID: TBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralDATA_LOTE: TSQLTimeStampField;
    ClientAncestralNUMERO_INICIAL: TBCDField;
    ClientAncestralNUMERO_FINAL: TBCDField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralSELO_GRUPO_ID: TBCDField;
    sqlSeloGrupo: TI9Query;
    dtsSeloGrupo: TDataSource;
    sqlSeloLivroSELO_LIVRO_ID: TBCDField;
    sqlSeloLivroNUMERO: TBCDField;
    sqlSeloLivroSELO_SITUACAO_ID: TBCDField;
    sqlSeloLivroOBSERVACAO: TStringField;
    sqlSeloLivroSELO_LOTE_ID: TBCDField;
    sqlSeloGrupoSELO_GRUPO_ID: TBCDField;
    sqlSeloGrupoDESCRICAO: TStringField;
    sqlSeloGrupoSITUACAO: TStringField;
    sqlSeloLivroSIGLA: TStringField;
    sqlSeloSituacao: TI9Query;
    dtsSeloSituacao: TDataSource;
    sqlSeloSituacaoSELO_SITUACAO_ID: TBCDField;
    sqlSeloSituacaoDESCRICAO: TStringField;
    sqlSeloSituacaoSITUACAO: TStringField;
    sqlSeloLivroDATA: TSQLTimeStampField;
    sqlSeloGrupoNUMERO: TBCDField;
    sqlSeloLivroTABELA: TStringField;
    sqlSeloLivroCAMPO_ID: TBCDField;
    sqlSeloLivroUSUARIO_ID: TBCDField;
    sqlSeloLivrocalc_Vinculo: TBooleanField;
    ClientAncestralCALC_NUMERO_INI: TStringField;
    ClientAncestralCALC_NUMERO_FIM: TStringField;
    sqlSeloLivroCALC_NUMERO: TStringField;
    ClientAncestralNOTA_FISCAL: TStringField;
    PopupMenu: TPopupMenu;
    mniAlterarNumeroNota: TMenuItem;
    sqlSeloGrupoTIPO_CARTORIO: TStringField;
    sqlSeloGrupoDESCRICAO_TIPO_CARTORIO: TStringField;
    sqlSeloGrupoDESCRICAO_COMPLETA: TStringField;
    ClientAncestralSIGLA: TStringField;
    sqlSeloLivroDESCRICAO: TStringField;
    pgcPainel: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    pnlDadosSelo: TPanel;
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    edtData: TcxDBDateEdit;
    lcxGrupo: TcxDBLookupComboBox;
    icxSituacao: TcxDBImageComboBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel3: TcxLabel;
    edtSigla: TcxDBTextEdit;
    edtNumeroInicial: TcxDBTextEdit;
    edtNumeroFinal: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    pgcControle: TcxPageControl;
    tbcLote: TcxTabSheet;
    Panel1: TPanel;
    rdbAtivos: TcxRadioButton;
    rdbFechados: TcxRadioButton;
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
    tbcSelos: TcxTabSheet;
    cxGridSelos: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnlBotoes: TPanel;
    chxProximoSelo: TcxCheckBox;
    btnRegistrarSelo: TcxButton;
    cxGroupBox2: TcxGroupBox;
    lblDisponivel: TcxLabel;
    lblUtilizado: TcxLabel;
    lblExtraviado: TcxLabel;
    lblInutilizado: TcxLabel;
    pnlControleLotes: TPanel;
    btnAtivarLote: TcxButton;
    btnDesativarLote: TcxButton;
    btnFecharLote: TcxButton;
    chxFechamentoLote: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    mmoLista: TcxMemo;
    gridExportar: TcxGrid;
    gridSelos: TcxGridDBTableView;
    gridSelosSITUACAO: TcxGridDBColumn;
    gridSelosPEDIDO: TcxGridDBColumn;
    gridSelosNUMERO_AGRUPADOR: TcxGridDBColumn;
    gridSelosNUMERO_SELO: TcxGridDBColumn;
    gridSelosTIPO_ATO: TcxGridDBColumn;
    gridSelosDATA: TcxGridDBColumn;
    gridSelosAPRESENTANTE: TcxGridDBColumn;
    gridSelosNOME_COMPLETO: TcxGridDBColumn;
    gridSelosIP_MAQUINA: TcxGridDBColumn;
    gridSelosVALOR_EMOLUMENTO: TcxGridDBColumn;
    gridSelosVALOR_TAXA_JUDICIARIA: TcxGridDBColumn;
    gridSelosVALOR_FUNDESP: TcxGridDBColumn;
    gridSelosVALOR_TOTAL: TcxGridDBColumn;
    gridExportarLevel1: TcxGridLevel;
    gridSelosNUMEROSELO: TcxGridDBColumn;
    gridSelosSIGLA: TcxGridDBColumn;
    gridSelosGRUPO: TcxGridDBColumn;
    gridSelosTIPOCARTORIO: TcxGridDBColumn;
    gridSelosDESCRICAO: TcxGridDBColumn;
    Panel2: TPanel;
    btnPesquisar: TcxButton;
    dtsSelos: TDataSource;
    sqlSelos: TI9Query;
    sqlSelosNOTA_FISCAL: TStringField;
    sqlSelosNUMERO_AGRUPADOR: TStringField;
    sqlSelosSIGLA: TStringField;
    sqlSelosNUMERO: TBCDField;
    sqlSelosTIPO_ATO: TBCDField;
    sqlSelosAPRESENTANTE: TStringField;
    sqlSelosNOME_COMPLETO: TStringField;
    sqlSelosDATA: TSQLTimeStampField;
    sqlSelosIP_MAQUINA: TStringField;
    sqlSelosVALOR_TOTAL: TBCDField;
    sqlSelosVALOR_EMOLUMENTO: TBCDField;
    sqlSelosVALOR_TAXA_JUDICIARIA: TBCDField;
    sqlSelosVALOR_FUNDESP: TBCDField;
    sqlSeloscal_numero_selo: TStringField;
    sqlSelosSELO_LIVRO_ID: TBCDField;
    ProgressBar: TcxProgressBar;
    sqlSelosSELO_GRUPO_ID: TBCDField;
    sqlSelosSELO_SITUACAO_ID: TBCDField;
    sqlSelosDESCRICAO: TStringField;
    btnLimparDoc: TcxButton;
    sqlSeloLivroCALC_PROTOCOLO: TStringField;
    sqlSelosCALC_PROTOCOLO: TStringField;
    sqlSelosTABELA: TStringField;
    sqlSelosCAMPO_ID: TBCDField;
    sqlSelosTIPO_CARTORIO: TStringField;
    gridSelosTABELA: TcxGridDBColumn;
    gridSelosCAMPO_iD: TcxGridDBColumn;
    cdsSelos: TClientDataSet;
    cdsSelosNOTA_FISCAL: TStringField;
    cdsSelosNUMERO_AGRUPADOR: TStringField;
    cdsSelosSIGLA: TStringField;
    cdsSelosNUMERO: TBCDField;
    cdsSelosTIPO_ATO: TBCDField;
    cdsSelosAPRESENTANTE: TStringField;
    cdsSelosNOME_COMPLETO: TStringField;
    cdsSelosDATA: TSQLTimeStampField;
    cdsSelosIP_MAQUINA: TStringField;
    cdsSelosVALOR_TOTAL: TBCDField;
    cdsSelosVALOR_EMOLUMENTO: TBCDField;
    cdsSelosVALOR_TAXA_JUDICIARIA: TBCDField;
    cdsSelosVALOR_FUNDESP: TBCDField;
    cdsSelosSELO_LIVRO_ID: TBCDField;
    cdsSelosSELO_GRUPO_ID: TBCDField;
    cdsSelosSELO_SITUACAO_ID: TBCDField;
    cdsSelosDESCRICAO: TStringField;
    cdsSelosTABELA: TStringField;
    cdsSelosCAMPO_ID: TBCDField;
    cdsSelosTIPO_CARTORIO: TStringField;
    cdsSeloscal_numero_selo: TStringField;
    cdsSelosCALC_PROTOCOLO: TStringField;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    lblReservado: TcxLabel;
    lblUsuario: TcxLabel;
    pgcPesquisa: TcxPageControl;
    tabPesquisarLote: TcxTabSheet;
    tabPesquisarSelo: TcxTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TcxTextEdit;
    edtNF: TcxTextEdit;
    btnPesquisarLote: TcxButton;
    btnLimparPesquisa: TcxButton;
    Label3: TLabel;
    edtNumeroSelo: TcxTextEdit;
    btnPesquisarSelo: TcxButton;
    btnPesqLimpar: TcxButton;
    sqlSeloLivroUSUARIO_ATO_ID: TBCDField;
    sqlSeloLivroUSUARIO_RESERVA_ID: TBCDField;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cdsSelosPROTOCOLO: TStringField;
    sqlSelosPROTOCOLO: TBCDField;
    gridSelosProtocolo: TcxGridDBColumn;
    N1: TMenuItem;
    CorrigirNumerodeProtocolo1: TMenuItem;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    procedure mniAlterarNumeroNotaClick(Sender: TObject);
    procedure ClientAncestralBeforeDelete(DataSet: TDataSet);
    procedure btnDesativarLoteClick(Sender: TObject);
    procedure rdbFechadosClick(Sender: TObject);
    procedure rdbAtivosClick(Sender: TObject);
    procedure pgcPainelChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparDocClick(Sender: TObject);
    procedure sqlSelosCalcFields(DataSet: TDataSet);
    procedure MenuItem1Click(Sender: TObject);
    procedure btnReservarSeloClick(Sender: TObject);
    procedure btnLimparPesquisaClick(Sender: TObject);
    procedure btnPesquisarLoteClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarSeloClick(Sender: TObject);
    procedure edtNumeroSeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesqLimparClick(Sender: TObject);
    procedure edtNumeroSeloKeyPress(Sender: TObject; var Key: Char);
    procedure CorrigirNumerodeProtocolo1Click(Sender: TObject);
    procedure grdBasicaDBTableView1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grdBasicaDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    vgAbrindoForm : Boolean;
    vgQtdCaracterSelo : Integer;

    procedure PesquisarLoteSelos;
  public
    vgSeloDisponivel, vgSeloReservado, vgSeloUsuario, vgSeloUltimo, vgSeloProximo : Integer;
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
  VerificarPreenchimentoEDT_DB(edtNumeroInicial.Text, 'N� Inicial', edtNumeroInicial);
  VerificarPreenchimentoEDT_DB(edtNumeroFinal.Text, 'N� Final', edtNumeroFinal);
  VerificarPreenchimentoLCX_DB(lcxGrupo.Text, 'Grupo', lcxGrupo);

  // **** Valida o Controle de Numera��o
  if ClientAncestralNUMERO_INICIAL.AsInteger > ClientAncestralNUMERO_FINAL.AsInteger then
  begin
    ShowMessage('N�mero Inicial n�o pode ser maior que o N�mero Final!!!');
    edtNumeroInicial.SetFocus;
  end;

  Screen.Cursor := crHourGlass;
  if (ClientAncestralNUMERO_FINAL.AsInteger - ClientAncestralNUMERO_INICIAL.AsInteger) > 30000 then
  begin
    ShowMessage('Intervalo de N�mera��o Inv�lido!!!');
    edtNumeroInicial.SetFocus;
    exit;
  end;
  // **** Final de Valida��o

  inherited;

  if ClientAncestralSITUACAO.AsString = 'A' then
  begin
    dtmControles.StartTransaction;
    try
      Application.CreateForm(TfrmAtualizacao,frmAtualizacao);
      frmAtualizacao.lblTexto.Caption := 'Criando Lote de Selos, Aguarde!!!';
      frmAtualizacao.Show;
      Application.ProcessMessages;

      ExecutaSqlAuxiliar(' DELETE FROM G_SELO_LIVRO '+
                         ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString,1);

      sqlSeloLivro.Active := False;
      sqlSeloLivro.ParamByName('SELO_LOTE_ID').AsBCD := ClientAncestralSELO_LOTE_ID.AsCurrency;
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
        sqlSeloLivroSELO_SITUACAO_ID.AsInteger  := 1; // Selo Dispon�vel
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
      ShowMessage('Erro na cria��o do Lote. Tente Novamente!!!');
    end;

    sqlSeloLivro.Refresh;
    sqlSeloLivro.EnableControls;
    Screen.Cursor := crDefault;
    frmAtualizacao.hide;
    frmAtualizacao.free;
  end;
  ClientAncestral.Refresh;
end;

procedure TfrmCadSeloLote.LoadData;
begin
  inherited;
  PesquisarLoteSelos;
end;

procedure TfrmCadSeloLote.MenuItem1Click(Sender: TObject);
var
  HandleXLS : Variant;
begin
  if not sqlSelos.IsEmpty then
  begin
  try
    if not DirectoryExists('C:\Temp') then
      CreateDir('C:\Temp');

    ExportGridToExcel('C:\temp\RelTemp.xls', gridExportar);
    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open('C:\temp\RelTemp.xls');
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;

  end
  else Application.MessageBox('Nenhum registro carregado!', 'Aten��o', MB_OK + MB_ICONWARNING);
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

procedure TfrmCadSeloLote.PesquisarLoteSelos;
var
  viCodicao, viCodigo, viSql : string;

begin

  viSql := ' SELECT * '+
           ' FROM G_SELO_LOTE ';

  if rdbAtivos.Checked then
       viSql := viSql + ' WHERE SITUACAO <> '+QuotedStr('F')
  else viSql := viSql + ' WHERE SITUACAO = '+QuotedStr('F');

  if Trim(edtCodigo.Text) <> '' then
  begin
    viCodigo := dtmControles.GetStr(' SELECT SELO_GRUPO_ID FROM G_SELO_GRUPO WHERE NUMERO = '+ edtCodigo.Text);
    viCodicao := viCodicao + ' AND SELO_GRUPO_ID = '+viCodigo;
  end;

  if Trim(edtNF.Text) <> '' then
    viCodicao := viCodicao + ' AND NOTA_FISCAL = '+QuotedStr(edtNF.Text);

  viSql := viSql + viCodicao + ' ORDER BY SELO_GRUPO_ID, DATA_LOTE ';

  Screen.Cursor := crSQLWait;
  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := viSql;
  ClientAncestral.Active := True;
  Screen.Cursor := crDefault;

  if not vgAbrindoForm then
    edtCodigo.SetFocus;
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

  tabPesquisarSelo.TabVisible := pgcControle.ActivePageIndex = 1;
  tabPesquisarLote.TabVisible := pgcControle.ActivePageIndex = 0;

  if pgcControle.ActivePageIndex = 1 then
  begin
    pgcPesquisa.ActivePageIndex := 1 ;

    sqlSeloLivro.Active := False;
    sqlSeloLivro.ParamByName('SELO_LOTE_ID').AsBCD := ClientAncestralSELO_LOTE_ID.AsCurrency;
    sqlSeloLivro.Active := True;

    vgSeloDisponivel := StrToInt(PegarSeloDisponivel('1'));
    lblDisponivel.Caption  := ' Disponivel = '+ IntToStr(vgSeloDisponivel);
    lblUtilizado.Caption   := ' Utilizado = '+ PegarSeloDisponivel('2');
    lblExtraviado.Caption  := ' Extraviado = '+ PegarSeloDisponivel('3');
    lblInutilizado.Caption := ' Inutilizado = '+ PegarSeloDisponivel('4');

    vgSeloReservado := StrToInt(PegarSeloDisponivel('5'));
    lblReservado.Caption   := ' Reservado = '+ IntToStr(vgSeloReservado);

    vgSeloUsuario := StrToInt(PegarSeloDisponivel('6'));
    lblUsuario.Caption     := ' Usu�rio   = '+ IntToStr(vgSeloUsuario);

    vgSeloUltimo  := dtmControles.GetInt(' SELECT MAX(NUMERO) FROM G_SELO_LIVRO '+
                                         ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString);

    vgSeloProximo := dtmControles.GetInt(' SELECT MIN(NUMERO) FROM G_SELO_LIVRO '+
                                         ' WHERE SELO_LOTE_ID = '+ ClientAncestralSELO_LOTE_ID.AsString+
                                         '   AND SELO_SITUACAO_ID = 1');
    btnRegistrarSelo.Enabled := (not sqlSeloLivro.IsEmpty) and (ClientAncestralSITUACAO.AsString = 'I');
    edtNumeroSelo.SetFocus;
  end
  else pgcPesquisa.ActivePageIndex := 0;

  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloLote.pgcPainelChange(Sender: TObject);
begin
  inherited;
  pnlControleLotes.Enabled := pgcPainel.ActivePageIndex = 0;

  if vgAbrindoForm then
    exit;

  if (tabPesquisarLote.TabVisible) and (pgcPainel.ActivePageIndex = 0) then
    edtCodigo.SetFocus;
end;

procedure TfrmCadSeloLote.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled   := State = dsBrowse;
  mniAlterarNumeroNota.Enabled := State = dsBrowse;
  pnlDadosSelo.Visible := State in [dsInsert, dsEdit];
  pgcPesquisa.Enabled  := State = dsBrowse;

  PanelData.Enabled := True;
end;

procedure TfrmCadSeloLote.sqlSeloLivroCalcFields(DataSet: TDataSet);
begin
  inherited;
  sqlSeloLivrocalc_Vinculo.AsBoolean := sqlSeloLivroCAMPO_ID.AsInteger > 0;

  if vgQtdCaracterSelo = 6 then
     sqlSeloLivroCALC_NUMERO.AsInteger  := sqlSeloLivroNUMERO.AsInteger
  else
    sqlSeloLivroCALC_NUMERO.AsString   := dtmControles.FormatarMascaraSelo(
      sqlSeloLivroSIGLA.AsString, sqlSeloLivroNUMERO.AsInteger);
end;

procedure TfrmCadSeloLote.sqlSelosCalcFields(DataSet: TDataSet);
begin
  inherited;
  sqlSeloscal_numero_selo.AsString := dtmControles.FormatarMascaraSelo(
    sqlSelosSIGLA.AsString, sqlSelosNUMERO.AsInteger);
end;

procedure TfrmCadSeloLote.FormActivate(Sender: TObject);
begin
  inherited;
  vgAbrindoForm := False;
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
  ClientAncestralSITUACAO.AsString := 'A';
  edtData.SetFocus;
end;

procedure TfrmCadSeloLote.btnAtivarLoteClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(Pchar('Ativar Lote da Sequencia '+ ClientAncestralSIGLA.AsString + '  '+
                                   ClientAncestralNUMERO_INICIAL.AsString +' a '+ ClientAncestralNUMERO_FINAL.AsString+'. Confirma?'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = IDNO then
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
                                   ClientAncestralNUMERO_INICIAL.AsString +' a '+ ClientAncestralNUMERO_FINAL.AsString+'. Confirma?'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  ClientAncestral.Edit;
  ClientAncestralSITUACAO.AsString := 'A';
  ClientAncestral.ApplyUpdates(-1);
  pgcControleChange(pgcControle);
end;

procedure TfrmCadSeloLote.btnFecharLoteClick(Sender: TObject);
var
  viFechar : Integer;
  viFlag : Boolean;
begin
  viFechar := 0;
  inherited;
  if not chxFechamentoLote.Checked then
  begin
    if ClientAncestralSELO_LOTE_ID.AsString <> '' then
      viFechar := dtmControles.GetInt(' SELECT COUNT(*) FROM G_SELO_LIVRO '+
                                      ' WHERE SELO_SITUACAO_ID = 1 '+
                                      ' AND SELO_LOTE_ID = '+ClientAncestralSELO_LOTE_ID.AsString);

    viFlag := (viFechar = 0) and (ClientAncestralSITUACAO.AsString = 'I');

    if not viFlag then
    begin
      ShowMessage('Este Lote n�o pode ser Fechado!!!');
      exit;
    end;

    if Application.MessageBox(Pchar('Fechar Lote da Sequencia '+ ClientAncestralSIGLA.AsString + '  '+
                                     ClientAncestralNUMERO_INICIAL.AsString +' a '+ ClientAncestralNUMERO_FINAL.AsString+'. Confirma?'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = IDNO then
      exit;

    ClientAncestral.Edit;
    ClientAncestralSITUACAO.AsString := 'F';
    ClientAncestral.ApplyUpdates(-1);
    pgcControleChange(pgcControle);
  end
  else FecharLotes;
end;

procedure TfrmCadSeloLote.btnLimparDocClick(Sender: TObject);
begin
  inherited;
  mmoLista.Clear;
  sqlSeloLivro.Active := False;
  cdsSelos.EmptyDataSet;
end;

procedure TfrmCadSeloLote.btnLimparPesquisaClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Clear;
  edtNF.Clear;
  PesquisarLoteSelos;
end;

procedure TfrmCadSeloLote.btnPesqLimparClick(Sender: TObject);
begin
  inherited;
  edtNumeroSelo.Clear;
  edtNumeroSelo.SetFocus;
end;

procedure TfrmCadSeloLote.btnPesquisarClick(Sender: TObject);
var
  viSql,
  viSeloLista,
  viSeloSigla,
  viSeloNumero : String;
  j, i: Integer;

  // Registro Civil
  vlRegCivilTermo, vlRegCivilTipo : String;


  procedure PegarNomePessoaCivil(vpLivroNaturezaId, vpRegistroID : Integer; vpSomenteTipo : Boolean = False);
  var
    viCampoMostrar, viCampoId, viTabela, viTipoMatricula : String;
  begin
    case vpLivroNaturezaId of
       1 : begin
             viCampoMostrar  := 'V.REG_NOME';
             viCampoId       := 'V.NASCIMENTO_ID';
             viTabela        := 'V_NASCIMENTO';
             viTipoMatricula := '1';
             vlRegCivilTipo  := 'Nascimento';
           end;
       2,3 : begin
               viCampoMostrar := 'V.FAL_NOME';
               viCampoId      := 'V.OBITO_ID';
               viTabela       := 'V_OBITO';
               if vpLivroNaturezaId = 2 then
                    viTipoMatricula := '4'
               else viTipoMatricula := '5';
               vlRegCivilTipo       := 'Obito';
             end;
       4,5,6 : begin
               viCampoMostrar := 'V.NOIVO_NOME_ATUAL, V.NOIVA_NOME_ATUAL';
               viCampoId      := 'V.CASAMENTO_ID';
               viTabela       := 'V_CASAMENTO';
               case vpLivroNaturezaId of
                 4 : begin
                       viTipoMatricula := '2';
                       vlRegCivilTipo  := 'Casamento Civil';
                     end;
                 5 : begin
                       viTipoMatricula := '3';
                       vlRegCivilTipo  := 'Casamento Religioso c/ Efeito Civil';
                     end;
                 6 : begin
                       viTipoMatricula := '6';
                       vlRegCivilTipo  := 'Registro de Edital de Proclamas';
                     end;
               end;
             end;
       7 : begin
             viCampoMostrar  := 'V.A_PRIMEIRA_PARTE, V.A_SEGUNDA_PARTE';
             viCampoId       := 'V.LIVROE_ID';
             viTabela        := 'V_LIVROE';
             viTipoMatricula := '7';
             vlRegCivilTipo  := 'Livro E';
           end;
    end;
  end;

  Function CarregarProtocoloSelo(vpCampoId, vpTabela, vpCampoConsulta,
         vpCampoResultado, vpTipo : string):String;
  begin
    if vpTipo = '1' then
    begin
      viSql := ' SELECT '+vpCampoResultado+ ' FROM '+vpTabela +
               ' WHERE '+vpCampoConsulta + '='+ vpCampoId;
      Result := dtmControles.GetStr(viSql);
    end;

    if vpTipo = '2' then
    begin
      viSql := vpCampoId;
      Result := dtmControles.GetStr(viSql);
    end;
  end;


  procedure VerificarProtocoloSelo;
  var
    viTabela, viCampoId, viProtocolo : String;
  begin
    sqlSelos.DisableControls;
    sqlSelos.First;
    try
      while not sqlSelos.Eof do
      begin
        viTabela    := sqlSelosTABELA.AsString;
        viCampoId   := sqlSelosCAMPO_ID.AsString;
        viProtocolo := '';
        case sqlSelosTIPO_CARTORIO.AsString[1] of
          '1' : begin
                  if viTabela = 'T_ATO' then
                    viProtocolo := CarregarProtocoloSelo(viCampoId, viTabela, 'ATO_ID', 'PROTOCOLO', '1')
                  else
                    if viTabela = 'T_SERVICO_ITEMPEDIDO' then
                       viProtocolo := CarregarProtocoloSelo(viCampoId, viTabela, 'SERVICO_ITEMPEDIDO_ID', 'SERVICO_PEDIDO_ID', '1')
                  else viProtocolo := 'N�o Ident.';
                end;
          '2' : begin
                  if viTabela = 'R_PEDIDO_ITEM' then
                    viProtocolo :=  dtmControles.GetStr(' SELECT DISTINCT(NUMERO_ORDEM) '+
                                      ' FROM R_PEDIDO_ITEM PI LEFT JOIN R_PROTOCOLO R ON PI.PEDIDO_ID = R.PEDIDO_ID WHERE PI.PEDIDO_ITEM_ID ='+viCampoId+
                                      '   AND TIPO_PROTOCOLO = ''1''')
                  else
                    if viTabela = 'R_PEDIDO_ITEM_NUMERO' then
                       viProtocolo := dtmControles.GetStr(' SELECT DISTINCT(NUMERO_ORDEM) FROM R_PEDIDO_ITEM_NUMERO PIN   '+
                                      ' LEFT JOIN R_PEDIDO_ITEM PI ON PIN.PEDIDO_ITEM_ID = PI.PEDIDO_ITEM_ID LEFT JOIN '+
                                      ' R_PROTOCOLO R ON PI.PEDIDO_ID = R.PEDIDO_ID WHERE PIN.PEDIDO_ITEM_NUMERO_ID='+viCampoId)
                  else viProtocolo := 'N�o Ident.';
                end;
          '4' : begin
                  if viTabela = 'D_DOCUMENTO' then
                       viProtocolo := CarregarProtocoloSelo(viCampoId, viTabela, 'DOCUMENTO_ID', 'PROTOCOLO', '1')
                  else viProtocolo := viCampoId;
                end;
          '3' : begin
                  viProtocolo := '';
                  if viCampoId <> '' then
                  begin
                    ExecutaSqlAuxiliar(' SELECT LIVRO_NATUREZA_ID, REGISTRO_ID FROM V_SERVICO_REALIZADO '+
                                       ' WHERE SERVICO_REALIZADO_ID  = '+ viCampoId,0);
                    if not dtmControles.sqlAuxiliar.IsEmpty then
                    begin
                      PegarNomePessoaCivil(dtmControles.sqlAuxiliar.FieldByName('LIVRO_NATUREZA_ID').AsInteger,
                                           dtmControles.sqlAuxiliar.FieldByName('REGISTRO_ID').AsInteger);
                      viProtocolo := vlRegCivilTermo;
                    end;
                    dtmControles.sqlAuxiliar.Active := False;
                  end
                end;
          '5' : begin
                  if viTabela = 'P_TITULO' then
                       viProtocolo := dtmControles.GetStr('SELECT NUMERO_APONTAMENTO FROM P_TITULO WHERE TITULO_ID = '+ viCampoId)
                  else viProtocolo := viCampoId;
                end;
        end;

        if viProtocolo = '' then
          viProtocolo := 'N�o Ident.'
        else
          if viProtocolo <> 'N�o Ident.' then
            viProtocolo := FormatFloat('###,###', StrToInt((viProtocolo)));

        sqlSelos.Edit;
        sqlSelosCALC_PROTOCOLO.AsString := viProtocolo;
        sqlSelos.Post;
        sqlSelos.Next;
      end;
    except
      ProgressBar.Position := ProgressBar.Position + 1;
      viProtocolo := 'N�o Ident.';
      Application.ProcessMessages;
      sqlSelos.Next;
    end;
    sqlSelos.EnableControls;
  end;

  procedure CarregarSQl;
  begin
    viSql := ' SELECT SO.NOTA_FISCAL, '+
             '       SL.NUMERO_AGRUPADOR, '+
             '       SL.SIGLA, SL.NUMERO, '+
             '       SG.NUMERO AS TIPO_ATO, '+
             '       SL.APRESENTANTE, '+
             '       U.NOME_COMPLETO, '+
             '       SL.DATA, '+
             '       SL.IP_MAQUINA, '+
             '       SL.VALOR_TOTAL, '+
             '       SL.VALOR_EMOLUMENTO, '+
             '       SL.VALOR_TAXA_JUDICIARIA, '+
             '       SL.VALOR_FUNDESP, '+
             '       SL.SELO_LIVRO_ID, '+
             '       SG.SELO_GRUPO_ID, '+
             '       SL.SELO_SITUACAO_ID, '+
             '       SL.DESCRICAO, '+
             '       SL.TABELA, '+
             '       SL.CAMPO_ID, '+
             '       SG.TIPO_CARTORIO, '+
             '       Sl.PROTOCOLO '+
             ' FROM G_SELO_LIVRO SL '+
             ' LEFT JOIN G_SELO_LOTE SO ON '+
             '  SL.SELO_LOTE_ID = SO.SELO_LOTE_ID '+
             ' LEFT JOIN G_SELO_GRUPO SG ON '+
             '  SO.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
             ' LEFT JOIN G_USUARIO U ON '+
             '   SL.USUARIO_ID = U.USUARIO_ID '+
             ' WHERE NOT SG.TIPO_CARTORIO IS NULL ';
  end;

begin
  inherited;
  if mmoLista.Text = '' then
  begin
    Application.MessageBox('Nenhum selo informado na lista para pesquisar!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  ProgressBar.Properties.Max := mmoLista.Lines.Count - 1;
  cdsSelos.EmptyDataSet;
  cdsSelos.DisableControls;
  Screen.Cursor := crHourGlass;

  ProgressBar.Position := 0;
  ProgressBar.Properties.Max := mmoLista.Lines.Count;

  for j := 0 to mmoLista.Lines.Count - 1 do
  begin
    try
      CarregarSQl;
      viSeloLista  := Trim(mmoLista.Lines.Strings[j]);
      if viSeloLista <> '' then
      begin
        viSeloLista  := Copy(viSeloLista, Pos('-', viSeloLista) + 1, length(viSeloLista));

        if vgUF = 'GO' then
        begin
          viSeloLista  := RetornaNumerico(viSeloLista);
          viSeloSigla  := Copy(viSeloLista,1, 17);
          viSeloNumero := Copy(viSeloLista,18, 6);
        end
        else
        begin
          viSeloSigla  := RetornaAlfa(viSeloLista);
          viSeloNumero := RetornaNumerico(viSeloLista);
        end;

        sqlSelos.Close;
        sqlSelos.SQL.Text := viSql + ' AND SL.SIGLA = ' + QuotedStr(viSeloSigla)+
                                                ' AND SL.NUMERO = ' + viSeloNumero +
                                                ' ORDER BY SL.NUMERO_AGRUPADOR, TIPO_ATO, SL.NUMERO ';
        sqlSelos.Open;
        VerificarProtocoloSelo;

        sqlSelos.First;
        while not sqlSelos.Eof do
        begin
          cdsSelos.Append;
          for i := 0 to sqlSelos.FieldCount - 1 do
             cdsSelos.Fields[i].Value := sqlSelos.Fields[i].Value;
          cdsSelos.Post;
          sqlSelos.Next;
        end;
      end;
      ProgressBar.Position := ProgressBar.Position + 1;
      Application.ProcessMessages;
    except
      ShowMessage(mmoLista.Lines.Strings[j]);
    end;

  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  cdsSelos.EnableControls;

  if sqlSelos.IsEmpty then
    Application.MessageBox('Nenhum registro encontrado!', 'Aten��o', MB_OK + MB_ICONWARNING);

  ProgressBar.Position := 0;

end;

procedure TfrmCadSeloLote.btnPesquisarLoteClick(Sender: TObject);
begin
  inherited;
  PesquisarLoteSelos;
end;

procedure TfrmCadSeloLote.btnRegistrarSeloClick(Sender: TObject);
begin
  inherited;
  if chxProximoSelo.Checked then
    sqlSeloLivro.Locate('NUMERO', vgSeloProximo, [loCaseInsensitive]);

  ExibirFormulario(TfrmSeloRegistrar, frmSeloRegistrar, True);
  pgcControleChange(pgcControle);
end;

procedure TfrmCadSeloLote.btnReservarSeloClick(Sender: TObject);
begin
  inherited;
  ExibirFormulario(TfrmSeloRegistrar, frmSeloRegistrar, True);
  pgcControleChange(pgcControle);
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
  ClientAncestralCALC_NUMERO_INI.AsString    := dtmControles.FormatarMascaraSelo('', ClientAncestralNUMERO_INICIAL.AsInteger); FormatFloat('000000000', ClientAncestralNUMERO_INICIAL.AsInteger);
  ClientAncestralCALC_NUMERO_FIM.AsString    := dtmControles.FormatarMascaraSelo('', ClientAncestralNUMERO_FINAL.AsInteger); FormatFloat('000000000', ClientAncestralNUMERO_INICIAL.AsInteger);
end;

procedure TfrmCadSeloLote.CorrigirNumerodeProtocolo1Click(Sender: TObject);
var
  viProtocolo : String;
begin
  inherited;

  if cdsSelos.IsEmpty then
    exit;

  repeat
    if InputQuery('Alterar Numero do Protocolo:', 'Numero do Protocolo:', viProtocolo) then
    begin
      try
        viProtocolo := IntToStr(StrToInt(viProtocolo));
      except
        viProtocolo := '';
        Application.MessageBox('Numero inv�lido. Digite apenas n�mero.', 'Aten��o', MB_OK + MB_ICONWARNING);
      end;
    end
    else abort;
  until viProtocolo <> '';

  ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET PROTOCOLO = '+ viProtocolo+
                     ' WHERE SELO_LIVRO_ID = '+cdsSelosSELO_LIVRO_ID.AsString,1);
  btnPesquisarClick(self);

end;

procedure TfrmCadSeloLote.btnPesquisarSeloClick(Sender: TObject);
begin
  inherited;
  if not sqlSeloLivro.Locate('NUMERO', edtNumeroSelo.Text, [loCaseInsensitive]) then
  begin
    Application.MessageBox('N�mero de Selo n�o encontrado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNumeroSelo.SetFocus;
  end;
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
  PesquisarLoteSelos;
end;

procedure TfrmCadSeloLote.rdbFechadosClick(Sender: TObject);
begin
  inherited;
  PesquisarLoteSelos;
end;

procedure TfrmCadSeloLote.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
  begin
    btnPesquisarLote.SetFocus;
    btnPesquisarLoteClick(self);
  end;
end;

procedure TfrmCadSeloLote.edtNumeroSeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
  begin
    btnPesquisarSelo.SetFocus;
    btnPesquisarSeloClick(self);
  end;
end;

procedure TfrmCadSeloLote.edtNumeroSeloKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DigitaInteiro(key);
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
    ShowMessage('Altera��o n�o permitida. Este lote j� foi ativado pra uso!!!');
    exit;
  end;

  inherited;
  edtData.SetFocus;
end;

procedure TfrmCadSeloLote.ExecuteExcluirExecute(Sender: TObject);
begin
  if ClientAncestralSITUACAO.AsString <> 'A' then
  begin
    ShowMessage('Exclus�o n�o permitida. Este lote j� foi ativado pra uso!!!');
    exit;
  end;

  inherited;

end;

procedure TfrmCadSeloLote.FormCreate(Sender: TObject);
begin
  inherited;
  vgAbrindoForm   := True;
  vgNomeTabela    := 'G_SELO_LOTE';
  vgChavePrimaria := 'SELO_LOTE_ID';

  pgcPesquisa.ActivePageIndex := 0;
  pgcControle.ActivePageIndex := 0;
  pgcControleChange(Self);
  sqlSeloLivro.Connection     := dtmControles.DB;
  sqlSeloGrupo.Connection     := dtmControles.DB;
  sqlSeloSituacao.Connection  := dtmControles.DB;
  sqlSelos.Connection         := dtmControles.DB;
  sqlSeloLivro.Active         := True;
  sqlSeloGrupo.Active         := True;
  sqlSeloSituacao.Active      := True;
  pgcPainel.ActivePageIndex := 0;
  vgQtdCaracterSelo := StrToInt(dtmControles.GetQuantidadeDigitosNumeroSelo.ToString);
end;

procedure TfrmCadSeloLote.FormShow(Sender: TObject);
begin
  inherited;
  pgcPainelChange(self);
end;

procedure TfrmCadSeloLote.grdBasicaDBTableView1DblClick(Sender: TObject);
begin
  pgcControle.ActivePage := tbcSelos;
end;

procedure TfrmCadSeloLote.grdBasicaDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if vgAbrindoForm then
    exit;

  Screen.Cursor := crHourGlass;
  btnAtivarLote.Enabled := ClientAncestralSITUACAO.AsString = 'A';
  if ClientAncestralSELO_LOTE_ID.AsString <> '' then
  begin
    btnDesativarLote.Enabled := (dtmControles.GetInt(' SELECT COUNT(*) FROM G_SELO_LIVRO '+
                                    ' WHERE NOT SELO_SITUACAO_ID = 1 '+
                                    ' AND SELO_LOTE_ID = '+ClientAncestralSELO_LOTE_ID.AsString) = 0) AND
                                (ClientAncestralSITUACAO.AsString = 'I');
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloLote.FecharLotes;
var
  viFechar: Integer;
begin
  Screen.Cursor := crHourGlass;
  ClientAncestral.DisableControls;

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
    end
    else ClientAncestral.Next;
  end;

  ClientAncestral.EnableControls;

  rdbAtivosClick(Self);
  Screen.Cursor := crDefault;
end;

end.
