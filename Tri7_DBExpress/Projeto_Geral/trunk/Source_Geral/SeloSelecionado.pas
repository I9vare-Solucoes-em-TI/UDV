unit SeloSelecionado;

interface

uses
  FireDAC.Stan.Param,
  I9Query,
  I9Connection,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxControls, SeloFundo,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, DB, DBClient,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, DbxDevartInterBase, SimpleDS,
  dxSkinsCore, dxSkinCoffee, dxSkiniMaginary, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver;

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
    function SelecionarSelos(
      const vpSeloGrupoID: Integer;
      const vpQuantidade: Integer): string;

    function NovaFormaSelecionarSelo: Boolean;
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
      vpCampoItemId: string = '');

    Function SelecionarSelo(vpSeloGrupoId, vpQtd : string; vpTipoRetorno : Boolean = True):Boolean; {True - Abort / False - Exit}
    procedure SolicitarSelo(vpEmolumentoItemId : Integer; vpTipoRetorno : Boolean = True; vpTransacao : Boolean = True); {True - Abort / False - Exit}
    Function PesquisarSelo(vpRegistroID, vpTabela, vpTextoAdicional : String; vpAgrupador : Boolean = True;
                vpTodos : Boolean = True; vpNumeroAgrupador : string = ''):String;
    Function PesquisarNumeroAgrupador(vpRegistroID, vpTabela : String):String;
    procedure CapturarSelo(vpTipoRetorno : Boolean = True); {True - Abort / False - Exit}
    Function LiberarSeloVinculado(vpTabela, vpId  : String; vpIdSeloLivro : Integer = 0; vpCancelar : Boolean = True;
            vpManterVinculo : Boolean = False):Boolean;
    procedure CancelarSeloVinculado(vpTabela, vpId : String; vpManterVinculo : Boolean = False; const vpIdSeloLivro: Integer = 0);
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
  FDControle,
  Geral.Model.Entity.Impl.DataSet,
  FireDAC.Comp.Client;

{$R *.dfm}

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

procedure TfrmSeloSelecionado.CancelarSeloVinculado(vpTabela, vpId: String; vpManterVinculo : Boolean = False;
    const vpIdSeloLivro: Integer = 0);
var
  viCondicao: string;
begin
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
                         '                         DESCRICAO = '+ QuotedStr('SERVIÇO CANCELADO - '+ '|| DESCRICAO')+', '+
                         '                         DATA = :DATA, '+
                         '                         TABELA = '+ QuotedStr('')+', '+
                         '                         CAMPO_ID = null, '+
                         '                         NUMERO_AGRUPADOR = null, '+
                         '                         USUARIO_ID = '+ vgUsuarioID +
                         {' WHERE CAMPO_ID IN ('+vpId+')'+
                         ' AND TABELA = '+QuotedStr(vpTabela),2)}
                         viCondicao, 2)
    else
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 4, '+
                         '                         DESCRICAO = '+ QuotedStr('SERVIÇO CANCELADO - '+ '|| DESCRICAO')+', '+
                         '                         DATA = :DATA, '+
                         '                         USUARIO_ID = '+ vgUsuarioID +
                         {' WHERE CAMPO_ID IN ('+vpId+')'+
                         ' AND TABELA = '+QuotedStr(vpTabela),2);}
                         viCondicao, 2);

    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('DATA').AsString := dtmControles.DataHoraBanco(5);
      ExecSQL;
    end;
  end;

  // *************
end;

procedure TfrmSeloSelecionado.CapturarSelo(vpTipoRetorno : Boolean = True);
var
  viSeloFormatado : string;
