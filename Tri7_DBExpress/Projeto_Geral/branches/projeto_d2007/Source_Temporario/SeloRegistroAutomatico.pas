unit SeloRegistroAutomatico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, StdCtrls, cxButtons, ExtCtrls, DBClient, cxTextEdit, FMTBcd, SqlExpr;

type
  TfrmSeloRegistroAutomatico = class(TForm)
    Panel1: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    grdPesquisa: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ClientRegistro: TClientDataSet;
    ClientRegistroQTD: TIntegerField;
    ClientRegistroCODIGO: TIntegerField;
    ClientRegistroSELO_INICIAL: TStringField;
    ClientRegistroSELO_FINAL: TStringField;
    ClientRegistroSELO_GRUPO_ID: TIntegerField;
    dtsRegistro: TDataSource;
    ClientRegistroSERVICO: TStringField;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    ClientRegistroOBSERVACAO: TStringField;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    ClientRegistroEMOLUMENTO: TCurrencyField;
    ClientRegistroTAXA_JUDICIARIA: TCurrencyField;
    ClientRegistroOUTRA_TAXA1: TCurrencyField;
    ClientRegistroEMOLUMENTO_ITEM_ID: TIntegerField;
    sqlPesquisa: TSQLQuery;
    ClientRegistroQTD_CORRECAO: TIntegerField;
    cxGridPesquisaColumn8: TcxGridDBColumn;
    cxGridPesquisaColumn9: TcxGridDBColumn;
    ClientRegistroQTD_TOTAL: TIntegerField;
    ClientRegistroORDEM: TIntegerField;
    ClientRegistroISS: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClientRegistroQTD_CORRECAOChange(Sender: TField);
  private
    vlQtdCorretiva : TStringList;
    vlInsercaoNova : boolean;
    procedure LiberarReservarLiberarSelos(vpSequencialSelos : String; vpTravar : Boolean);
    procedure ArmazenarRegistro(vpNovo : Boolean);
  public
    { Public declarations }
  end;

var
  frmSeloRegistroAutomatico: TfrmSeloRegistroAutomatico;
  vgSeloDataRegistroAutomatico : TDate;
  vgSeloRegistroConfirmado : Boolean;
  vgSeloCaixaId : Integer;

implementation

uses Rotinas, Lookup, Controles, SeloSelecionado;

{$R *.dfm}

