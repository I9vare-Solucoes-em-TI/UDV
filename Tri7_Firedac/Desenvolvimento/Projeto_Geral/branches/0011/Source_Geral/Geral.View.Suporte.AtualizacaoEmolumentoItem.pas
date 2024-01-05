unit Geral.View.Suporte.AtualizacaoEmolumentoItem;

interface

uses
  I9Query,
  I9Connection,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  cxControls,
  cxContainer,
  cxEdit,
  cxGroupBox,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.ExtCtrls,
  cxDropDownEdit,
  cxTextEdit,
  cxMaskEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
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
  dxBarBuiltInMenu,
  cxPC;

type
  TfrmSuporteAtualizacaoEmolumentoItem = class(TForm)
    pnlCabecalho: TPanel;
    pnlSair: TPanel;
    btnSair: TcxButton;
    grbEmolumentoPeriodo: TcxGroupBox;
    lcbEmolumentoPeriodo: TcxLookupComboBox;
    grbCampo: TcxGroupBox;
    cbxCampo: TcxComboBox;
    btnPesquisar: TcxButton;
    btnConfirmar: TcxButton;
    qryEmolumentoItem: TI9Query;
    qryEmolumentoItemEMOLUMENTO_ITEM_ID: TBCDField;
    qryEmolumentoItemCODIGO_SELO: TStringField;
    qryEmolumentoItemVALOR_EMOLUMENTO: TBCDField;
    qryEmolumentoItemVALOR_TAXA_JUDICIARIA: TBCDField;
    qryEmolumentoItemSISTEMA_ID: TBCDField;
    qryEmolumentoItemDESCRICAO: TStringField;
    qryEmolumentoItemVALOR_EMOLUMENTO_TJ: TBCDField;
    qryEmolumentoItemVALOR_TAXA_JUDICIARIA_TJ: TBCDField;
    qryEmolumentoItemCORRECAO_VALOR_EMOLUMENTO: TBCDField;
    qryEmolumentoItemCORRECAO_VALOR_TAXA_JUDICIARIA: TBCDField;
    dtsEmolumentoItem: TDataSource;
    qryEmolumentoPeriodo: TI9Query;
    dtsEmolumentoPeriodo: TDataSource;
    qrySeloGrupo: TI9Query;
    dtsSeloGrupo: TDataSource;
    qrySeloGrupoSELO_GRUPO_ID: TBCDField;
    qrySeloGrupoNUMERO: TBCDField;
    qrySeloGrupoDESCRICAO_COMPLETA: TStringField;
    qrySeloGrupoDESCRICAO_COMPLETA_TJ: TStringField;
    qrySeloGrupoSISTEMA_ID: TBCDField;
    qrySeloGrupoDESCRICAO: TStringField;
    pgcAtualizacaoEmolumentoItem: TcxPageControl;
    tbsEmolumentoItem: TcxTabSheet;
    tbsSeloGrupo: TcxTabSheet;
    grdEmolumentoItem: TcxGrid;
    grdEmolumentoItemDBTableView: TcxGridDBTableView;
    grdEmolumentoItemDBTableViewCODIGO_SELO: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewDESCRICAO: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewVALOR_EMOLUMENTO: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewVALOR_EMOLUMENTO_TJ: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewVALOR_TAXA_JUDICIARIA: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewVALOR_TAXA_JUDICIARIA_TJ: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewCORRECAO_VALOR_EMOLUMENTO: TcxGridDBColumn;
    grdEmolumentoItemDBTableViewCORRECAO_VALOR_TAXA_JUDICIARIA: TcxGridDBColumn;
    grdEmolumentoItemLevel: TcxGridLevel;
    grdSeloGrupoDBTableView: TcxGridDBTableView;
    grdSeloGrupoLevel: TcxGridLevel;
    grdSeloGrupo: TcxGrid;
    grdSeloGrupoDBTableViewNUMERO: TcxGridDBColumn;
    grdSeloGrupoDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn;
    grdSeloGrupoDBTableViewDESCRICAO_COMPLETA_TJ: TcxGridDBColumn;
    grdSeloGrupoDBTableViewDESCRICAO: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lcbEmolumentoPeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure grdEmolumentoItemDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    function EmolumentoPeriodoID: Integer;
    function SQL: string;
    function Coluna: string;
    function ValorEmolumento: Boolean;
    function ValorTaxaJudiciaria: Boolean;
    function CampoEmolumentoItem: Boolean;

    procedure PesquisarEmolumentoItem;
    procedure PesquisarSeloGrupo;
    procedure ConfirmarEmolumentoItem;
    procedure ConfirmarSeloGrupo;
  public
    { Public declarations }
  end;

