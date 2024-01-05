unit SeloSelecionado;

interface

uses
  I9Query,
  FireDAC.Stan.Param,
  I9Query,
  I9Connection,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Menus,
  cxControls,
  SeloFundo,
  cxContainer,
  cxEdit,
  cxLabel,
  StdCtrls,
  cxButtons,
  ExtCtrls,
  DB,
  DBClient,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  DbxDevartInterBase,
  SimpleDS,
  dxSkinsCore,
  dxSkinCoffee,
  dxSkiniMaginary,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  Geral.Model.Entity.AnonymousMethods,
  Geral.Model.Entity.Spec.List,
  I9Transaction;

type
  TDadosSelo = Record
    SeloGrupoId, Qtd, SeloContSeq, SeloContTotal, SeloI, RecuoLinha, RecuoLimite : Integer;
    Confirmado, ImprimirDocumento, SolicitarSelo, SeloAutomatico, SomenteTraslado, DesativarExibicao, SeloUsuario : Boolean;
    SeloLivroId, SeloSequencia, Serventuario, ReservaEspecial : String;
    SeloSeq : array[1..15, 1..30] of string;
    MultiploApresentante : array[1..100] of string;

    // Dados Adicionais
    SeloAgrupador, Apresentante, Tabela, CampoId, Descricao, EmolumentoId, Protocolo, CodigoGratuito  : String;
    SeloCodigoBusca1, SeloCodigoBusca2 : String;
    ValorTotal, ValorEmolumento, ValorTaxaJud, ValorFundesp, ValorISS : Currency;
    Transacao : Boolean;
  End;

  TOnQuantidadeModificada = TAction<Integer>;
  TInutilizacaoJustificativa = reference to function: string;

  TfrmSeloSelecionado = class(TForm)
    plnSelo: TPanel;
    Panel2: TPanel;
    btnPesquisar: TcxButton;
    cxButton1: TcxButton;
    btnConfirmar: TcxButton;
    lblSelo: TcxLabel;
    Shape1: TShape;

    procedure FormActivate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    {$REGION 'Constantes'}
    const CL_RECORDS_PER_TRANSACTION: Integer = 1000;
    {$ENDREGION}

    function RegistrarSelo(
      const vpGrupoId: Integer;
      const vpUsuarioId: Integer;
      const vpQtde: Integer;
      const vpCodigoSeloPrenotacao: string): string;

    function SelecionarSelos(
      const vpSeloGrupoID: Integer;
      const vpQuantidade: Integer): string;

    function NovaFormaSelecionarSelo: Boolean;

    function CriarAtosRetornoTJ_GO(
      const vpSeloLivroList: IList<Integer>): TDataSet;

    function SegundosEsperarPedidoAtoTJ_GO(
      const vpSeloGrupoID: Integer): Integer;

    function SeloLivroList(
      const vpDados: TDataSet): IList<Integer>;

    function SeloLivroListRetornadosTJ_GO(
      const vpSeloLivroList: IList<Integer>): IList<Integer>;

    function SolicitarInutilizacaoJustificativa: Boolean;

    function VerificarRetornoAtosGrupoSeloTJ_GO(
      const vpSeloGrupoID: Integer;
      const vpTipoAto: Integer): IList<Integer>;

    procedure AlterarExportacao(
      const vpSeloLivroList: IList<Integer>;
      const vpDataExportacao: TDateTime;
      const vpCodigoExportacao: Integer);

    procedure VerificarSeloRetornoAtoTJ_GO(
      const vpSeloRetornoAtoID: Integer);

    procedure AlterarSituacaoValidado(
      const vpSeloLivroList: IList<Integer>;
      const vpSeloSituacaoID: Integer;
      const vpValidado: string;
      const vpTransaction: TI9Transaction);
  public
    procedure GravarDadosSelo(
      vpSeloLivroId,
      vpTabela,
      vpCampoId,
      vpDescricao: string;
      vpAgrupadorIgual: Boolean;
      vpData: string = '';
      vpIdSeloArmazena: Integer = 0;
      const vpSeloFundos: TSeloFundos = nil;
      vpTabelaItem: string = '';
      vpCampoItemId: string = '';
      const vpRetornarAtosTJ: Boolean = False);

    function SelecionarSelo(
      vpSeloGrupoId, vpQtd : string;
      vpTipoRetorno : Boolean = True;
      const vpOnQuantidadeModificada: TOnQuantidadeModificada = nil;
      const vpCodigoSeloPrenotacao: string = ''):Boolean; {True - Abort / False - Exit}

    procedure SolicitarSelo(
      vpEmolumentoItemId : Integer;
      vpTipoRetorno : Boolean = True;
      vpTransacao : Boolean = True;
      const vpOnQuantidadeModificada: TOnQuantidadeModificada = nil;
      const vpCodigoSeloPrenotacao: string = ''); {True - Abort / False - Exit}

    Function PesquisarSelo(vpRegistroID, vpTabela, vpTextoAdicional : String; vpAgrupador : Boolean = True;
                vpTodos : Boolean = True; vpNumeroAgrupador : string = ''):String;
    Function PesquisarNumeroAgrupador(vpRegistroID, vpTabela : String):String;

    procedure CapturarSelo(
      vpTipoRetorno : Boolean = True;
      const vpOnQuantidadeModificada: TOnQuantidadeModificada = nil;
      const vpCodigoSeloPrenotacao: string = ''); {True - Abort / False - Exit}

    function LiberarSeloVinculado(
      vpTabela: string;
      vpId: String;
      vpIdSeloLivro: Integer = 0;
      vpCancelar: Boolean = True;
      vpManterVinculo: Boolean = False;
      const vpAutorizarEstornoSeloExportado: Boolean = True;
      const vpEstornoSeloExportadoAutorizado: TAction = nil;
      const vpInutilizacaoJustificativa: TInutilizacaoJustificativa = nil): Boolean;

    function InutilizacaoJustificativa: string;

    procedure CancelarSeloVinculado(
      vpTabela, vpId : String;
      vpManterVinculo : Boolean = False;
      const vpIdSeloLivro: Integer = 0;
      const vpInutilizacaoJustificativa: string = '');

    Function VerificarSeloExportado(vpTabela, vpRegistroID : String; const vpIdSeloLivro: Integer = 0):Boolean;
    Function BuscarCodigoGrupoSelo(vpEmolumentoItemId : string): Integer;
    Function BuscarCodigoSelo(vpEmolumentoItemId : string): Integer;
  end;

var
  frmSeloSelecionado: TfrmSeloSelecionado;
  vgDadosSelo : TDadosSelo;
  vlExibirSelo : Boolean;

implementation

uses
  Controles,
  SeloSelecao,
  Rotinas,
  Lookup,
  SeloFundoDAO,
  FundoTipo,
  SeloLivroList,
  BooleanHelper,
  System.StrUtils,
  SeloLivro,
  SeloLivroImpl,
  System.Math,
  System.Types,
  FormatadorMascaraSeloSimpleFactory,
  Geral.Model.Entity.Impl.DataSet,
  FireDAC.Comp.Client,
  ADM.Model.Business.Spec.SelosTJ_GO,
  ADM.Controller.Factory.Business.SelosTJ_GO,
  MensagemUtils,
  Geral.Model.Entity.Impl.Factory.List,
  I9MemTable,
  System.DateUtils,
  Atualizacao,
  ValidarPermissaoUsuario;

{$R *.dfm}

procedure TfrmSeloSelecionado.AlterarExportacao(
  const vpSeloLivroList: IList<Integer>;
  const vpDataExportacao: TDateTime;
  const vpCodigoExportacao: Integer);
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  I: Integer;
  viSeloLivroID: Integer;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL UPDATE'}

      {$REGION 'Cláusula UPDATE'}
      'UPDATE ' +
      'G_SELO_LIVRO G_SL ' +
      {$ENDREGION}

      {$REGION 'Cláusula SET, Colunas e Parâmetros'}
      'SET ' +
      'G_SL.DATA_EXPORTACAO = :P_DATA_EXPORTACAO, ' +
      'G_SL.CODIGO_EXPORTACAO = :P_CODIGO_EXPORTACAO ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SL.SELO_LIVRO_ID = :P_SELO_LIVRO_ID';
      {$ENDREGION}

    {$ENDREGION}

    viQuery.Params.ArraySize := CL_RECORDS_PER_TRANSACTION;
    I := 0;

    for viSeloLivroID in vpSeloLivroList do
    begin
      {$REGION 'Preencher valores dos parâmetros'}
      viQuery.ParamByName(
        'P_DATA_EXPORTACAO').AsDateTimes[I] := vpDataExportacao;

      viQuery.ParamByName(
        'P_CODIGO_EXPORTACAO').AsIntegers[I] := vpCodigoExportacao;

      viQuery.ParamByName(
        'P_SELO_LIVRO_ID').AsIntegers[I] := viSeloLivroID;
      {$ENDREGION}

      Inc(
        I);

      if I = CL_RECORDS_PER_TRANSACTION then
      begin
        viQuery.Execute(
          I);

        I := 0;
      end;
    end;

    if I > 0 then
      viQuery.Execute(
        I);
  finally
    viQuery.Free;
  end;
end;

procedure TfrmSeloSelecionado.AlterarSituacaoValidado(
  const vpSeloLivroList: IList<Integer>;
  const vpSeloSituacaoID: Integer;
  const vpValidado: string;
  const vpTransaction: TI9Transaction);
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  I: Integer;
  viSeloLivroID: Integer;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    if Assigned(
      vpTransaction) then
      viQuery.Transaction := vpTransaction;

    viQuery.SQL.Text := {$REGION 'Comando SQL UPDATE'}

      {$REGION 'Cláusula UPDATE'}
      'UPDATE ' +
      'G_SELO_LIVRO G_SL ' +
      {$ENDREGION}

      {$REGION 'Cláusula SET, Colunas e Parâmetros'}
      'SET ' +
      'G_SL.SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID, ' +
      'G_SL.VALIDADO = :P_VALIDADO ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SL.SELO_LIVRO_ID = :P_SELO_LIVRO_ID';
      {$ENDREGION}

    {$ENDREGION}

    viQuery.Params.ArraySize := CL_RECORDS_PER_TRANSACTION;
    I := 0;

    for viSeloLivroID in vpSeloLivroList do
    begin
      {$REGION 'Preencher valores dos parâmetros'}
      viQuery.ParamByName(
        'P_SELO_SITUACAO_ID').AsIntegers[I] := vpSeloSituacaoID;

      viQuery.ParamByName(
        'P_VALIDADO').AsStrings[I] := vpValidado;

      viQuery.ParamByName(
        'P_SELO_LIVRO_ID').AsIntegers[I] := viSeloLivroID;
      {$ENDREGION}

      Inc(
        I);

      if I = CL_RECORDS_PER_TRANSACTION then
      begin
        viQuery.Execute(
          I);

        I := 0;
      end;
    end;

    if I > 0 then
      viQuery.Execute(
        I);
  finally
    viQuery.Free;
  end;
end;

procedure TfrmSeloSelecionado.btnConfirmarClick(Sender: TObject);
begin
  vgDadosSelo.Confirmado := True;
  Close;
