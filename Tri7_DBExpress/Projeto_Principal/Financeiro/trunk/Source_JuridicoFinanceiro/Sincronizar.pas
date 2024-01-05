unit Sincronizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxContainer, cxLabel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, SimpleDS, cxCheckBox, cxPC,
  cxImageComboBox, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, Data.DBXInterBase, frxClass, DbxDevartInterBase, Grids, System.Win.ComObj,
  cxProgressBar, cxCurrencyEdit;

type
  TAssociado = Record
    Selecao : String;
    Flag : Boolean;
  End;

  TfrmSincronizar = class(TForm)
    Panel2: TPanel;
    pgcSincronizar: TcxPageControl;
    tabSincronizacao: TcxTabSheet;
    pnlSincronizar: TPanel;
    btnSincronizar: TcxButton;
    PanelBotaoFechar: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBSincronizar: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dtsPlanilha: TDataSource;
    OpenDialog1: TOpenDialog;
    lblSincronizar: TcxLabel;
    sqlPlanilha: TClientDataSet;
    btnConfirma: TcxButton;
    btnCancelar: TcxButton;
    cxBtnFechar: TcxButton;
    Panel4: TPanel;
    lblInformacaoLancamento: TcxLabel;
    imgReceber: TImage;
    cxProgress: TcxProgressBar;
    sqlPlanilhaPROTOCOLO: TStringField;
    sqlPlanilhaCONVENIO: TStringField;
    sqlPlanilhaDEVEDOR: TStringField;
    sqlPlanilhaCREDOR: TStringField;
    sqlPlanilhaACAO: TStringField;
    sqlPlanilhaCONTRATO: TStringField;
    sqlPlanilhaVALOR_GESTAO: TCurrencyField;
    sqlPlanilhaVALOR_ADICIONAL: TCurrencyField;
    sqlPlanilhaVALOR_REEMBOLSAVEL: TCurrencyField;
    sqlPlanilhaCODIGO: TStringField;
    sqlPlanilhaGCPJ: TStringField;
    sqlPlanilhaVALOR_TROCO: TCurrencyField;
    sqlPlanilhaVALOR_TOTAL: TCurrencyField;
    cxGridDBSincronizarColumn1: TcxGridDBColumn;
    cxGridDBSincronizarColumn2: TcxGridDBColumn;
    cxGridDBSincronizarColumn3: TcxGridDBColumn;
    cxGridDBSincronizarColumn4: TcxGridDBColumn;
    cxGridDBSincronizarColumn5: TcxGridDBColumn;
    cxGridDBSincronizarColumn6: TcxGridDBColumn;
    cxGridDBSincronizarColumn7: TcxGridDBColumn;
    cxGridDBSincronizarColumn8: TcxGridDBColumn;
    cxGridDBSincronizarColumn9: TcxGridDBColumn;
    cxGridDBSincronizarColumn10: TcxGridDBColumn;
    cxGridDBSincronizarColumn11: TcxGridDBColumn;
    cxGridDBSincronizarColumn12: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
  private
    vlNumeroLinhasXLS,
    vlNumeroColunasXLS : Integer;
    viLiberadoSincronizacao : Boolean;

    procedure HabilitarBotoes(vpHabilitado : Boolean);
    Procedure ImportarDados;
    function XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmSincronizar: TfrmSincronizar;
  vgAssociado : TAssociado;

implementation

uses Controles, Lookup, Lookup_Contabil, Rotinas;

{$R *.dfm}

procedure TfrmSincronizar.btnConfirmaClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Confirma dados sincronizados?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
  begin
    btnCancelarClick(Self);
    exit;
  end;

  dtmControles.Commit;
  HabilitarBotoes(True);
  lblSincronizar.Enabled := False;
  lblSincronizar.Caption := 'Importa��o Realizada!!!';
  lblSincronizar.Refresh;
  dtmLookup.AtualizarTabelas;
  ShowMessage('Importa��o Realizada!!!');
end;

