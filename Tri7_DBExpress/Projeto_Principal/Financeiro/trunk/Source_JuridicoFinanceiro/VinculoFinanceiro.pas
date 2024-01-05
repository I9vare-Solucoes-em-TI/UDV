unit VinculoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, Menus,
  cxLookAndFeelPainters, DBClient, SimpleDS, frxpngimage, ExtCtrls, StdCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxRadioGroup, cxContainer, cxLabel, cxCheckBox;

type
  TfrmVinculoFinaceiro = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    pnlVinculo: TPanel;
    rdvVinculoCompromissoSel: TcxRadioButton;
    rdvVinculoCompromissoTodos: TcxRadioButton;
    grbVinculos: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTablePESSOA: TcxGridDBColumn;
    cxGridDBTablePESSOATIPO: TcxGridDBColumn;
    cxGridDBTablePERCENTUAL: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel4: TPanel;
    imgReceber: TImage;
    dtsVinculo: TDataSource;
    sqlVinculoResponsavelAtivo: TSimpleDataSet;
    ClientVinculo: TClientDataSet;
    ClientVinculoPESSOA_ID: TIntegerField;
    ClientVinculoRESPONSAVEL_ID: TIntegerField;
    ClientVinculoPESSOA_TIPO: TStringField;
    ClientVinculoPERCENTUAL: TCurrencyField;
    cxGridDBTableSELECIONADO: TcxGridDBColumn;
    sqlVinculoResponsavelAtivoPROCESSO_RESPONSAVEL_ID: TFMTBCDField;
    sqlVinculoResponsavelAtivoPESSOA_ID: TFMTBCDField;
    sqlVinculoResponsavelAtivoPESSOA_TIPO: TStringField;
    sqlSocio: TSimpleDataSet;
    sqlSocioPESSOA_ID: TFMTBCDField;
    sqlSocioNOME: TStringField;
    sqlVinculosFinanceiros: TSimpleDataSet;
    sqlVinculosFinanceirosPESSOA_ID: TFMTBCDField;
    sqlVinculosFinanceirosPROCESSO_RESPONSAVEL_ID: TFMTBCDField;
    sqlVinculosFinanceirosPERCENTUAL: TFMTBCDField;
    ClientVinculoSOCIO_ID: TIntegerField;
    ClientVinculoSELECIONADO: TBooleanField;
    btnConfirmarCompromisso: TcxButton;
    btnCancelar: TcxButton;
    btnLimparCompromisso: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGridDBTableSELECIONADOPropertiesChange(Sender: TObject);
    procedure cxGridDBTablePERCENTUALCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btnLimparCompromissoClick(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure ClientVinculoAfterPost(DataSet: TDataSet);
  private
    vlMontandoGrid : Boolean;
    vlAlterado : Boolean;
  public
    { Public declarations }
  end;

var
  frmVinculoFinaceiro: TfrmVinculoFinaceiro;

implementation

uses
  LookupJuridico, Controles, Rotinas, GerenciadorServico;

{$R *.dfm}

procedure TfrmVinculoFinaceiro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVinculoFinaceiro.btnConfirmarCompromissoClick(Sender: TObject);
var
  viValor : String;
begin

  if not vlAlterado then
  begin
    Close;
    exit;
  end;

  if cxGridDBTableView3.DataController.Summary.FooterSummaryValues[0] = 0 then
  begin
    Application.MessageBox('Nenhuma Vinculo Selecionado.', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if cxGridDBTableView3.DataController.Summary.FooterSummaryValues[0] > 100 then
  begin
    Application.MessageBox('Soma das % não pode ser maior que 100.', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  Screen.Cursor := crHourGlass;
  ClientVinculo.DisableControls;

{  try
    dtmControles.StartTransaction;
    with frmGerenciadorServico do
    begin
      if rdvVinculoCompromissoTodos.Checked then
        ExecutaSqlAuxiliar('DELETE FROM J_PROCESSO_FINANCEIRO '+
                           'WHERE PROCESSO_ID = '+IntToStr(vgDadosVinculoFinanceiro.ProcessoId)+
                           ' AND SITUACAO = '+QuotedStr('1'),1)
      else
        ExecutaSqlAuxiliar('DELETE FROM J_PROCESSO_FINANCEIRO '+
                           'WHERE PROCESSO_CUSTAS_ID = '+IntToStr(vgDadosVinculoFinanceiro.ProcessoCustasID)+
                           ' AND SITUACAO = '+QuotedStr('1'),1);

      ClientVinculo.First;
      while not ClientVinculo.Eof do
      begin
        if not ClientVinculoSELECIONADO.AsBoolean then
        begin
          ClientVinculo.Next;
          Continue;
        end;

{        if rdvVinculoCompromissoTodos.Checked then
          sqlProcessoCustas.First;

        while not sqlProcessoCustas.eof do
        begin
          vgDadosVinculoFinanceiro.ProcessoResponsavelId := ClientVinculoRESPONSAVEL_ID.AsInteger;
          vgDadosVinculoFinanceiro.ProcessoCustasID      := sqlProcessoCustasPROCESSO_CUSTAS_ID.AsInteger;
          vgDadosVinculoFinanceiro.PessoaId              := ClientVinculoPESSOA_ID.AsInteger;
          vgDadosVinculoFinanceiro.CentroCustoId         := sqlProcessoCustasCENTRO_CUSTO_ID.AsInteger;
          vgDadosVinculoFinanceiro.ContabilContaID       := 0;
          vgDadosVinculoFinanceiro.Percentual            := ClientVinculoPERCENTUAL.AsCurrency;
          vgDadosVinculoFinanceiro.ValorReceber          := Arredondamento(((sqlProcessoCustasVALOR.AsCurrency * ClientVinculoPERCENTUAL.AsCurrency)/100),2);
          vgDadosVinculoFinanceiro.ValorDocumento        := sqlProcessoCustasVALOR.AsCurrency;

          dtmLookupJuridico.GravarVinculoFinanceiro;
          if rdvVinculoCompromissoSel.Checked then
            Break;
          sqlProcessoCustas.Next;
        end;
        ClientVinculo.Next;
      end;
      dtmControles.Commit;
      sqlProcessoCustas.EnableControls;

      if rdvVinculoCompromissoSel.Checked then
        sqlProcessoCustas.Refresh
      else
      begin
        sqlProcessoCustas.First;
        sqlProcessoCustas.Refresh;
      end;
      sqlProcessoCustasAfterScroll(sqlProcessoCustas);
    end;
  except
    dtmControles.Roolback;
    ClientVinculo.EnableControls;
    frmGerenciadorServico.sqlProcessoCustas.EnableControls;
    Application.MessageBox('Problemas na Gravação.', 'Atenção', MB_OK + MB_ICONWARNING);
  end;     }
  Screen.Cursor := crDefault;
  Close;
end;

procedure TfrmVinculoFinaceiro.btnLimparCompromissoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  ClientVinculo.DisableControls;
  ClientVinculo.First;
  while not ClientVinculo.Eof do
  begin
    ClientVinculo.Edit;
    ClientVinculoSELECIONADO.AsBoolean := True;
    ClientVinculoPERCENTUAL.AsCurrency := 0;
    ClientVinculo.Next;
  end;
  ClientVinculo.First;
  ClientVinculo.EnableControls;
  Screen.Cursor := crDefault;

end;

procedure TfrmVinculoFinaceiro.ClientVinculoAfterPost(DataSet: TDataSet);
begin
  vlAlterado := True;
end;

procedure TfrmVinculoFinaceiro.cxGridDBTablePERCENTUALCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[2] = FALSE) then
  begin
    ACanvas.Brush.Color    := clSilver;
    AviewInfo.item.Editing := False;
  end;
end;

procedure TfrmVinculoFinaceiro.cxGridDBTableSELECIONADOPropertiesChange(
  Sender: TObject);
begin
  if vlMontandoGrid then
    exit;

  ClientVinculo.Post;
  ClientVinculo.Edit;
  if not ClientVinculoSELECIONADO.AsBoolean then
    ClientVinculoPERCENTUAL.AsCurrency := 0;
end;

procedure TfrmVinculoFinaceiro.cxGridDBTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[2] = True then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmVinculoFinaceiro.FormActivate(Sender: TObject);
begin
  ClientVinculo.First;
  grbVinculos.SetFocus;
end;

procedure TfrmVinculoFinaceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlVinculoResponsavelAtivo.Close;
  sqlSocio.Close;
  sqlVinculosFinanceiros.Close;

  Action := caFree;
  frmVinculoFinaceiro := nil;
end;

procedure TfrmVinculoFinaceiro.FormCreate(Sender: TObject);
var
  viNovo : Boolean;

  procedure InserirVinculo(vpPessoaId, vpResponsavelId : Integer; vpPessoaTipo : String; vpSocio : Boolean = False);
  begin
    ClientVinculo.Append;
    ClientVinculoPESSOA_ID.AsInteger      := vpPessoaId;
    ClientVinculoRESPONSAVEL_ID.AsInteger := vpResponsavelId;
    ClientVinculoPESSOA_TIPO.AsString     := vpPessoaTipo;
    ClientVinculoSELECIONADO.AsBoolean    := FALSE;
    ClientVinculoPERCENTUAL.AsCurrency    := 0;

    if vpSocio then
      ClientVinculoSOCIO_ID.AsInteger     := vpPessoaId;

    ClientVinculo.Post;
  end;

  procedure EditarVinculo;
  begin
    viNovo := False;
    ClientVinculo.Edit;
    ClientVinculoPERCENTUAL.AsCurrency := sqlVinculosFinanceirosPERCENTUAL.AsCurrency ;
    ClientVinculoSELECIONADO.AsBoolean := True;
    ClientVinculo.Post;
  end;

begin
  sqlVinculoResponsavelAtivo.Connection := dtmControles.DB;
  sqlSocio.Connection                   := dtmControles.DB;
  sqlVinculosFinanceiros.Connection     := dtmControles.DB;

  sqlVinculoResponsavelAtivo.Active := False;
  sqlVinculoResponsavelAtivo.DataSet.ParamByName('PROCESSO_ID').AsBCD := vgDadosVinculoFinanceiro.ProcessoId;
  sqlVinculoResponsavelAtivo.Active := True;

  vlMontandoGrid := True;
  ClientVinculo.EmptyDataSet;
  while not sqlVinculoResponsavelAtivo.Eof do
  begin
    InserirVinculo(sqlVinculoResponsavelAtivoPESSOA_ID.AsInteger, sqlVinculoResponsavelAtivoPROCESSO_RESPONSAVEL_ID.AsInteger,
                   sqlVinculoResponsavelAtivoPESSOA_TIPO.AsString);
    sqlVinculoResponsavelAtivo.Next;
  end;

  sqlSocio.Active := true;
  while not sqlSocio.eof do
  begin
    InserirVinculo(sqlSocioPESSOA_ID.AsInteger, 0, 'S', True);
    sqlSocio.Next;
  end;

  sqlVinculosFinanceiros.Active := False;
  sqlVinculosFinanceiros.DataSet.ParamByName('PROCESSO_CUSTAS_ID').AsBCD := vgDadosVinculoFinanceiro.ProcessoCustasID;
  sqlVinculosFinanceiros.Active := True;

  viNovo := True;
  while not sqlVinculosFinanceiros.Eof do
  begin
    if sqlVinculosFinanceirosPROCESSO_RESPONSAVEL_ID.AsInteger > 0 then
    begin
      if ClientVinculo.Locate('RESPONSAVEL_ID', sqlVinculosFinanceirosPROCESSO_RESPONSAVEL_ID.AsInteger, [loCaseInsensitive]) then
        EditarVinculo;
    end
    else
      if ClientVinculo.Locate('SOCIO_ID', sqlVinculosFinanceirosPESSOA_ID.AsInteger, [loCaseInsensitive]) then
        EditarVinculo;

    sqlVinculosFinanceiros.Next;
  end;

  if viNovo then
    btnLimparCompromissoClick(self);

  vlMontandoGrid := False;
  cxGridDBTableView3.DataController.Groups.FullExpand;
  vlAlterado := False;
end;

end.