end;

procedure TfrmSeloSelecionado.btnPesquisarClick(Sender: TObject);
begin
  vgDadosSelo.Confirmado := False;
  ExibirFormulario(TFrmSeloSelecao, FrmSeloSelecao, True);
  btnConfirmar.SetFocus;
end;

function TfrmSeloSelecionado.BuscarCodigoGrupoSelo(
  vpEmolumentoItemId: string): Integer;
var
  viSelar : string;
begin
  viSelar := dtmControles.GetStr(' SELECT FIRST 1 E.SELAR FROM G_EMOLUMENTO E '+
                                 '   LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
                                 '   E.EMOLUMENTO_ID = EI.EMOLUMENTO_ID '+
                                 ' WHERE EI.EMOLUMENTO_ITEM_ID = '+vpEmolumentoItemId);

  if viSelar = 'N' then
    Result := -1
  else
    Result := dtmControles.GetInt(' SELECT SG.SELO_GRUPO_ID '+
                                  ' FROM G_EMOLUMENTO_ITEM EI '+
                                  '  LEFT JOIN G_SELO_GRUPO SG ON '+
                                  '  EI.CODIGO_SELO = SG.NUMERO '+
                                  ' WHERE EI.EMOLUMENTO_ITEM_ID = '+vpEmolumentoItemId);

end;

function TfrmSeloSelecionado.BuscarCodigoSelo(
  vpEmolumentoItemId: string): Integer;
begin
  Result := dtmControles.GetInt(' SELECT CODIGO_SELO '+
                                ' FROM G_EMOLUMENTO_ITEM '+
                                ' WHERE EMOLUMENTO_ITEM_ID = '+vpEmolumentoItemId);
end;

procedure TfrmSeloSelecionado.CancelarSeloVinculado(
  vpTabela, vpId: String;
  vpManterVinculo : Boolean = False;
  const vpIdSeloLivro: Integer = 0;
  const vpInutilizacaoJustificativa: string = '');
{$REGION 'Variáveis'}
var
  viCondicao: string;
  viSolicitarInutilizacaoJustificativa: Boolean;
  viParam: TFDParam;
{$ENDREGION}
begin
  if vpInutilizacaoJustificativa.IsEmpty then
  begin
    viSolicitarInutilizacaoJustificativa := SolicitarInutilizacaoJustificativa;
    if viSolicitarInutilizacaoJustificativa then
      raise Exception.Create(
        'É necessário informar uma justificativa para inutilizar o(s) ato(s).');
  end;

  if vpIdSeloLivro = 0 then
    viCondicao := ' WHERE CAMPO_ID IN (' + vpId + ') AND ' +
      'TABELA = ' + QuotedStr(vpTabela)
  else
    viCondicao := ' WHERE SELO_LIVRO_ID = ' + IntToStr(vpIdSeloLivro);

  // Cancela os Selos Vinculados;
  if (vpId <> '') or (vpIdSeloLivro > 0) then
  begin
    if not vpManterVinculo then
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 4, '+
                         '                         DESCRICAO = ' + QuotedStr('SERVIÇO CANCELADO - ') + '|| DESCRICAO, ' +
                         '                         DATA = :DATA, '+
                         '                         TABELA = '+ QuotedStr('')+', '+
                         '                         CAMPO_ID = null, '+
                         '                         TABELA_ITEM = '+ QuotedStr('')+', '+
                         '                         CAMPO_ITEM_ID = null, '+
                         '                         NUMERO_AGRUPADOR = null, '+
                         '                         USUARIO_ID = '+ vgUsuarioID + ', ' +
                         '                         INUTILIZACAO_JUSTIFICATIVA = :P_INUTILIZACAO_JUSTIFICATIVA ' +
                         {' WHERE CAMPO_ID IN ('+vpId+')'+
                         ' AND TABELA = '+QuotedStr(vpTabela),2)}
                         viCondicao, 2)
    else
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 4, '+
                         '                         DESCRICAO = ' + QuotedStr('SERVIÇO CANCELADO - ') + '|| DESCRICAO, ' +
                         '                         DATA = :DATA, '+
                         '                         USUARIO_ID = '+ vgUsuarioID + ', ' +
                         '                         INUTILIZACAO_JUSTIFICATIVA = :P_INUTILIZACAO_JUSTIFICATIVA ' +
                         {' WHERE CAMPO_ID IN ('+vpId+')'+
                         ' AND TABELA = '+QuotedStr(vpTabela),2);}
                         viCondicao, 2);

    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('DATA').AsString := dtmControles.DataHoraBanco(5);

      viParam := dtmControles.sqlAuxiliar.ParamByName(
        'P_INUTILIZACAO_JUSTIFICATIVA');

      if vpInutilizacaoJustificativa.IsEmpty then
      begin
        viParam.Bound := True;
        viParam.DataType := TFieldType.ftString;
        viParam.Clear;
      end
      else
        viParam.AsString := vpInutilizacaoJustificativa;

      ExecSQL;
    end;
  end;

  // *************
end;

procedure TfrmSeloSelecionado.CapturarSelo(
  vpTipoRetorno : Boolean = True;
  const vpOnQuantidadeModificada: TOnQuantidadeModificada = nil;
  const vpCodigoSeloPrenotacao: string = '');
var
  viSeloFormatado : string;