procedure TfrmSincronizar.btnSincronizarClick(Sender: TObject);
var
  viSicronizaReuniId : Currency;
  viSituacaoNova, viPessoas, viPessoasSemCPF : string;
  vgCadastrar, viAbriuForm : Boolean;

  procedure GravarHistoricoSincronizacao;
  Begin
    ExecutaSqlAuxiliar(' INSERT INTO T_SINCRONIZA_REUNI( '+
                       '              SINCRONIZA_REUNI_ID, '+
                       '              DATA, '+
                       '              CEDENTE_ID, '+
                       '              NOME_ARQUIVO) '+
                       ' VALUES(      :SINCRONIZA_REUNI_ID, '+
                       '              :DATA, '+
                       '              :CEDENTE_ID, '+
                       '              :NOME_ARQUIVO)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('SINCRONIZA_REUNI_ID').AsBCD := viSicronizaReuniId;
      ParamByName('DATA').AsString             := dtmControles.DataHoraBanco(5);
      ParamByName('CEDENTE_ID').AsCurrency     := vgCedenteAtivo;
      ParamByName('NOME_ARQUIVO').AsString     := ExtractFileName(OpenDialog1.FileName);
      ExecSQL(FALSE);
    end;
  end;

begin
  Screen.Cursor := crHourGlass;
  OpenDialog1.FileName;

  lblSincronizar.Visible := True;
  lblSincronizar.Caption := 'Abrindo Arquivo...';
  lblSincronizar.Refresh;
  if not OpenDialog1.Execute then
  begin
    Screen.Cursor := crDefault;
    exit;
  end;

{  // Verifica se o Arquivo ja foi importado
  ExecutaSqlAuxiliar(' SELECT DATA FROM T_SINCRONIZA_REUNI '+
                     ' WHERE UPPER(NOME_ARQUIVO) = '+ QuotedStr(AnsiUpperCase(ExtractFileName(OpenDialog1.FileName))),0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    lblSincronizar.Visible := False;
    Application.MessageBox(Pchar('Este arquivo ja foi sincronizado em '+
                                 dtmControles.sqlAuxiliar.FieldByName('DATA').AsString), 'Aten��o', MB_OK + MB_ICONWARNING);
    Screen.Cursor := crDefault;
    exit;
  end;}

  try
    lblSincronizar.Caption := 'Carregando Dados...';
    lblSincronizar.Refresh;
    ImportarDados;
  except
    Application.MessageBox(Pchar('Erro de importa��o de arquivo. Verifique se o arquivo esta correto!!!'+#13+#13+
                                 'Caso o erro persiste entrar em contato com o Administrador do Sistema'), 'Error', MB_OK + MB_ICONERROR);
    exit;
  end;

{  viLiberadoSincronizacao := True;
  Screen.Cursor := crHourGlass;

  pnlSincronizar.Enabled := False;
  viSicronizaReuniId := dtmControles.GerarSequencia('T_SINCRONIZA_REUNI');
  sqlPlanilha.First;

  dtmControles.StartTransaction;

  ExecutaSqlAuxiliar(' UPDATE T_PESSOA SET SINCRONIZADO_NOVO = NULL,'+
                     '                     SINCRONIZADO_DATA = NULL,' +
                     '                     SINCRONIZA_REUNI_ID = NULL,' +
                     '                     SINCRONIZADO_SITUACAO_NEW = NULL,' +
                     '                     SINCRONIZADO_SITUACAO_OLD = NULL' +
                     ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);}

{  CarregarDados;
  VerificarTransferidos;}

{  Screen.Cursor := crHourGlass;
  if viPessoas <> '' then
  begin
    viAbriuForm := False;
    if frmGerenciadorCompromisso = nil then
    begin
      frmGerenciadorCompromisso := TfrmGerenciadorCompromisso.Create(self);
      viAbriuForm := True;
    end;
    frmGerenciadorCompromisso.AtivarLancamentosMensais(0, viPessoas, False, False, '1');
    if viAbriuForm then
      frmGerenciadorCompromisso := nil;
  end;

  // Mostra Apenas os Novos e/ou atualizados que a Situa�ao mudou.
  sqlVerificar.Filtered := False;
  sqlVerificar.Filter   := '((SINCRONIZADO_NOVO = ''S'') OR (SINCRONIZADO_NOVO = ''N''))';
  sqlVerificar.Filtered := True;

  if sqlVerificar.RecordCount = 0 then
  begin
    Screen.Cursor := crDefault;
    dtmControles.Roolback;
    lblSincronizar.Visible := False;
    Application.MessageBox('Nenhum Associado Atualizado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    HabilitarBotoes(True);
    exit;
  end
  else
  begin
    HabilitarBotoes(False);
    GravarHistoricoSincronizacao;
    sqlAssociadosAtivos.Active := True;
  end;

  sqlVerificar.EnableControls;
  Screen.Cursor := crDefault;
  pnlSincronizar.Enabled := True;
  cxGridDBSincronizar.DataController.Groups.FullExpand;

  btnConfirma.Enabled := (viPessoasSemCPF = '') and viLiberadoSincronizacao;
  if viPessoasSemCPF <> '' then
  begin
    Application.MessageBox(Pchar('ASSOCIADOS N�O IMPORTADOS - SEM CADASTRO DE CPF.'+#13+#13+viPessoasSemCPF), 'Aten��o', MB_OK + MB_ICONWARNING);
    lblSincronizar.Caption := 'Verifique com a Secret�ria os Dados dos Associados!!!';
    lblSincronizar.Refresh;
  end
  else
  begin
    cxGrid2.SetFocus;
    lblSincronizar.Caption := 'Dados Carregados. VERIFIQUE e CONFIRME a SINCRONIZA��O!!!';
    lblSincronizar.Refresh;
    if viLiberadoSincronizacao then
         Application.MessageBox(Pchar(lblSincronizar.Caption), 'Aten��o', MB_OK + MB_ICONWARNING)
    else Application.MessageBox(Pchar('Sincroniza��o n�o permitida!!!'+#13+#13+
                                      'Existem Cadastro(s) com CPF inv�lido. Verifique e Sincronize Novamente.'), 'Aten��o', MB_OK + MB_ICONWARNING);
  end;}
end;

procedure TfrmSincronizar.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSincronizar.btnCancelarClick(Sender: TObject);
begin
  dtmControles.Roolback;
  HabilitarBotoes(True);
  ShowMessage('Sincroniza��o Cancelada!!!');
end;

procedure TfrmSincronizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                      := caFree;
  frmSincronizar := nil
end;

procedure TfrmSincronizar.HabilitarBotoes(vpHabilitado: Boolean);
begin
  btnCancelar.Enabled     := not vpHabilitado;
  btnConfirma.Enabled     := not vpHabilitado;
  cxBtnFechar.Enabled     := vpHabilitado;
  btnSincronizar.Enabled  := vpHabilitado;
end;


procedure TfrmSincronizar.ImportarDados;
var
  viStringGrid : TStringGrid;
  viLin : Integer;

begin
  //Abrir Planilha Excel
  viStringGrid      := TStringGrid.Create(Self);

  if XlsToStringGrid(viStringGrid,OpenDialog1.FileName) then
  begin
    Screen.Cursor := crHourGlass;
    sqlPlanilha.EmptyDataSet;

    for viLin := 1 to vlNumeroLinhasXLS do
    begin
      sqlPlanilha.Append;
      sqlPlanilhaPROTOCOLO.AsString              := Trim(viStringGrid.Cells[1, viLin]);
      sqlPlanilhaCONVENIO.AsString               := Trim(viStringGrid.Cells[2, viLin]);
      sqlPlanilhaDEVEDOR.AsString                := Trim(viStringGrid.Cells[3, viLin]);
      sqlPlanilhaCREDOR.AsString                 := Trim(viStringGrid.Cells[4, viLin]);
      sqlPlanilhaACAO.AsString                   := Trim(viStringGrid.Cells[5, viLin]);
      sqlPlanilhaCONTRATO.AsString               := Trim(viStringGrid.Cells[6, viLin]);
      sqlPlanilhaVALOR_GESTAO.AsCurrency         := StrToCurr(Trim(viStringGrid.Cells[7, viLin]));
      sqlPlanilhaVALOR_ADICIONAL.AsCurrency      := StrToCurr(Trim(viStringGrid.Cells[8, viLin]));
      sqlPlanilhaVALOR_REEMBOLSAVEL.AsCurrency   := StrToCurr(Trim(viStringGrid.Cells[9, viLin]));
      sqlPlanilhaVALOR_TROCO.AsCurrency          := StrToCurr(Trim(viStringGrid.Cells[10, viLin]));
      sqlPlanilhaVALOR_TOTAL.AsCurrency          := StrToCurr(Trim(viStringGrid.Cells[11, viLin]));
      sqlPlanilhaCODIGO.AsString                 := Trim(viStringGrid.Cells[12, viLin]);
      sqlPlanilhaGCPJ.AsString                   := Trim(viStringGrid.Cells[13, viLin]);
    end;
  end;
  viStringGrid.Free;
end;

function TfrmSincronizar.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
const
    xlCellTypeLastCell = $0000000B;
var
    XLApp, Sheet: OLEVariant;
    RangeMatrix: Variant;
    x, y, k, r, NumBrancos: Integer;
begin
  Result:=False;
  //Cria Excel- OLE Object
  XLApp:=CreateOleObject('Excel.Application');
  try
    //Esconde Excel
    XLApp.Visible:=False;
    //Abre o Workbook
    XLApp.Workbooks.Open(AXLSFile);
    Sheet:=XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    //Pegar o n�mero da �ltima linha
    x:=XLApp.ActiveCell.Row;
    vlNumeroLinhasXLS := x - 1;
    //Pegar o n�mero da �ltima coluna
    y:=XLApp.ActiveCell.Column;
    vlNumeroColunasXLS := y;
    //Seta Stringgrid linha e coluna
    AGrid.RowCount:=x;
    AGrid.ColCount:=y;
    //Associaca a variant WorkSheet com a variant do Delphi
    RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

    //Cria o loop para listar os registros no TStringGrid
    k:=1;
    repeat
      NumBrancos := 0;
      for r:=1 to y do
      begin
        AGrid.Cells[(r - 1),(k - 1)]:=RangeMatrix[K, R];
        if Trim(RangeMatrix[K, R]) = '' then
        begin
          Inc(NumBrancos,1);
          if NumBrancos = 10 then
            Break;
        end
        else NumBrancos := 0;
      end;
      Inc(k,1);
    until k > x;
    RangeMatrix:=Unassigned;
  finally
    //Fecha o Excel
    if not VarIsEmpty(XLApp) then
      begin
        XLApp.Quit;
        XLAPP:=Unassigned;
        Sheet:=Unassigned;
        Result:=True;
      end;
  end;
end;

end.
procedure TfrmSincronizar.pgcSincronizarChange(Sender: TObject);
begin

end;

procedure TfrmSincronizar.VerificaSincronizacaoAnterior;
begin

end;

function TfrmSincronizar.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
begin

end;


procedure TfrmSincronizar.pgcSincronizarChange(Sender: TObject);
begin

end;

procedure TfrmSincronizar.VerificaSincronizacaoAnterior;
begin

end;

function TfrmSincronizar.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
begin

end;