var
  frmSuporteAtualizacaoEmolumentoItem: TfrmSuporteAtualizacaoEmolumentoItem;

implementation

uses
  Controles,
  MensagemUtils,
  System.StrUtils,
  StringUtils,
  Geral.Model.Entity.Spec.DataSet,
  Geral.Model.Entity.Impl.DataSet,
  System.Character,
  System.Types;

{$R *.dfm}

procedure TfrmSuporteAtualizacaoEmolumentoItem.btnConfirmarClick(
  Sender: TObject);
begin
  if CampoEmolumentoItem then
  begin
    ConfirmarEmolumentoItem;
    Exit;
  end;

  ConfirmarSeloGrupo;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.btnPesquisarClick(
  Sender: TObject);
begin
  if CampoEmolumentoItem then
  begin
    PesquisarEmolumentoItem;
    Exit;
  end;

  PesquisarSeloGrupo;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TfrmSuporteAtualizacaoEmolumentoItem.CampoEmolumentoItem: Boolean;
begin
  Result := ValorEmolumento or
    ValorTaxaJudiciaria;
end;

function TfrmSuporteAtualizacaoEmolumentoItem.Coluna: string;
begin
  Result := IfThen(
    ValorEmolumento,
    'VALOR_EMOLUMENTO',
    'VALOR_TAXA_JUDICIARIA');
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.ConfirmarEmolumentoItem;
{$REGION 'Constantes'}
const
  CI_RECORDS_PER_TRANSACTION: Integer = 1000;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viCursor: TCursor;
  viBookmark: TBookmark;
  I: Integer;
  viEmolumentoItem: TI9Query;
  viEmolumentoItemAPI: IDataSetAPI<TI9Query>;
  viValorTJ: Currency;
  viEmolumentoItemID: Integer;
{$ENDREGION}
begin
  if qryEmolumentoItem.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum registro encontrado.');

    Exit;
  end;

  if not TMensagemUtils.ExibirMensagemPergunta(
    'Tem certeza que deseja confirmar?',
    False) then
    Exit;

  viCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  viBookmark := qryEmolumentoItem.Bookmark;
  qryEmolumentoItem.DisableControls;

  try
    dtmControles.StartTransaction;
    try
      qryEmolumentoItem.First;
      I := 0;

      viEmolumentoItem := TI9Query.Create(
        nil);

      viEmolumentoItemAPI := TDataSetAPI<TI9Query>.New(
        viEmolumentoItem)
      .AutoDestroy;

      viEmolumentoItem.Connection := dtmControles.DB;

      viEmolumentoItem.SQL.Text := {$REGION 'Comando SQL UPDATE'}

        {$REGION 'Cláusula UPDATE'}
        'UPDATE ' +
        'G_EMOLUMENTO_ITEM G_EI ' +
        {$ENDREGION}

        {$REGION 'Cláusula SET, Colunas e Parâmetros'}
        'SET ' +

        string.Format(
          'G_EI.%s = :P_%s ',
          [Coluna,
          Coluna]) +

        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'G_EI.EMOLUMENTO_ITEM_ID = :P_EMOLUMENTO_ITEM_ID';
        {$ENDREGION}

      {$ENDREGION}

      viEmolumentoItem.Params.ArraySize := CI_RECORDS_PER_TRANSACTION;

      while not qryEmolumentoItem.Eof do
        try
          {$REGION 'Preencher valores dos parâmetros'}
          viValorTJ := qryEmolumentoItem.FieldByName(
            string.Format(
              '%s_TJ',
              [Coluna]))
          .AsCurrency;

          viEmolumentoItem.ParamByName(
            string.Format(
              'P_%s',
              [Coluna]))
          .AsCurrencys[I] := viValorTJ;

          viEmolumentoItemID := qryEmolumentoItemEMOLUMENTO_ITEM_ID.AsInteger;

          viEmolumentoItem.ParamByName(
            'P_EMOLUMENTO_ITEM_ID').AsIntegers[I] := viEmolumentoItemID;
          {$ENDREGION}

          Inc(
            I);

          if I = CI_RECORDS_PER_TRANSACTION then
          begin
            viEmolumentoItem.Execute(
              I);

            I := 0;
          end;
        finally
          qryEmolumentoItem.Next;
        end;

      if I > 0 then
        viEmolumentoItem.Execute(
          I);

      dtmControles.Commit;
    except
      on E: Exception do
      begin
        dtmControles.Rollback;
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
    qryEmolumentoItem.GotoBookmark(
      viBookmark);

    qryEmolumentoItem.EnableControls;

    Screen.Cursor := viCursor;
    Application.ProcessMessages;
  end;

  TMensagemUtils.ExibirMensagemInformacao(
    'A confirmação foi realizada com sucesso.');

  btnConfirmar.Enabled := False;
  qryEmolumentoItem.Close;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.ConfirmarSeloGrupo;
{$REGION 'Constantes'}
const
  CI_RECORDS_PER_TRANSACTION: Integer = 1000;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viCursor: TCursor;
  viBookmark: TBookmark;
  I: Integer;
  viSeloGrupo: TI9Query;
  viSeloGrupoAPI: IDataSetAPI<TI9Query>;
  viSeloGrupoID: Integer;
  viDescricaoCompleta: string;
  viDescricao: string;
{$ENDREGION}
begin
  if qrySeloGrupo.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum registro encontrado.');

    Exit;
  end;

  if not TMensagemUtils.ExibirMensagemPergunta(
    'Tem certeza que deseja confirmar?',
    False) then
    Exit;

  viCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  viBookmark := qrySeloGrupo.Bookmark;
  qrySeloGrupo.DisableControls;

  try
    dtmControles.StartTransaction;
    try
      qrySeloGrupo.First;
      I := 0;

      viSeloGrupo := TI9Query.Create(
        nil);

      viSeloGrupoAPI := TDataSetAPI<TI9Query>.New(
        viSeloGrupo)
      .AutoDestroy;

      viSeloGrupo.Connection := dtmControles.DB;

      viSeloGrupo.SQL.Text := {$REGION 'Comando SQL UPDATE'}

        {$REGION 'Cláusula UPDATE'}
        'UPDATE ' +
        'G_SELO_GRUPO G_SG ' +
        {$ENDREGION}

        {$REGION 'Cláusula SET, Colunas e Parâmetros'}
        'SET ' +
        'G_SG.DESCRICAO = :P_DESCRICAO, ' +
        'G_SG.DESCRICAO_COMPLETA = :P_DESCRICAO_COMPLETA ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'G_SG.SELO_GRUPO_ID = :P_SELO_GRUPO_ID';
        {$ENDREGION}

      {$ENDREGION}

      viSeloGrupo.Params.ArraySize := CI_RECORDS_PER_TRANSACTION;

      while not qrySeloGrupo.Eof do
        try
          {$REGION 'Preencher valores dos parâmetros'}
          viDescricaoCompleta := qrySeloGrupoDESCRICAO_COMPLETA_TJ.AsString
          .Trim
          .Substring(
            0,
            260)
          .Trim;

          viDescricao := viDescricaoCompleta
          .Substring(
            0,
            30)
          .Trim;

          viSeloGrupo.ParamByName(
            'P_DESCRICAO').AsStrings[I] := viDescricao;

          viSeloGrupo.ParamByName(
            'P_DESCRICAO_COMPLETA').AsStrings[I] := viDescricaoCompleta;

          viSeloGrupoID := qrySeloGrupoSELO_GRUPO_ID.AsInteger;

          viSeloGrupo.ParamByName(
            'P_SELO_GRUPO_ID').AsIntegers[I] := viSeloGrupoID;
          {$ENDREGION}

          Inc(
            I);

          if I = CI_RECORDS_PER_TRANSACTION then
          begin
            viSeloGrupo.Execute(
              I);

            I := 0;
          end;
        finally
          qrySeloGrupo.Next;
        end;

      if I > 0 then
        viSeloGrupo.Execute(
          I);

      dtmControles.Commit;
    except
      on E: Exception do
      begin
        dtmControles.Rollback;
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
    qrySeloGrupo.GotoBookmark(
      viBookmark);

    qrySeloGrupo.EnableControls;

    Screen.Cursor := viCursor;
    Application.ProcessMessages;
  end;

  TMensagemUtils.ExibirMensagemInformacao(
    'A confirmação foi realizada com sucesso.');

  btnConfirmar.Enabled := False;
  qrySeloGrupo.Close;