procedure TfrmSeloRegistroAutomatico.ArmazenarRegistro(vpNovo : Boolean);
var
  viLiberado : Boolean;
  viOrdem : Integer;
  viValorISS : Currency;

  procedure LimparSelosTemp(vpId : integer);
  var
    i : Integer;
  begin
    for i := 1 to 15 do
      vgDadosSelo.SeloSeq[vpId, i] := '';
  end;

  procedure VerificarRegistros;
  begin
    sqlPesquisa.Active := False;
    sqlPesquisa.SQL.Clear;
    sqlPesquisa.SQL.Add(' SELECT SUM(CI.QTD) AS QTD, E.SELO_GRUPO_ID, E.DESCRICAO, EI.CODIGO, EI.EMOLUMENTO_ITEM_ID,'+
                        ' SUM(CI.EMOLUMENTO) AS EMOLUMENTO,  SUM(CI.TAXA_JUDICIARIA) AS TAXA_JUDICIARIA, '+
                        ' SUM(CI.OUTRA_TAXA1) AS OUTRA_TAXA1, SUM(CI.FUNDESP) AS ISS '+
                        ' FROM C_CAIXA_ITEM CI '+
                        '    RIGHT JOIN G_EMOLUMENTO_ITEM EI ON '+
                        '    CI.EMOLUMENTO_ITEM_ID = EI.EMOLUMENTO_ITEM_ID '+
                        '    RIGHT JOIN G_EMOLUMENTO E ON '+
                        '    EI.EMOLUMENTO_ID = E.EMOLUMENTO_ID '+
                        '    RIGHT JOIN G_SELO_GRUPO SG ON '+
                        '    E.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
                        ' WHERE CI.DATA_PAGAMENTO = :DATA '+
                        '     AND CI.SITUACAO in (''4'',''6'',''7'',''8'',''9'')'+
                        ' AND (CI.CAIXA_REGISTROSELO_ID IS NULL)'+
                        '     AND SG.CONTROLE_AUTOMATICO = ''S'''+
                        ' AND CI.CAIXA_SERVICO_ID IN (''13'',''14'')'+
                        ' GROUP BY E.SELO_GRUPO_ID, E.DESCRICAO, EI.CODIGO, EI.EMOLUMENTO_ITEM_ID'+
                        ' ORDER BY EI.CODIGO');
    sqlPesquisa.ParamByName('DATA').AsString := FormatDateTime('YYYY/MM/DD', vgSeloDataRegistroAutomatico);
    sqlPesquisa.Active := True;
  end;

  procedure VerificarSelosQtdDisponivel(vpQtd: String);
  begin
    ExecutaSimpleDSAux(' SELECT FIRST '+vpQtd+' SL.SELO_LIVRO_ID, '+
                       '             (SL.SIGLA || CAST(SL.NUMERO AS INTEGER)) AS NUMERO '+
                       ' FROM G_SELO_LIVRO SL LEFT OUTER JOIN G_SELO_LOTE ST ON '+
                       '   SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
                       '   LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
                       '   ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
                       ' WHERE ST.SITUACAO = ''I'''+
                       '   AND SL.SELO_SITUACAO_ID = 1 '+
                       '   AND ((SL.RESERVADO = ''N'') OR (SL.RESERVADO IS NULL))' +
                       '   AND SG.SELO_GRUPO_ID = '+ ClientRegistroSELO_GRUPO_ID.AsString+
                       ' ORDER BY SL.SELO_LIVRO_ID ',0);
    if dtmControles.SimpleAuxiliar.IsEmpty then
    begin
      ClientRegistroObservacao.AsString := 'N�o existem selos cadastrados  dispon�veis para este servi�o. VERIFIQUE!!!';
      viLiberado := False;
    end
    else
    begin
      vgDadosSelo.SeloContSeq := 0;
      vgDadosSelo.SeloI       := 1;
      LimparSelosTemp(ClientRegistroOrdem.AsInteger);

//      vgDadosSelo.SeloSequencia := '';
      dtmControles.SimpleAuxiliar.First;
      ClientRegistroSELO_INICIAL.AsString  := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsString;
      dtmControles.SimpleAuxiliar.Last;
      if dtmControles.SimpleAuxiliar.RecNo < StrToInt(vpQtd) then
      begin
        ClientRegistroObservacao.AsString := 'Existem somente '+IntToStr(dtmControles.SimpleAuxiliar.RecordCount)+' selos dispon�veis para este servi�o. VERIFIQUE!!!';
        viLiberado := False;
      end
      else ClientRegistroSELO_FINAL.AsString := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsString;

      dtmControles.SimpleAuxiliar.First;
      // Armazena a Sequencia de Selos
      while not dtmControles.SimpleAuxiliar.eof do
      begin
        if vgDadosSelo.SeloSequencia = '' then
             vgDadosSelo.SeloSequencia := dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsString
        else vgDadosSelo.SeloSequencia := vgDadosSelo.SeloSequencia+','+dtmControles.SimpleAuxiliar.FieldByName('SELO_LIVRO_ID').AsString;
        inc(vgDadosSelo.SeloContSeq);
        dtmControles.SimpleAuxiliar.next;

        // Se chegar at� 500, grava e come�a novamente, armazenando os registros em um array para registro apos grava��o.
        if (vgDadosSelo.SeloContSeq = 500) or (dtmControles.SimpleAuxiliar.Eof) then
        begin
          LiberarReservarLiberarSelos(vgDadosSelo.SeloSequencia, True);
          vgDadosSelo.SeloContSeq := 0;
          vgDadosSelo.SeloSeq[ClientRegistroOrdem.AsInteger, vgDadosSelo.SeloI] := vgDadosSelo.SeloSequencia;
          inc(vgDadosSelo.SeloI);
          vgDadosSelo.SeloSequencia := '';
        end;
      end;
