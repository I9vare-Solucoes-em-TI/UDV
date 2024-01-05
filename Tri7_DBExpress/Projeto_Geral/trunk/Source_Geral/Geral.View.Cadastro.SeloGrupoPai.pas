unit Geral.View.Cadastro.SeloGrupoPai;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  CadBasico,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  Data.FMTBcd,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,
  Data.SqlExpr,
  System.Actions,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.ExtCtrls,
  cxControls,
  cxContainer,
  cxEdit,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxLabel,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  cxDBEditRepository,
  cxGroupBox,
  cxCurrencyEdit,
  cxSplitter;

type
  TfrmCadastroSeloGrupoPai = class(TfrmCadBasico)
    ClientAncestralSELO_GRUPO_PAI_ID: TFMTBCDField;
    ClientAncestralSELO_GRUPO_ID: TFMTBCDField;
    lblSeloGrupo: TcxLabel;
    lcbSeloGrupo: TcxDBLookupComboBox;
    dtsSeloGrupo: TDataSource;
    qrySeloGrupo: TFDQuery;
    grdSeloGrupoPaiDBTableView: TcxGridDBTableView;
    grdSeloGrupoPaiLevel: TcxGridLevel;
    grdSeloGrupoPai: TcxGrid;
    cxEditRepository: TcxEditRepository;
    Lista_SeloGrupo: TcxEditRepositoryLookupComboBoxItem;
    qrySeloGrupoSELO_GRUPO_ID: TBCDField;
    qrySeloGrupoDESCRICAO_COMPLETA: TStringField;
    qrySeloGrupoNUMERO: TBCDField;
    grdSeloGrupoPaiDBTableViewSELO_GRUPO_ID: TcxGridDBColumn;
    grbSeloGrupoFilho: TcxGroupBox;
    pnlSeloGrupoFilhoOpcoes: TPanel;
    grdSeloGrupoFilhoDBTableView: TcxGridDBTableView;
    grdSeloGrupoFilhoLevel: TcxGridLevel;
    grdSeloGrupoFilho: TcxGrid;
    qrySeloGrupoFilho: TFDQuery;
    dtsSeloGrupoFilho: TDataSource;
    qrySeloGrupoFilhoSELO_GRUPO_FILHO_ID: TBCDField;
    qrySeloGrupoFilhoSELO_GRUPO_PAI_ID: TBCDField;
    qrySeloGrupoFilhoSELO_GRUPO_ID: TBCDField;
    grdSeloGrupoFilhoDBTableViewSELO_GRUPO_ID: TcxGridDBColumn;
    btnConfirmar: TcxButton;
    qrySeloGrupoSISTEMA_ID: TBCDField;
    grbNumero: TcxGroupBox;
    edtNumeroInicial: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    edtNumeroFinal: TcxCurrencyEdit;
    grdSeloGrupoPaiDBTableViewSELO_GRUPO_PAI_ID: TcxGridDBColumn;
    grdSeloGrupoFilhoDBTableViewSELO_GRUPO_FILHO_ID: TcxGridDBColumn;
    cxSplitter: TcxSplitter;
    Lista_SeloGrupoNumero: TcxEditRepositoryLookupComboBoxItem;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function NumeroInicial: Integer;
    function NumeroFinal: Integer;

    function Numero(
      const vpEdit: TcxCurrencyEdit): Integer;

    function NumeroInicialInformado: Boolean;
    function NumeroFinalInformado: Boolean;
    function NumeroFinalMenorNumeroInicial: Boolean;
    function SistemaID: Integer;
    function SeloGrupoPaiID: Integer;
    function SeloGrupoID: Integer;
  public
    { Public declarations }
    procedure SetState(
      AState : TDataSetState); override;
  end;

var
  frmCadastroSeloGrupoPai: TfrmCadastroSeloGrupoPai;

implementation

uses
  Controles,
  FDControle,
  MensagemUtils,
  Geral.Model.Entity.Spec.DataSet,
  Geral.Model.Entity.Impl.DataSet,
  Geral.Model.Entity.Impl.Situacao,
  StringUtils;

{$R *.dfm}

