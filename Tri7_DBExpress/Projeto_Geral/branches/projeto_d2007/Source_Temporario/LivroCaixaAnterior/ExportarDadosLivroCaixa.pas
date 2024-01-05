unit ExportarDadosLivroCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxLabel, StdCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, ExtCtrls, cxButtons, DBClient, cxImageComboBox, ComCtrls, SimpleDS,
  cxCurrencyEdit;

type
  TSeloDados = Record
    Qtd : Integer;
    Emolumento, Fermoju, ValorSelo : Currency;
    SeloInicial, SeloFinal : String;
  End;

  TfrmExportarDadosLivroCaixa = class(TForm)
    btnConfimarDoi: TcxButton;
    Panel1: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    cxLabel7: TcxLabel;
    grdPesquisa: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    cxGridPesquisaFermoju: TcxGridDBColumn;
    cxGridPesquisaFerc: TcxGridDBColumn;
    ClientFermoju: TClientDataSet;
    dtsFermoju: TDataSource;
    ClientFermojuSELO_INICIAL: TStringField;
    ClientFermojuSELO_FINAL: TStringField;
    ClientFermojuEMOLUMENTO: TCurrencyField;
    ClientFermojuFERMOJU: TCurrencyField;
    ClientFermojuVALOR_SELO: TCurrencyField;
    ClientFermojuTOTAL: TCurrencyField;
    ClientFermojuDATA: TDateField;
    ClientFermojuVALOR_DOCUMENTO: TCurrencyField;
    cxGridPesquisaColumn12: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    edtPesqDataInicial: TcxDateEdit;
    edtPesqDataFinal: TcxDateEdit;
    btnPesquisar: TcxButton;
    btnConfirmar: TcxButton;
    ClientFermojuQTD_ATOS: TIntegerField;
    cxGridPesquisaColumn13: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    ClientFermojuPROTOCOLO: TStringField;
    ClientFermojuLIVRO: TStringField;
    ClientFermojuFOLHA: TStringField;
    ClientFermojuSERVICO_CAIXA_ID: TIntegerField;
    ClientFermojuATO_TIPO: TStringField;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    ClientFermojuISS: TCurrencyField;
    cxGridPesquisaISS: TcxGridDBColumn;
    cxGridPesquisaColumn10: TcxGridDBColumn;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    ClientFermojuSITUACAO: TStringField;
    ClientFermojuSERVENTIA: TStringField;
    sqlPrenotacao: TSimpleDataSet;
    sqlPrenotacaoEMOLUMENTO: TFMTBCDField;
    sqlPrenotacaoQTD: TFMTBCDField;
    sqlPrenotacaoDATA_PEDIDO: TSQLTimeStampField;
    sqlPrenotacaoSERVICO_CAIXA_ID: TFMTBCDField;
    sqlPrenotacaoDESCRICAO: TStringField;
    sqlPrenotacaoSERVENTIA_REGISTRO_DIARIO: TStringField;
    OpenDialog1: TOpenDialog;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    procedure CarregarSqlPrenotacao;
    procedure ImportarArquivoProtesto;
    procedure PreencherDadosGerais;
  public
    { Public declarations }
  end;

var
  frmExportarDadosLivroCaixa: TfrmExportarDadosLivroCaixa;
  vlSeloDados : array[1..2] of TSeloDados;

implementation

uses Controles, Lookup, Rotinas;

{$R *.dfm}

procedure TfrmExportarDadosLivroCaixa.btnConfirmarClick(Sender: TObject);
var
  viValorFermoju, viValorFERC, viValorISS : Currency;
  viCodigoRegistroAuto : String;
  viRegistroDiarioId : Integer;