begin
  vgDadosSelo.Confirmado := False;

  if not SelecionarSelo(
    IntToStr(
      vgDadosSelo.SeloGrupoId),
    IntToStr(
      vgDadosSelo.Qtd),
    vpTipoRetorno,
    vpOnQuantidadeModificada,
    vpCodigoSeloPrenotacao) then
    Exit;

  dtmLookup.ClientTemp.EmptyDataSet;
  vgDadosSelo.SeloLivroId := '';

  if not dtmControles.SimpleAuxiliar.IsEmpty then
  begin
    if dtmControles.SimpleAuxiliar.RecordCount <> vgDadosSelo.Qtd then
    begin
      if vlExibirSelo and (not vgDadosSelo.DesativarExibicao) then
        lblSelo.Caption := 'Selos Disponiveis Insuficientes!!!';
      Application.MessageBox('A quantidade de selos disponíveis é insuficiente para registrar este ato!!!','Informação', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    dtmControles.SimpleAuxiliar.First;
    if vlExibirSelo and (not vgDadosSelo.DesativarExibicao) then
      lblSelo.Caption := '';

    while not dtmControles.SimpleAuxiliar.eof do
    begin
       viSeloFormatado := dtmControles.FormatarMascaraSelo(
         dtmControles.SimpleAuxiliar.FieldByName('SIGLA').AsString,
         dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger,
         dtmControles.SimpleAuxiliar.FieldByName('VALIDADOR').AsString);
      if vgDadosSelo.SeloLivroId = '' then
      begin
        if vlExibirSelo and (not vgDadosSelo.DesativarExibicao) then
          lblSelo.Caption         := viSeloFormatado;
        vgDadosSelo.SeloLivroId   := dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsString;
        vgDadosSelo.SeloAgrupador := viSeloFormatado;
      end
      else
      begin
        if vlExibirSelo and (not vgDadosSelo.DesativarExibicao) then
          lblSelo.Caption       := lblSelo.Caption + ', ' + viSeloFormatado;
        vgDadosSelo.SeloLivroId := vgDadosSelo.SeloLivroId + ', '+ dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsString;
      end;
      dtmLookup.ClientTemp.Insert;
      dtmLookup.ClientTempCHAVE_ID.AsInteger := dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsInteger;
      dtmLookup.ClientTempVALOR.AsString     := viSeloFormatado;
      dtmLookup.ClientTemp.Post;

      dtmControles.SimpleAuxiliar.next;
    end;
    vgDadosSelo.Confirmado := True;
  end
  else
  begin
    if vlExibirSelo and (not vgDadosSelo.DesativarExibicao) then
      lblSelo.Caption := 'Selo Inexistente!!!';
    Application.MessageBox('Não foi encontrado nenhum selo disponível!!!','Informação', MB_ICONINFORMATION + MB_OK);
    vgDadosSelo.SeloLivroId := '';
  end;
end;

function TfrmSeloSelecionado.CriarAtosRetornoTJ_GO(
  const vpSeloLivroList: IList<Integer>): TDataSet;
{$REGION 'Variáveis'}
var
  viResult: TI9MemTable;
  viField: TField;
  viQuery: TI9Query;
  viCondicaoWhere: IList<string>;
  viSeloLivroID: Integer;
  viSigla: string;
  viNumero: Integer;
  viValidador: string;
  viCodigoAto: string;
  viNumeroAgrupador: string;
  viNumeroAgrupadorList: IList<string>;
  viValorEmolumento: Currency;
  viValorTaxaJudiciaria: Currency;
  viValorFundos: Currency;
  viValorISSQN: Currency;
  viValorTotal: Currency;
  viOrdemSelo: Integer;
  viQuerySeloPai: TI9Query;
  viCondicaoWhereSeloPai: IList<string>;
  viValidado: string;
  viSeloPaiList: IList<Integer>;
  viSeloPai: TDataSet;
{$ENDREGION}
begin
  viResult := TI9MemTable.Create(
    nil);

  Result := viResult;

  {$REGION 'Criar campos'}
  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'SELO_LIVRO_ID';
  viField.DataSet := Result;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'NOTA_FISCAL';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'TIPO_ATO';
  viField.DataSet := Result;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'NUMERO_AGRUPADOR';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'CODIGO_ATO';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'APRESENTANTE';
  viField.DataSet := Result;
  viField.Size := 120;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'USUARIO';
  viField.DataSet := Result;
  viField.Size := 120;

  viField := TDateTimeField.Create(
    Result);

  viField.FieldName := 'DATA_SELO';
  viField.DataSet := Result;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'IP_MAQUINA';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_TOTAL';
  viField.DataSet := Result;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_EMOLUMENTO';
  viField.DataSet := Result;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_TAXA_JUDICIARIA';
  viField.DataSet := Result;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_FUNDOS';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'CODIGO_GRATUITO';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'PROTOCOLO';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'SISTEMA_ID';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'ORDEM_SELO';
  viField.DataSet := Result;
  {$ENDREGION}

  Result.Open;
  viNumeroAgrupadorList := TListFactory<string>.New.GetInstance;

  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;
    viCondicaoWhere := TListFactory<string>.New.GetInstance;

    for viSeloLivroID in vpSeloLivroList do
      viCondicaoWhere.Add(
        string.Format(
          '(G_SL.SELO_LIVRO_ID = %d)',
          [viSeloLivroID]));

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_SL.SELO_LIVRO_ID, ' +
      'G_SL.NUMERO_AGRUPADOR, ' +
      'G_SL.SIGLA, ' +
      'G_SL.NUMERO, ' +
      'G_SL.APRESENTANTE, ' +
      'G_SL.DATA AS DATA_SELO, ' +
      'G_SL.IP_MAQUINA, ' +
      'G_SL.VALOR_EMOLUMENTO, ' +
      'G_SL.VALOR_TAXA_JUDICIARIA, ' +
      'G_SL.VALOR_FUNDESP AS VALOR_FUNDOS, ' +
      'G_SL.VALOR_ISSQN, ' +
      'G_SL.CODIGO_GRATUITO, ' +
      'G_SL.PROTOCOLO, ' +
      'G_SL.VALIDADOR, ' +
      'G_SL.VALIDADO, ' +
      'G_SLO.SELO_LOTE_ID, ' +
      'G_SLO.NOTA_FISCAL, ' +
      'G_SG.SELO_GRUPO_ID, ' +
      'G_SG.NUMERO AS TIPO_ATO, ' +
      'G_SG.SISTEMA_ID, ' +
      'G_U.USUARIO_ID, ' +
      'G_U.NOME_COMPLETO AS USUARIO ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_SELO_LIVRO G_SL ' +
      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_LOTE G_SLO ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SLO.SELO_LOTE_ID = G_SL.SELO_LOTE_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_GRUPO G_SG ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SG.SELO_GRUPO_ID = G_SLO.SELO_GRUPO_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_USUARIO G_U ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_U.USUARIO_ID = G_SL.USUARIO_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +

      string.Format(
        '(%s) ',
        [string.Join(
          ' OR ',
          viCondicaoWhere.ToArray)]) +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_SL.SELO_LIVRO_ID';
      {$ENDREGION}

    {$ENDREGION}

    viQuery.Open;
    try
      viQuery.First;

      while not viQuery.Eof do
        try
          viValidado := viQuery.FieldByName(
            'VALIDADO').AsString;

          if viValidado = 'S' then
            Continue;

          Result.Append;

          Result.CopyFields(
            viQuery);

          viSigla := viQuery.FieldByName(
            'SIGLA').AsString;

          viNumero := viQuery.FieldByName(
            'NUMERO').AsInteger;

          viValidador := viQuery.FieldByName(
            'VALIDADOR').AsString;

          viCodigoAto := dtmControles.FormatarMascaraSelo(
            viSigla,
            viNumero,
            viValidador);

          Result.FieldByName(
            'CODIGO_ATO').AsString := viCodigoAto;

          viNumeroAgrupador := Result.FieldByName(
            'NUMERO_AGRUPADOR').AsString;

          {
            0 = Selo Pai
            1 = Selo Filho
          }
          if viCodigoAto = viNumeroAgrupador then
            viOrdemSelo := 0
          else
          begin
            viOrdemSelo := 1;

            if not viNumeroAgrupadorList.Contains(
              viNumeroAgrupador) then
              viNumeroAgrupadorList.Add(
                viNumeroAgrupador);
          end;

          Result.FieldByName(
            'ORDEM_SELO').AsInteger := viOrdemSelo;

          viValorEmolumento := viQuery.FieldByName(
            'VALOR_EMOLUMENTO').AsCurrency;

          viValorTaxaJudiciaria := viQuery.FieldByName(
            'VALOR_TAXA_JUDICIARIA').AsCurrency;

          viValorFundos := viQuery.FieldByName(
            'VALOR_FUNDOS').AsCurrency;

          viValorISSQN := viQuery.FieldByName(
            'VALOR_ISSQN').AsCurrency;

          viValorTotal := viValorEmolumento +
            viValorTaxaJudiciaria +
            viValorFundos +
            viValorISSQN;

          Result.FieldByName(
            'VALOR_TOTAL').AsCurrency := viValorTotal;

          Result.Post;
        finally
          viQuery.Next;
        end;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;

  if viNumeroAgrupadorList.Any then
  begin
    viSeloPaiList := TListFactory<Integer>.New.GetInstance;

    viQuerySeloPai := TI9Query.Create(
      nil);

    try
      viQuerySeloPai.Connection := dtmControles.DB;
      viCondicaoWhereSeloPai := TListFactory<string>.New.GetInstance;

      for viNumeroAgrupador in viNumeroAgrupadorList do
        viCondicaoWhereSeloPai.Add(
          string.Format(
            '(G_SL.NUMERO_AGRUPADOR = %s)',
            [viNumeroAgrupador.QuotedString]));

      viQuerySeloPai.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'G_SL.SELO_LIVRO_ID, ' +
        'G_SL.SIGLA, ' +
        'G_SL.NUMERO, ' +
        'G_SL.VALIDADOR, ' +
        'G_SL.VALIDADO, ' +
        'G_SL.NUMERO_AGRUPADOR ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LIVRO G_SL ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +

        string.Format(
          '(%s) AND ' +
          '(NOT (%s)) ',
          [string.Join(
            ' OR ',
            viCondicaoWhereSeloPai.ToArray),
          string.Join(
            ' OR ',
            viCondicaoWhere.ToArray)]) +
        {$ENDREGION}

        {$REGION 'Cláusula ORDER BY'}
        'ORDER BY ' +
        'G_SL.SELO_LIVRO_ID';
        {$ENDREGION}

      {$ENDREGION}

      viQuerySeloPai.Open;
      try
        viQuerySeloPai.First;

        while not viQuerySeloPai.Eof do
          try
            viValidado := viQuerySeloPai.FieldByName(
              'VALIDADO').AsString;

            if viValidado = 'S' then
              Continue;

            viSigla := viQuerySeloPai.FieldByName(
              'SIGLA').AsString;

            viNumero := viQuerySeloPai.FieldByName(
              'NUMERO').AsInteger;

            viValidador := viQuerySeloPai.FieldByName(
              'VALIDADOR').AsString;

            viCodigoAto := dtmControles.FormatarMascaraSelo(
              viSigla,
              viNumero,
              viValidador);

            viNumeroAgrupador := viQuerySeloPai.FieldByName(
              'NUMERO_AGRUPADOR').AsString;

            if viCodigoAto <> viNumeroAgrupador then
              Continue;

            viSeloLivroID := viQuerySeloPai.FieldByName(
              'SELO_LIVRO_ID').AsInteger;

            viSeloPaiList.Add(
              viSeloLivroID);
          finally
            viQuerySeloPai.Next;
          end;
      finally
        viQuerySeloPai.Close;
      end;
    finally
      viQuerySeloPai.Free;
    end;

    if viSeloPaiList.Any then
    begin
      viSeloPai := CriarAtosRetornoTJ_GO(
        viSeloPaiList);

      try
        viResult.CopyDataSet(
          viSeloPai);
      finally
        viSeloPai.Close;
        viSeloPai.Free;
      end;
    end;
  end;

  viResult.IndexFieldNames := 'ORDEM_SELO;SELO_LIVRO_ID';
  Result.First;
end;

procedure TfrmSeloSelecionado.cxButton1Click(Sender: TObject);
begin
  vgDadosSelo.Confirmado := False;
  Close;
end;

procedure TfrmSeloSelecionado.FormActivate(Sender: TObject);
begin
  btnConfirmar.SetFocus;
  CapturarSelo;
  btnConfirmar.Enabled := vgDadosSelo.SeloLivroId <> '';
  btnPesquisar.Enabled := vgDadosSelo.SeloLivroId <> '';
end;

procedure TfrmSeloSelecionado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action             := caFree;
  frmSeloSelecionado := nil;
end;

procedure TfrmSeloSelecionado.GravarDadosSelo(
  vpSeloLivroId,
  vpTabela,
  vpCampoId,
  vpDescricao: string;
  vpAgrupadorIgual: Boolean;
  vpData: string = '';
  vpIdSeloArmazena: Integer = 0;
  const vpSeloFundos: TSeloFundos = nil;
  vpTabelaItem: string = '';
  vpCampoItemId: string = '';
  const vpRetornarAtosTJ: Boolean = False);
{$REGION 'Variáveis'}
var
  i: Integer;
  viSeloGravar: string;
  viSeloLivroList: IList<Integer>;
  viUF: string;
  viHabilitarNovoWebService: Boolean;
  viHabilitarPedidoAutomatico: Boolean;
  viSelosTJ_GO_Business: ISelosTJ_GO_Business;
  viAtosRetornoTJ_GO: TDataSet;
  viDataExportacao: TDateTime;
  viCodigoExportacao: Integer;
  viSeloRetornoAtoID: Integer;
  viHabilitarContingenciamento: Boolean;
  viInTransaction: Boolean;
{$ENDREGION}

  procedure GravaDados;
  var
    viSeloFundoDAO: TSeloFundoDAO;
    viSeloFundo: TSeloFundo;
    viSeloLivroArray: TArray<string>;
    viSeloLivroID: string;
    viValorFundosDeducao: Currency;
  begin
    if vgDadosSelo.CodigoGratuito = '' then
      vgDadosSelo.CodigoGratuito := '0';

    if vgDadosSelo.Protocolo = '' then
      vgDadosSelo.Protocolo := '0';

    ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 2, '+
                       '                         DATA = :DATA, '+
                       '                         DESCRICAO = '+QuotedStr(vpDescricao)+','+
                       '                         TABELA = '+QuotedStr(vpTabela)+','+
                       '                         CAMPO_ID = '+vpCampoId+','+
                       '                         USUARIO_ID = :USUARIO_ID, '+
                       '                         USUARIO_ATO_ID = :USUARIO_ATO_ID, '+
                       '                         APRESENTANTE = '+ RetNull(QuotedStr(vgDadosSelo.Apresentante))+', '+
                       '                         IP_MAQUINA = '+ QuotedStr(RetornaIP)+', '+
                       '                         NUMERO_AGRUPADOR = :NUMERO_AGRUPADOR, '+
                       '                         CODIGO_GRATUITO = '+ RetNullInteger(StrToInt(vgDadosSelo.CodigoGratuito))+', '+
                       '                         PROTOCOLO = '+ RetNullInteger(StrToInt(vgDadosSelo.Protocolo))+', '+
                       '                         CODIGO_BUSCA1 = '+ RetNull(vgDadosSelo.SeloCodigoBusca1)+', '+
                       '                         CODIGO_BUSCA2 = '+ RetNull(vgDadosSelo.SeloCodigoBusca2)+', '+
                       '                         TABELA_ITEM = ' + RetNull(QuotedStr(vpTabelaItem)) + ', ' +
                       '                         CAMPO_ITEM_ID = ' + RetNull(vpCampoItemId) + ', ' +
                       '                         VALOR_TOTAL = :VALOR_TOTAL, '+
                       '                         VALOR_EMOLUMENTO = :VALOR_EMOLUMENTO, '+
                       '                         VALOR_TAXA_JUDICIARIA = :VALOR_TAXA_JUDICIARIA, '+
                       '                         VALOR_FUNDESP = :VALOR_FUNDESP, '+
                       '                         VALOR_ISSQN = :VALOR_ISSQN, '+
                       '                         VALOR_FUNDOS_DEDUCAO = :VALOR_FUNDOS_DEDUCAO ' +
                       ' WHERE SELO_LIVRO_ID IN ('+vpSeloLivroId+')',2);
    with dtmControles.sqlAuxiliar do
    begin
      if vpData = '' then
           ParamByName('DATA').AsString := dtmControles.DataHoraBanco(5)
      else ParamByName('DATA').AsString := FormatDateTime('YYYY/MM/DD',StrToDate(vpData));

      if (vpAgrupadorIgual) AND (pos(',',vpSeloLivroId) = 0) then
      begin
        dtmLookup.ClientTemp.Locate('CHAVE_ID', StrToInt(vpSeloLivroId), [loCaseInsensitive]);
        ParamByName('NUMERO_AGRUPADOR').AsString := dtmLookup.ClientTempVALOR.AsString;
      end
      else ParamByName('NUMERO_AGRUPADOR').AsString   := vgDadosSelo.SeloAgrupador;

      ParamByName('VALOR_TOTAL').AsCurrency           := vgDadosSelo.ValorTotal;
      ParamByName('VALOR_EMOLUMENTO').AsCurrency      := vgDadosSelo.ValorEmolumento;
      ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency := vgDadosSelo.ValorTaxaJud;
      ParamByName('VALOR_FUNDESP').AsCurrency         := vgDadosSelo.ValorFundesp;
      ParamByName('VALOR_ISSQN').AsCurrency           := vgDadosSelo.ValorISS;

      if vgDadosSelo.Serventuario = '' then
           ParamByName('USUARIO_ID').AsString := vgUsuarioID
      else ParamByName('USUARIO_ID').AsString := vgDadosSelo.Serventuario;

      ParamByName('USUARIO_ATO_ID').AsString := vgUsuarioID;

      viValorFundosDeducao := 0;
      if Assigned(vpSeloFundos) then
        viValorFundosDeducao := vpSeloFundos.ValorDeducao;

      ParamByName('VALOR_FUNDOS_DEDUCAO').AsCurrency := viValorFundosDeducao;
      ExecSQL;
    end;

    if Assigned(vpSeloFundos) then
    begin
      viSeloFundoDAO := TSeloFundoDAO.Create;

      try
        viSeloFundoDAO.Excluir(vpSeloLivroID.ToInteger);

        for viSeloFundo in vpSeloFundos do
        begin
          viSeloFundo.SeloLivroID := vpSeloLivroID.ToInteger;
          viSeloFundoDAO.Inserir(viSeloFundo);
        end;
      finally
        viSeloFundoDAO.Free;
      end;
    end;

    if vpRetornarAtosTJ then
    begin
      viSeloLivroArray := vpSeloLivroID.Split(
        [',']);

      for viSeloLivroID in viSeloLivroArray do
        viSeloLivroList.Add(
          viSeloLivroID.Trim.ToInteger);
    end;
  end;