procedure TfrmCadastroSeloGrupoPai.btnConfirmarClick(Sender: TObject);
{$REGION 'Constantes'}
const
  CI_RECORDS_PER_TRANSACTION: Integer = 1000;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSeloGrupo: TFDQuery;
  viSeloGrupoAPI: IDataSetAPI<TFDQuery>;
  viSeloGrupoFilho: TFDQuery;
  viSeloGrupoFilhoAPI: IDataSetAPI<TFDQuery>;
  viCursor: TCursor;
  I: Integer;
  viSeloGrupoFilhoID: Integer;
  viSeloGrupoPaiID: Integer;
  viSeloGrupoID: Integer;
{$ENDREGION}
begin
  if not NumeroInicialInformado then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe o número inicial.');

    edtNumeroInicial.SetFocus;
    Exit;
  end;

  if not NumeroFinalInformado then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe o número final.');

    edtNumeroFinal.SetFocus;
    Exit;
  end;

  if NumeroFinalMenorNumeroInicial then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe um número final maior ou igual ao número inicial.');

    edtNumeroFinal.SetFocus;
    edtNumeroFinal.SelectAll;
    Exit;
  end;

  if not TMensagemUtils.ExibirMensagemPergunta(
    'Tem certeza que deseja confirmar?',
    False) then
    Exit;

  viSeloGrupo := TFDQuery.Create(
    nil);

  viSeloGrupoAPI := TDataSetAPI<TFDQuery>.New(
    viSeloGrupo)
  .AutoClose
  .AutoDestroy;

  viSeloGrupo.Connection := dtmFD.FDConnection;

  viSeloGrupo.SQL.Text := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'G_SG.SELO_GRUPO_ID ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_SELO_GRUPO G_SG ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_SG.NUMERO BETWEEN :P_NUMERO_INICIAL AND :P_NUMERO_FINAL AND ' +
    'G_SG.SITUACAO = :P_SITUACAO AND ' +
    'G_SG.SISTEMA_ID = :P_SISTEMA_ID ' +
    {$ENDREGION}

    {$REGION 'Cláusula ORDER BY'}
    'ORDER BY ' +
    'G_SG.NUMERO';
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'Preencher valores dos parâmetros'}
  viSeloGrupo.ParamByName(
    'P_NUMERO_INICIAL').AsInteger := NumeroInicial;

  viSeloGrupo.ParamByName(
    'P_NUMERO_FINAL').AsInteger := NumeroFinal;

  viSeloGrupo.ParamByName(
    'P_SITUACAO').AsString := TAtivo.New.Value;

  viSeloGrupo.ParamByName(
    'P_SISTEMA_ID').AsInteger := SistemaID;
  {$ENDREGION}

  viSeloGrupo.Open;

  if viSeloGrupo.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum registro encontrado.');

    Exit;
  end;

  viCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  try
    dtmFD.FDConnection.StartTransaction;
    try
      {$REGION 'Inserir Selo Grupo Filho'}
      viSeloGrupo.First;
      I := 0;

      viSeloGrupoFilho := TFDQuery.Create(
        nil);

      viSeloGrupoFilhoAPI := TDataSetAPI<TFDQuery>.New(
        viSeloGrupoFilho)
      .AutoDestroy;

      viSeloGrupoFilho.Connection := dtmFD.FDConnection;

      viSeloGrupoFilho.SQL.Text := {$REGION 'Comando SQL INSERT'}
        'INSERT ' +

        {$REGION 'Cláusula INTO'}
        'INTO ' +
        'G_SELO_GRUPO_FILHO ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'SELO_GRUPO_FILHO_ID, ' +
        'SELO_GRUPO_PAI_ID, ' +
        'SELO_GRUPO_ID' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_SELO_GRUPO_FILHO_ID, ' +
        ':P_SELO_GRUPO_PAI_ID, ' +
        ':P_SELO_GRUPO_ID' +
        ')';
        {$ENDREGION}

      {$ENDREGION}

      viSeloGrupoFilho.Params.ArraySize := CI_RECORDS_PER_TRANSACTION;

      while not viSeloGrupo.Eof do
        try
          {$REGION 'Preencher valores dos parâmetros'}
          viSeloGrupoFilhoID := dtmFD.GerarSequencia(
            'G_SELO_GRUPO_FILHO');

          viSeloGrupoFilho.ParamByName(
            'P_SELO_GRUPO_FILHO_ID').AsIntegers[I] := viSeloGrupoFilhoID;

          viSeloGrupoPaiID := SeloGrupoPaiID;

          viSeloGrupoFilho.ParamByName(
            'P_SELO_GRUPO_PAI_ID').AsIntegers[I] := viSeloGrupoPaiID;

          viSeloGrupoID := viSeloGrupo.FieldByName(
            'SELO_GRUPO_ID').AsInteger;

          viSeloGrupoFilho.ParamByName(
            'P_SELO_GRUPO_ID').AsIntegers[I] := viSeloGrupoID;
          {$ENDREGION}

          Inc(
            I);

          if I = CI_RECORDS_PER_TRANSACTION then
          begin
            viSeloGrupoFilho.Execute(
              I);

            I := 0;
          end;
        finally
          viSeloGrupo.Next;
        end;

      if I > 0 then
        viSeloGrupoFilho.Execute(
          I);
      {$ENDREGION}

      dtmFD.FDConnection.Commit;
    except
      on E: Exception do
      begin
        dtmFD.FDConnection.Rollback;
        Screen.Cursor := viCursor;
        Application.ProcessMessages;

        TMensagemUtils.ExibirMensagemErro(
          string.Format(
            'Não foi possível confirmar devido ao motivo abaixo:' +
            '%s%s',
            [TStringUtils.GetQuebraLinhaDupla,
            E.Message]));

        Exit;
      end;
    end;
  finally
    Screen.Cursor := viCursor;
    Application.ProcessMessages;
  end;

  TMensagemUtils.ExibirMensagemInformacao(
    'A confirmação foi realizada com sucesso.');

  qrySeloGrupoFilho.Refresh;
  edtNumeroInicial.Clear;
  edtNumeroFinal.Clear;