//      ClientRegistroSELO_SEQUENCIAL.Asstring := vgDadosSelo.SeloSequencia;
//      LiberarReservarLiberarSelos(vgDadosSelo.SeloSequencia, True);
    end;
  end;

begin
  Screen.Cursor := crHourGlass;
  vlInsercaoNova := True;
  LiberarReservarLiberarSelos('', False);
  viLiberado := True;
  VerificarRegistros;
  ClientRegistro.EmptyDataSet;
  sqlPesquisa.First;
  viOrdem := 0;
  while not sqlPesquisa.eof do
  begin
    inc(viOrdem);
    vgDadosSelo.SeloSequencia := '';
    ClientRegistro.Insert;
    ClientRegistroQTD.AsInteger               := sqlPesquisa.FieldByName('QTD').AsInteger;
    if vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString] <> '0' then
         ClientRegistroQTD_CORRECAO.AsString  := vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString]
    else ClientRegistroQTD_CORRECAO.AsInteger := 0;
    ClientRegistroOrdem.AsInteger             := viOrdem;
    ClientRegistroCODIGO.AsString             := sqlPesquisa.FieldByName('CODIGO').AsString;
    ClientRegistroSELO_GRUPO_ID.AsInteger     := sqlPesquisa.FieldByName('SELO_GRUPO_ID').AsInteger;
    ClientRegistroSERVICO.Asstring            := sqlPesquisa.FieldByName('DESCRICAO').AsString;
    ClientRegistroEMOLUMENTO.AsCurrency       := sqlPesquisa.FieldByName('EMOLUMENTO').AsCurrency;
    ClientRegistroTAXA_JUDICIARIA.AsCurrency  := sqlPesquisa.FieldByName('TAXA_JUDICIARIA').AsCurrency;
    ClientRegistroISS.AsCurrency              := sqlPesquisa.FieldByName('ISS').AsCurrency;
    ClientRegistroOUTRA_TAXA1.AsCurrency      := sqlPesquisa.FieldByName('OUTRA_TAXA1').AsCurrency;
    ClientRegistroEMOLUMENTO_ITEM_ID.AsInteger:= sqlPesquisa.FieldByName('EMOLUMENTO_ITEM_ID').AsInteger;
    ClientRegistroQTD_TOTAL.AsInteger         := ClientRegistroQTD.AsInteger + (ClientRegistroQTD_CORRECAO.AsInteger);

    if vpNovo then
      vlQtdCorretiva.Add(sqlPesquisa.FieldByName('CODIGO').AsString+'=0')
    else
    begin
      if vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString] <> '0' then
      begin
        ExecutaSqlAuxiliar(' SELECT VALOR_EMOLUMENTO, VALOR_TAXA_JUDICIARIA, VALOR_OUTRA_TAXA1 '+
                           ' FROM G_EMOLUMENTO_ITEM '+
                           ' WHERE EMOLUMENTO_ITEM_ID = '+ sqlPesquisa.FieldByName('EMOLUMENTO_ITEM_ID').AsString,0);
        ClientRegistroEMOLUMENTO.AsCurrency := ClientRegistroEMOLUMENTO.AsCurrency +
                                                            (dtmControles.sqlAuxiliar.FieldByName('VALOR_EMOLUMENTO').AsCurrency * StrToInt(vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString]));
        ClientRegistroTAXA_JUDICIARIA.AsCurrency := ClientRegistroTAXA_JUDICIARIA.AsCurrency +
                                                            (dtmControles.sqlAuxiliar.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency * StrToInt(vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString]));
        ClientRegistroOUTRA_TAXA1.AsCurrency := ClientRegistroOUTRA_TAXA1.AsCurrency +
                                                            (dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency * StrToInt(vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString]));

        viValorISS := ((dtmControles.sqlAuxiliar.FieldByName('VALOR_EMOLUMENTO').AsCurrency * 5)/100);
        ClientRegistroISS.AsCurrency         := ClientRegistroISS.AsCurrency +
                                                            (viValorISS * StrToInt(vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString]));
        ClientRegistroQTD_CORRECAO.AsInteger := StrtoInt(vlQtdCorretiva.Values[sqlPesquisa.FieldByName('CODIGO').AsString]);
      end;
    end;

    // Verifica e Grava Numera��o de Selos;
    VerificarSelosQtdDisponivel(ClientRegistroQTD_TOTAL.AsString);
    ClientRegistro.Post;
    sqlPesquisa.next;
  end;

  btnConfirmar.Enabled := viLiberado and (not ClientRegistro.IsEmpty);
  vlInsercaoNova := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmSeloRegistroAutomatico.btnCancelarClick(Sender: TObject);