begin
  viInTransaction := dtmControles.DB.InTransaction;
  if not viInTransaction then
    dtmControles.DB.StartTransaction;

  try
    Screen.Cursor := crHourGlass;
    i := 0;
    viSeloGravar := vpSeloLivroId;
    viSeloLivroList := TListFactory<Integer>.New.GetInstance;

    repeat
      if vpSeloLivroId = '' then
      begin
        inc(i);
        vpSeloLivroId := vgDadosSelo.SeloSeq[vpIdSeloArmazena, i];
        if vpSeloLivroId <> '' then
        begin
          GravaDados;
          vpSeloLivroId := '';
        end
        else i := 0;
      end
      else
      begin
        i := 1;
        vpSeloLivroId := copy(viSeloGravar,1, pos(',', viSeloGravar)-1);
        if vpSeloLivroId = '' then
             vpSeloLivroId := viSeloGravar
        else delete(viSeloGravar,1,pos(',', viSeloGravar));
        GravaDados;

        if vpSeloLivroId = viSeloGravar then
          i := 0;
      end;
    until i = 0;
    Screen.Cursor := crDefault;

    if vpRetornarAtosTJ then
    begin
      if viSeloLivroList.IsEmpty then
        raise Exception.Create(
          'Nenhum selo para retornar pro TJ.');

      viUF := dtmControles.BuscarParametroOutroSistema(
        'UF',
        'CARTORIO',
        'PRINCIPAL',
        '5');

      if not SameText(
        viUF,
        'GO') then
        raise Exception.CreateFmt(
          'Rotina de retorno de atos na selagem pro TJ-%s não implementada.',
          [viUF]);

      viHabilitarNovoWebService := dtmControles.BuscarParametroOutroSistema(
        'HABILITAR_NOVO_WEB_SERVICE',
        'GOIAS',
        'SELO',
        '5') = 'S';

      if not viHabilitarNovoWebService then
        raise Exception.CreateFmt(
          'Rotina de retorno de atos na selagem pro TJ-%s disponível apenas ' +
          'no novo WebService.',
          [viUF]);

      viHabilitarPedidoAutomatico := dtmControles.BuscarParametroOutroSistema(
        'HABILITAR_PEDIDO_AUTOMATICO',
        'GOIAS',
        'SELO',
        '5') = 'S';

      if not viHabilitarPedidoAutomatico then
        raise Exception.CreateFmt(
          'Rotina de retorno de atos na selagem pro TJ-%s disponível apenas ' +
          'com o pedido automático habilitado.',
          [viUF]);

      viHabilitarContingenciamento := dtmControles.BuscarParametroOutroSistema(
        'HABILITAR_CONTINGENCIAMENTO',
        'GOIAS',
        'SELO',
        '5') = 'S';

      if not viHabilitarContingenciamento then
        raise Exception.CreateFmt(
          'Rotina de retorno de atos na selagem pro TJ-%s disponível apenas ' +
          'com o contingenciamento habilitado.',
          [viUF]);

      viSelosTJ_GO_Business := TSelosTJ_GO_BusinessFactory.New.GetInstance;

      viAtosRetornoTJ_GO := CriarAtosRetornoTJ_GO(
        viSeloLivroList);

      try
        viSeloLivroList := SeloLivroList(
          viAtosRetornoTJ_GO);

        viDataExportacao := dtmControles.DataHoraBanco(
          3,
          False);

        viCodigoExportacao := dtmControles.GerarSequencia(
          'SELO_CODIGO_EXPORTACAO');

        AlterarExportacao(
          viSeloLivroList,
          viDataExportacao,
          viCodigoExportacao);

        // A = Automático
        viSeloRetornoAtoID := viSelosTJ_GO_Business.RetornarAtos(
          viAtosRetornoTJ_GO,
          'A',
          Controles.vgUsuarioID.ToInteger);

        VerificarSeloRetornoAtoTJ_GO(
          viSeloRetornoAtoID);

        {
          Nesse ponto os selos foram retornados pro TJ-GO portanto,
          é necessário persistir as informações deles no banco pois,
          se for lançada uma exceção futuramente e todo o processo for
          desfeito, os selos também serão desfeitos sendo que
          eles já se encontram no TJ-GO.

          Obs.: o início de uma nova transação se deve pelo fato de
          que quem chamou esse método pode ter iniciado uma transação.
          Logo, deve-se retomar o estado anterior.
        }
        dtmControles.DB.Commit;
        if viInTransaction then
          dtmControles.DB.StartTransaction;
      finally
        viAtosRetornoTJ_GO.Close;
        viAtosRetornoTJ_GO.Free;
      end;
    end;

    if not viInTransaction and
      dtmControles.DB.InTransaction then
      dtmControles.DB.Commit;
  except
    if not viInTransaction and
      dtmControles.DB.InTransaction then
      dtmControles.DB.Rollback;

    raise;
  end;
end;

function TfrmSeloSelecionado.InutilizacaoJustificativa: string;
{$REGION 'Variáveis'}
var
  B: Boolean;
  viJustificativaValida: Boolean;
  viQuantidadePalavras: Integer;
{$ENDREGION}
begin
  Result := string.Empty;

  while True do
  begin
    B := InputQuery(
      'Inutilização Ato',
      'Justificativa:',
      Result);

    if not B then
      raise Exception.Create(
        'Por favor, informe a justificativa da inutilização.');

    Result := Result.Trim;
    viQuantidadePalavras := 0;

    if not Result.IsEmpty then
      viQuantidadePalavras := Length(
        Result.Split(
          [Space]));

    viJustificativaValida := not Result.IsEmpty and
      (Result.Length >= 10) and
      (viQuantidadePalavras >= 2);

    if viJustificativaValida then
      Exit;

    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe uma justificativa de inutilização válida.');
  end;
end;

function TfrmSeloSelecionado.LiberarSeloVinculado(
  vpTabela: string;
  vpId: string;
  vpIdSeloLivro: Integer = 0;
  vpCancelar: Boolean = True;
  vpManterVinculo: Boolean = False;
  const vpAutorizarEstornoSeloExportado: Boolean = True;
  const vpEstornoSeloExportadoAutorizado: TAction = nil;
  const vpInutilizacaoJustificativa: TInutilizacaoJustificativa = nil): Boolean;
{$REGION 'Constantes'}
const
  CI_MSG_SELO_EXPORTADO: string = 'O(s) selo(s) informado(s) está(ão) exportado(s).';
{$ENDREGION}

  procedure Liberar;
  var
    viSql, viCondicao : String;

    {$REGION 'AtualizarSelos'}
    procedure AtualizarSelos(vpSituacao, vpCondAdicional : string);
    begin
      viSql := ' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = '+vpSituacao+', '+
                 '                         DATA = DATA_RESERVA, '+
                 '                         DESCRICAO = null, '+
                 '                         TABELA = null, '+
                 '                         CAMPO_ID = null, '+
                 '                         TABELA_ITEM = null, '+
                 '                         CAMPO_ITEM_ID = null, '+
                 '                         NUMERO_AGRUPADOR = null ';
      if vpSituacao = '1' then
           viSql := viSql + ', USUARIO_ID = null '
      else viSql := viSql + ', USUARIO_ID = USUARIO_ATO_ID';

      viSql := viSql + viCondicao + vpCondAdicional;
      ExecutaSqlAuxiliar(viSql,1);
    end;
    {$ENDREGION}

  begin
    viCondicao := '';
    if vpIdSeloLivro = 0 then
    begin
      if vpId <> '' then
        viCondicao :=  ' WHERE CAMPO_ID IN ('+vpId+')'+
                       ' AND TABELA = '+QuotedStr(vpTabela)
    end
    else viCondicao := ' WHERE SELO_LIVRO_ID = '+ IntToStr(vpIdSeloLivro);

    if viCondicao = '' then
      exit;

    AtualizarSelos('1', ' AND DATA_RESERVA IS NULL ');
    AtualizarSelos('6', ' AND NOT DATA_RESERVA IS NULL ');
  end;