end;

procedure TfrmCadastroSeloGrupoPai.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmCadastroSeloGrupoPai := nil;
end;

procedure TfrmCadastroSeloGrupoPai.FormCreate(Sender: TObject);
begin
  inherited;
  ClientAncestral.Open;
  vgNomeTabela := 'G_SELO_GRUPO_PAI';
  vgChavePrimaria := 'SELO_GRUPO_PAI_ID';
  qrySeloGrupo.Open;
  qrySeloGrupoFilho.Open;
end;

procedure TfrmCadastroSeloGrupoPai.FormDestroy(Sender: TObject);
begin
  qrySeloGrupo.Close;
  qrySeloGrupoFilho.Close;
  inherited;
end;

function TfrmCadastroSeloGrupoPai.Numero(
  const vpEdit: TcxCurrencyEdit): Integer;
begin
  if VarIsNull(
    vpEdit.EditValue) then
    Exit(
      0);

  Result := vpEdit.EditValue;
end;

function TfrmCadastroSeloGrupoPai.NumeroFinal: Integer;
begin
  Result := Numero(
    edtNumeroFinal);
end;

function TfrmCadastroSeloGrupoPai.NumeroFinalInformado: Boolean;
begin
  Result := NumeroFinal > 0;
end;

function TfrmCadastroSeloGrupoPai.NumeroFinalMenorNumeroInicial: Boolean;
begin
  Result := NumeroFinal < NumeroInicial;
end;

function TfrmCadastroSeloGrupoPai.NumeroInicial: Integer;
begin
  Result := Numero(
    edtNumeroInicial);
end;

function TfrmCadastroSeloGrupoPai.NumeroInicialInformado: Boolean;
begin
  Result := NumeroInicial > 0;
end;

function TfrmCadastroSeloGrupoPai.SeloGrupoID: Integer;
begin
  Result := ClientAncestralSELO_GRUPO_ID.AsInteger;
end;

function TfrmCadastroSeloGrupoPai.SeloGrupoPaiID: Integer;
begin
  Result := ClientAncestralSELO_GRUPO_PAI_ID.AsInteger;
end;

procedure TfrmCadastroSeloGrupoPai.SetState(AState: TDataSetState);
begin
  inherited;

  grbSeloGrupoFilho.Enabled := (AState = TDataSetState.dsBrowse) and
    not ClientAncestral.IsEmpty;
end;

function TfrmCadastroSeloGrupoPai.SistemaID: Integer;
begin
  if qrySeloGrupoSELO_GRUPO_ID.AsInteger <> SeloGrupoID then
    qrySeloGrupo.Locate(
      'SELO_GRUPO_ID',
      SeloGrupoID);

  Result := qrySeloGrupoSISTEMA_ID.AsInteger;
end;

end.