begin
  vgDadosSelo.Confirmado := False;
  if not SelecionarSelo(IntToStr(vgDadosSelo.SeloGrupoId), IntToStr(vgDadosSelo.Qtd),vpTipoRetorno) then
    exit;

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
       viSeloFormatado := dtmControles.FormatarMascaraSelo(dtmControles.SimpleAuxiliar.FieldByName('SIGLA').AsString,dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger);
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
  vpCampoItemId: string = '');
{$REGION 'Variáveis'}
var
  i: Integer;
  viSeloGravar: string;
{$ENDREGION}

  procedure GravaDados;
  var
    viSeloFundoDAO: TSeloFundoDAO;
    viSeloFundo: TSeloFundo;
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
                       '                         VALOR_ISSQN = :VALOR_ISSQN '+
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
  end;

begin
  Screen.Cursor := crHourGlass;
  i := 0;
  viSeloGravar := vpSeloLivroId;
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
end;

Function TfrmSeloSelecionado.LiberarSeloVinculado(vpTabela, vpId  : String; vpIdSeloLivro : Integer = 0;
            vpCancelar : Boolean = True; vpManterVinculo : Boolean = False):Boolean;

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

begin
  Result := True;
  if vpIdSeloLivro > 0 then
  begin
    // Verifica se o Selo já foi exportado. Caso Sim cancela o mesmo, caso Não, Libera;
    if VerificarSeloExportado(EmptyStr, EmptyStr, vpIdSeloLivro) then
    begin
      if vpCancelar then
        CancelarSeloVinculado(EmptyStr, EmptyStr, vpManterVinculo, vpIdSeloLivro)
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
      if vpCancelar then
           CancelarSeloVinculado(vpTabela,vpId, vpManterVinculo)
      else Result := False;
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

Function TfrmSeloSelecionado.SelecionarSelo(vpSeloGrupoId, vpQtd : string; vpTipoRetorno : Boolean = True):Boolean;
var
  viDivisor : String;
  viSelos, viUsuarioId : String;
begin
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
        vpQtd.ToInteger)
    else
      viSelos := dtmControles.GetStr(
        'SELECT * FROM C_REGISTRA_SELO(' + vpSeloGrupoId + ', ' +
        viUsuarioId + ', ' + vpQtd + ')');

    if viSelos <> '' then
    begin
      if vgDadosSelo.Transacao then
        dtmControles.StartTransaction;

        ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 1 '+
                           ' WHERE SELO_LIVRO_ID IN ('+viSelos+')',1);

        ExecutaSimpleDSAux(' SELECT FIRST '+vpQtd+'  MIN(SL.SELO_LIVRO_ID), SL.NUMERO, SL.SIGLA, '+
                           ' (SL.SIGLA || '+QuotedStr(viDivisor)+'  || CAST(SL.NUMERO AS INTEGER)) AS NUMEROSIGLA, '+
                           ' ST.SELO_GRUPO_ID, SL.SELO_LIVRO_ID '+
                           ' FROM G_SELO_LIVRO SL LEFT OUTER JOIN G_SELO_LOTE ST ON '+
                           '   SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
                           '   LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
                           '   ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
                           ' WHERE SL.SELO_LIVRO_ID IN ('+viSelos+')'+
                           ' GROUP BY SL.NUMERO, SL.SIGLA, ST.SELO_GRUPO_ID, SL.SELO_LIVRO_ID'+
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
    if vgDadosSelo.Transacao then
      dtmControles.Roolback;

    Application.MessageBox('Problemas ao Selecionar o(s) Selos(s). Tente Novamente!!!','Error!!!', MB_ICONINFORMATION + MB_OK);
    if vpTipoRetorno then
         abort
    else
    begin 
      Result := False; 
      exit;
    end;
  end;
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
        vpFDQuery.Connection := dtmFD.FDConnection;

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
    viStrings.Free;
  end;
end;

procedure TfrmSeloSelecionado.SolicitarSelo(vpEmolumentoItemId : Integer;
                    vpTipoRetorno : Boolean = True; vpTransacao : Boolean = True); {True - Abort / False - Exit}
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
    else CapturarSelo(vpTipoRetorno);

    if not vgDadosSelo.Confirmado then
      if vpTipoRetorno then
        Abort
      else
        Exit;
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

end.