begin
  if Application.MessageBox('Confirma Envio de Dados para o Livro Caixa?', 'Pergunta', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
    Exit;

  ClientFermoju.First;
  viValorFermoju := 0;
  viValorFERC    := 0;
  viValorISS     := 0;
  Screen.Cursor := crHourGlass;

  while not ClientFermoju.eof do
  begin
    // Verifica se este registro ja foi registrado
    try
      viCodigoRegistroAuto := RetirarBarra(ClientFermojuDATA.AsString)+
                              ClientFermojuSERVICO_CAIXA_ID.AsString+
                              ClientFermojuSELO_INICIAL.AsString+ClientFermojuTOTAL.AsString;
    except

    end;
    viRegistroDiarioId := dtmControles.GetInt(' SELECT REGISTRO_DIARIO_ID FROM C_REGISTRO_DIARIO WHERE CODIGO_REGISTRO_AUTO = '+QuotedStr(viCodigoRegistroAuto));
    ClientFermoju.Edit;
    if viRegistroDiarioId > 0 then
    begin
      ClientFermojuSITUACAO.asString := '3';
      ClientFermoju.Post;
      ClientFermoju.Next;
      continue;
    end;

    vgLivroDiario.Descricao          := ClientFermojuAto_Tipo.AsString;
    vgLivroDiario.Serventia          := ClientFermojuSERVENTIA.AsString;
    vgLivroDiario.Apresentante       := 'REGISTRO AUTOMATICO';
    vgLivroDiario.Valor              := ClientFermojuEMOLUMENTO.AsCurrency;
    vgLivroDiario.Operacao           := 'C';
    vgLivroDiario.Data               := ClientFermojuDATA.AsDateTime;
    vgLivroDiario.Qtd                := ClientFermojuQTD_ATOS.AsInteger;
    vgLivroDiario.Escrevente         := StrToInt(vgUsuarioID);
    vgLivroDiario.CaixaServicoID     := ClientFermojuSERVICO_CAIXA_ID.AsInteger;
    vgLivroDiario.ControleID         := 0;
    if ClientFermojuSELO_INICIAL.AsString <> '' then
         vgLivroDiario.Selo          := ClientFermojuSELO_INICIAL.AsString +' a '+ ClientFermojuSELO_FINAL.AsString
    else vgLivroDiario.Selo          := '';
    vgLivroDiario.LIvro              := ClientFermojuLIVRO.AsString;
    vgLivroDiario.Folha              := ClientFermojuFOLHA.AsString;
    vgLivroDiario.CodigoRegistroAuto := viCodigoRegistroAuto;

    if (ClientFermojuPROTOCOLO.AsVariant <> null) and (ClientFermojuPROTOCOLO.AsString <> '') then
         vgLivroDiario.Protocolo    := ClientFermojuPROTOCOLO.AsInteger
    else vgLivroDiario.Protocolo    := 0;
    dtmLookup.RegistrarLivroDiario;

    viValorFermoju := viValorFermoju + ClientFermojuFERMOJU.AsCurrency;
    viValorFERC    := viValorFermoju + ClientFermojuVALOR_SELO.AsCurrency;
    viValorISS     := viValorFermoju + ClientFermojuISS.AsCurrency;
    ClientFermojuSITUACAO.AsString := '2';
    ClientFermoju.Post;

    ClientFermoju.Next;
  end;

  Screen.Cursor := crDefault;
  Application.MessageBox('Envio registrado com sucesso!', 'AteInformaçãonção', MB_OK + MB_ICONINFORMATION);
  edtPesqDataInicial.clear;
  edtPesqDataFinal.Clear;
  btnConfirmar.Enabled := False;
end;

procedure TfrmExportarDadosLivroCaixa.btnPesquisarClick(Sender: TObject);
  procedure PesquisarAtoEscrituras;
  var
    viProtocolo : String;
  begin
    ExecutaSqlAuxiliar('SELECT AV.EMOLUMENTO, AV.TAXA_JUDICIARIA, AV.VALOR_OUTRA_TAXA1, AV.QUANTIDADE, '+
                       '       A.DATA_LAVRATURA, AV.VALOR_DOCUMENTO, AV.FUNDESP, SL.SIGLA, '+
                       '      (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) AS NUMEROSIGLA, '+
                       '       A.FOLHA_INICIAL, A.FOLHA_FINAL, A.PROTOCOLO, LA.NUMERO_LIVRO, '+
                       '       E.SERVICO_CAIXA_ID, TA.DESCRICAO AS ATO_TIPO '+
                       ' FROM T_ATO A LEFT OUTER JOIN T_ATO_VINCULOVALOR AV ON '+
                       '    A.ATO_ID = AV.ATO_ID '+
                       '    LEFT OUTER JOIN G_EMOLUMENTO E ON '+
                       '    AV.EMOLUMENTO_ID = E.EMOLUMENTO_ID '+
                       '    LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
                       '    SL.CAMPO_ID = A.ATO_ID AND '+
                       '    SL.TABELA = '+QuotedStr('T_ATO')+
                       '    LEFT OUTER JOIN T_LIVRO_ANDAMENTO LA ON '+
                       '    A.LIVRO_ANDAMENTO_ID = LA.LIVRO_ANDAMENTO_ID '+
                       '    LEFT OUTER JOIN T_ATO_TIPO TA ON '+
                       '    A.ATO_TIPO_ID = TA.ATO_TIPO_ID '+
                       ' WHERE (A.DATA_LAVRATURA '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
                       '   ORDER BY SERVICO_CAIXA_ID, NUMERO_LIVRO, FOLHA_INICIAL, PROTOCOLO, DATA ',0);
    dtmControles.sqlAuxiliar.First;
    viProtocolo := '0';
    while not dtmControles.sqlAuxiliar.eof do
    begin
      if viProtocolo <> dtmControles.sqlAuxiliar.FieldByName('PROTOCOLO').AsString then
      begin
        ClientFermoju.Append;
        ClientFermojuQTD_ATOS.AsInteger         := dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger;
        ClientFermojuDATA.AsDateTime            := dtmControles.sqlAuxiliar.FieldByName('DATA_LAVRATURA').AsDateTime;
        ClientFermojuEMOLUMENTO.AsCurrency      := dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency;
        ClientFermojuFERMOJU.AsCurrency         := dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency;
        ClientFermojuVALOR_SELO.AsCurrency      := dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency;
        ClientFermojuVALOR_DOCUMENTO.AsCurrency := dtmControles.sqlAuxiliar.FieldByName('VALOR_DOCUMENTO').AsCurrency;
        ClientFermojuTOTAL.AsCurrency           := ClientFermojuEMOLUMENTO.AsCurrency;
        ClientFermojuSELO_INICIAL.AsString      := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
        ClientFermojuSELO_FINAL.AsString        := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
        ClientFermojuPROTOCOLO.AsString         := dtmControles.sqlAuxiliar.FieldByName('PROTOCOLO').AsString;

        if dtmControles.sqlAuxiliar.FieldByName('FOLHA_INICIAL').AsString = dtmControles.sqlAuxiliar.FieldByName('FOLHA_FINAL').AsString then
             ClientFermojuFOLHA.AsString := dtmControles.sqlAuxiliar.FieldByName('FOLHA_INICIAL').AsString + ' a ' +
                                            dtmControles.sqlAuxiliar.FieldByName('FOLHA_FINAL').AsString
        else ClientFermojuFOLHA.AsString := dtmControles.sqlAuxiliar.FieldByName('FOLHA_INICIAL').AsString;

        ClientFermojuLIVRO.AsString            := dtmControles.sqlAuxiliar.FieldByName('NUMERO_LIVRO').AsString;
        ClientFermojuSERVICO_CAIXA_ID.AsString := dtmControles.sqlAuxiliar.FieldByName('SERVICO_CAIXA_ID').AsString;
        ClientFermojuATO_TIPO.AsString         := dtmControles.sqlAuxiliar.FieldByName('ATO_TIPO').AsString;
        ClientFermojuISS.AsString              := dtmControles.sqlAuxiliar.FieldByName('FUNDESP').AsString;
      end
      else
      begin
        ClientFermoju.Edit;
        ClientFermojuSELO_FINAL.AsString       := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
        ClientFermojuEMOLUMENTO.AsCurrency     := dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency / ClientFermojuQTD_ATOS.AsInteger;
      end;

      ClientFermojuSERVENTIA.AsString  := '1';
      ClientFermojuSITUACAO.asString   := '1';
      ClientFermoju.Post;
      viProtocolo := dtmControles.sqlAuxiliar.FieldByName('PROTOCOLO').AsString;
      dtmControles.sqlAuxiliar.next;
    end;
  end;

  procedure PesquisarAtosCaixa;
  var
    viCont : Integer;
    viQtdTotalGeral : Integer;

    // Verifica se a Numereção Inicial do selos Utilizados e Anumeração Final são do Mesmo Lote.
    // Caso, não seja, faz a separação do mesmo.
    procedure VerificarNumeracaoSelo;
    var
      viNumeroInicial, viNumeroFinal, viQtdParcial, viQtdTotal, viNovoFinal1, viNovoInicio2 : Integer;
    begin
      viNumeroInicial := StrToInt(RetornaNumerico(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString));
      viNumeroFinal   := StrToInt(RetornaNumerico(dtmControles.sqlAuxiliar.FieldByName('SELO_FINAL').AsString));
      viQtdTotal      := viQtdTotalGeral;

      if (viNumeroFinal - viNumeroInicial)+1 = viQtdTotal then
      begin
        vlSeloDados[2].SeloInicial := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2) + FormatFloat('000000',viNumeroInicial);
        vlSeloDados[2].SeloFinal   := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_FINAL').AsString,1,2) + FormatFloat('000000',viNumeroFinal);
        vlSeloDados[2].Qtd         := viQtdTotalGeral;
        vlSeloDados[2].Emolumento  := dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency;
        vlSeloDados[2].Fermoju     := dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency;
        vlSeloDados[2].ValorSelo   := dtmControles.sqlAuxiliar.FieldByName('OUTRA_TAXA1').AsCurrency;
        viCont := 1;
        exit;
      end;

      // Procura e Armazena Dados do 1º Lote
      viNovoFinal1 := dtmControles.GetInt(' SELECT NUMERO_FINAL FROM G_SELO_LOTE '+
                                          ' WHERE SELO_LOTE_ID = (SELECT SELO_LOTE_ID FROM G_SELO_LIVRO '+
                                          '           WHERE NUMERO = '+ IntToStr(viNumeroInicial)+
                                          '           AND SIGLA = '+ QuotedStr(COPY(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2))+')');
      viQtdParcial               := (viNovoFinal1 - viNumeroInicial)+1;
      vlSeloDados[1].SeloInicial := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2) + FormatFloat('000000',viNumeroInicial);
      vlSeloDados[1].SeloFinal   := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2) + FormatFloat('000000',viNovoFinal1);
      vlSeloDados[1].Qtd         := viQtdParcial;
      vlSeloDados[1].Emolumento  := (dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency/viQtdTotal)*viQtdParcial;
      vlSeloDados[1].Fermoju     := (dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency/viQtdTotal)*viQtdParcial;
      vlSeloDados[1].ValorSelo   := (dtmControles.sqlAuxiliar.FieldByName('OUTRA_TAXA1').AsCurrency/viQtdTotal)*viQtdParcial;

      // Procura e Armazena Dados do 2º Lote
      viNovoInicio2 := dtmControles.GetInt(' SELECT NUMERO_INICIAL FROM G_SELO_LOTE '+
                                          ' WHERE SELO_LOTE_ID = (SELECT SELO_LOTE_ID FROM G_SELO_LIVRO '+
                                          '                      WHERE NUMERO = '+ IntToStr(viNumeroFinal)+
                                          '   AND SIGLA = '+ QuotedStr(COPY(dtmControles.sqlAuxiliar.FieldByName('SELO_FINAL').AsString,1,2))+')');
      viQtdParcial               := (viNumeroFinal - viNovoInicio2)+1;
      vlSeloDados[2].SeloInicial := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_FINAL').AsString,1,2) + FormatFloat('000000',viNovoInicio2);
      vlSeloDados[2].SeloFinal   := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_FINAL').AsString,1,2) + FormatFloat('000000',viNumeroFinal);
      vlSeloDados[2].Qtd         := viQtdParcial;
      vlSeloDados[2].Emolumento  := (dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency/viQtdTotal)*viQtdParcial;
      vlSeloDados[2].Fermoju     := (dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency/viQtdTotal)*viQtdParcial;
      vlSeloDados[2].ValorSelo   := (dtmControles.sqlAuxiliar.FieldByName('OUTRA_TAXA1').AsCurrency/viQtdTotal)*viQtdParcial;
    end;

  begin
    ExecutaSqlAuxiliar(' SELECT CR.*, SG.DESCRICAO AS TIPO '+
                       ' FROM C_CAIXA_REGISTROSELO CR LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
                       '       CR.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
                       ' WHERE (DATA '+MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')',0);
    dtmControles.sqlAuxiliar.First;
    while not dtmControles.sqlAuxiliar.eof do
    begin
      viCont := 0;
      viQtdTotalGeral := dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger + (dtmControles.sqlAuxiliar.FieldByName('QTD_CORRECAO').AsInteger);
      VerificarNumeracaoSelo;
      repeat
        Inc(viCont);
        ClientFermoju.Append;
        ClientFermojuQTD_ATOS.AsInteger         := vlSeloDados[viCont].Qtd;
         ClientFermojuDATA.AsDateTime           := dtmControles.sqlAuxiliar.FieldByName('DATA').AsDateTime;
        ClientFermojuEMOLUMENTO.AsCurrency      := vlSeloDados[viCont].Emolumento / ClientFermojuQTD_ATOS.AsInteger;
        ClientFermojuFERMOJU.AsCurrency         := vlSeloDados[viCont].Fermoju;
        ClientFermojuVALOR_SELO.AsCurrency      := vlSeloDados[viCont].ValorSelo;
        ClientFermojuVALOR_DOCUMENTO.AsCurrency := 0;
        ClientFermojuTOTAL.AsCurrency           := vlSeloDados[viCont].Emolumento;
        ClientFermojuSELO_INICIAL.AsString      := vlSeloDados[viCont].SeloInicial;
        ClientFermojuSELO_FINAL.AsString        := vlSeloDados[viCont].SeloFinal;
        ClientFermojuFOLHA.AsString             := '';
        ClientFermojuLIVRO.AsString             := '';

        case dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger of
          2001 : ClientFermojuSERVICO_CAIXA_ID.AsString := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_RECONHECIMENTO', 'I');
          2002 : ClientFermojuSERVICO_CAIXA_ID.AsString := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_AUTENTICACAO', 'I');
          2006 : ClientFermojuSERVICO_CAIXA_ID.AsString := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_ABERTURAFIRMA', 'I');
          2021 : ClientFermojuSERVICO_CAIXA_ID.AsString := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_RECONHECIMENTO', 'I');
        end;

        ClientFermojuATO_TIPO.AsString  := dtmControles.sqlAuxiliar.FieldByName('TIPO').AsString;
        ClientFermojuISS.AsString       := dtmControles.sqlAuxiliar.FieldByName('ISS').AsString;
        ClientFermojuSITUACAO.asString  := '1';
        ClientFermojuSERVENTIA.AsString := '1';
        ClientFermoju.Post;
      until viCont = 2;
      dtmControles.sqlAuxiliar.next;
    end;
  end;

  procedure InserirPrenotacacao(vpQtd : Integer; vpData : TDateTime);
  begin
    ClientFermoju.Append;
    PreencherDadosGerais;
    ClientFermojuQTD_ATOS.AsInteger         := vpQtd;
    ClientFermojuEMOLUMENTO.AsCurrency      := (sqlPrenotacaoEMOLUMENTO.AsCurrency / sqlPrenotacaoQTD.AsInteger);
    ClientFermojuTOTAL.AsCurrency           := (ClientFermojuEMOLUMENTO.AsCurrency * vpQtd);
    ClientFermojuDATA.AsDateTime            := vpData;
    ClientFermojuSERVICO_CAIXA_ID.AsString  := sqlPrenotacaoSERVICO_CAIXA_ID.AsString;
    ClientFermojuATO_TIPO.AsString          := MaiusculoMinusculo(sqlPrenotacaoDESCRICAO.AsString);
    ClientFermojuSERVENTIA.AsString         := sqlPrenotacaoSERVENTIA_REGISTRO_DIARIO.AsString;
    ClientFermoju.Post;
  end;

  procedure PesquisarServicosAgrupados(vpTipo, vpAgrupacaoAdicional : String);
  begin
     CarregarSqlPrenotacao;
     ExecutaSqlAuxiliar(' SELECT SUM(COALESCE(PI.QTD,0)) AS QTD, '+
                       '         SUM(COALESCE(PI.EMOLUMENTO,0)) AS EMOLUMENTO, '+
                       '         P.DATA_PEDIDO, ST.SERVICO_CAIXA_ID, ST.DESCRICAO, CS.SERVENTIA_REGISTRO_DIARIO '+
                       ' FROM T_SERVICO_ITEMPEDIDO PI '+
                       '      LEFT OUTER JOIN T_SERVICO_PEDIDO P ON '+
                       '      PI.SERVICO_PEDIDO_ID = P.SERVICO_PEDIDO_ID '+
                       '      LEFT OUTER JOIN T_SERVICO_TIPO ST ON '+
                       '      PI.SERVICO_TIPO_ID = ST.SERVICO_TIPO_ID '+
                       '      LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
                       '      ST.SERVICO_CAIXA_ID = CS.CAIXA_SERVICO_ID '+
                       ' WHERE PI.SITUACAO = '+ QuotedStr('F')+
                       '   AND ST.LIVRO_CAIXA = '+QuotedStr(vpTipo)+
                       '   AND P.DATA_PEDIDO '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+
                       ' GROUP BY P.DATA_PEDIDO, ST.SERVICO_CAIXA_ID, ST.DESCRICAO, CS.SERVENTIA_REGISTRO_DIARIO '+vpAgrupacaoAdicional,0);

    while not dtmControles.sqlAuxiliar.eof do
    begin
      PreencherDadosGerais;
      ClientFermoju.Append;
      ClientFermojuQTD_ATOS.AsInteger         := dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger;
      ClientFermojuEMOLUMENTO.AsCurrency      := dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency/dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger;
      ClientFermojuTOTAL.AsCurrency           := dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency;
      ClientFermojuDATA.AsDateTime            := dtmControles.sqlAuxiliar.FieldByName('DATA_PEDIDO').AsDateTime;
      ClientFermojuSERVICO_CAIXA_ID.AsString  := dtmControles.sqlAuxiliar.FieldByName('SERVICO_CAIXA_ID').AsString;
      ClientFermojuATO_TIPO.AsString          := MaiusculoMinusculo(dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString);
      ClientFermojuSERVENTIA.AsString         := dtmControles.sqlAuxiliar.FieldByName('SERVENTIA_REGISTRO_DIARIO').AsString;
      ClientFermoju.Post;

      if vpTipo = '2' then
        InserirPrenotacacao(ClientFermojuQTD_ATOS.AsInteger,  ClientFermojuDATA.AsDateTime);

      dtmControles.sqlAuxiliar.next;
    end;
  end;

