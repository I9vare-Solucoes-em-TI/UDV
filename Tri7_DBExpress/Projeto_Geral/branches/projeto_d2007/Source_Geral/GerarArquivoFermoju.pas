unit GerarArquivoFermoju;

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
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxCore, cxDateUtils,
  cxNavigator, cxPCdxBarPopupMenu, cxPC, cxCheckBox;

type
  TSeloDados = Record
    Qtd : Integer;
    Emolumento, Fermoju, ValorSelo : Currency;
    SeloInicial, SeloFinal : String;
  End;

  TfrmGerarArquivoFermoju = class(TForm)
    btnConfimarDoi: TcxButton;
    Panel1: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    cxLabel7: TcxLabel;
    ClientFermoju: TClientDataSet;
    dtsFermoju: TDataSource;
    ClientFermojuCODIGO: TIntegerField;
    ClientFermojuSELO_INICIAL: TStringField;
    ClientFermojuSELO_FINAL: TStringField;
    ClientFermojuEMOLUMENTO: TCurrencyField;
    ClientFermojuFERMOJU: TCurrencyField;
    ClientFermojuVALOR_SELO: TCurrencyField;
    ClientFermojuTOTAL: TCurrencyField;
    ClientFermojuDATA: TDateField;
    ClientFermojuSELO_GRUPO_ID: TIntegerField;
    SaveDialog1: TSaveDialog;
    ClientFermojuSELO_TIPO: TStringField;
    ClientFermojuVALOR_DOCUMENTO: TCurrencyField;
    ClientFermojuTIPO_MOVIMENTACAO: TStringField;
    richSelo: TMemo;
    cxLabel1: TcxLabel;
    edtPesqDataInicial: TcxDateEdit;
    edtPesqDataFinal: TcxDateEdit;
    btnPesquisar: TcxButton;
    btnConfirmar: TcxButton;
    ClientFermojuQTD_ATOS: TIntegerField;
    ClientFermojuQTD_SELOS: TIntegerField;
    tbcFermoju: TcxTabControl;
    grdPesquisa: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn13: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn11: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    cxGridPesquisaColumn8: TcxGridDBColumn;
    cxGridPesquisaColumn9: TcxGridDBColumn;
    cxGridPesquisaColumn10: TcxGridDBColumn;
    cxGridPesquisaColumn12: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ClientFermojuDEDUTIVEL: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tbcFermojuChange(Sender: TObject);
  private
    procedure CriarArquivoXML; 
  public
    { Public declarations }
  end;

var
  frmGerarArquivoFermoju: TfrmGerarArquivoFermoju;
  vlSeloDados : array[1..5] of TSeloDados;

implementation

uses Controles, Lookup, Rotinas;

{$R *.dfm}

procedure TfrmGerarArquivoFermoju.btnConfirmarClick(Sender: TObject);
begin
  CriarArquivoXML;
end;