end;

function TfrmSuporteAtualizacaoEmolumentoItem.EmolumentoPeriodoID: Integer;
begin
  if VarIsNull(
    lcbEmolumentoPeriodo.EditValue) then
    Exit(
      0);

  Result := lcbEmolumentoPeriodo.EditValue;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmSuporteAtualizacaoEmolumentoItem := nil;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.FormCreate(Sender: TObject);
begin
  qryEmolumentoPeriodo.Open;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key.IsInArray(
    [CarriageReturn]) then
  begin
    Key := NullChar;

    PostMessage(
      Handle,
      WM_NEXTDLGCTL,
      0,
      0);
  end;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.grdEmolumentoItemDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
{$REGION 'Variáveis'}
var
  I: Integer;
  viValor: Variant;
  viCorrecao: Currency;
{$ENDREGION}
begin
  if not (AViewInfo.Item.Index in
    [grdEmolumentoItemDBTableViewCORRECAO_VALOR_EMOLUMENTO.Index,
    grdEmolumentoItemDBTableViewCORRECAO_VALOR_TAXA_JUDICIARIA.Index]) then
    Exit;

  if grdEmolumentoItemDBTableViewCORRECAO_VALOR_EMOLUMENTO.Visible then
    I := grdEmolumentoItemDBTableViewCORRECAO_VALOR_EMOLUMENTO.Index
  else
    I := grdEmolumentoItemDBTableViewCORRECAO_VALOR_TAXA_JUDICIARIA.Index;

  viValor := AViewInfo.GridRecord.Values[I];

  if VarIsNull(
    viValor) then
    viCorrecao := 0
  else
    viCorrecao := viValor;

  if viCorrecao < 0 then
  begin
    ACanvas.Font.Color := clBlue;
    Exit;
  end;

  if viCorrecao > 0 then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.lcbEmolumentoPeriodoPropertiesEditValueChanged(
  Sender: TObject);