begin
  VerificarPreenchimentoDTA_TX(edtPesqDataInicial.Text, 'Data Inicial',edtPesqDataInicial);
  VerificarPreenchimentoDTA_TX(edtPesqDataFinal.Text, 'Data Final',edtPesqDataFinal);

  Screen.Cursor := crHourGlass;
  ClientFermoju.DisableControls;
  ClientFermoju.EmptyDataSet;
  PesquisarAtoEscrituras;
  PesquisarAtosCaixa;
  PesquisarServicosAgrupados('1','');
  PesquisarServicosAgrupados('2',', PI.EMOLUMENTO');
  Screen.Cursor := crDefault;
  ClientFermoju.EnableControls;
  btnConfirmar.Enabled := not ClientFermoju.IsEmpty;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmExportarDadosLivroCaixa.CarregarSqlPrenotacao;
var
  visql : string;
begin
  visql:= 'SELECT FIRST 1 PI.EMOLUMENTO, PI.QTD, P.DATA_PEDIDO, ST.SERVICO_CAIXA_ID, ST.DESCRICAO, CS.SERVENTIA_REGISTRO_DIARIO '+
        ' FROM T_SERVICO_ITEMPEDIDO PI '+
        '      LEFT OUTER JOIN T_SERVICO_PEDIDO P ON '+
        '      PI.SERVICO_PEDIDO_ID = P.SERVICO_PEDIDO_ID '+
        '      LEFT OUTER JOIN T_SERVICO_TIPO ST ON '+
        '      PI.SERVICO_TIPO_ID = ST.SERVICO_TIPO_ID '+
        '      LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
        '      ST.SERVICO_CAIXA_ID = CS.CAIXA_SERVICO_ID '+
        ' WHERE PI.SITUACAO = '+ QuotedStr('F')+
        '   AND ST.LIVRO_CAIXA = '+QuotedStr('3')+
        '   AND P.DATA_PEDIDO '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date);
  sqlPrenotacao.Active := False;
  sqlPrenotacao.DataSet.CommandText := visql;
  sqlPrenotacao.Active := True;
