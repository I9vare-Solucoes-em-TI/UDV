unit ConciliacaoCarregarArquivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroAuxSimplificado, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Data.FMTBcd, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxLabel, YMOFXReader, cxProgressBar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxCheckComboBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxCalendar, cxCheckBox, cxImageComboBox;

type
  TfrmConciliacaoArquivoCarregar = class(TfrmCadastroAuxSimplificado)
    ClientArquivo: TClientDataSet;
    ClientArquivoDATA: TStringField;
    ClientArquivoDESCRICAO: TStringField;
    ClientArquivoVALOR: TCurrencyField;
    ClientArquivoOPERACAO: TStringField;
    ClientArquivoID: TStringField;
    ClientArquivoDOCUMENTO: TStringField;
    ClientArquivoSITUACAO: TStringField;
    ClientArquivoOBSERVACAO: TStringField;
    ClientArquivoLIVRO_CAIXA_ID: TIntegerField;
    ClientArquivoLIVRO_FINANCEIRO_ID: TIntegerField;
    ClientArquivoLANCAMENTO: TStringField;
    ClientArquivoLIBERADO: TStringField;
    ClientArquivoVINCULO: TStringField;
    ClientArquivoREGISTRADO: TBooleanField;
    ClientArquivoALTERADO: TBooleanField;
    ClientArquivoMODELO: TStringField;
    ClientArquivoREALIZAR_PLANEJAMENTO: TStringField;
    ClientArquivoCALC_SELECIONADO: TBooleanField;
    ClientArquivoCONCILIACAO_VINCULO_ID: TStringField;
    dtsClientArquivo: TDataSource;
    progressBar: TcxProgressBar;
    OpenDialogRetorno: TOpenDialog;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    lcbConta: TcxLookupComboBox;
    edtRetorno: TcxTextEdit;
    cxLabel2: TcxLabel;
    btnCarregarArquivo: TcxButton;
    cxGridConciliacao: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Selecionado: TcxGridDBColumn;
    ClientDataConciliacao: TClientDataSet;
    dtsClientDataConciliacao: TDataSource;
    ClientDataConciliacaoDATA: TDateField;
    ClientDataConciliacaoCALC_SELECIONADO: TBooleanField;
    ClientDataConciliacaoSITUACAO: TStringField;
    cxGridDBTableView1Situacao: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxGridDBTableView1Column2PropertiesChange(Sender: TObject);
    procedure btnCarregarArquivoClick(Sender: TObject);
    procedure lcbContaPropertiesChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ClientDataConciliacaoAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableView1SelecionadoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    procedure CarregarArquivo(vpBuscarArquivo : Boolean = True);
    procedure CarregarArquivoBB(vpBuscarArquivo : Boolean = True);
    procedure SalvarDados;
  public
    { Public declarations }
  end;

var
  frmConciliacaoArquivoCarregar: TfrmConciliacaoArquivoCarregar;

implementation

uses
  ConciliacaoBancaria, Rotinas, LookupFinanceiro, Controles;

{$R *.dfm}

procedure TfrmConciliacaoArquivoCarregar.btnCarregarArquivoClick(
  Sender: TObject);
begin
  inherited;
  ClientDataConciliacao.EmptyDataSet;
  CarregarArquivo(True);
  btnConfirmar.Enabled := True;
  lcbConta.Enabled     := False;
end;

procedure TfrmConciliacaoArquivoCarregar.btnConfirmarClick(Sender: TObject);
begin
  SalvarDados;

  if Application.MessageBox('Deseja carregar mais algum arquivo?', 'Confirmação', MB_YESNO) = IDNO then
    Close;

  ClientDataConciliacao.EmptyDataSet;
  ClientDataConciliacao.Filtered := False;
  ClientArquivo.Filtered         := False;
  lcbConta.EditValue         := null;
  lcbConta.Enabled           := True;
  btnCarregarArquivo.Enabled := False;
  btnConfirmar.Enabled       := False;
  edtRetorno.Text            := '';

  lcbConta.SetFocus;
  exit;
end;

procedure TfrmConciliacaoArquivoCarregar.CarregarArquivo(
  vpBuscarArquivo: Boolean);