begin
  btnConfirmar.Enabled := False;

  if Sender = cbxCampo then
    lcbEmolumentoPeriodo.Enabled := CampoEmolumentoItem;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.PesquisarEmolumentoItem;
{$REGION 'Variáveis'}
var
  viEmolumentoPeriodoID: Integer;
{$ENDREGION}
begin
  viEmolumentoPeriodoID := EmolumentoPeriodoID;
  if viEmolumentoPeriodoID = 0 then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe o emolumento período.');

    lcbEmolumentoPeriodo.SetFocus;
    lcbEmolumentoPeriodo.DroppedDown := True;
    Exit;
  end;

  tbsEmolumentoItem.TabVisible := True;
  tbsSeloGrupo.TabVisible := False;
  pgcAtualizacaoEmolumentoItem.ActivePage := tbsEmolumentoItem;
  grdEmolumentoItemDBTableViewVALOR_EMOLUMENTO.Visible := ValorEmolumento;
  grdEmolumentoItemDBTableViewVALOR_EMOLUMENTO_TJ.Visible := ValorEmolumento;

  grdEmolumentoItemDBTableViewCORRECAO_VALOR_EMOLUMENTO.Visible :=
    ValorEmolumento;

  grdEmolumentoItemDBTableViewVALOR_TAXA_JUDICIARIA.Visible :=
    not ValorEmolumento;

  grdEmolumentoItemDBTableViewVALOR_TAXA_JUDICIARIA_TJ.Visible :=
    not ValorEmolumento;

  grdEmolumentoItemDBTableViewCORRECAO_VALOR_TAXA_JUDICIARIA.Visible :=
    not ValorEmolumento;

  qryEmolumentoItem.SQL.Text := SQL;

  {$REGION 'Preencher valores dos parâmetros'}
  qryEmolumentoItem.ParamByName(
    'P_EMOLUMENTO_PERIODO_ID').AsInteger := viEmolumentoPeriodoID;
  {$ENDREGION}

  qryEmolumentoItem.Open;

  if qryEmolumentoItem.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum registro encontrado.');

    Exit;
  end;

  btnConfirmar.Enabled := True;