end;

procedure TfrmExportarDadosLivroCaixa.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExportarDadosLivroCaixa.cxButton1Click(Sender: TObject);
begin
  ImportarArquivoProtesto;
end;

procedure TfrmExportarDadosLivroCaixa.FormActivate(Sender: TObject);
begin
  sqlPrenotacao.Connection := dtmControles.DB;
  edtPesqDataInicial.SetFocus;
end;

procedure TfrmExportarDadosLivroCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlPrenotacao.Active := False;

  Action                     := caFree;
  frmExportarDadosLivroCaixa := nil;
end;

procedure TfrmExportarDadosLivroCaixa.ImportarArquivoProtesto;
var
  viArq     : TStringList;
  vilinha, viValor : String;
  i : Integer;

  Function CapturaValor(var vpLinha : String):String;
  begin
    Result := copy(vpLinha, 1, pos(';', vpLinha)-1);
    Delete(vpLinha,1, length(Result)+1);
  end;

begin

  if not OpenDialog1.Execute then
    exit;

  if Application.MessageBox('Confirma a Importação do Arquivo Selecionado?', 'Confirmação', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON1) = IDNO then
    exit;

   viArq := TStringList.Create;
   viArq.LoadFromFile(OpenDialog1.FileName);

  Screen.Cursor := crHourGlass;