procedure TfrmGerarArquivoFermoju.btnPesquisarClick(Sender: TObject);
var
  SQL: TSimpleDataSet;

  procedure PesquisarProcuracaoEOutros;
  var
    viQtdAtos, viQtdSelos, viNumeroSequencia, viCodigo, viGrupoId, viCodigoAto : Integer;
    viNumeroInicial, viNumeroFinal, viTipo : String;
    viEmolumentos, viTaxa, viOutraTaxa : Currency;
    viNumeroInicical : String;
    viData : TDate;

    procedure GravarRegistro;
    begin
      ClientFermoju.Insert;
      ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';
      ClientFermojuQTD_ATOS.AsInteger         := viQtdSelos;
      ClientFermojuQTD_SELOS.AsInteger        := viQtdSelos;
      ClientFermojuDATA.AsDateTime            := viData;
      ClientFermojuCODIGO.AsInteger           := viCodigo;
      ClientFermojuEMOLUMENTO.AsCurrency      := viEmolumentos;
      ClientFermojuFERMOJU.AsCurrency         := viTaxa;
      ClientFermojuVALOR_SELO.AsCurrency      := viOutraTaxa;
      ClientFermojuVALOR_DOCUMENTO.AsCurrency := 0;
      ClientFermojuTOTAL.AsCurrency           := viEmolumentos + viTaxa + viOutraTaxa;
      ClientFermojuSELO_GRUPO_ID.AsInteger    := viGrupoId;
      ClientFermojuSELO_TIPO.AsString         := viTipo;
      ClientFermojuSELO_INICIAL.AsString      := viNumeroInicial;
      ClientFermojuSELO_FINAL.AsString        := viNumeroFinal;
      ClientFermoju.Post;
    end;

    procedure CapturarRegistro;
    begin
      viNumeroSequencia := dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsInteger;
      viNumeroFinal     := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
      viCodigo          := dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger;
      viData            := dtmControles.sqlAuxiliar.FieldByName('DATA_LAVRATURA').AsDateTime;
      viEmolumentos     := viEmolumentos + (dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency / dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger);
      viTaxa            := viTaxa + (dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency  / dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger);
      viQtdSelos        := viQtdSelos + 1;

      if viCodigoAto <> dtmControles.sqlAuxiliar.FieldByName('ATO_ID').AsInteger then
        viQtdAtos      := viQtdAtos + 1;

      viOutraTaxa       := viOutraTaxa + (dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency / dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger);
      viGrupoId         := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
      viTipo            := dtmControles.GetStr('SELECT NUMERO FROM G_SELO_GRUPO WHERE SELO_GRUPO_ID = '+dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString);
      viCodigoAto       := dtmControles.sqlAuxiliar.FieldByName('ATO_ID').AsInteger;
    end;

    procedure IniciarContagem;
    begin
      viEmolumentos   := 0;
      viTaxa          := 0;
      viQtdAtos       := 0;
      viQtdSelos      := 0;      
      viOutraTaxa     := 0;
      viNumeroInicial := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
    end;

  begin
    ExecutaSqlAuxiliar('SELECT AV.EMOLUMENTO, AV.TAXA_JUDICIARIA, AV.VALOR_OUTRA_TAXA1, AV.QUANTIDADE, '+
                       '       EI.CODIGO, A.DATA_LAVRATURA, A.ATO_ID, E.SELO_GRUPO_ID, AV.VALOR_DOCUMENTO, '+
                       '       (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) AS NUMEROSIGLA, SL.NUMERO '+
                       ' FROM T_ATO A LEFT OUTER JOIN T_ATO_VINCULOVALOR AV ON '+
                       '    A.ATO_ID = AV.ATO_ID '+
                       '    LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
                       '    AV.EMOLUMENTO_ITEM_ID = EI.EMOLUMENTO_ITEM_ID '+
                       '    LEFT OUTER JOIN G_EMOLUMENTO E ON '+
                       '    AV.EMOLUMENTO_ID = E.EMOLUMENTO_ID '+
                       '    LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
                       '    SL.CAMPO_ID = A.ATO_ID AND '+
                       '    SL.TABELA = '+QuotedStr('T_ATO')+
                       ' WHERE (A.DATA_LAVRATURA '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
                       '   AND (AV.VALOR_DOCUMENTO IS NULL OR AV.VALOR_DOCUMENTO = 0)'+
                       '   AND A.NATUREZA_ID IN (1,2,3,4)'+
                       ' ORDER BY DATA_LAVRATURA, NUMEROSIGLA ',0);
    dtmControles.sqlAuxiliar.First;

    if dtmControles.sqlAuxiliar.IsEmpty then
      exit;

    IniciarContagem;
    CapturarRegistro;
    repeat
      dtmControles.sqlAuxiliar.next;
      if not dtmControles.sqlAuxiliar.eof and
         ((viNumeroSequencia+1) = dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsInteger) and
         (viCodigo = dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger) and
         (viGrupoId = dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger) and
         (viData = dtmControles.sqlAuxiliar.FieldByName('DATA_LAVRATURA').AsDateTime) then
      begin
        CapturarRegistro
      end
      else
      begin
        GravarRegistro;
        if not dtmControles.sqlAuxiliar.eof then
        begin
          IniciarContagem;
          CapturarRegistro
        end;
      end;
    until dtmControles.sqlAuxiliar.eof;
  end;

  procedure PesquisarAtoEscrituras;
  begin
    ExecutaSqlAuxiliar('SELECT AV.EMOLUMENTO, AV.TAXA_JUDICIARIA, AV.VALOR_OUTRA_TAXA1, AV.QUANTIDADE, A.CALCULO_DEDUTIVEL, '+
                       '       EI.CODIGO, A.DATA_LAVRATURA, E.SELO_GRUPO_ID, AV.VALOR_DOCUMENTO, SL.SIGLA, '+
                       '      (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) AS NUMEROSIGLA '+
                       ' FROM T_ATO A LEFT OUTER JOIN T_ATO_VINCULOVALOR AV ON '+
                       '    A.ATO_ID = AV.ATO_ID '+
                       '    LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
                       '    AV.EMOLUMENTO_ITEM_ID = EI.EMOLUMENTO_ITEM_ID '+
                       '    LEFT OUTER JOIN G_EMOLUMENTO E ON '+
                       '    AV.EMOLUMENTO_ID = E.EMOLUMENTO_ID '+
                       '    LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
                       '    SL.CAMPO_ID = A.ATO_ID AND '+
                       '    SL.TABELA = '+QuotedStr('T_ATO')+
                       ' WHERE (A.DATA_LAVRATURA '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
                       '   AND AV.VALOR_DOCUMENTO > 0',0);
    dtmControles.sqlAuxiliar.First;
    while not dtmControles.sqlAuxiliar.eof do
    begin
      ClientFermoju.Insert;
      if (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 2017) OR
          (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 2031) then
           ClientFermojuTIPO_MOVIMENTACAO.AsString := 'DETALHADA'
      else ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';
      ClientFermojuQTD_ATOS.AsInteger         := dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger;
      ClientFermojuQTD_SELOS.AsInteger        := dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger;
      ClientFermojuDATA.AsDateTime            := dtmControles.sqlAuxiliar.FieldByName('DATA_LAVRATURA').AsDateTime;
      ClientFermojuCODIGO.AsString            := dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsString;
      ClientFermojuEMOLUMENTO.AsCurrency      := Arredondamento(dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency,2);
      ClientFermojuFERMOJU.AsCurrency         := Arredondamento(dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency,2);
      ClientFermojuVALOR_SELO.AsCurrency      := Arredondamento(dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency,2);
      ClientFermojuVALOR_DOCUMENTO.AsCurrency := dtmControles.sqlAuxiliar.FieldByName('VALOR_DOCUMENTO').AsCurrency;
      ClientFermojuTOTAL.AsCurrency           := Arredondamento((ClientFermojuEMOLUMENTO.AsCurrency + ClientFermojuFERMOJU.AsCurrency +
                                                 ClientFermojuVALOR_SELO.AsCurrency),2);
      ClientFermojuSELO_GRUPO_ID.AsInteger    := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
      ClientFermojuSELO_TIPO.AsString         := dtmControles.GetStr('SELECT NUMERO FROM G_SELO_GRUPO WHERE SELO_GRUPO_ID = '+dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString);
      ClientFermojuSELO_INICIAL.AsString      := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
      ClientFermojuSELO_FINAL.AsString        := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
      ClientFermojuDEDUTIVEL.AsString         := dtmControles.sqlAuxiliar.FieldByName('CALCULO_DEDUTIVEL').AsString;
      ClientFermoju.Post;
      dtmControles.sqlAuxiliar.next;
    end;
  end;

  procedure PesquisarAtosCaixa;
  var
    viCont : Integer;
    viQtdTotalGeral, viQtdAdicional : Integer;

    // Verifica se a Numere��o Inicial do selos Utilizados e Anumera��o Final s�o do Mesmo Lote.
    // Caso, n�o seja, faz a separa��o do mesmo.
    procedure VerificarNumeracaoSelo;
    var
      viNumeroInicial, viNumeroFinal, viQtdParcial, viQtdTotal, viNovoFinal1,
      viNovoInicio2, viQtdTotalParcial : Integer;
      viBreak : Boolean;
      viSigla : String;
    begin
      viNumeroInicial := StrToInt(RetornaNumerico(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString));
      viNumeroFinal   := StrToInt(RetornaNumerico(dtmControles.sqlAuxiliar.FieldByName('SELO_FINAL').AsString));
      viQtdTotal      := viQtdTotalGeral;
      viQtdAdicional  := 2;

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

      viQtdTotalParcial := 0;
      viSigla := COPY(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2);
      // Procura e Armazena Dados do 1� Lote
      viNovoFinal1 := dtmControles.GetInt(' SELECT NUMERO_FINAL FROM G_SELO_LOTE '+
                                          ' WHERE SELO_LOTE_ID = (SELECT SELO_LOTE_ID FROM G_SELO_LIVRO '+
                                          '           WHERE NUMERO = '+ IntToStr(viNumeroInicial)+
                                          '           AND SIGLA = '+QuotedStr(viSigla)+')');
      viQtdParcial               := (viNovoFinal1 - viNumeroInicial)+1;
      vlSeloDados[1].SeloInicial := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2) + FormatFloat('000000',viNumeroInicial);
      vlSeloDados[1].SeloFinal   := Copy(dtmControles.sqlAuxiliar.FieldByName('SELO_INICIAL').AsString,1,2) + FormatFloat('000000',viNovoFinal1);
      vlSeloDados[1].Qtd         := viQtdParcial;
      vlSeloDados[1].Emolumento  := (dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency/viQtdTotal)*viQtdParcial;
      vlSeloDados[1].Fermoju     := (dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency/viQtdTotal)*viQtdParcial;
      vlSeloDados[1].ValorSelo   := (dtmControles.sqlAuxiliar.FieldByName('OUTRA_TAXA1').AsCurrency/viQtdTotal)*viQtdParcial;
      viQtdTotalParcial          :=  viQtdParcial;

      // Procura e Armazena Dados do 2� Lote
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
      viQtdTotalParcial          :=  viQtdTotalParcial + viQtdParcial;

      // Verifica se esta faltando selos
      if viQtdTotalParcial <> viQtdTotal then
      begin
        // Verifica Outros lotes do selo nesta data
        ExecutaSimpleDSAux(' SELECT ST.NUMERO_INICIAL, ST.NUMERO_FINAL '+
                           ' FROM G_SELO_LOTE ST LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
                           '   ST.SELO_LOTE_ID = SL.SELO_lOTE_ID'+
                           ' WHERE ST.SIGLA = '+QuotedStr(viSigla)+
                           '   AND (NOT ST.NUMERO_FINAL = '+IntToStr(viNovoFinal1) +
                           '   AND NOT ST.NUMERO_INICIAL = '+IntToStr(viNovoInicio2)+')'+
                           '   AND (SL.DATA '+MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
                           ' GROUP BY ST.NUMERO_INICIAL, ST.NUMERO_FINAL ',0);

        while not dtmControles.SimpleAuxiliar.Eof do
        begin
          inc(viQtdAdicional);
          viQtdParcial := dtmControles.SimpleAuxiliar.FieldByName('NUMERO_FINAL').AsInteger - dtmControles.SimpleAuxiliar.FieldByName('NUMERO_INICIAL').AsInteger + 1;
          vlSeloDados[viQtdAdicional].SeloInicial := viSigla+FormatFloat('000000',dtmControles.SimpleAuxiliar.FieldByName('NUMERO_INICIAL').AsInteger);
          vlSeloDados[viQtdAdicional].SeloFinal   := viSigla+FormatFloat('000000',dtmControles.SimpleAuxiliar.FieldByName('NUMERO_FINAL').AsInteger);
          vlSeloDados[viQtdAdicional].Qtd         := viQtdParcial;
          vlSeloDados[viQtdAdicional].Emolumento  := (dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency/viQtdTotal)*viQtdParcial;
          vlSeloDados[viQtdAdicional].Fermoju     := (dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency/viQtdTotal)*viQtdParcial;
          vlSeloDados[viQtdAdicional].ValorSelo   := (dtmControles.sqlAuxiliar.FieldByName('OUTRA_TAXA1').AsCurrency/viQtdTotal)*viQtdParcial;
          dtmControles.SimpleAuxiliar.Next;
        end;
      end;
    end;

  begin
    ExecutaSqlAuxiliar(' SELECT * FROM C_CAIXA_REGISTROSELO '+
                       ' WHERE (DATA '+MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')',0);
    dtmControles.sqlAuxiliar.First;
    while not dtmControles.sqlAuxiliar.eof do
    begin
      viCont := 0;
      viQtdTotalGeral := dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger + (dtmControles.sqlAuxiliar.FieldByName('QTD_CORRECAO').AsInteger);
      VerificarNumeracaoSelo;
      repeat
        Inc(viCont);
        ClientFermoju.Insert;
        ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';
        ClientFermojuQTD_ATOS.AsInteger         := vlSeloDados[viCont].Qtd;
        ClientFermojuQTD_SELOS.AsInteger        := vlSeloDados[viCont].Qtd;
        ClientFermojuDATA.AsDateTime            := dtmControles.sqlAuxiliar.FieldByName('DATA').AsDateTime;
        ClientFermojuCODIGO.AsString            := dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsString;
        ClientFermojuEMOLUMENTO.AsCurrency      := vlSeloDados[viCont].Emolumento;
        ClientFermojuFERMOJU.AsCurrency         := vlSeloDados[viCont].Fermoju;
        ClientFermojuVALOR_SELO.AsCurrency      := vlSeloDados[viCont].ValorSelo;
        ClientFermojuVALOR_DOCUMENTO.AsCurrency := 0;
        ClientFermojuTOTAL.AsCurrency           := vlSeloDados[viCont].Emolumento + vlSeloDados[viCont].Fermoju + vlSeloDados[viCont].ValorSelo;
        ClientFermojuSELO_INICIAL.AsString      := vlSeloDados[viCont].SeloInicial;
        ClientFermojuSELO_FINAL.AsString        := vlSeloDados[viCont].SeloFinal;
        ClientFermojuSELO_GRUPO_ID.AsInteger    := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
        ClientFermojuSELO_TIPO.AsString         := dtmControles.GetStr('SELECT NUMERO FROM G_SELO_GRUPO WHERE SELO_GRUPO_ID = '+dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString);
        ClientFermoju.Post;
      until viCont = viQtdAdicional;
      dtmControles.sqlAuxiliar.next;      
    end;
  end;

  procedure PesquisarAberturaFirma;
  var
    viServicoCaixaId : String;
  begin
    viServicoCaixaId := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'GERAL', 'SERVICO_CAIXA_ABERTURAFIRMA', 'S');
    ExecutaSqlAuxiliar(' SELECT SUM(COALESCE(QTD,0)) AS QTD, '+
                       '        SUM(COALESCE(EMOLUMENTO,0)) AS EMOLUMENTO, '+
                       '        SUM(COALESCE(TAXA_JUDICIARIA,0)) AS TAXA_JUDICIARIA, '+
                       '        SUM(COALESCE(FUNDESP,0)) AS FUNDESP, '+
                       '        SUM(COALESCE(VALOR_PAGO,0)) AS VALOR_PAGO, '+
                       '        DATA_PAGAMENTO '+
                       ' FROM C_CAIXA_ITEM '+
                       ' WHERE DATA_PAGAMENTO '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+
                       '   AND CAIXA_SERVICO_ID = '+viServicoCaixaID+
                       '   AND SITUACAO IN (4,6,7,8,9) '+
                       ' GROUP BY DATA_PAGAMENTO ',0);
    while not dtmControles.sqlAuxiliar.eof do
    begin
      ClientFermoju.Append;
      ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';
      ClientFermojuQTD_ATOS.AsInteger         := dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger;
      ClientFermojuQTD_SELOS.AsInteger        := 0;
      ClientFermojuCODIGO.AsString            := '2006';
      ClientFermojuDATA.AsDateTime            := dtmControles.sqlAuxiliar.FieldByName('DATA_PAGAMENTO').AsDateTime;
      ClientFermojuEMOLUMENTO.AsCurrency      := dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency;
      ClientFermojuFERMOJU.AsCurrency         := dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency;
      ClientFermojuVALOR_SELO.AsCurrency      := 0;
      ClientFermojuVALOR_DOCUMENTO.AsCurrency := 0;
      ClientFermojuTOTAL.AsCurrency           := dtmControles.sqlAuxiliar.FieldByName('VALOR_PAGO').AsCurrency;
      ClientFermojuSELO_INICIAL.AsString      := '';
      ClientFermojuSELO_FINAL.AsString        := '';
      ClientFermojuSELO_GRUPO_ID.AsInteger    := 0;
      ClientFermojuSELO_TIPO.AsString         := '';
      ClientFermoju.Post;
      dtmControles.sqlAuxiliar.next;
    end;
  end;