{$REGION 'Variáveis'}
var
  viInutilizacaoJustificativa: string;
  viSolicitarInutilizacaoJustificativa: Boolean;
{$ENDREGION}
begin
  Result := True;
  if vpIdSeloLivro > 0 then
  begin
    // Verifica se o Selo já foi exportado. Caso Sim cancela o mesmo, caso Não, Libera;
    if VerificarSeloExportado(EmptyStr, EmptyStr, vpIdSeloLivro) then
    begin
      if vpAutorizarEstornoSeloExportado then
      begin
        TMensagemUtils.ExibirMensagemAtencao(
          CI_MSG_SELO_EXPORTADO);

        if LiberarPermissaoUsuario(
          'ESP_ESTORNO_SELO_EXPORTADO',
          6,
          20)[6] <> '1' then
        begin
          Result := False;

          raise Exception.Create(
            CI_MSG_SELO_EXPORTADO);
        end;

        if Assigned(vpEstornoSeloExportadoAutorizado) then
          vpEstornoSeloExportadoAutorizado;
      end;

      if vpCancelar then
      begin
        viInutilizacaoJustificativa := string.Empty;
        viSolicitarInutilizacaoJustificativa := SolicitarInutilizacaoJustificativa;

        if viSolicitarInutilizacaoJustificativa then
          if Assigned(vpInutilizacaoJustificativa) then
            viInutilizacaoJustificativa := vpInutilizacaoJustificativa
          else
            viInutilizacaoJustificativa := InutilizacaoJustificativa;

        CancelarSeloVinculado(
          EmptyStr,
          EmptyStr,
          vpManterVinculo,
          vpIdSeloLivro,
          viInutilizacaoJustificativa);
      end
      else
        Result := False;
    end
    else
      Liberar;
  end
  else
  begin
    // Verifica se os Selos ja foram exportados. Caso Sim cancela os mesmo, caso não, Libera;
    if not frmSeloSelecionado.VerificarSeloExportado(vpTabela,vpId) then
      Liberar
    else
    begin
      if vpAutorizarEstornoSeloExportado then
      begin
        TMensagemUtils.ExibirMensagemAtencao(
          CI_MSG_SELO_EXPORTADO);

        if LiberarPermissaoUsuario(
          'ESP_ESTORNO_SELO_EXPORTADO',
          6,
          20)[6] <> '1' then
        begin
          Result := False;

          raise Exception.Create(
            CI_MSG_SELO_EXPORTADO);
        end;

        if Assigned(vpEstornoSeloExportadoAutorizado) then
          vpEstornoSeloExportadoAutorizado;
      end;

      if vpCancelar then
      begin
        viInutilizacaoJustificativa := string.Empty;
        viSolicitarInutilizacaoJustificativa := SolicitarInutilizacaoJustificativa;

        if viSolicitarInutilizacaoJustificativa then
          if Assigned(vpInutilizacaoJustificativa) then
            viInutilizacaoJustificativa := vpInutilizacaoJustificativa
          else
            viInutilizacaoJustificativa := InutilizacaoJustificativa;

        CancelarSeloVinculado(
          vpTabela,
          vpId,
          vpManterVinculo,
          0,
          viInutilizacaoJustificativa);
      end
      else
        Result := False;
    end;
  end;
end;

function TfrmSeloSelecionado.NovaFormaSelecionarSelo: Boolean;
begin
  // 5 = Caixa
  Result := string(
    dtmControles.BuscarParametroOutroSistema(
      'NOVA_FORMA_SELECIONAR_SELO',
      'GERAL',
      'SELO',
      '5'))
    .Equals(
      'S');
end;

function TfrmSeloSelecionado.PesquisarNumeroAgrupador(vpRegistroID, vpTabela : String):String;
begin
  if vpRegistroID <> '' then
    Result := dtmControles.GetStr(' SELECT DISTINCT(NUMERO_AGRUPADOR) FROM G_SELO_LIVRO '+
                                  ' WHERE CAMPO_ID = '+vpRegistroID +
                                  ' AND TABELA = '+ QuotedStr(vpTabela))
  else Result := '';
end;

function TfrmSeloSelecionado.PesquisarSelo(vpRegistroID, vpTabela, vpTextoAdicional : String;
         vpAgrupador : Boolean = True; vpTodos : Boolean = True; vpNumeroAgrupador : string = ''):String;
{$REGION 'Variáveis'}
var
  viSelo, viPesquisa : String;
  viSeloLivroList: TSeloLivroList;
  viSQL: string;
  viParams: TFDParams;
  viDataSet: TDataSet;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  if vpRegistroID.IsEmpty.&And(
    vpNumeroAgrupador.IsEmpty) then
  begin
    Result := string.Empty;
    Exit;
  end;

  viSelo := string.Empty;

  {if vpNumeroAgrupador <> '' then
  begin
    viPesquisa  := ' C_PESQUISA_SELOS_TODOS ';
    viSelo := dtmControles.GetStr('SELECT * FROM '+viPesquisa+'('+ QuotedStr(vpNumeroAgrupador)+')');
  end
  else
  begin
    if vpAgrupador then
         viPesquisa  := ' C_PESQUISA_SELO_AGRUPADOR '
    else viPesquisa  := ' C_PESQUISA_SELOS ';

    viSelo := dtmControles.GetStr('SELECT * FROM '+viPesquisa+'('+ QuotedStr(vpTabela) +','+
                                  vpRegistroID+')');
  end;}

  if vpNumeroAgrupador.IsEmpty.&And(
    vpAgrupador) then
  begin
    viPesquisa := ' C_PESQUISA_SELO_AGRUPADOR ';

    viSelo := dtmControles.GetStr('SELECT * FROM ' + viPesquisa + '(' +
      vpTabela.QuotedString + ',' + vpRegistroID + ')');
  end
  else
  begin
    viSeloLivroList := TSeloLivroList.Create;
    try
      viSQL := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'SIGLA, ' +
        'NUMERO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LIVRO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +

        IfThen(
          vpNumeroAgrupador.IsEmpty,
          'TABELA = :P_TABELA AND CAMPO_ID = :P_CAMPO_ID',
          'NUMERO_AGRUPADOR = :P_NUMERO_AGRUPADOR');
        {$ENDREGION}

      {$ENDREGION}

      viParams := TFDParams.Create;
      try
        if vpNumeroAgrupador.IsEmpty then
        begin
          viParams.CreateParam(
            TFieldType.ftString,
            'P_TABELA',
            TParamType.ptInput).AsString := vpTabela;

          viParams.CreateParam(
            TFieldType.ftInteger,
            'P_CAMPO_ID',
            TParamType.ptInput).AsInteger := vpRegistroID.ToInteger;
        end
        else
          viParams.CreateParam(
            TFieldType.ftString,
            'P_NUMERO_AGRUPADOR',
            TParamType.ptInput).AsString := vpNumeroAgrupador;

        dtmControles.DB.Execute(viSQL, viParams, viDataSet);

        try
          try
            if viDataSet.IsEmpty.&Not then
            begin
              viDataSet.First;
              while viDataSet.Eof.&Not do
                try
                  viSeloLivro := TSeloLivro.New;
                  viSeloLivro.Sigla := viDataSet.FieldByName('SIGLA').AsString;

                  viSeloLivro.Numero := viDataSet.FieldByName(
                    'NUMERO').AsInteger;

                  viSeloLivroList.Add(viSeloLivro);
                finally
                  viDataSet.Next;
                end;
            end;
          finally
            viDataSet.Close;
          end;
        finally
          FreeAndNil(viDataSet);
        end;
      finally
        FreeAndNil(viParams);
      end;

      if CompareValue(viSeloLivroList.Count, ZeroValue) = GreaterThanValue then
        viSelo := TFormatadorMascaraSeloSimpleFactory.Get(
          dtmControles.BuscarConfig(
            'PRINCIPAL',
            'CARTORIO',
            IfThen(CompareValue(vgId, 13) = EqualsValue, 'SIGLA_ESTADO', 'UF'),
            'S')).FormatarMascaraSelos(
              viSeloLivroList);
    finally
      FreeAndNil(viSeloLivroList);
    end;
  end;

  if viSelo.IsEmpty.&Not then
  begin
    if not vpTodos then
    begin
      if Pos(',', viSelo) > 0 then      
        viSelo := Copy(viSelo,1, Pos(',', viSelo)-1)+' (...)';
    end;

    if vpTextoAdicional <> '' then
         Result := vpTextoAdicional + viSelo
    else Result := viSelo;
  end
  else
    Result := string.Empty;
end;

function TfrmSeloSelecionado.RegistrarSelo(const vpGrupoId, vpUsuarioId, vpQtde: Integer; const vpCodigoSeloPrenotacao: string): string;
var
  viSql: string;
  viQuery: TI9Query;
  viLista: TStringList;