//  AssignFile ( arq, OpenDialog1.FileName);
//  Reset ( arq );

  ClientFermoju.EmptyDataSet;

  for i := 1 to viArq.Count do

//    Readln ( arq, vilinha );
    ClientFermoju.Append;
    PreencherDadosGerais;

    viValor := CapturaValor(vilinha);
    ClientFermojuDATA.AsString := TrocaPtoPBarra(viValor);

    viValor := CapturaValor(vilinha);
    if viValor[1] = '3' then
         ClientFermojuSERVICO_CAIXA_ID.AsString  := '19'
    else ClientFermojuSERVICO_CAIXA_ID.AsString  := '22';

    viValor := CapturaValor(vilinha);
    ClientFermojuATO_TIPO.AsString := MaiusculoMinusculo(viValor);

    viValor := CapturaValor(vilinha);
    ClientFermojuEMOLUMENTO.AsCurrency := StrToCurr(viValor);

    viValor := CapturaValor(vilinha);
    ClientFermojuQTD_ATOS.AsString  := viValor;

    viValor := CapturaValor(vilinha);
    ClientFermojuTOTAL.AsCurrency := StrToCurr(viValor);

    viValor := CapturaValor(vilinha);
    ClientFermojuSERVENTIA.AsString := viValor;
    ClientFermoju.Post;
  until arq.

end;

procedure TfrmExportarDadosLivroCaixa.PreencherDadosGerais;
begin
  ClientFermojuFERMOJU.AsCurrency         := 0;
  ClientFermojuVALOR_SELO.AsCurrency      := 0;
  ClientFermojuVALOR_DOCUMENTO.AsCurrency := 0;
  ClientFermojuSELO_INICIAL.AsString      := '';
  ClientFermojuSELO_FINAL.AsString        := '';
  ClientFermojuPROTOCOLO.AsString         := '';
  ClientFermojuFOLHA.AsString             := '';
  ClientFermojuLIVRO.AsString             := '';
  ClientFermojuISS.AsCurrency             := 0;
  ClientFermojuSITUACAO.AsString          := '1';
end;

end.