begin
  tbcFermoju.TabIndex := 0;
  Screen.Cursor := crHourGlass;
  ClientFermoju.DisableControls;
  ClientFermoju.EmptyDataSet;
  PesquisarAtoEscrituras;
  PesquisarProcuracaoEOutros;
  PesquisarAtosCaixa;
  //PesquisarAberturaFirma;
  cxGridPesquisa.DataController.Groups.FullExpand;
  Screen.Cursor := crDefault;
  ClientFermoju.EnableControls;
  tbcFermojuChange(self);
end;

procedure TfrmGerarArquivoFermoju.CriarArquivoXML;
var
  vNomeArquivo: string;
  vData: string;
begin
  if Application.MessageBox(Pchar('Deseja realmente gerar xml, '+#13+ 'para envio das informa��es do(s) selo(s) para o FERMOJU?'), 'Pergunta',
    MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDNO then
    Exit;

  richSelo.Lines.Clear;
  richSelo.Lines.Add('<?xml version="1.0"?>');
  richSelo.Lines.Add('<movimentacao>');
  richSelo.Lines.Add('      <codigoServentia>'+ '007021' +'</codigoServentia>');

  SaveDialog1.FileName := 'Selos_'+FormatDateTime('YYYY',dtmControles.DataHoraBanco(3))+'-'+
    FormatDateTime('MM',dtmControles.DataHoraBanco(3))+'-'+
    FormatDateTime('DD',dtmControles.DataHoraBanco(3))+'.xml';
  if SaveDialog1.Execute then
    vNomeArquivo := SaveDialog1.FileName;
  if Trim(vNomeArquivo) = '' then
    Exit;

  try
    ClientFermoju.First;
    while not ClientFermoju.Eof do
    begin
      richSelo.Lines.Add('      <item>');
      richSelo.Lines.Add('         <chaveCartorio>' + '00555'+FormatFloat('000000',(dtmControles.GerarSequencia('G_CHAVE_CARTORIO_SELO')))+'</chaveCartorio>');
      richSelo.Lines.Add('         <data>' +FormatDateTime('YYYY-MM-DD', ClientFermojuDATA.AsDateTime)+'</data>');
      richSelo.Lines.Add('         <ato>');
      richSelo.Lines.Add('            <codigo>'+FormatFloat('000000', ClientFermojuCODIGO.AsCurrency)+'</codigo>');
      richSelo.Lines.Add('            <selo>');
      richSelo.Lines.Add('               <codigo>'+ClientFermojuSELO_TIPO.AsString+'</codigo>');
      richSelo.Lines.Add('            </selo>');
      richSelo.Lines.Add('         </ato>');
      richSelo.Lines.Add('         <talao>null</talao>');
      richSelo.Lines.Add('         <quantidadeAtos>'+ClientFermojuQTD_SELOS.AsString+'</quantidadeAtos>');
      richSelo.Lines.Add('         <quantidadeSelos>'+ClientFermojuQTD_SELOS.AsString+'</quantidadeSelos>');
      richSelo.Lines.Add('         <quantidadeExtra>0</quantidadeExtra>');
      richSelo.Lines.Add('         <valorDocumento>'+ TrocaVirgPPto(FormatFloat('#0.00', ClientFermojuVALOR_DOCUMENTO.AsCurrency))+'</valorDocumento>');
      richSelo.Lines.Add('         <emolumentoCobrado>0.0</emolumentoCobrado>');
      richSelo.Lines.Add('         <serieInicial>'+ClientFermojuSELO_INICIAL.AsString+'</serieInicial>');
      richSelo.Lines.Add('         <serieFinal>'+ClientFermojuSELO_FINAL.AsString+'</serieFinal>');
      richSelo.Lines.Add('         <distribuicaoEletronica>false</distribuicaoEletronica>');
      richSelo.Lines.Add('         <tipoGeracao>NORMAL</tipoGeracao>');
      richSelo.Lines.Add('         <tipoCobranca>NORMAL</tipoCobranca>');
      richSelo.Lines.Add('         <tipoMovimentacao>'+ClientFermojuTIPO_MOVIMENTACAO.AsString+'</tipoMovimentacao>');
      richSelo.Lines.Add('         <valor>');
      richSelo.Lines.Add('            <emolumento>'+TrocaVirgPPto(FormatFloat('#0.00', ClientFermojuEMOLUMENTO.AsCurrency))+'</emolumento>');
      richSelo.Lines.Add('            <ferc>'+TrocaVirgPPto(FormatFloat('#0.00', ClientFermojuVALOR_SELO.AsCurrency))+'</ferc>');
      richSelo.Lines.Add('            <fermoju>'+TrocaVirgPPto(FormatFloat('#0.00', ClientFermojuFERMOJU.AsCurrency))+'</fermoju>');
      richSelo.Lines.Add('         </valor>');
      richSelo.Lines.Add('         <seloPendente>false</seloPendente>');
      richSelo.Lines.Add('      </item>');
      ClientFermoju.Next;
    end;
    richSelo.Lines.Add('</movimentacao>');
    richSelo.Lines.SaveToFile(vNomeArquivo);
  Except
    Application.MessageBox('Opera��o abortada! Verifique', 'ERRO', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Screen.Cursor := crDefault;
    Exit;
  end;
  Application.MessageBox(Pchar('Arquivo Gerado com sucesso! '#13+vNomeArquivo),'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
  Screen.Cursor := crDefault;

end;

procedure TfrmGerarArquivoFermoju.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerarArquivoFermoju.FormActivate(Sender: TObject);
begin
  edtPesqDataInicial.SetFocus;
end;

procedure TfrmGerarArquivoFermoju.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                 := caFree;
  frmGerarArquivoFermoju := nil;
end;

procedure TfrmGerarArquivoFermoju.tbcFermojuChange(Sender: TObject);
begin
  ClientFermoju.Filtered := False;
  if tbcFermoju.TabIndex = 0 then
       ClientFermoju.Filter   := '((DEDUTIVEL = '+QuotedStr('N')+') OR (DEDUTIVEL = NULL) OR (DEDUTIVEL = '+ QuotedStr('')+'))'
  else ClientFermoju.Filter   := 'DEDUTIVEL = '+QuotedStr('S');
  ClientFermoju.Filtered := True;

  btnConfirmar.Enabled := (tbcFermoju.TabIndex = 0) and (ClientFermoju.RecordCount > 0);
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

end.