begin
  Result := EmptyStr;

  viSql := ' SELECT FIRST(' + vpQtde.ToString + ') SL.SELO_LIVRO_ID '+
           ' FROM G_SELO_LIVRO SL '+
           ' INNER JOIN G_SELO_LOTE ST ON '+
           ' SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
           ' AND ST.SITUACAO = ''I'' '+
           ' INNER JOIN G_SELO_GRUPO SG ON '+
           ' ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
           '  AND SG.SELO_GRUPO_ID = ' + vpGrupoId.ToString;

  if (vpUsuarioId <> 0) then
  begin
    if (vpUsuarioId < 0) then
      viSql := viSql + ' WHERE SL.SELO_SITUACAO_ID = 5 '
    else
      viSql := viSql + ' WHERE SL.SELO_SITUACAO_ID = 6 '+
                      ' AND SL.USUARIO_ID = ' + vpUsuarioId.ToString;
  end
  else
    viSql := viSql + ' WHERE SL.SELO_SITUACAO_ID = 1 ';

  viSql := viSql + ' AND COALESCE(ST.CODIGO_SELO_PRENOTACAO, '''') = ' + vpCodigoSeloPrenotacao.QuotedString;

  viSql := viSql + ' ORDER BY ST.SIGLA, SL.NUMERO ';

  viQuery := TI9Query.Create(
    nil);

  viLista := TStringList.Create;
  try
    viQuery.Connection := dtmControles.DB;
    viQuery.SQL.Text := viSql;

    viQuery.Open;
    if viQuery.IsEmpty then
      Exit;

    viQuery.First;
    while not viQuery.Eof do
    begin
      viLista.Add(viQuery.FieldByName('SELO_LIVRO_ID').AsString);
      viQuery.Next;
    end;

    Result := string.Join(
      ', ',
      viLista.ToStringArray);
  finally
    viQuery.Close;
    viQuery.Free;

    viLista.Free;
  end;
end;

function TfrmSeloSelecionado.SegundosEsperarPedidoAtoTJ_GO(
  const vpSeloGrupoID: Integer): Integer;
{$REGION 'Constantes'}
const
  CI_SEGUNDOS_CARENCIA: Integer = 10;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viUltimaDataLote: TDateTime;
  viDataAtual: TDateTime;
  viIntervaloSegundos: Integer;
  viField: TField;
{$ENDREGION}
begin
  Result := 0;

  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'MAX(G_SLO.DATA_LOTE) AS ULTIMA_DATA_LOTE ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_SELO_LOTE G_SLO ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SLO.SELO_GRUPO_ID = :P_SELO_GRUPO_ID';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_SELO_GRUPO_ID').AsInteger := vpSeloGrupoID;
    {$ENDREGION}

    viQuery.Open;
    try
      if viQuery.IsEmpty then
        Exit;

      viField := viQuery.FieldByName(
        'ULTIMA_DATA_LOTE');

      if viField.IsNull then
        Exit;

      viUltimaDataLote := viField.AsDateTime;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;

  viDataAtual := dtmControles.DataHoraBanco(
    3,
    False);

  viIntervaloSegundos := SecondsBetween(
    viDataAtual,
    viUltimaDataLote);

  Dec(
    viIntervaloSegundos,
    CI_SEGUNDOS_CARENCIA);

  if viIntervaloSegundos > SecsPerMin then
    Exit;

  Result := SecsPerMin - viIntervaloSegundos;
end;

function TfrmSeloSelecionado.SelecionarSelo(
  vpSeloGrupoId, vpQtd : string;
  vpTipoRetorno : Boolean = True;
  const vpOnQuantidadeModificada: TOnQuantidadeModificada = nil;
  const vpCodigoSeloPrenotacao: string = ''):Boolean;
{$REGION 'Variáveis'}
var
  viDivisor : String;
  viSelos, viUsuarioId : String;
  viTentar: Boolean;
  viUF: string;
  viHabilitarNovoWebService: Boolean;
  viHabilitarPedidoAutomatico: Boolean;
  viQuantidadeSelosDisponiveis: Integer;
  viSeloGrupo: TI9Query;
  viNumeroSeloGrupo: Integer;
  viSelosTJ_GO_Business: ISelosTJ_GO_Business;
  viTipoAtoTJ_GO: TDataSet;
  viDescricaoCompleta: string;
  viLimitePedidoTJ_GO: Integer;
  viSeloPedidoAtoID: Integer;
  viSeloPedidoAtoItem: TI9Query;
  viQuantidade: Integer;
  viSegundosEsperarPedidoAtoTJ_GO: Integer;
  viFormAtualizacao: TfrmAtualizacao;
  I: Integer;
  viSeloArray: TArray<string>;
  viSelo: string;
  viSeloLivroList: IList<Integer>;
  viSeloLivroID: Integer;
  viSeloLivroListRetornadosTJ_GO: IList<Integer>;
  viTransaction: TI9Transaction;
  viFormatSettings: TFormatSettings;
  viAguardarLiberacaoLote: Boolean;
  viHabilitarContingenciamento: Boolean;
{$ENDREGION}
begin
  viQuantidade := vpQtd.ToInteger;

  viUF := dtmControles.BuscarParametroOutroSistema(
    'UF',
    'CARTORIO',
    'PRINCIPAL',
    '5');

  viHabilitarNovoWebService := False;
  viHabilitarPedidoAutomatico := False;
  viHabilitarContingenciamento := False;

  if SameText(
    viUF,
    'GO') then
  begin
    viHabilitarNovoWebService := dtmControles.BuscarParametroOutroSistema(
      'HABILITAR_NOVO_WEB_SERVICE',
      'GOIAS',
      'SELO',
      '5') = 'S';

    if viHabilitarNovoWebService then
    begin
      viHabilitarPedidoAutomatico := dtmControles.BuscarParametroOutroSistema(
        'HABILITAR_PEDIDO_AUTOMATICO',
        'GOIAS',
        'SELO',
        '5') = 'S';

      if viHabilitarPedidoAutomatico then
        viHabilitarContingenciamento := dtmControles.BuscarParametroOutroSistema(
          'HABILITAR_CONTINGENCIAMENTO',
          'GOIAS',
          'SELO',
          '5') = 'S';
    end;
  end;

  repeat
    viTentar := False;
    Result := False;

    if vlExibirSelo and (not vgDadosSelo.DesativarExibicao) then
         viDivisor := '-'
    else viDivisor := '';

    try
      if vgDadosSelo.SeloUsuario then
      begin
        if vgDadosSelo.ReservaEspecial = 'S' then
             viUsuarioId := QuotedStr('-1')
        else viUsuarioId := vgUsuarioID;
      end
      else viUsuarioId := '0';
      vgDadosSelo.SeloUsuario     := False;
      vgDadosSelo.ReservaEspecial := '';

      if NovaFormaSelecionarSelo then
        viSelos := SelecionarSelos(
          vpSeloGrupoId.ToInteger,
          viQuantidade)
      else
        {viSelos := dtmControles.GetStr(
          'SELECT * FROM C_REGISTRA_SELO(' + vpSeloGrupoId + ', ' +
          viUsuarioId + ', ' + viQuantidade.ToString + ', ' +
          vpCodigoSeloPrenotacao.QuotedString + ')');}
        viSelos := RegistrarSelo(
          vpSeloGrupoId.ToInteger,
          viUsuarioId.ToInteger,
          viQuantidade,
          vpCodigoSeloPrenotacao);

      viQuantidadeSelosDisponiveis := 0;
      if not viSelos.IsEmpty then
      begin
        viSeloArray := viSelos.Split(
          [',']);

        viQuantidadeSelosDisponiveis := Length(
          viSeloArray);

        if SameText(
          viUF,
          'GO') and
          viHabilitarNovoWebService and
          viHabilitarPedidoAutomatico then
        begin
          viSeloLivroList := TListFactory<Integer>.New.GetInstance;
          viFormatSettings := TFormatSettings.Create;
          viFormatSettings.DecimalSeparator := '.';

          for viSelo in viSeloArray do
          begin
            viSeloLivroID := Trunc(
              StrToFloat(
                viSelo,
                viFormatSettings));

            viSeloLivroList.Add(
              viSeloLivroID);
          end;

          {
            Verificar selos retornados pro TJ-GO porém
            não vinculados à serviços (Perdidos)
          }
          viSeloLivroListRetornadosTJ_GO := SeloLivroListRetornadosTJ_GO(
            viSeloLivroList);

          if viSeloLivroListRetornadosTJ_GO.Any then
          begin
            viTransaction := TI9Transaction.Create(
              nil);

            try
              viTransaction.Connection := dtmControles.DB;
              viTransaction.StartTransaction;

              try
                {
                  7 = Perdido
                  S = Sim
                }
                AlterarSituacaoValidado(
                  viSeloLivroListRetornadosTJ_GO,
                  7,
                  'S',
                  viTransaction);

                viTransaction.Commit;
                viTentar := True;
                Continue;
              except
                viTransaction.Rollback;
                raise;
              end;
            finally
              viTransaction.Free;
            end;
          end;
        end;
      end;

      if (viQuantidadeSelosDisponiveis < viQuantidade) and
        SameText(
          viUF,
          'GO') and
        viHabilitarNovoWebService and
        viHabilitarPedidoAutomatico then
      begin
        viSeloGrupo := TI9Query.Create(
          nil);

        try
          viSeloGrupo.Connection := dtmControles.DB;

          viSeloGrupo.SQL.Text := {$REGION 'Comando SQL SELECT'}
            'SELECT ' +

            {$REGION 'Colunas'}
            'G_SG.NUMERO, ' +
            'G_SG.DESCRICAO_COMPLETA ' +
            {$ENDREGION}

            {$REGION 'Cláusula FROM'}
            'FROM ' +
            'G_SELO_GRUPO G_SG ' +
            {$ENDREGION}

            {$REGION 'Cláusula WHERE e Parâmetros'}
            'WHERE ' +
            'G_SG.SELO_GRUPO_ID = :P_SELO_GRUPO_ID';
            {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Preencher valores dos parâmetros'}
          viSeloGrupo.ParamByName(
            'P_SELO_GRUPO_ID').AsInteger := vpSeloGrupoId.ToInteger;
          {$ENDREGION}

          viSeloGrupo.Open;
          try
            viNumeroSeloGrupo := viSeloGrupo.FieldByName(
              'NUMERO').AsInteger;

            viDescricaoCompleta := viSeloGrupo.FieldByName(
              'DESCRICAO_COMPLETA').AsString;
          finally
            viSeloGrupo.Close;
          end;
        finally
          viSeloGrupo.Free;
        end;

        viSelosTJ_GO_Business := TSelosTJ_GO_BusinessFactory.New.GetInstance;

        viTipoAtoTJ_GO := viSelosTJ_GO_Business.BuscarTipoAto(
          viNumeroSeloGrupo);

        viLimitePedidoTJ_GO := 0;
        try
          if vpCodigoSeloPrenotacao.IsEmpty then
          begin
            if viTipoAtoTJ_GO.FieldByName(
              'limite_pedido').IsNull then
              raise Exception.CreateFmt(
                'Não será possível pedir %d ato(s) do selo %d - %s no TJ-GO ' +
                'pois, o limite do pedido não está definido.',
                [viQuantidade,
                viNumeroSeloGrupo,
                viDescricaoCompleta]);

            viLimitePedidoTJ_GO := viTipoAtoTJ_GO.FieldByName(
              'limite_pedido').AsInteger;
          end
          else
            viLimitePedidoTJ_GO := viQuantidade;
        finally
          viTipoAtoTJ_GO.Close;
          viTipoAtoTJ_GO.Free;
        end;

        if viQuantidade > viLimitePedidoTJ_GO then
        begin
          if not viHabilitarContingenciamento or
            not Assigned(
              vpOnQuantidadeModificada) then
            raise Exception.CreateFmt(
              'Não será possível pedir %d ato(s) do selo %d - %s no TJ-GO ' +
              'pois, a quantidade solicitada é maior do que o limite de ' +
              'pedido definido (%d).',
              [viQuantidade,
              viNumeroSeloGrupo,
              viDescricaoCompleta,
              viLimitePedidoTJ_GO]);

          viQuantidade := viLimitePedidoTJ_GO;
          vgDadosSelo.Qtd := viQuantidade;

          vpOnQuantidadeModificada(
            viQuantidade);
        end;

        viAguardarLiberacaoLote := dtmControles.BuscarParametroOutroSistema(
          'AGUARDAR_LIBERACAO_LOTE',
          'GOIAS',
          'SELO',
          '5') = 'S';

        if viAguardarLiberacaoLote then
        begin
          viSegundosEsperarPedidoAtoTJ_GO := SegundosEsperarPedidoAtoTJ_GO(
            vpSeloGrupoID.ToInteger);

          if viSegundosEsperarPedidoAtoTJ_GO > 0 then
          begin
            viFormAtualizacao := TfrmAtualizacao.Create(
              Application);

            try
              viFormAtualizacao.lblTexto.Caption := 'Aguardando liberação de ' +
                'lotes no TJ-GO...';

              viFormAtualizacao.HabilitarProgressBar;

              viFormAtualizacao.SetValorMaximoProgressBar(
                viSegundosEsperarPedidoAtoTJ_GO);

              viFormAtualizacao.Show;
              Application.ProcessMessages;

              try
                for I := 1 to viSegundosEsperarPedidoAtoTJ_GO do
                begin
                  Sleep(
                    MSecsPerSec);

                  viFormAtualizacao.AddProgressBar;
                  Application.ProcessMessages;
                end;
              finally
                viFormAtualizacao.DesabilitarProgressBar;
                viFormAtualizacao.Close;
              end;
            finally
              viFormAtualizacao.Free;
            end;
          end;
        end
        else
        begin
          Sleep(
            MSecsPerSec * 5);

          Application.ProcessMessages;
        end;

        if viHabilitarContingenciamento then
          VerificarRetornoAtosGrupoSeloTJ_GO(
            vpSeloGrupoID.ToInteger,
            viNumeroSeloGrupo);

        // A = Automático
        viSeloPedidoAtoID := viSelosTJ_GO_Business.PedirAto(
          vpSeloGrupoID.ToInteger,
          viNumeroSeloGrupo,
          IfThen(
            vpCodigoSeloPrenotacao.IsEmpty,
            viLimitePedidoTJ_GO,
            viQuantidade),
          'A',
          Controles.vgUsuarioID.ToInteger,
          viLimitePedidoTJ_GO,
          vpCodigoSeloPrenotacao);

        viSeloPedidoAtoItem := TI9Query.Create(
          nil);

        try
          viSeloPedidoAtoItem.Connection := dtmControles.DB;

          viSeloPedidoAtoItem.SQL.Text := {$REGION 'Comando SQL SELECT'}
            'SELECT ' +

            {$REGION 'Colunas'}
            'G_SPAI.SELO_PEDIDO_ATO_ITEM_ID, ' +
            'G_SPAI.STATUS, ' +
            'G_SPAI.ERRO ' +
            {$ENDREGION}

            {$REGION 'Cláusula FROM'}
            'FROM ' +
            'G_SELO_PEDIDO_ATO_ITEM G_SPAI ' +
            {$ENDREGION}

            {$REGION 'Cláusula WHERE e Parâmetros'}
            'WHERE ' +
            'G_SPAI.SELO_PEDIDO_ATO_ID = :P_SELO_PEDIDO_ATO_ID AND ' +
            'G_SPAI.SELO_GRUPO_ID = :P_SELO_GRUPO_ID';
            {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Preencher valores dos parâmetros'}
          viSeloPedidoAtoItem.ParamByName(
            'P_SELO_PEDIDO_ATO_ID').AsInteger := viSeloPedidoAtoID;

          viSeloPedidoAtoItem.ParamByName(
            'P_SELO_GRUPO_ID').AsInteger := vpSeloGrupoId.ToInteger;
          {$ENDREGION}

          viSeloPedidoAtoItem.Open;
          try
            // 0 = Sucesso
            viTentar := viSeloPedidoAtoItem.FieldByName(
              'STATUS').AsInteger = 0;

            if viTentar then
              Continue;

            raise Exception.CreateFmt(
              'Não foi possível pedir %d ato(s) do selo %d - %s no TJ-GO ' +
              'devido ao motivo abaixo:%s%s',
              [viLimitePedidoTJ_GO,
              viNumeroSeloGrupo,
              viDescricaoCompleta,
              DupeString(
                sLineBreak,
                2),
              viSeloPedidoAtoItem.FieldByName(
                'ERRO').AsString]);
          finally
            viSeloPedidoAtoItem.Close;
          end;
        finally
          viSeloPedidoAtoItem.Free;
        end;
      end;

      if viSelos <> '' then
      begin
        if vgDadosSelo.Transacao then
          dtmControles.StartTransaction;

          ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 1 '+
                             ' WHERE SELO_LIVRO_ID IN ('+viSelos+')',1);

          ExecutaSimpleDSAux(' SELECT FIRST ' + viQuantidade.ToString + '  MIN(SL.SELO_LIVRO_ID), SL.NUMERO, SL.SIGLA, '+
                             ' (SL.SIGLA || '+QuotedStr(viDivisor)+'  || CAST(SL.NUMERO AS INTEGER)) AS NUMEROSIGLA, '+
                             ' ST.SELO_GRUPO_ID, SL.SELO_LIVRO_ID, SL.VALIDADOR '+
                             ' FROM G_SELO_LIVRO SL LEFT OUTER JOIN G_SELO_LOTE ST ON '+
                             '   SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
                             '   LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
                             '   ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
                             ' WHERE SL.SELO_LIVRO_ID IN ('+viSelos+')'+
                             ' GROUP BY SL.NUMERO, SL.SIGLA, ST.SELO_GRUPO_ID, SL.SELO_LIVRO_ID, SL.VALIDADOR'+
                             ' FOR UPDATE',0);
        if vgDadosSelo.Transacao then
          dtmControles.Commit;
        Result := True;
      end
      else
      begin
        Application.MessageBox('A quantidade de selos disponíveis é insuficiente para registrar este ato!!!','Informação', MB_ICONINFORMATION + MB_OK);
        Result := False;
      end;
    except
      on E: Exception do
      begin
        if vgDadosSelo.Transacao then
          dtmControles.Rollback;

        //Application.MessageBox('Problemas ao Selecionar o(s) Selos(s). Tente Novamente!!!','Error!!!', MB_ICONINFORMATION + MB_OK);

        TMensagemUtils.ExibirMensagemErro(
          string.Format(
            'Não foi possível selecionar o(s) selo(s) devido ao motivo ' +
            'abaixo:%s%s',
            [DupeString(
              sLineBreak,
              2),
            E.Message]));

        if vpTipoRetorno then
          Abort
        else
        begin
          Result := False;
          Exit;
        end;
      end;
    end;
  until not viTentar;
end;

function TfrmSeloSelecionado.SelecionarSelos(
  const vpSeloGrupoID: Integer;
  const vpQuantidade: Integer): string;
{$REGION 'Variáveis'}
var
  viStrings: TStrings;
{$ENDREGION}
begin
  viStrings := TStringList.Create;
  try
    TDataSetAPI<TI9Query>.New(
      TI9Query.Create(
        nil))
    .AutoClose
    .AutoDestroy
    .ExecuteAction(
      procedure(
        const vpFDQuery: TI9Query)
      begin
        vpFDQuery.Connection := dtmControles.DB;

        vpFDQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
          'SELECT ' +

          {$REGION 'Colunas'}
          'FIRST ' + vpQuantidade.ToString + ' ' +
          'G_SL.SELO_LIVRO_ID ' +
          {$ENDREGION}

          {$REGION 'Cláusula FROM'}
          'FROM ' +
          'G_SELO_LIVRO G_SL ' +
          {$ENDREGION}

          {$REGION 'Cláusula INNER JOIN'}
          'INNER JOIN ' +
          'G_SELO_LOTE G_SLO ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'G_SLO.SELO_LOTE_ID = G_SL.SELO_LOTE_ID ' +
          {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Cláusula INNER JOIN'}
          'INNER JOIN ' +
          'G_SELO_GRUPO G_SG ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'G_SG.SELO_GRUPO_ID = G_SLO.SELO_GRUPO_ID ' +
          {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Cláusula WHERE e Parâmetros'}
          'WHERE ' +
          'G_SL.SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID AND ' +
          'G_SLO.SITUACAO = :P_SITUACAO AND ' +
          'G_SG.SELO_GRUPO_ID = :P_SELO_GRUPO_ID ' +
          {$ENDREGION}

          {$REGION 'Cláusula ORDER BY'}
          'ORDER BY ' +
          'G_SL.SIGLA, ' +
          'G_SL.NUMERO';
          {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Preencher valores dos parâmetros'}
        // 1 = Aguardando
        vpFDQuery.ParamByName(
          'P_SELO_SITUACAO_ID').AsInteger := 1;

        // I = Ativo
        vpFDQuery.ParamByName(
          'P_SITUACAO').AsString := 'I';

        vpFDQuery.ParamByName(
          'P_SELO_GRUPO_ID').AsInteger := vpSeloGrupoID;
        {$ENDREGION}
      end)
    .Open
    .ForEach(
      procedure(
        const vpFDQuery: TI9Query)
      begin
        viStrings.Add(
          vpFDQuery.FieldByName(
            'SELO_LIVRO_ID').AsString);
      end);

    if CompareValue(
      viStrings.Count,
      ZeroValue) = EqualsValue then
      Exit(
        string.Empty);

    Result := string.Join(
      ', ',
      viStrings.ToStringArray);
  finally
    FreeAndNil(viStrings);
  end;
end;

function TfrmSeloSelecionado.SeloLivroList(
  const vpDados: TDataSet): IList<Integer>;
{$REGION 'Variáveis'}
var
  viBookmark: TBookmark;
  viSeloLivroID: Integer;
{$ENDREGION}
begin
  Result := TListFactory<Integer>.New.GetInstance;
  viBookmark := vpDados.Bookmark;
  vpDados.DisableControls;

  try
    vpDados.First;
    while not vpDados.Eof do
      try
        viSeloLivroID := vpDados.FieldByName(
          'SELO_LIVRO_ID').AsInteger;

        Result.Add(
          viSeloLivroID);
      finally
        vpDados.Next;
      end;
  finally
    vpDados.GotoBookmark(
      viBookmark);

    vpDados.EnableControls;
  end;
end;

function TfrmSeloSelecionado.SeloLivroListRetornadosTJ_GO(
  const vpSeloLivroList: IList<Integer>): IList<Integer>;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
  viCondicaoWhere: IList<string>;
  viSeloLivroID: Integer;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    viCondicaoWhere := TListFactory<string>.New.GetInstance;

    for viSeloLivroID in vpSeloLivroList do
      viCondicaoWhere.Add(
        string.Format(
          '(G_SRAI.SELO_LIVRO_ID = %d)',
          [viSeloLivroID]));

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_SRAI.SELO_LIVRO_ID ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_SELO_RETORNO_ATO_ITEM G_SRAI ' +
      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_RETORNO_ATO_ITEM_CRIT G_SRAIC ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SRAIC.SELO_RETORNO_ATO_ITEM_ID = G_SRAI.SELO_RETORNO_ATO_ITEM_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +

      string.Format(
        '(%s) AND ',
        [string.Join(
          ' OR ',
          viCondicaoWhere.ToArray)]) +

      'G_SRAIC.STATUS = :P_STATUS ' +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_SRAI.SELO_LIVRO_ID';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    // 0 = Sucesso
    viQuery.ParamByName(
      'P_STATUS').AsInteger := 0;
    {$ENDREGION}

    viQuery.Open;
    try
      Result := SeloLivroList(
        viQuery);
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;
end;

function TfrmSeloSelecionado.SolicitarInutilizacaoJustificativa: Boolean;
{$REGION 'Variáveis'}
var
  viUF: string;
  viHabilitarNovoWebService: Boolean;
{$ENDREGION}
begin
  Result := False;

  viUF := dtmControles.CartorioUF;
  if viUF <> 'GO' then
    Exit;

  viHabilitarNovoWebService := dtmControles.BuscarParametroOutroSistema(
    'HABILITAR_NOVO_WEB_SERVICE',
    'GOIAS',
    'SELO',
    '5') = 'S';

  Result := viHabilitarNovoWebService;
end;

procedure TfrmSeloSelecionado.SolicitarSelo(
  vpEmolumentoItemId : Integer;
  vpTipoRetorno : Boolean = True;
  vpTransacao : Boolean = True;
  const vpOnQuantidadeModificada: TOnQuantidadeModificada = nil;
  const vpCodigoSeloPrenotacao: string = ''); {True - Abort / False - Exit}
var
  viNovoModeloSelo : String;
begin
  if vpEmolumentoItemId = 0 then
  begin
    Application.MessageBox(Pchar('Calculo de Emolumento Desatualizado!!! '+#13+#13+
                                 'Vá na Aba de Emolumentos e Re-Calcule o valor do Ato; '+#13+#13+
                                 'Ou verifique os valores da tabela vinculada.!'),'Informação', MB_OK);
    if vpTipoRetorno then
      Abort
    else
      Exit;
  end;

  // Verificar Grupo de Selo
  try
    viNovoModeloSelo := dtmControles.BuscarParametroOutroSistema('NOVO_MODELO', 'GERAL','SELO','5');
  except
    ShowMessage('Parametro SELO/GERAL/NOVO_MODELO não configurado e/ou não encontrado.');
    Abort;
  end;

  if viNovoModeloSelo = 'S' then
    vgDadosSelo.SeloGrupoId := BuscarCodigoGrupoSelo(IntToStr(vpEmolumentoItemId));

  if vgDadosSelo.SeloGrupoId = -1 then
  begin
    vgDadosSelo.Confirmado := False;
    Exit;
  end;

  if vgDadosSelo.SeloGrupoId = 0 then
  begin
    Application.MessageBox('Grupo de Selos não vinculado a Tabela de Emolumentos!!!','Informação', MB_OK);
    if vpTipoRetorno then
      Abort
    else
      Exit;
  end
  else
  begin
    vgDadosSelo.Transacao := vpTransacao;
    vlExibirSelo := dtmLookup.GetConfigCaixa('SELO', 'GERAL', 'EXIBIR_NUMERO_SELO', 'S') = 'S';
    if (vlExibirSelo) and (not vgDadosSelo.DesativarExibicao) then
         ExibirFormulario(TfrmSeloSelecionado, frmSeloSelecionado, True)
    else
      CapturarSelo(
        vpTipoRetorno,
        vpOnQuantidadeModificada,
        vpCodigoSeloPrenotacao);

    if not vgDadosSelo.Confirmado then
      if vpTipoRetorno then
        Abort
      else
        Exit;
  end;
end;

function TfrmSeloSelecionado.VerificarRetornoAtosGrupoSeloTJ_GO(
  const vpSeloGrupoID: Integer;
  const vpTipoAto: Integer): IList<Integer>;
{$REGION 'Constantes'}
const
  CL_SELO_SITUACAO_ID_UTILIZADO: Integer = 2;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viTiposAtoIndisponiveis: TDataSet;
  viSelosTJ_GO_Business: ISelosTJ_GO_Business;
  viNotaFiscalList: IList<string>;
  viID: Integer;
  viNotaFiscal: string;
  viSelosRetornar: TI9Query;
  viCondicaoList: IList<string>;
  viCondicao: string;
  viCondicaoNotaFiscal: string;
  viSeloLivroList: IList<Integer>;
  viAtosRetornoTJ_GO: TDataSet;
  viDataExportacao: TDateTime;
  viCodigoExportacao: Integer;
  viSeloRetornoAtoID: Integer;
  viInTransaction: Boolean;
{$ENDREGION}
begin
  Result := nil;

  viSelosTJ_GO_Business := TSelosTJ_GO_BusinessFactory.New.GetInstance;
  viTiposAtoIndisponiveis := viSelosTJ_GO_Business.ListarTiposAtoIndisponiveis;
  viNotaFiscalList := TListFactory<string>.New.GetInstance;

  try
    if not viTiposAtoIndisponiveis.Active then
      Exit;

    viTiposAtoIndisponiveis.First;
    while not viTiposAtoIndisponiveis.Eof do
      try
        viID := viTiposAtoIndisponiveis.FieldByName(
          'id').AsInteger;

        if vpTipoAto = viID then
        begin
          viNotaFiscal := viTiposAtoIndisponiveis.FieldByName(
            'protocolo_pedido').AsString;

          viNotaFiscalList.Add(
            viNotaFiscal);
        end;
      finally
        viTiposAtoIndisponiveis.Next;
      end;
  finally
    viTiposAtoIndisponiveis.Close;
    viTiposAtoIndisponiveis.Free;
  end;

  if viNotaFiscalList.IsEmpty then
    Exit;

  viSeloLivroList := nil;

  viSelosRetornar := TI9Query.Create(
    nil);

  try
    viSelosRetornar.Connection := dtmControles.DB;
    viCondicaoList := TListFactory<string>.New.GetInstance;

    for viNotaFiscal in viNotaFiscalList do
    begin
      viCondicao := string.Format(
        'G_SLO.NOTA_FISCAL = %s',
        [viNotaFiscal.QuotedString]);

      viCondicaoList.Add(
        viCondicao);
    end;

    viCondicaoNotaFiscal := string.Format(
      '(%s)',
      [string.Join(
        ' OR ',
        viCondicaoList.ToArray)]);

    viSelosRetornar.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_SL.SELO_LIVRO_ID ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_SELO_GRUPO G_SG ' +
      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_LOTE G_SLO ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SLO.SELO_GRUPO_ID = G_SG.SELO_GRUPO_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_LIVRO G_SL ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SL.SELO_LOTE_ID = G_SLO.SELO_LOTE_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SG.SELO_GRUPO_ID = :P_SELO_GRUPO_ID AND ' +
      viCondicaoNotaFiscal + ' AND ' +
      'G_SL.SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID_UTILIZADO AND ' +
      'COALESCE(G_SL.VALIDADO, '''') <> :P_VALIDADO ' +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_SL.SELO_LIVRO_ID';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viSelosRetornar.ParamByName(
      'P_SELO_GRUPO_ID').AsInteger := vpSeloGrupoID;

    viSelosRetornar.ParamByName(
      'P_SELO_SITUACAO_ID_UTILIZADO').AsInteger := CL_SELO_SITUACAO_ID_UTILIZADO;

    // S = Sim
    viSelosRetornar.ParamByName(
      'P_VALIDADO').AsString := 'S';
    {$ENDREGION}

    viSelosRetornar.Open;
    try
      viSeloLivroList := SeloLivroList(
        viSelosRetornar);
    finally
      viSelosRetornar.Close;
    end;
  finally
    viSelosRetornar.Free;
  end;

  if not Assigned(viSeloLivroList) then
    Exit;

  if viSeloLivroList.IsEmpty then
    Exit;

  viInTransaction := dtmControles.DB.InTransaction;
  if not viInTransaction then
    dtmControles.DB.StartTransaction;

  try
    viAtosRetornoTJ_GO := CriarAtosRetornoTJ_GO(
      viSeloLivroList);

    try
      viSeloLivroList := SeloLivroList(
        viAtosRetornoTJ_GO);

      viDataExportacao := dtmControles.DataHoraBanco(
        3,
        False);

      viCodigoExportacao := dtmControles.GerarSequencia(
        'SELO_CODIGO_EXPORTACAO');

      AlterarExportacao(
        viSeloLivroList,
        viDataExportacao,
        viCodigoExportacao);

      // A = Automático
      viSeloRetornoAtoID := viSelosTJ_GO_Business.RetornarAtos(
        viAtosRetornoTJ_GO,
        'A',
        Controles.vgUsuarioID.ToInteger);

      VerificarSeloRetornoAtoTJ_GO(
        viSeloRetornoAtoID);

      {
        Nesse ponto os selos foram retornados pro TJ-GO portanto,
        é necessário persistir as informações deles no banco pois,
        se for lançada uma exceção futuramente e todo o processo for
        desfeito, os selos também serão desfeitos sendo que
        eles já se encontram no TJ-GO.

        Obs.: o início de uma nova transação se deve pelo fato de
        que quem chamou esse método pode ter iniciado uma transação.
        Logo, deve-se retomar o estado anterior.
      }
      dtmControles.DB.Commit;
      if viInTransaction then
        dtmControles.DB.StartTransaction;

      Result := viSeloLivroList;
    finally
      viAtosRetornoTJ_GO.Close;
      viAtosRetornoTJ_GO.Free;
    end;

    if not viInTransaction and
      dtmControles.DB.InTransaction then
      dtmControles.DB.Commit;
  except
    if not viInTransaction and
      dtmControles.DB.InTransaction then
      dtmControles.DB.Rollback;

    raise;
  end;