var
  YMOFXReader1: TYMOFXReader;
  i:integer;
  viData : String;

  function VerificarImportacao(vpData : TDate):Boolean;
  begin
    Result := dtmControles.GetInt(' SELECT CONCILIACAO_ID FROM J_CONCILIACAO WHERE DATA_CONCILIACAO = '+QuotedStr(FormatDateTime('DD.MM.YYYY', vpData))+
                                  '    AND CAIXA_ID = '+IntToStr(lcbConta.EditValue)) > 0;
  end;

  procedure InserirDataConciliacao(vpData : String);
  begin
    ClientDataConciliacao.Append;
    ClientDataConciliacaoDATA.AsString := vpData;
    ClientDataConciliacaoCALC_SELECIONADO.AsBoolean := False;
    if VerificarImportacao(StrToDate(vpData)) then
         ClientDataConciliacaoSITUACAO.AsString := '2'
    else ClientDataConciliacaoSITUACAO.AsString := '1';
    ClientDataConciliacao.Post;
  end;

begin
  if vpBuscarArquivo then
  begin
    OpenDialogRetorno.Filename := '*.ofx';
    if OpenDialogRetorno.Execute then
         edtRetorno.Text := OpenDialogRetorno.Filename
    else abort;

    if Trim(edtRetorno.Text) = '' then
    begin
      Application.MessageBox('Informe um arquivo válido para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      abort;
    end;
  end;

  try
    Screen.Cursor := crHourGlass;
    YMOFXReader1:= TYMOFXReader.create(self);
    YMOFXReader1.OFXFile := edtRetorno.Text;
    YMOFXReader1.Process;
    ClientArquivo.ReadOnly := False;
    ClientArquivo.EmptyDataSet;
    ClientArquivo.DisableControls;
    viData := '';

    IniciarIncrementarProgressBar(progressBar, YMOFXReader1.Count-1);
    vgAgendaConc.LancamentoId := dtmControles.GerarSequencia('J_CONCILIACAO_LANCAMENTO');
    for i := 0 to YMOFXReader1.Count-1 do
    begin
      Application.ProcessMessages;
      ClientArquivo.Append;
      ClientArquivoDATA.AsString      := dateToStr(YMOFXReader1.Get(i).MovDate);
      ClientArquivoDESCRICAO.AsString := YMOFXReader1.Get(i).Desc;
      ClientArquivoVALOR.AsCurrency   := YMOFXReader1.Get(i).Value;

      ClientArquivoOPERACAO.AsString    := YMOFXReader1.Get(i).MovType;
      if (ClientArquivoOPERACAO.AsString[1] = 'C') or (ClientArquivoVALOR.AsCurrency > 0) then
           ClientArquivoOPERACAO.AsString := 'R'
      else ClientArquivoOPERACAO.AsString := 'D';

      if ClientArquivoVALOR.AsCurrency < 0 then
        ClientArquivoVALOR.AsCurrency := ClientArquivoVALOR.AsCurrency * -1;

      ClientArquivoID.AsString          := YMOFXReader1.Get(i).ID;
      if Pos(':',ClientArquivoID.AsString) > 0 then
        ClientArquivoID.AsString := Copy(ClientArquivoID.AsString, 1,Pos(':',ClientArquivoID.AsString)-1);

      ClientArquivoDOCUMENTO.AsString   := YMOFXReader1.Get(i).Document;
      ClientArquivoLIBERADO.AsString    := 'N';
      ClientArquivoLANCAMENTO.AsString  := '5';
      ClientArquivoVinculo.AsString     := '1';
      ClientArquivoREGISTRADO.AsBoolean := FALSE;
      ClientArquivoALTERADO.AsBoolean   := FALSE;
      ClientArquivoCALC_SELECIONADO.AsBoolean := FALSE;
      ClientArquivo.Post;

      if viData <> ClientArquivoDATA.AsString then
      begin
        viData := ClientArquivoDATA.AsString;
        InserirDataConciliacao(viData);
      end;

      IniciarIncrementarProgressBar(progressBar, 1, True);
    end;
  except
    on E: exception do
      Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
  end;
  FreeAndNil(YMOFXReader1);
  Screen.Cursor := crDefault;
  ClientArquivo.First;
  ClientArquivo.EnableControls;
  btnConfirmar.Enabled            := ClientArquivo.RecordCount > 0;
  progressBar.Visible := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmConciliacaoArquivoCarregar.CarregarArquivoBB(
  vpBuscarArquivo: Boolean);
var
  YMOFXReader1: TYMOFXReader;
  i:integer;
  viData : String;

  function VerificarImportacao(vpData : TDate):Boolean;
  begin
    Result := dtmControles.GetInt(' SELECT CONCILIACAO_ID FROM J_CONCILIACAO WHERE DATA_CONCILIACAO = '+QuotedStr(FormatDateTime('DD.MM.YYYY', vpData))+
                                  '    AND CAIXA_ID = '+IntToStr(lcbConta.EditValue)) > 0;
  end;

  procedure InserirDataConciliacao(vpData : String);
  begin
    ClientDataConciliacao.Append;
    ClientDataConciliacaoDATA.AsString := vpData;
    ClientDataConciliacaoCALC_SELECIONADO.AsBoolean := False;
    if VerificarImportacao(StrToDate(vpData)) then
         ClientDataConciliacaoSITUACAO.AsString := '2'
    else ClientDataConciliacaoSITUACAO.AsString := '1';
    ClientDataConciliacao.Post;
  end;

begin
  if vpBuscarArquivo then
  begin
    OpenDialogRetorno.Filename := '*.ofx';
    if OpenDialogRetorno.Execute then
         edtRetorno.Text := OpenDialogRetorno.Filename
    else abort;

    if Trim(edtRetorno.Text) = '' then
    begin
      Application.MessageBox('Informe um arquivo válido para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      abort;
    end;
  end;

  try
    Screen.Cursor := crHourGlass;
    YMOFXReader1:= TYMOFXReader.create(self);
    YMOFXReader1.OFXFile := edtRetorno.Text;
    YMOFXReader1.Process;
    ClientArquivo.ReadOnly := False;
    ClientArquivo.EmptyDataSet;
    ClientArquivo.DisableControls;
    viData := '';

    IniciarIncrementarProgressBar(progressBar, YMOFXReader1.Count-1);
    vgAgendaConc.LancamentoId := dtmControles.GerarSequencia('J_CONCILIACAO_LANCAMENTO');
    for i := 0 to YMOFXReader1.Count-1 do
    begin
      Application.ProcessMessages;
      ClientArquivo.Append;
      ClientArquivoDATA.AsString      := dateToStr(YMOFXReader1.Get(i).MovDate);
      ClientArquivoDESCRICAO.AsString := YMOFXReader1.Get(i).Desc;
      ClientArquivoVALOR.AsCurrency   := YMOFXReader1.Get(i).Value;

      if ClientArquivoVALOR.AsCurrency < 0 then
        ClientArquivoVALOR.AsCurrency := ClientArquivoVALOR.AsCurrency * -1;

      ClientArquivoOPERACAO.AsString    := YMOFXReader1.Get(i).MovType;
      if ClientArquivoOPERACAO.AsString[1] = 'C' then
           ClientArquivoOPERACAO.AsString := 'R'
      else ClientArquivoOPERACAO.AsString := 'D';

      ClientArquivoID.AsString          := YMOFXReader1.Get(i).ID;
      if Pos(':',ClientArquivoID.AsString) > 0 then
        ClientArquivoID.AsString := Copy(ClientArquivoID.AsString, 1,Pos(':',ClientArquivoID.AsString)-1);

      ClientArquivoDOCUMENTO.AsString   := YMOFXReader1.Get(i).Document;
      ClientArquivoLIBERADO.AsString    := 'N';
      ClientArquivoLANCAMENTO.AsString  := '5';
      ClientArquivoVinculo.AsString     := '1';
      ClientArquivoREGISTRADO.AsBoolean := FALSE;
      ClientArquivoALTERADO.AsBoolean   := FALSE;
      ClientArquivoCALC_SELECIONADO.AsBoolean := FALSE;
      ClientArquivo.Post;

      if viData <> ClientArquivoDATA.AsString then
      begin
        viData := ClientArquivoDATA.AsString;
        InserirDataConciliacao(viData);
      end;

      IniciarIncrementarProgressBar(progressBar, 1, True);
    end;
  except
    on E: exception do
      Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
  end;
  FreeAndNil(YMOFXReader1);
  Screen.Cursor := crDefault;
  ClientArquivo.First;
  ClientArquivo.EnableControls;
  btnConfirmar.Enabled            := ClientArquivo.RecordCount > 0;
  progressBar.Visible := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmConciliacaoArquivoCarregar.ClientDataConciliacaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  cxGridDBTableView1Selecionado.Properties.ReadOnly := ClientDataConciliacaoSITUACAO.AsString = '2';
end;

procedure TfrmConciliacaoArquivoCarregar.cxGridDBTableView1Column2PropertiesChange(
  Sender: TObject);
begin
  inherited;
  ClientDataConciliacao.Post;
end;

procedure TfrmConciliacaoArquivoCarregar.cxGridDBTableView1SelecionadoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.RecordViewInfo.GridRecord.Values[1] = '2') then
    ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConciliacaoArquivoCarregar.FormActivate(Sender: TObject);
begin
  inherited;
  lcbConta.SetFocus;
end;

procedure TfrmConciliacaoArquivoCarregar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action      := caFree;
  frmConciliacaoArquivoCarregar := nil;
end;

procedure TfrmConciliacaoArquivoCarregar.lcbContaPropertiesChange(
  Sender: TObject);
begin
  inherited;
  btnCarregarArquivo.Enabled := True;
  ClientArquivo.EmptyDataSet;
  ClientArquivo.EmptyDataSet;
end;

procedure TfrmConciliacaoArquivoCarregar.SalvarDados;
var
  viSql : String;
  viIdConciliacao : Integer;
  vlCarregado : Boolean;

  procedure InserirRegistroData(vpData : TDate);
  begin
    viSql :=  ' INSERT INTO J_CONCILIACAO( ' +
              '              CONCILIACAO_ID, '+
              '              ARQUIVO, ' +
              '              DATA_CARREGAMENTO, ' +
              '              DATA_CONCILIACAO, ' +
              '              SITUACAO, ' +
              '              CAIXA_ID) '+
              ' VALUES(      :CONCILIACAO_ID, ' +
              '              :ARQUIVO, ' +
              '              :DATA_CARREGAMENTO, ' +
              '              :DATA_CONCILIACAO, ' +
              '              :SITUACAO, ' +
              '              :CAIXA_ID)';
    ExecutaSqlAuxiliar(viSql,2);
    with dtmControles.sqlAuxiliar do
    begin
      viIdConciliacao := dtmControles.GerarSequencia('J_CONCILIACAO');
      ParamByName('CONCILIACAO_ID').AsInteger   := viIdConciliacao;
      ParamByName('ARQUIVO').AsString           := ExtractFileName(OpenDialogRetorno.FileName);
      ParamByName('DATA_CARREGAMENTO').AsString := dtmControles.DataHoraBanco(5);
      ParamByName('DATA_CONCILIACAO').AsString  := FormatDateTime('DD.MM.YYYY HH:MM:SS', vpData);
      ParamByName('SITUACAO').AsString          := '1';
      ParamByName('CAIXA_ID').AsInteger         := lcbConta.EditValue;
      ExecSQL;
    end;
  end;

  procedure RegistrarConciliacao;
  var
    viSql : String;
    vlIdConciliacao : Integer;

    procedure RegistrarNovoItem;
    begin
      viSql :=  ' INSERT INTO J_CONCILIACAO_REGISTRADO( ' +
                '              CONCILIACAO_REGISTRADO_ID, '+
                '              CONCILIACAO_ID, '+
                '              DATA_CONCILIACAO, ' +
                '              LANCAMENTO_ID, ' +
                '              DATA_PAGAMENTO, ' +
                '              DESCRICAO, ' +
                '              ID_REGISTRO, ' +
                '              OPERACAO, ' +
                '              DOCUMENTO, ' +
                '              SITUACAO, ' +
                '              LIBERADO, ' +
                '              VINCULO, ' +
                '              LANCAMENTO, ' +
                '              OBSERVACAO, ' +
                '              VALOR) '+
                ' VALUES(      :CONCILIACAO_REGISTRADO_ID, ' +
                '              :CONCILIACAO_ID, '+
                '              :DATA_CONCILIACAO, ' +
                '              :LANCAMENTO_ID, ' +
                '              :DATA_PAGAMENTO, ' +
                '              :DESCRICAO, ' +
                '              :ID_REGISTRO, ' +
                '              :OPERACAO, ' +
                '              :DOCUMENTO, ' +
                '              :SITUACAO, ' +
                '              :LIBERADO, ' +
                '              :VINCULO, ' +
                '              :LANCAMENTO, '+
                '              :OBSERVACAO, ' +
                '              :VALOR)';
    end;

    procedure RegistrarAtualizacao;
    begin
       viSql :=  ' UPDATE J_CONCILIACAO_REGISTRADO SET ID_REGISTRO = '+ QuotedStr(ClientArquivoID.AsString)+','+
                '                                  CONCILIACAO_REGISTRADO_ID = '+QuotedStr(IntToStr(viIdConciliacao)+'-'+ClientArquivoID.AsString)+','+
                '                                  OPERACAO = '+QuotedStr(ClientArquivoOPERACAO.AsString)+','+
                '                                  CONCILIACAO_ID = '+IntToStr(viIdConciliacao)+
                ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString);
       ExecutaSqlAuxiliar(viSql,1);

       viSql :=  ' UPDATE J_LIVRO_CAIXA SET CONCILIACAO_REGISTRADO_ID = '+ QuotedStr(IntToStr(viIdConciliacao)+'-'+ClientArquivoID.AsString)+
                 ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString);
       ExecutaSqlAuxiliar(viSql,1);

     end;

    procedure CarregarValoresGravar;
    begin
      ExecutaSqlAuxiliar(viSql,2);
      with dtmControles.sqlAuxiliar do
      begin
        try
          ParamByName('DATA_CONCILIACAO').AsString          := dtmControles.DataHoraBanco(5);
          ParamByName('LANCAMENTO_ID').AsInteger            := vgAgendaConc.LancamentoId;
          ParamByName('DATA_PAGAMENTO').AsString            := FormatDateTime('DD.MM.YYYY HH:MM:SS', ClientArquivoDATA.AsDateTime);
          ParamByName('DESCRICAO').AsString                 := ClientArquivoDESCRICAO.AsString;
          ParamByName('ID_REGISTRO').AsString               := ClientArquivoID.AsString;
          ParamByName('OPERACAO').AsString                  := ClientArquivoOPERACAO.AsString;
          ParamByName('DOCUMENTO').AsString                 := ClientArquivoDOCUMENTO.AsString;
          ParamByName('VALOR').AsCurrency                   := ClientArquivoVALOR.AsCurrency;
          ParamByName('CONCILIACAO_ID').AsInteger           := viIdConciliacao;
          ParamByName('CONCILIACAO_REGISTRADO_ID').AsString := IntToStr(viIdConciliacao)+'-'+ClientArquivoID.AsString;
          ParamByName('SITUACAO').AsString                  := ClientArquivoSITUACAO.AsString;
          ParamByName('LIBERADO').AsString                  := ClientArquivoLIBERADO.AsString;
          ParamByName('LANCAMENTO').AsString                := ClientArquivoLANCAMENTO.AsString;
          ParamByName('VINCULO').AsString                   := ClientArquivoVinculo.AsString;
          ParamByName('OBSERVACAO').AsString                := ClientArquivoOBSERVACAO.AsString;
          ExecSQL;
        except
          dtmControles.sqlAuxiliar.Cancel;
        end;
      end;
    end;

  begin
    ExecutaSqlAuxiliar(' SELECT CONCILIACAO_REGISTRADO_ID FROM J_CONCILIACAO_REGISTRADO '+
                       ' WHERE CONCILIACAO_REGISTRADO_ID = '+ QuotedStr(ClientArquivoID.AsString)+
                       '  AND CONCILIACAO_ID IS NULL ',0);
    if dtmControles.sqlAuxiliar.IsEmpty then
    begin
      dtmControles.sqlAuxiliar.Active := False;
      RegistrarNovoItem;
      CarregarValoresGravar;
    end
    else RegistrarAtualizacao;
  end;

begin
  ClientDataConciliacao.First;
  vlCarregado := False;
  dtmControles.StartTransaction;
  try
    while not ClientDataConciliacao.Eof do
    begin
      if ClientDataConciliacaoCALC_SELECIONADO.AsBoolean then
      begin
        InserirRegistroData(ClientDataConciliacaoDATA.AsDateTime);

        ClientArquivo.Filtered := False;
        ClientArquivo.Filter   := ' DATA = '+ QuotedStr(ClientDataConciliacaoDATA.AsString);
        ClientArquivo.Filtered := True;

        IniciarIncrementarProgressBar(progressBar, ClientArquivo.RecordCount);
        Screen.Cursor := crHourGlass;
        while not ClientArquivo.Eof do
        begin
          RegistrarConciliacao;
          ClientArquivo.Next;
          IniciarIncrementarProgressBar(progressBar, 1, True);
        end;
        DeleteFile(edtRetorno.Text);
      end;
      ClientDataConciliacao.Next;
    end;
    dtmControles.Commit;
  except
    dtmControles.Roolback;
    Application.MessageBox('Falha ao Salvar Dados!!!','Aviso', MB_OK + MB_ICONINFORMATION);
  end;
  Screen.Cursor := crDefault;
end;

end.
