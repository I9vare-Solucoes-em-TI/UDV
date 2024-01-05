unit SeloSelecionado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, DB, DBClient,
  cxGraphics, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinDevExpressDarkStyle;

type

  TDadosSelo = Record
    SeloGrupoId, Qtd, SeloContSeq, SeloI, RecuoLinha : Integer;
    Confirmado, ImprimirDocumento, SolicitarSelo, SeloAutomatico, SomenteTraslado : Boolean;
    SeloLivroId, SeloSequencia, Serventuario : String;
    SeloSeq : array[1..5, 1..15] of string;
    MultiploApresentante : array[1..100] of string;

    // Dados Adicionais
    SeloAgrupador, Apresentante, Tabela, CampoId, Descricao, EmolumentoId  : String;
    ValorTotal, ValorEmolumento, ValorTaxaJud, ValorFundesp : Currency;
    Transacao : Boolean;
  End;

  TfrmSeloSelecionado = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Panel2: TPanel;
    lblSelo: TcxLabel;
    btnPesquisar: TcxButton;
    cxButton1: TcxButton;
    btnConfirmar: TcxButton;

    procedure FormActivate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    procedure GravarDadosSelo(vpSeloLivroId, vpTabela, vpCampoId, vpDescricao : String; vpAgrupadorIgual : Boolean;
                                    vpData : String = '';vpIdSeloArmazena : Integer = 0);
    Function SelecionarSelo(vpSeloGrupoId, vpQtd : string; vpTipoRetorno : Boolean = True):Boolean; {True - Abort / False - Exit}
    procedure SolicitarSelo(vpEmolumentoItemId : Integer; vpTipoRetorno : Boolean = True; vpTransacao : Boolean = True); {True - Abort / False - Exit}
    Function PesquisarSelo(vpRegistroID, vpTabela, vpTextoAdicional : String):String;
    Function PesquisarNumeroAgrupador(vpRegistroID, vpTabela : String):String;
    procedure CapturarSelo(vpTipoRetorno : Boolean = True); {True - Abort / False - Exit}
    Function LiberarSeloVinculado(vpTabela, vpId  : String; vpIdSeloLivro : Integer = 0; vpCancelar : Boolean = True):Boolean;
    procedure CancelarSeloVinculado(vpTabela, vpId : String);
    Function VerificarSeloExportado(vpTabela, vpRegistroID : String):Boolean;
  end;

var
  frmSeloSelecionado: TfrmSeloSelecionado;
  vgDadosSelo : TDadosSelo;
  vlExibirSelo : Boolean;

implementation

uses Controles, SeloSelecao, Rotinas, Lookup;

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

procedure TfrmSeloSelecionado.CancelarSeloVinculado(vpTabela, vpId: String);
var
  viSeloRetirado : String;
begin
  // Cancela os Selos Vinculados;
  if vpId <> '' then
  begin
    ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 4, '+
                       '                         DESCRICAO = '+ QuotedStr('SERVI�O CANCELADO - ')+ '|| DESCRICAO,'+
                       '                         DATA = :DATA, '+
                       '                         TABELA = '+ QuotedStr('')+', '+
                       '                         CAMPO_ID = null, '+
                       '                         NUMERO_AGRUPADOR = null, '+
                       '                         USUARIO_ID = '+ vgUsuarioID +
                       ' WHERE CAMPO_ID IN ('+vpId+')'+
                       ' AND TABELA = '+QuotedStr(vpTabela),2);

    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('DATA').AsString := dtmControles.DataHoraBanco(5);
      ExecSQL(FALSE);
    end;
  end;

  // *************
end;