end;

procedure TfrmSuporteAtualizacaoEmolumentoItem.PesquisarSeloGrupo;
begin
  tbsEmolumentoItem.TabVisible := False;
  tbsSeloGrupo.TabVisible := True;
  pgcAtualizacaoEmolumentoItem.ActivePage := tbsSeloGrupo;

  qrySeloGrupo.Close;
  qrySeloGrupo.Open;

  if qrySeloGrupo.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum registro encontrado.');

    Exit;
  end;

  btnConfirmar.Enabled := True;
end;

function TfrmSuporteAtualizacaoEmolumentoItem.SQL: string;
begin
  Result := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'G_EI.EMOLUMENTO_ITEM_ID, ' +
    'G_EI.CODIGO_SELO, ' +
    'G_EI.VALOR_EMOLUMENTO, ' +
    'G_EI.VALOR_TAXA_JUDICIARIA, ' +
    'G_S.SISTEMA_ID, ' +
    'G_S.DESCRICAO, ' +
    'C.VALOR_EMOLUMENTO AS VALOR_EMOLUMENTO_TJ, ' +
    'C.VALOR_TAXA_JUDICIARIA AS VALOR_TAXA_JUDICIARIA_TJ, ' +

    'C.VALOR_EMOLUMENTO - G_EI.VALOR_EMOLUMENTO ' +
      'AS CORRECAO_VALOR_EMOLUMENTO, ' +

    'C.VALOR_TAXA_JUDICIARIA - G_EI.VALOR_TAXA_JUDICIARIA ' +
      'AS CORRECAO_VALOR_TAXA_JUDICIARIA ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_EMOLUMENTO_ITEM G_EI ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'CONFERENCIA C ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'C.CODIGO = G_EI.CODIGO_SELO ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_EMOLUMENTO G_E ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_E.EMOLUMENTO_ID = G_EI.EMOLUMENTO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_SISTEMA G_S ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_S.SISTEMA_ID = G_E.SISTEMA_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_EI.EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND ' +

    string.Format(
      'G_EI.%s <> C.%s ',
      [Coluna,
      Coluna]) +

    {$ENDREGION}

    {$REGION 'Cláusula ORDER BY'}
    'ORDER BY ' +
    'G_S.DESCRICAO, ' +
    'G_EI.CODIGO_SELO';
    {$ENDREGION}

  {$ENDREGION}
end;

function TfrmSuporteAtualizacaoEmolumentoItem.ValorEmolumento: Boolean;
begin
  Result := cbxCampo.ItemIndex = 0;
end;

function TfrmSuporteAtualizacaoEmolumentoItem.ValorTaxaJudiciaria: Boolean;
begin
  Result := cbxCampo.ItemIndex = 1;
end;

end.