begin
  vgSeloRegistroConfirmado := False; 
  Close;
end;

procedure TfrmSeloRegistroAutomatico.btnConfirmarClick(Sender: TObject);
var
  viRegistroSeloId : Integer;

  procedure RegistraCaixaSelo;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO C_CAIXA_REGISTROSELO( '+
                       '              CAIXA_REGISTROSELO_ID, '+
                       '              SELO_INICIAL, '+
                       '              SELO_FINAL, '+
                       '              CODIGO, '+
                       '              SELO_GRUPO_ID, '+
                       '              EMOLUMENTO, '+
                       '              TAXA_JUDICIARIA, '+
                       '              OUTRA_TAXA1, '+
                       '              ISS, '+
                       '              QTD, '+
                       '              QTD_CORRECAO, '+
                       '              USUARIO_ID, '+
                       '              CAIXA_ID, '+
                       '              DATA) '+
                       ' VALUES(      :CAIXA_REGISTROSELO_ID, '+
                       '              :SELO_INICIAL, '+
                       '              :SELO_FINAL, '+
                       '              :CODIGO, '+
                       '              :SELO_GRUPO_ID, '+
                       '              :EMOLUMENTO, '+
                       '              :TAXA_JUDICIARIA, '+
                       '              :OUTRA_TAXA1, '+
                       '              :ISS, '+
                       '              :QTD, '+
                       '              :QTD_CORRECAO, '+
                       '              :USUARIO_ID, '+
                       '              :CAIXA_ID, '+
                       '              :DATA)',2);
    with dtmControles.sqlAuxiliar do
    begin
      viRegistroSeloId := dtmControles.GerarSequencia('C_CAIXA_REGISTROSELO');
      ParamByName('CAIXA_REGISTROSELO_ID').AsBCD := viRegistroSeloId;
      ParamByName('SELO_INICIAL').AsString       := ClientRegistroSELO_INICIAL.AsString;
      ParamByName('SELO_FINAL').AsString         := ClientRegistroSELO_FINAL.AsString;
      ParamByName('CODIGO').AsCurrency           := ClientRegistroCODIGO.AsCurrency;
      ParamByName('SELO_GRUPO_ID').AsInteger     := ClientRegistroSELO_GRUPO_ID.AsInteger;
      ParamByName('EMOLUMENTO').AsBCD            := ClientRegistroEMOLUMENTO.AsCurrency;
      ParamByName('TAXA_JUDICIARIA').AsBCD       := ClientRegistroTAXA_JUDICIARIA.AsCurrency;
      ParamByName('OUTRA_TAXA1').AsBCD           := ClientRegistroOUTRA_TAXA1.AsCurrency;
      ParamByName('ISS').AsBCD                   := ClientRegistroISS.AsCurrency;
      ParamByName('QTD').AsBCD                   := ClientRegistroQTD.AsCurrency;
      ParamByName('QTD_CORRECAO').AsBCD          := ClientRegistroQTD_CORRECAO.AsCurrency;
      ParamByName('USUARIO_ID').AsBCD            := StrToInt(vgUsuarioID);
      ParamByName('CAIXA_ID').AsBCD              := vgSeloCaixaId;
      ParamByName('DATA').AsString               := FormatDateTime('YYYY/MM/DD', vgSeloDataRegistroAutomatico);
      ExecSQL(FALSE);
    end;
  end;

  procedure VerificarLivroDiario;
  begin
    vgLivroDiario.Descricao      := ClientRegistroSERVICO.AsString;
    vgLivroDiario.Serventia      := '1';
    vgLivroDiario.Apresentante   := 'REGISTRO AUTOMATICO';
    vgLivroDiario.Valor          := ClientRegistroEMOLUMENTO.AsCurrency;
    vgLivroDiario.Operacao       := 'C';
    vgLivroDiario.Data           := vgSeloDataRegistroAutomatico;
    vgLivroDiario.Qtd            := ClientRegistroQTD.AsInteger;
    vgLivroDiario.Escrevente     := StrToInt(vgUsuarioID);
    if ClientRegistroCODIGO.AsString = '2002' then
          vgLivroDiario.CaixaServicoID := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_AUTENTICACAO', 'I')
    else  vgLivroDiario.CaixaServicoID := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_RECONHECIMENTO', 'I');
    vgLivroDiario.ControleID     := 0;
    vgLivroDiario.Selo           := ClientRegistroSELO_INICIAL.AsString +' a '+ ClientRegistroSELO_FINAL.AsString;
    dtmLookup.RegistrarLivroDiario;
  end;