procedure TfrmSeloSelecionado.CapturarSelo(vpTipoRetorno : Boolean = True);
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
      if vlExibirSelo then
        lblSelo.Caption := 'Selos Disponiveis Insuficientes!!!';
      Application.MessageBox('A quantidade de selos dispon�veis � insuficiente para registrar este ato!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    dtmControles.SimpleAuxiliar.First;
    if vlExibirSelo then
      lblSelo.Caption := '';

    while not dtmControles.SimpleAuxiliar.eof do
    begin
      if vgDadosSelo.SeloLivroId = '' then
      begin
        if vlExibirSelo then
          lblSelo.Caption         := dtmControles.SimpleAuxiliar.FieldByName('NUMEROSIGLA').AsString;
        vgDadosSelo.SeloLivroId   := dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsString;
        vgDadosSelo.SeloAgrupador := dtmControles.SimpleAuxiliar.FieldByName('SIGLA').AsString+FormatFloat('000000',dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger);
      end
      else
      begin
        if vlExibirSelo then
          lblSelo.Caption       := lblSelo.Caption + ', ' + dtmControles.SimpleAuxiliar.FieldByName('NUMEROSIGLA').AsString;
        vgDadosSelo.SeloLivroId := vgDadosSelo.SeloLivroId + ', '+ dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsString;
      end;
      dtmLookup.ClientTemp.Insert;
      dtmLookup.ClientTempCHAVE_ID.AsInteger := dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsInteger;
      dtmLookup.ClientTempVALOR.AsString     := dtmControles.SimpleAuxiliar.FieldByName('SIGLA').AsString+FormatFloat('000000',dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger);
      dtmLookup.ClientTemp.Post;

      dtmControles.SimpleAuxiliar.next;
    end;
    vgDadosSelo.Confirmado := True;
  end
  else
  begin
    if vlExibirSelo then
      lblSelo.Caption := 'Selo Inexistente!!!';
    Application.MessageBox('N�o foi encontrado nenhum selo dispon�vel!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
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

procedure TfrmSeloSelecionado.GravarDadosSelo(vpSeloLivroId, vpTabela, vpCampoId, vpDescricao : String; vpAgrupadorIgual : Boolean;
                                    vpData : String = '';vpIdSeloArmazena : Integer = 0);
var
  i : Integer;
  viSeloGravar : String;

  procedure GravaDados;
  begin
    ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 2, '+
                       '                         DATA = :DATA, '+
                       '                         DESCRICAO = '+QuotedStr(vpDescricao)+','+
                       '                         TABELA = '+QuotedStr(vpTabela)+','+
                       '                         CAMPO_ID = '+vpCampoId+','+
                       '                         USUARIO_ID = :USUARIO_ID, '+
                       '                         APRESENTANTE = '+ RetNull(QuotedStr(vgDadosSelo.Apresentante))+', '+
                       '                         IP_MAQUINA = '+ QuotedStr(RetornaIP)+', '+
                       '                         NUMERO_AGRUPADOR = :NUMERO_AGRUPADOR, '+
                       '                         VALOR_TOTAL = :VALOR_TOTAL, '+
                       '                         VALOR_EMOLUMENTO = :VALOR_EMOLUMENTO, '+
                       '                         VALOR_TAXA_JUDICIARIA = :VALOR_TAXA_JUDICIARIA, '+
                       '                         VALOR_FUNDESP = :VALOR_FUNDESP '+
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

      if vgDadosSelo.Serventuario = '' then
           ParamByName('USUARIO_ID').AsString       := vgUsuarioID
      else ParamByName('USUARIO_ID').AsString       := vgDadosSelo.Serventuario;
      ExecSQL(FALSE);
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
            vpCancelar : Boolean = True):Boolean;
var
  viSeloRetirado : String;
  viSql : String;

  procedure Liberar;
  begin
    // Libera os Selos Vinculados;
    viSql := ' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = 1, '+
             '                         DATA = null, '+
             '                         DESCRICAO = null, '+
             '                         TABELA = null, '+
             '                         CAMPO_ID = null, '+
             '                         NUMERO_AGRUPADOR = null, '+
             '                         USUARIO_ID = null ';
    if vpIdSeloLivro = 0 then
    begin
      if vpId <> '' then
      begin
        viSql := viSql + ' WHERE CAMPO_ID IN ('+vpId+')'+
                         ' AND TABELA = '+QuotedStr(vpTabela);
        ExecutaSqlAuxiliar(viSql,1);
      end;
    end
    else
    begin
      viSql := viSql + ' WHERE SELO_LIVRO_ID = '+ IntToStr(vpIdSeloLivro);
      ExecutaSqlAuxiliar(viSql,1);
    end;
  end;

begin
  Result := True;
  if vpIdSeloLivro > 0 then
    Liberar
  else
  begin
    // Verifica se os Selos ja foram exportados. Caso Sim cancela os mesmo, caso n�o, Libera;
    if not frmSeloSelecionado.VerificarSeloExportado(vpTabela,vpId) then
         Liberar
    else
    begin
      if vpCancelar then
           CancelarSeloVinculado(vpTabela,vpId)
      else Result := False;
    end;
  end;
end;

function TfrmSeloSelecionado.PesquisarNumeroAgrupador(vpRegistroID, vpTabela : String):String;
begin
  if vpRegistroID <> '' then
    Result := dtmControles.GetStr(' SELECT DISTINCT(NUMERO_AGRUPADOR) FROM G_SELO_LIVRO '+
                                  ' WHERE CAMPO_ID = '+vpRegistroID +
                                  ' AND TABELA = '+ QuotedStr(vpTabela))
  else Result := '';
end;

function TfrmSeloSelecionado.PesquisarSelo(vpRegistroID, vpTabela, vpTextoAdicional : String):String;
var
  viSelo : String;
begin
  if vpRegistroID = '' then
  begin
    Result := '';
    exit;
  end;

  viSelo := '';
  viSelo := dtmControles.GetStr('SELECT * FROM C_PESQUISA_SELO_AGRUPADOR('+ QuotedStr(vpTabela) +','+
                                vpRegistroID+')');
  if viSelo <> '' then
  begin
    if vpTextoAdicional <> '' then
         Result := vpTextoAdicional + viSelo
    else Result := viSelo;
  end
  else Result := '';
end;

Function TfrmSeloSelecionado.SelecionarSelo(vpSeloGrupoId, vpQtd : string; vpTipoRetorno : Boolean = True):Boolean;
var
  viDivisor : String;
  viSelos : String;
begin
  if vlExibirSelo then
       viDivisor := '-'
  else viDivisor := '';

  try
    viSelos := dtmControles.GetStr('SELECT * FROM C_REGISTRA_SELO('+vpSeloGrupoId+', '+ vpQtd+ ')');
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
      Application.MessageBox('A quantidade de selos dispon�veis � insuficiente para registrar este ato!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
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

procedure TfrmSeloSelecionado.SolicitarSelo(vpEmolumentoItemId : Integer; vpTipoRetorno : Boolean = True; vpTransacao : Boolean = True); {True - Abort / False - Exit}
var
  viNovoModeloSelo : String;
begin
  if vpEmolumentoItemId = 0 then
  begin
    Application.MessageBox(Pchar('Calculo de Emolumento Desatualizado!!! '+#13+#13+
                                 'V� na Aba de Emolumentos e Re-Calcule o valor do Ato; '+#13+#13+
                                 'Ou verifique os valores da tabela vinculada.!'),'Informa��o', MB_OK);
    if vpTipoRetorno then
      Abort
    else
      Exit;
  end;

  // Verificar Grupo de Selo
  try
    viNovoModeloSelo := dtmControles.BuscarParametroOutroSistema('NOVO_MODELO', 'GERAL','SELO','5');
  except
    ShowMessage('Parametro SELO/GERAL/NOVO_MODELO n�o configurado e/ou n�o encontrado.');
  end;


  if viNovoModeloSelo = 'S' then
    vgDadosSelo.SeloGrupoId := dtmControles.GetInt(' SELECT SG.SELO_GRUPO_ID '+
                                                   ' FROM G_SELO_GRUPO SG '+
                                                   '  LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
                                                   '  SG.NUMERO = EI.CODIGO_SELO '+
                                                   ' WHERE EI.EMOLUMENTO_ITEM_ID = '+IntToStr(vpEmolumentoItemId));

  if vgDadosSelo.SeloGrupoId = 0 then
  begin
    Application.MessageBox('Grupo de Selos n�o vinculado a Tabela de Emolumentos!!!','Informa��o', MB_OK);
    if vpTipoRetorno then
      Abort
    else
      Exit;
  end
  else
  begin
    vgDadosSelo.Transacao := vpTransacao;
    vlExibirSelo := dtmLookup.GetConfigCaixa('SELO', 'GERAL', 'EXIBIR_NUMERO_SELO', 'S') = 'S';
    if vlExibirSelo then
         ExibirFormulario(TfrmSeloSelecionado, frmSeloSelecionado, True)
    else CapturarSelo(vpTipoRetorno);

    if not vgDadosSelo.Confirmado then
      if vpTipoRetorno then
        Abort
      else
        Exit;
  end;
end;

function TfrmSeloSelecionado.VerificarSeloExportado(vpTabela, vpRegistroID : String):Boolean;
begin
  Result := dtmControles.GetInt(' SELECT COUNT(SELO_LIVRO_ID) '+
                                ' FROM G_SELO_LIVRO '+
                                ' WHERE CAMPO_ID IN ('+vpRegistroID+')'+
                                '   AND TABELA = '+ QuotedStr(vpTabela)+
                                '   AND NOT CODIGO_EXPORTACAO IS NULL') > 0;
end;

end.