end;

function TfrmSeloSelecionado.VerificarSeloExportado(vpTabela, vpRegistroID : String;const vpIdSeloLivro: Integer = 0):Boolean;
var
  viCondicao: string;
begin
  if vpIdSeloLivro = 0 then
    viCondicao := 'WHERE CAMPO_ID IN (' + vpRegistroID + ') AND ' +
      'TABELA = ' + QuotedStr(vpTabela) + ' AND '
  else
    viCondicao := 'WHERE SELO_LIVRO_ID = ' + IntToStr(vpIdSeloLivro) + ' AND ';
  viCondicao := viCondicao + 'CODIGO_EXPORTACAO IS NOT NULL;';

  {Result := dtmControles.GetInt(' SELECT COUNT(SELO_LIVRO_ID) '+
                                ' FROM G_SELO_LIVRO '+
                                ' WHERE CAMPO_ID IN ('+vpRegistroID+')'+
                                '   AND TABELA = '+ QuotedStr(vpTabela)+
                                '   AND NOT CODIGO_EXPORTACAO IS NULL') > 0;}

  Result := dtmControles.GetInt('SELECT ' +
    'COUNT(SELO_LIVRO_ID) ' +
    'FROM ' +
    'G_SELO_LIVRO ' +
    viCondicao) > 0;