begin
  if Application.MessageBox('Confirma Registro do Selos?', 'Pergunta', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
    Exit;

  try
    dtmControles.StartTransaction;
    ClientRegistro.First;
    while not ClientRegistro.eof do
    begin
      RegistraCaixaSelo;
      frmSeloSelecionado.GravarDadosSelo('', 'T_CAIXA_REGISTROSELO', IntToStr(viRegistroSeloId), 'Registro Autom�tico', True, DateToStr(vgSeloDataRegistroAutomatico), ClientRegistroOrdem.AsInteger);
//      VerificarLivroDiario;

      // Atualiza Dados do Caixa
      ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET CAIXA_REGISTROSELO_ID = '+IntToStr(viRegistroSeloId) +
                         ' WHERE DATA_PAGAMENTO = :DATA '+
                         '   AND SITUACAO = ''4'''+
                         '   AND EMOLUMENTO_ITEM_ID = '+ ClientRegistroEMOLUMENTO_ITEM_ID.AsString,2);
      With dtmControles.sqlAuxiliar do
      begin
        ParamByName('DATA').AsString := FormatDateTime('YYYY/MM/DD', vgSeloDataRegistroAutomatico);
        ExecSQL(False);
      end;

      ClientRegistro.Next;
    end;
    dtmControles.Commit;
    vgSeloRegistroConfirmado := True;
  except
    dtmControles.Roolback;
    ShowMessage('Erro ao registrar o Selo. VerifiQue com o Administrador do Sistema!!!');
  end;
  Close;
end;

procedure TfrmSeloRegistroAutomatico.ClientRegistroQTD_CORRECAOChange(
  Sender: TField);
begin
  if not vlInsercaoNova then
  begin
    vlQtdCorretiva.Values[ClientRegistroCODIGO.AsString] := IntToStr(Sender.Value);
    ArmazenarRegistro(False);
  end;
end;

procedure TfrmSeloRegistroAutomatico.FormActivate(Sender: TObject);
begin
  vlQtdCorretiva := TStringList.Create;
  ArmazenarRegistro(True);
end;

procedure TfrmSeloRegistroAutomatico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LiberarReservarLiberarSelos('', False);

  Action := caFree;
  frmSeloRegistroAutomatico := nil;
end;

procedure TfrmSeloRegistroAutomatico.LiberarReservarLiberarSelos(
  vpSequencialSelos: String; vpTravar: Boolean);
var
  visql : String;
begin
  if vpTravar then
    viSql := ' UPDATE G_SELO_LIVRO SET RESERVADO = ''S'''+
             ' WHERE SELO_LIVRO_ID IN ('+vpSequencialSelos+')'
  else
    viSql := ' UPDATE G_SELO_LIVRO SET RESERVADO = ''N'''+
             ' WHERE RESERVADO = ''S''';
  ExecutaSqlAuxiliar(visql, 1);
end;

end.