end;

procedure TfrmSeloSelecionado.VerificarSeloRetornoAtoTJ_GO(
  const vpSeloRetornoAtoID: Integer);
{$REGION 'Variáveis'}
var
  viSeloRetornoAto: TI9Query;
  viSeloLivroList: IList<Integer>;
{$ENDREGION}
begin
  viSeloRetornoAto := TI9Query.Create(
    nil);

  try
    viSeloRetornoAto.Connection := dtmControles.DB;

    viSeloRetornoAto.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_SRAI.SELO_LIVRO_ID ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_SELO_RETORNO_ATO G_SRA ' +
      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_RETORNO_ATO_ITEM G_SRAI ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SRAI.SELO_RETORNO_ATO_ID = G_SRA.SELO_RETORNO_ATO_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_SELO_RETORNO_ATO_ITEM_CRIT G_SRAIC ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_SRAIC.SELO_RETORNO_ATO_ITEM_ID = G_SRAI.SELO_RETORNO_ATO_ITEM_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_SRA.SELO_RETORNO_ATO_ID = :P_SELO_RETORNO_ATO_ID AND ' +
      'G_SRAIC.STATUS = :P_STATUS ' +
      {$ENDREGION}

      {$REGION 'Cláusula ORDER BY'}
      'ORDER BY ' +
      'G_SRAI.SELO_LIVRO_ID';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viSeloRetornoAto.ParamByName(
      'P_SELO_RETORNO_ATO_ID').AsInteger := vpSeloRetornoAtoID;

    // 0 = Sucesso
    viSeloRetornoAto.ParamByName(
      'P_STATUS').AsInteger := 0;
    {$ENDREGION}

    viSeloRetornoAto.Open;
    try
      viSeloLivroList := SeloLivroList(
        viSeloRetornoAto);

      {
        2 = Utilizado
        S = Sim
      }
      AlterarSituacaoValidado(
        viSeloLivroList,
        2,
        'S',
        nil);
    finally
      viSeloRetornoAto.Close;
    end;
  finally
    viSeloRetornoAto.Free;
  end;
end;

end.
