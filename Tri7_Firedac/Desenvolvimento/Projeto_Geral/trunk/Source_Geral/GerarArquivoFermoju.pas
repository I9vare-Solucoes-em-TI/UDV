unit GerarArquivoFermoju;

interface

uses
  I9Query,
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
  cxCustomData,
  cxEdit,
  DB,
  cxCalendar,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxControls,
  cxGridCustomView,
  cxGrid,
  cxLabel,
  StdCtrls,
  cxContainer,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  ExtCtrls,
  cxButtons,
  DBClient,
  ComCtrls,
  SimpleDS,
  cxPC,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxBarBuiltInMenu,
  cxStyles,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData,
  dxCore,
  cxDateUtils,
  Geral.Model.Entity.Spec.List,
  cxMemo, cxCheckBox, cxImageComboBox;

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
    ClientFermojuQTD_ATOS: TIntegerField;
    ClientFermojuQTD_SELOS: TIntegerField;
    tbcFermoju: TcxTabControl;
    grdPesquisa: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaQTD_ATOS: TcxGridDBColumn;
    cxGridPesquisaColumn13: TcxGridDBColumn;
    cxGridPesquisaCODIGO: TcxGridDBColumn;
    cxGridPesquisaColumn11: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    cxGridPesquisaColumn8: TcxGridDBColumn;
    cxGridPesquisaColumn9: TcxGridDBColumn;
    cxGridPesquisaColumn10: TcxGridDBColumn;
    cxGridPesquisaTIPO_MOVIMENTACAO: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ClientFermojuDEDUTIVEL: TStringField;
    btnPesquisar: TcxButton;
    btnConfirmar: TcxButton;
    cxBtnFechar: TcxButton;
    ClientFermojuPESSOA_CPF: TStringField;
    ClientFermojuTALAO: TStringField;
    ClientFermojuNUMERO_LIVRO: TStringField;
    ClientFermojuFOLHA_INICIAL: TIntegerField;
    ClientFermojuFOLHA_FINAL: TIntegerField;
    ClientFermojuQTD_OUTORGANTES: TIntegerField;
    ClientFermojuQTD_BENS_ENVOLVIDOS_NEGOCIO: TIntegerField;
    ClientFermojuQTD_NEGOCIOS_INSTRUMENTO: TIntegerField;
    ClientFermojuNUMERO_CARTAO_AUTOGRAFO: TStringField;
    ClientFermojuCHECK: TStringField;
    cxGridPesquisaTALAO: TcxGridDBColumn;
    ClientFermojuAPOSTILAMENTO: TStringField;
    ClientFermojuATA_NOTARIAL: TStringField;
    ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO: TStringField;
    ClientFermojuSEGUNDA_VIA_REGISTRO_CRC: TStringField;
    ClientFermojuVALOR_BENS_ENVOLVIDOS_NEGOCIO: TCurrencyField;
    btnValidar: TcxButton;
    pgcFERMOJU: TcxPageControl;
    tbsPesquisa: TcxTabSheet;
    tbsPendencias: TcxTabSheet;
    memPendencias: TcxMemo;
    ClientFermojuPENDENCIA: TStringField;
    cxGridPesquisaPENDENCIA: TcxGridDBColumn;
    pnlMarcar: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edtCodigo: TcxTextEdit;
    lblCodigo: TcxLabel;
    btnMarcarItens: TcxButton;
    ClientFermojuNR_REGISTRO_ORDEM_AVERB_PREN: TStringField;
    ClientFermojuCUSTAS_POSTERGADAS_QUIT_DEVEDOR: TStringField;
    ClientFermojuMICROFILMAGEM_COPI_REF_PROT_TIT: TStringField;
    ClientFermojuDIVORCIO: TStringField;
    ClientFermojuINVENTARIO: TStringField;
    ClientFermojuESCRITURA_INV_CONT_FINANCEIRO: TStringField;
    ClientFermojuESCRITURA_DIV_CONT_FINANCEIRO: TStringField;
    ClientFermojuRECONHECIMENTO_FIRMA_POR_AUTENT: TStringField;
    ClientFermojuREC_TIPO: TStringField;
    ClientFermojuREC_INFORMAR: TStringField;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn14: TcxGridDBColumn;
    cxGridPesquisaSelecionar: TcxGridDBColumn;
    cxGridPesquisaSERVENTIA: TcxGridDBColumn;
    ClientFermojuSISTEMA_ID: TIntegerField;
    icbTipoSistema: TcxImageComboBox;
    cxLabel2: TcxLabel;
    ppAtalho: TPopupMenu;
    ppAgruparTodos: TMenuItem;
    ppAgruparServentia: TMenuItem;
    N1: TMenuItem;
    ppDesagruparTodos: TMenuItem;
    ppDesagruparServentia: TMenuItem;
    N2: TMenuItem;
    ppExpandirTodos: TMenuItem;
    ppContrairTodos: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tbcFermojuChange(Sender: TObject);
    procedure cxGridPesquisaCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure cxGridPesquisaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure btnMarcarItensClick(Sender: TObject);
    procedure ppAgruparTodosClick(Sender: TObject);
    procedure ppContrairTodosClick(Sender: TObject);
    procedure ppExpandirTodosClick(Sender: TObject);
    procedure ppDesagruparServentiaClick(Sender: TObject);
    procedure ppAgruparServentiaClick(Sender: TObject);
    procedure ppDesagruparTodosClick(Sender: TObject);
    procedure edtPesqDataInicialExit(Sender: TObject);
  private
    FPendeciaList: IList<string>;
    vlCodServentiaSeloDigital: string;

    function FormatarCodigoAto: string;

    function AlterarSequencia(
      const vpTabela: string;
      const vpSequencia: Integer): Integer;

    function GetTalao(
      const vpData: TDateTime;
      const vpNumero: Integer): string;

    procedure CriarArquivoXML;
    procedure PesquisarProcuracaoEOutrosDetalhada(vpDigitalizacao : Boolean);
    procedure PesquisarAtosBalcaoDetalhada;
    procedure PesquisarAberturaFirmaDetalhada;
    procedure PesquisarDigitalizacaoDetalhada;
    procedure PesquisarPJ;
    procedure Validar;
    procedure MarcarDesmarcarTodos(vpMarcar : String; vpCodigo : Integer = 0);
    procedure DefinirMostrarSelo(vpNumeroGrupo : Integer);
    procedure AbrirArquivo(vpNomeArquivo: string);
  public
    { Public declarations }
  end;

var
  frmGerarArquivoFermoju: TfrmGerarArquivoFermoju;
  vlSeloDados : array[1..5] of TSeloDados;

implementation

uses
  Controles,
  Lookup,
  Rotinas,
  MensagemUtils,
  BooleanHelper,
  ADM.Model.Entity.FERMOJU.XML,
  System.DateUtils,
  StringUtils,
  Winapi.ShellAPI,
  System.Math,
  Xml.XMLIntf,
  Xml.XMLDoc,
  System.Types,
  Geral.Model.Entity.Impl.Factory.List,
  Data.SqlExpr,
  System.StrUtils;

{$R *.dfm}

{$REGION 'Constantes'}
const
  vcTabelionato = 2;
  vcRTD         = 7;
{$ENDREGION}

procedure TfrmGerarArquivoFermoju.AbrirArquivo(vpNomeArquivo: string);
begin
  TMensagemUtils.ExibirMensagemInformacao(
    string.Format(
      'Arquivo gerado com sucesso.%s%s',
      [sLineBreak,
      vpNomeArquivo]));

  // Abrir o Windows Explorer com o arquivo XML selecionado
  ShellExecute(
    ZeroValue,
    nil,
    PWideChar('explorer.exe'),
    PWideChar(
      string.Format(
        '/select, %s',
        [vpNomeArquivo])),
    nil,
    SW_SHOWNORMAL);
end;

function TfrmGerarArquivoFermoju.AlterarSequencia(
  const vpTabela: string;
  const vpSequencia: Integer): Integer;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(
    nil);

  try
    viSQLDataSet.Connection := dtmControles.DB;

    viSQLDataSet.SQL.Text := {$REGION 'Comando SQL UPDATE'}
      {$REGION 'Cláusula UPDATE'}
      'UPDATE ' +
      'G_SEQUENCIA ' +
      {$ENDREGION}

      {$REGION 'Cláusula SET, Colunas e Parâmetros'}
      'SET ' +
      'SEQUENCIA = :P_SEQUENCIA ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'TABELA = :P_TABELA';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viSQLDataSet.ParamByName(
      'P_SEQUENCIA').AsInteger := vpSequencia;

    viSQLDataSet.ParamByName(
      'P_TABELA').AsString := vpTabela;
    {$ENDREGION}

    Result := viSQLDataSet.ExecSQL;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TfrmGerarArquivoFermoju.btnConfirmarClick(Sender: TObject);
begin
  CriarArquivoXML;
end;

procedure TfrmGerarArquivoFermoju.btnMarcarItensClick(Sender: TObject);
begin
  VerificarPreenchimentoEDT_TX(edtCodigo.Text, 'Código', edtCodigo);
  MarcarDesmarcarTodos('S', StrToInt(edtCodigo.Text));
end;

procedure TfrmGerarArquivoFermoju.btnPesquisarClick(Sender: TObject);
var
  viEmolumentoPeriodoId : String;
  viQtd : Integer;

  procedure PesquisarProcuracaoEOutros;
  var
    viQtdAtos, viQtdSelos, viNumeroSequencia, viCodigo, viGrupoId, viCodigoAto : Integer;
    viNumeroInicial, viNumeroFinal, viTipo : String;
    viEmolumentos, viTaxa, viOutraTaxa : Currency;
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

  procedure PesquisarAtoEscrituras(vpPrincipal : Boolean);
  {$REGION 'Variáveis'}
  var
    viAtoID: Integer;
    viTalao, viSql: string;
    viNumeroLivro: Integer;
    viQtdBensEnvolvidosNegocio: Integer;
    viValorBensEnvolvidosNegocio: Currency;
    viDivorcio: Boolean;
    viInventario: Boolean;
    viConteudoFinanceiro: Boolean;
    viEscrituraInventarioConteudoFinanceiro: Boolean;
    viEscrituraDivorcioConteudoFinanceiro: Boolean;
    viData: TDateTime;
  {$ENDREGION}
  begin
    viSql := ' SELECT AV.EMOLUMENTO, AV.TAXA_JUDICIARIA, AV.VALOR_OUTRA_TAXA1, AV.QUANTIDADE, A.CALCULO_DEDUTIVEL, '+
             '       EI.CODIGO, A.DATA_LAVRATURA, E.SELO_GRUPO_ID, AV.VALOR_DOCUMENTO, SL.SIGLA, SG.NUMERO AS GRUPO_NUMERO, '+
             '      (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) AS NUMEROSIGLA, '+
             '      AVP.PESSOA_CPF, ' +
             '      A.ATO_ID, ' +
             '      A.FOLHA_INICIAL, ' +
             '      A.FOLHA_FINAL, ' +
             '      LA.NUMERO_LIVRO, ' +
             '      CTA.CENSEC_TIPOATO_ID ' +
             ' FROM T_ATO A LEFT OUTER JOIN T_ATO_VINCULOVALOR AV ON '+
             '    A.ATO_ID = AV.ATO_ID '+
             '    LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
             '    AV.EMOLUMENTO_ITEM_ID = EI.EMOLUMENTO_ITEM_ID '+
             '    LEFT OUTER JOIN G_EMOLUMENTO E ON '+
             '    AV.EMOLUMENTO_ID = E.EMOLUMENTO_ID '+
             '    LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
             '    SL.CAMPO_ID = A.ATO_ID AND '+
             '    SL.TABELA = '+QuotedStr('T_ATO')+
             '    LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
             '    E.SELO_GRUPO_ID = SG.SELO_GRUPO_ID ';

    if vpPrincipal then
      viSql := viSql +
             '    AND SL.NUMERO_AGRUPADOR = (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) '
    else
      viSql := viSql +
             '    AND SL.NUMERO_AGRUPADOR <> (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) ';

    viSql := viSql +
             '    LEFT OUTER JOIN T_ATO_VINCULOPARTE AVP ON ' +
             '    A.ATO_ID = AVP.ATO_ID AND ' +
             '    AVP.TIPO_VINCULO IN (' +
                    string('0').QuotedString + ', ' +
                    string('1').QuotedString + ') AND ' +
             '    AVP.ORDEM = 1 ' +
             '    LEFT OUTER JOIN T_LIVRO_ANDAMENTO LA ON ' +
             '    A.LIVRO_ANDAMENTO_ID = LA.LIVRO_ANDAMENTO_ID ' +
             '    LEFT OUTER JOIN T_ATO_TIPO T_AT ON ' +
             '    T_AT.ATO_TIPO_ID = A.ATO_TIPO_ID ' +
             '    LEFT OUTER JOIN T_CENSEC_TIPOATO CTA ON ' +
             '    CTA.CENSEC_TIPOATO_ID = T_AT.CENSEC_TIPOATO_ID ' +
             ' WHERE (A.DATA_LAVRATURA '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
             '   AND AV.VALOR_DOCUMENTO > 0';

    if vpPrincipal then
         viSql := viSql + '   AND AV.PRINCIPAL = '+QuotedStr('S')
    else viSql := viSql + '   AND ((AV.PRINCIPAL <> '+QuotedStr('S')+') or (AV.PRINCIPAL IS NULL))';

    ExecutaSqlAuxiliar(viSql,0);

    dtmControles.sqlAuxiliar.First;
    while not dtmControles.sqlAuxiliar.eof do
    begin
      ClientFermoju.Insert;
      if (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 2017) OR
          (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 2031) then
           ClientFermojuTIPO_MOVIMENTACAO.AsString := 'DETALHADA'
      else ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';

      ClientFermojuSISTEMA_ID.AsInteger       := vcTabelionato;

      viData := dtmControles.sqlAuxiliar.FieldByName(
        'DATA_LAVRATURA').AsDateTime;

      ClientFermojuDATA.AsDateTime := viData;
      ClientFermojuCODIGO.AsString            := dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsString;
      ClientFermojuVALOR_DOCUMENTO.AsCurrency := dtmControles.sqlAuxiliar.FieldByName('VALOR_DOCUMENTO').AsCurrency;
      ClientFermojuSELO_GRUPO_ID.AsInteger    := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
      ClientFermojuSELO_TIPO.AsString         := dtmControles.GetStr('SELECT NUMERO FROM G_SELO_GRUPO WHERE SELO_GRUPO_ID = '+dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString);
      ClientFermojuSELO_INICIAL.AsString      := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
      ClientFermojuSELO_FINAL.AsString        := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
      ClientFermojuDEDUTIVEL.AsString         := dtmControles.sqlAuxiliar.FieldByName('CALCULO_DEDUTIVEL').AsString;
      DefinirMostrarSelo(dtmControles.sqlAuxiliar.FieldByName('GRUPO_NUMERO').AsInteger);

      ClientFermojuPESSOA_CPF.AsString := dtmControles.sqlAuxiliar.FieldByName(
        'PESSOA_CPF').AsString;

      viAtoID := dtmControles.sqlAuxiliar.FieldByName(
        'ATO_ID').AsInteger;

      viTalao := GetTalao(
        viData,
        viAtoID);

      ClientFermojuQTD_ATOS.AsInteger         := dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger;
      ClientFermojuQTD_SELOS.AsInteger        := dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger;
      ClientFermojuEMOLUMENTO.AsCurrency      := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency,2);
      ClientFermojuFERMOJU.AsCurrency         := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency,2);
      ClientFermojuVALOR_SELO.AsCurrency      := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency,2);
      ClientFermojuTOTAL.AsCurrency           := Arredondamento(dtmControles.MetodoArredondamento,(ClientFermojuEMOLUMENTO.AsCurrency + ClientFermojuFERMOJU.AsCurrency +
                                                 ClientFermojuVALOR_SELO.AsCurrency),2);
      if ClientFermojuSELO_GRUPO_ID.AsInteger = 7 then
      begin
        ClientFermojuCHECK.AsString := 'S';
        ClientFermojuPENDENCIA.AsString := 'N';
        ClientFermojuCUSTAS_POSTERGADAS_QUIT_DEVEDOR.AsString := 'N';
        ClientFermojuMICROFILMAGEM_COPI_REF_PROT_TIT.AsString := 'N';

        viQtd := dtmControles.sqlAuxiliar.FieldByName('QUANTIDADE').AsInteger;
        ClientFermojuQTD_ATOS.AsInteger         := 1;
        ClientFermojuQTD_SELOS.AsInteger        := 1;
        ClientFermojuEMOLUMENTO.AsCurrency      := Arredondamento(dtmControles.MetodoArredondamento,(dtmControles.sqlAuxiliar.FieldByName('EMOLUMENTO').AsCurrency/viQtd),2);
        ClientFermojuFERMOJU.AsCurrency         := Arredondamento(dtmControles.MetodoArredondamento,(dtmControles.sqlAuxiliar.FieldByName('TAXA_JUDICIARIA').AsCurrency/viQtd),2);
        ClientFermojuVALOR_SELO.AsCurrency      := Arredondamento(dtmControles.MetodoArredondamento,(dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency/viQtd),2);
        ClientFermojuTOTAL.AsCurrency           := Arredondamento(dtmControles.MetodoArredondamento,(ClientFermojuEMOLUMENTO.AsCurrency + ClientFermojuFERMOJU.AsCurrency +
                                                                   ClientFermojuVALOR_SELO.AsCurrency),2);
        ClientFermojuATA_NOTARIAL.AsString := 'N';
        ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO.AsString   := 'N';
        ClientFermojuSEGUNDA_VIA_REGISTRO_CRC.AsString      := 'N';
        ClientFermojuREC_TIPO.AsString                      := 'E';
        ClientFermojuNR_REGISTRO_ORDEM_AVERB_PREN.AsString  := viTalao;
      end;

      ClientFermojuTALAO.AsString := viTalao;

      viNumeroLivro := dtmControles.sqlAuxiliar.FieldByName(
        'NUMERO_LIVRO').AsInteger;

      if CompareValue(
        viNumeroLivro,
        ZeroValue) = GreaterThanValue then
        ClientFermojuNUMERO_LIVRO.AsString := viNumeroLivro.ToString;

      ClientFermojuFOLHA_INICIAL.AsInteger := dtmControles.sqlAuxiliar.
        FieldByName('FOLHA_INICIAL').AsInteger;

      ClientFermojuFOLHA_FINAL.AsInteger := dtmControles.sqlAuxiliar.
        FieldByName('FOLHA_FINAL').AsInteger;

      viSQL := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'COUNT(*) ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'T_ATO_VINCULOIMOVEL ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'ATO_ID = ' + viAtoID.ToString;
        {$ENDREGION}

      {$ENDREGION}

      viQtdBensEnvolvidosNegocio := dtmControles.GetInt(
        viSQL);

      ClientFermojuQTD_BENS_ENVOLVIDOS_NEGOCIO.AsInteger :=
        viQtdBensEnvolvidosNegocio;

      viSQL := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'COALESCE(SUM(VALOR_AVALIACAO), 0) ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'T_ATO_VINCULOIMOVEL ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'ATO_ID = ' + viAtoID.ToString;
        {$ENDREGION}

      {$ENDREGION}

      viValorBensEnvolvidosNegocio := dtmControles.GetFloat(
        viSQL);

      ClientFermojuVALOR_BENS_ENVOLVIDOS_NEGOCIO.AsCurrency :=
        viValorBensEnvolvidosNegocio;

      ClientFermojuQTD_NEGOCIOS_INSTRUMENTO.AsInteger := 1;
      ClientFermojuATA_NOTARIAL.AsString := 'N';

      ClientFermojuCHECK.AsString := 'S';
      ClientFermojuPENDENCIA.AsString := 'N';

      // 11 = Divórcio Direto
      viDivorcio := CompareValue(
        dtmControles.sqlAuxiliar.FieldByName(
          'CENSEC_TIPOATO_ID').AsInteger,
        11) = EqualsValue;

      ClientFermojuDIVORCIO.AsString := IfThen(
        viDivorcio,
        'S',
        'N');

      // 12 = Inventário
      viInventario := CompareValue(
        dtmControles.sqlAuxiliar.FieldByName(
          'CENSEC_TIPOATO_ID').AsInteger,
        12) = EqualsValue;

      ClientFermojuINVENTARIO.AsString := IfThen(
        viInventario,
        'S',
        'N');

      viConteudoFinanceiro := CompareValue(
        viQtdBensEnvolvidosNegocio,
        ZeroValue) = GreaterThanValue;

      viEscrituraInventarioConteudoFinanceiro := viInventario and
        viConteudoFinanceiro;

      ClientFermojuESCRITURA_INV_CONT_FINANCEIRO.AsString := IfThen(
        viEscrituraInventarioConteudoFinanceiro,
        'S',
        'N');

      viEscrituraDivorcioConteudoFinanceiro := viDivorcio and
        viConteudoFinanceiro;

      ClientFermojuESCRITURA_DIV_CONT_FINANCEIRO.AsString := IfThen(
        viEscrituraDivorcioConteudoFinanceiro,
        'S',
        'N');

      ClientFermoju.Post;
      dtmControles.sqlAuxiliar.next;
    end;
  end;

  procedure PesquisarAtosBalcao;
  var
    viQtdTotal, viQtdGeral, viNumeroInicial, viNumeroFinal : Integer;
    viData, viSigla : String;
    viValor : TStringList;

    procedure VerificarNumeracaoSelo;
    var
      viBreak : Boolean;
    begin
      viNumeroInicial := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger;
      viNumeroFinal   := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger;
      viSigla         := dtmControles.SimpleAuxiliar.FieldByName('SIGLA').AsString;
      viData          := FormatDateTime('DD/MM/YYYY',dtmControles.SimpleAuxiliar.FieldByName('DATA').AsDateTime);
      viBreak         := False;
      repeat
        dtmControles.SimpleAuxiliar.Next;
        if (viNumeroFinal+1) = dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger then
             viNumeroFinal := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger
        else viBreak := True;
      until viBreak;
      viQtdTotal := (viNumeroFinal - viNumeroInicial)+1;
    end;

  begin
    ExecutaSqlAuxiliar(' SELECT SELO_GRUPO_ID, NUMERO '+
                       ' FROM G_SELO_GRUPO '+
                       ' WHERE CONTROLE_AUTOMATICO = '+QuotedStr('S'),0);
    while not dtmControles.sqlAuxiliar.eof do
    begin
      ExecutaSimpleDSAux(' SELECT SL.NUMERO, SL.SIGLA, SL.DATA '+
                         ' FROM G_SELO_LIVRO SL '+
                         '    LEFT OUTER JOIN G_SELO_LOTE ST ON '+
                         '    SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
                         ' WHERE (SL.DATA '+MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
                         '   AND SL.SELO_SITUACAO_ID = 2 '+
                         '   AND ST.SELO_GRUPO_ID ='+ dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString+
                         ' ORDER BY SL.SIGLA, SL.NUMERO',0);
      dtmControles.SimpleAuxiliar.First;
      viQtdGeral := dtmControles.SimpleAuxiliar.RecordCount;
      if viQtdGeral > 0 then
      begin
        repeat
          VerificarNumeracaoSelo;

          ClientFermoju.Insert;
          ClientFermojuSISTEMA_ID.AsInteger       := vcTabelionato;
          ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';
          ClientFermojuQTD_ATOS.AsInteger         := viQtdTotal;
          ClientFermojuQTD_SELOS.AsInteger        := viQtdTotal;
          ClientFermojuDATA.AsString              := viData;

          viValor := dtmControles.GetFields(' SELECT FIRST 1 VALOR_EMOLUMENTO, VALOR_TAXA_JUDICIARIA, VALOR_OUTRA_TAXA1, CODIGO '+
                                            ' FROM G_EMOLUMENTO_ITEM '+
                                            ' WHERE CODIGO_SELO = '+QuotedStr(dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsString) +
                                            '   AND EMOLUMENTO_PERIODO_ID = '+ viEmolumentoPeriodoId);
          try
            ClientFermojuEMOLUMENTO.AsCurrency      := StrToFloat(viValor.Values['VALOR_EMOLUMENTO']) * viQtdTotal;
            ClientFermojuFERMOJU.AsCurrency         := StrToFloat(viValor.Values['VALOR_TAXA_JUDICIARIA']) * viQtdTotal;
            ClientFermojuVALOR_SELO.AsCurrency      := StrToFloat(viValor.Values['VALOR_OUTRA_TAXA1']) * viQtdTotal;
            ClientFermojuCODIGO.AsString            := viValor.Values['CODIGO'];
            ClientFermojuVALOR_DOCUMENTO.AsCurrency := 0;
            ClientFermojuTOTAL.AsCurrency           := ClientFermojuEMOLUMENTO.AsCurrency + ClientFermojuFERMOJU.AsCurrency + ClientFermojuVALOR_SELO.AsCurrency;
            ClientFermojuSELO_INICIAL.AsString      := viSigla + FormatFloat('000000', viNumeroInicial);
            ClientFermojuSELO_FINAL.AsString        := viSigla + FormatFloat('000000', viNumeroFinal);
            ClientFermojuSELO_GRUPO_ID.AsInteger    := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
            ClientFermojuSELO_TIPO.AsString         := dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsString;
          finally
            FreeAndNil(viValor);
          end;
          ClientFermoju.Post;
        until dtmControles.SimpleAuxiliar.RecNo = viQtdGeral;
      end;
      dtmControles.sqlAuxiliar.Next;
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
      ClientFermojuSISTEMA_ID.AsInteger       := vcTabelionato;
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

  procedure MontarPesquisasTabelionato;
  begin
    PesquisarAtoEscrituras (True);
    PesquisarAtoEscrituras (False);

    //PesquisarProcuracaoEOutros;
    PesquisarProcuracaoEOutrosDetalhada(False);
    PesquisarProcuracaoEOutrosDetalhada(True);

    //PesquisarAtosBalcao;
    PesquisarAtosBalcaoDetalhada;

    //PesquisarAberturaFirma;
    PesquisarAberturaFirmaDetalhada;

    //PesquisarDigitalizaçãoAbertura;
    PesquisarDigitalizacaoDetalhada;
  end;

  procedure MontarPesquisasRTD;
  begin
    PesquisarPJ;
  end;

  procedure ValidarDados;
  begin
    if edtPesqDataFinal.EditValue < edtPesqDataInicial.EditValue then
    begin
      Application.MessageBox('Por favor, informe uma data final maior ou igual à data inicial.',
        'Aviso', MB_OK + MB_ICONINFORMATION);
      edtPesqDataInicial.SetFocus;
      Abort;
    end;
  end;

begin
  ValidarDados;
  viEmolumentoPeriodoId := dtmControles.BuscarParametroOutroSistema('PERIODO_PADRAO', 'VALOR', 'PRINCIPAL', '2');
  Screen.Cursor := crHourGlass;
  ClientFermoju.DisableControls;
  ClientFermoju.EmptyDataSet;
  try
    case icbTipoSistema.EditValue of
      1:
        begin
          MontarPesquisasTabelionato;
          MontarPesquisasRTD;
        end;
      2: MontarPesquisasTabelionato;
      7: MontarPesquisasRTD;
    end;
  finally
    RadioButton1Click(Sender);
    cxGridPesquisa.DataController.Groups.FullExpand;
    Screen.Cursor := crDefault;
    ClientFermoju.EnableControls;
    tbcFermojuChange(Self);
    btnConfirmar.Enabled := False;
    pnlMarcar.Visible    := not ClientFermoju.Eof;
  end;
end;

procedure TfrmGerarArquivoFermoju.btnValidarClick(Sender: TObject);
begin
  Validar;
end;
procedure TfrmGerarArquivoFermoju.CriarArquivoXML;
{$REGION 'Variáveis'}
var
  viData: TDateTime;
  viNomeArquivo: string;
  viXMLTMovimentacao: IXMLTMovimentacao;
  viRecNo: Integer;
  viCursor: TCursor;
  viFormatSettings: TFormatSettings;
  viChaveCartorioSelo: Integer;
  viCustasPostergadasQuitDevedor: string;
  viNrRegistroOrdemAverbPren: string;
  viMicrofilmagemCopiRefProTit: string;
  viAtaNotarial: string;
  viApostilamento: string;
  viDivorcio: string;
  viInventario: string;
  viEscrituraInventarioConteudoFinanceiro: string;
  viEscrituraDivorcioConteudoFinanceiro: string;
  viReconhecimentoFirmaPorAutenticidade: string;
{$ENDREGION}

  function FormatarValorMonetario(
    const vpValue: Currency): string;
  begin
    Result := FormatCurr(
      '0.00',
      vpValue,
      viFormatSettings);
  end;
begin
  if
    TMensagemUtils.ExibirMensagemPergunta(
      'Deseja realmente gerar XML para envio das informações ' +
      'do(s) selo(s) para o FERMOJU?').&Not
  then
    Exit;

  viData := dtmControles.DataHoraBanco(3);

  SaveDialog1.FileName := string.Format(
    'Selos_%d-%.2d-%.2d.xml',
    [YearOf(viData),
    MonthOf(viData),
    DayOf(viData)]);

  if SaveDialog1.Execute.&Not then
    Exit;

  viCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  viNomeArquivo := SaveDialog1.FileName;

  viXMLTMovimentacao := Newmovimentacao;

  {$REGION 'Configurar arquivo XML'}
  with viXMLTMovimentacao.OwnerDocument do
  begin
    Encoding := 'UTF-8';

    Options := Options + [
      TXMLDocOption.doNodeAutoIndent];
  end;
  {$ENDREGION}

  viXMLTMovimentacao.CodigoServentia := '007021';

  viRecNo := ClientFermoju.RecNo;
  ClientFermoju.DisableControls;
  ClientFermoju.First;

  viFormatSettings := TFormatSettings.Create;
  viFormatSettings.DecimalSeparator := '.';

  try
    dtmControles.StartTransaction;
    try
      viChaveCartorioSelo := dtmControles.GerarSequencia(
        'G_CHAVE_CARTORIO_SELO');

      while ClientFermoju.Eof.&Not do
        try
          if ClientFermojuCHECK.AsString.Equals('N') then
            Continue;

          with viXMLTMovimentacao.Item.Add do
          begin
            {ChaveCartorio := StrToInt64(
              string.Format(
                '%.5d%.6d',
                [555,
                Integer(
                  dtmControles.GerarSequencia('G_CHAVE_CARTORIO_SELO'))]));}

            if CompareValue(
              ClientFermoju.RecNo,
              1) = GreaterThanValue then
              Inc(
                viChaveCartorioSelo);

            ChaveCartorio := viChaveCartorioSelo;

            Data := FormatDateTime(
              'yyyy-mm-dd',
              ClientFermojuDATA.AsDateTime);

            with Ato do
            begin
              Codigo := FormatarCodigoAto;

              with Selo do
                if not ClientFermojuSELO_TIPO.AsString.IsEmpty then
                  Codigo := ClientFermojuSELO_TIPO.AsInteger;
            end;

            Talao := ClientFermojuTALAO.AsString;
            QuantidadeAtos := ClientFermojuQTD_ATOS.AsInteger;
            QuantidadeSelos := ClientFermojuQTD_SELOS.AsInteger;
            QuantidadeExtra := ZeroValue;

            ValorDocumento := FormatarValorMonetario(
              ClientFermojuVALOR_DOCUMENTO.AsCurrency);

            //Essa tag foi removida de xml
            //Igor
            //18-07-2019
            //EmolumentoCobrado := FormatarValorMonetario(ZeroValue);

            if not ClientFermojuSELO_INICIAL.AsString.IsEmpty then
              SerieInicial := ClientFermojuSELO_INICIAL.AsString;

            if not ClientFermojuSELO_FINAL.AsString.IsEmpty then
              SerieFinal := ClientFermojuSELO_FINAL.AsString;

            DistribuicaoEletronica := False;
            TipoGeracao := 'NORMAL';
            TipoCobranca := 'NORMAL';
            TipoMovimentacao := ClientFermojuTIPO_MOVIMENTACAO.AsString;

            with Valor do
            begin
              Emolumento := FormatarValorMonetario(
                ClientFermojuEMOLUMENTO.AsCurrency);

              Ferc := FormatarValorMonetario(
                ClientFermojuVALOR_SELO.AsCurrency);

              Fermoju := FormatarValorMonetario(
                ClientFermojuFERMOJU.AsCurrency);
            end;

            SeloPendente := False;

            if (ClientFermojuRECONHECIMENTO_FIRMA_POR_AUTENT.IsNull) or (ClientFermojuCODIGO.AsInteger = 2021) then
              CpfCnpj := ClientFermojuPESSOA_CPF.AsString;

            NrLivro := ClientFermojuNUMERO_LIVRO.AsString;

            if ClientFermojuFOLHA_INICIAL.IsNull.&Not then
              NrFolhaInicial := ClientFermojuFOLHA_INICIAL.AsInteger;

            if ClientFermojuFOLHA_FINAL.IsNull.&Not then
              NrFolhaFinal := ClientFermojuFOLHA_FINAL.AsInteger;

            if ClientFermojuNUMERO_CARTAO_AUTOGRAFO.IsNull.&Not then
              NrCartaoAutografo :=
                ClientFermojuNUMERO_CARTAO_AUTOGRAFO.AsString;

            NrOutorgantes := ClientFermojuQTD_OUTORGANTES.AsInteger;

            viNrRegistroOrdemAverbPren :=
              ClientFermojuNR_REGISTRO_ORDEM_AVERB_PREN.AsString.Trim;

            if not viNrRegistroOrdemAverbPren.IsEmpty then
              NrRegistroOrdemAverbPren := viNrRegistroOrdemAverbPren;

            QtdBensEnvolvidosNegocio := ClientFermojuQTD_BENS_ENVOLVIDOS_NEGOCIO.AsInteger;

            {if not ClientFermojuVALOR_BENS_ENVOLVIDOS_NEGOCIO.IsNull then
              ChildValues['valorBensEnvolvidosNegocio'] :=
                FormatarValorMonetario(
                  ClientFermojuVALOR_BENS_ENVOLVIDOS_NEGOCIO.AsCurrency);}

            QtdNegociosInstrumento :=
              ClientFermojuQTD_NEGOCIOS_INSTRUMENTO.AsInteger;

            viAtaNotarial := ClientFermojuATA_NOTARIAL.AsString.Trim;
            if not viAtaNotarial.IsEmpty then
              AtaNotarial := viAtaNotarial.Equals(
                'S');

            viMicrofilmagemCopiRefProTit :=
              ClientFermojuMICROFILMAGEM_COPI_REF_PROT_TIT.AsString.Trim;

            if not viMicrofilmagemCopiRefProTit.IsEmpty then
              MicrofilmagemOuCopiaRefProtestoDeTitulo :=
                viMicrofilmagemCopiRefProTit.Equals(
                  'S');

            viApostilamento := ClientFermojuAPOSTILAMENTO.AsString.Trim;
            if not viApostilamento.IsEmpty then
              Apostilamento := viApostilamento.Equals(
                'S');

            {if not ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO.IsNull then
              ChildValues['registroAtoSemValorEconomico'] :=
                ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO.AsString.Equals(
                  'S');

            if not ClientFermojuSEGUNDA_VIA_REGISTRO_CRC.IsNull then
              ChildValues['segundaViaRegistroCRC'] :=
                ClientFermojuSEGUNDA_VIA_REGISTRO_CRC.AsString.Equals(
                  'S');}

            viCustasPostergadasQuitDevedor :=
              ClientFermojuCUSTAS_POSTERGADAS_QUIT_DEVEDOR.AsString.Trim;

            if not viCustasPostergadasQuitDevedor.IsEmpty then
              CustasPostergadasQuitacaoPeloDevedor :=
                viCustasPostergadasQuitDevedor.Equals(
                  'S');

            viDivorcio := ClientFermojuDIVORCIO.AsString.Trim;
            if not viDivorcio.IsEmpty then
              Divorcio := viDivorcio.Equals(
                'S');

            viInventario := ClientFermojuINVENTARIO.AsString.Trim;
            if not viInventario.IsEmpty then
              Inventario := viInventario.Equals(
                'S');

            viEscrituraInventarioConteudoFinanceiro :=
              ClientFermojuESCRITURA_INV_CONT_FINANCEIRO.AsString.Trim;

            if not viEscrituraInventarioConteudoFinanceiro.IsEmpty then
              EscrituraInventarioComConteudoFinanceiro :=
                viEscrituraInventarioConteudoFinanceiro.Equals(
                  'S');

            viEscrituraDivorcioConteudoFinanceiro :=
              ClientFermojuESCRITURA_DIV_CONT_FINANCEIRO.AsString.Trim;

            if not viEscrituraDivorcioConteudoFinanceiro.IsEmpty then
              EscrituraDivorcioComConteudoFinanceiro :=
                viEscrituraDivorcioConteudoFinanceiro.Equals(
                  'S');

            if ClientFermojuREC_INFORMAR.AsString = 'V' then
                 viReconhecimentoFirmaPorAutenticidade := ClientFermojuRECONHECIMENTO_FIRMA_POR_AUTENT.AsString.Trim
            else viReconhecimentoFirmaPorAutenticidade := 'N';

            if not viReconhecimentoFirmaPorAutenticidade.IsEmpty then
              ReconhecimentoFirmaPorAutenticidade :=
                viReconhecimentoFirmaPorAutenticidade.Equals(
                  'S');
          end;
        finally
          ClientFermoju.Next;
        end;

      AlterarSequencia(
        'G_CHAVE_CARTORIO_SELO',
        viChaveCartorioSelo);

      viXMLTMovimentacao.OwnerDocument.SaveToFile(
        viNomeArquivo);

      Screen.Cursor := viCursor;
      dtmControles.Commit;

      AbrirArquivo(viNomeArquivo);
    except
      on E: Exception do
      begin
        dtmControles.Rollback;
        Screen.Cursor := viCursor;

        TMensagemUtils.ExibirMensagemErro(
          string.Format(
            'Não foi possível gerar o arquivo XML do FERMOJU devido ' +
            'ao motivo abaixo:%s%s',
            [TStringUtils.GetQuebraLinhaDupla,
            E.Message]));
      end;
    end;
  finally
    ClientFermoju.RecNo := viRecNo;
    ClientFermoju.EnableControls;
    Screen.Cursor := viCursor;
  end;

  {richSelo.Lines.Clear;
  richSelo.Lines.Add('<?xml version="1.0"?>');
  richSelo.Lines.Add('<movimentacao>');
  richSelo.Lines.Add('      <codigoServentia>'+ '007021' +'</codigoServentia>');

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
    richSelo.Lines.SaveToFile(viNomeArquivo);
  Except
    Application.MessageBox('Operação abortada! Verifique', 'ERRO', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Screen.Cursor := crDefault;
    Exit;
  end;
  Application.MessageBox(Pchar('Arquivo Gerado com sucesso! '#13+vNomeArquivo),'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
  Screen.Cursor := crDefault;}
end;

procedure TfrmGerarArquivoFermoju.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerarArquivoFermoju.cxGridPesquisaCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
{$REGION 'Variáveis'}
var
  viColumn: TcxGridDBColumn;
{$ENDREGION}
begin
  try
    viColumn := ACellViewInfo.Item as TcxGridDBColumn;
    if viColumn.DataBinding.FieldName.Equals(
      'CHECK') then
    begin
      ClientFermoju.Edit;
      if ClientFermojuCHECK.AsString.Equals('S') then
        ClientFermojuCHECK.AsString := 'N'
      else
        ClientFermojuCHECK.AsString := 'S';
      ClientFermoju.Post;
    end;
  except on E: Exception do
     begin
       Application.MessageBox(Pchar('Falha ao ' + E.Message), 'Alerta', MB_OK + MB_ICONWARNING);
     end;
  end;
end;

procedure TfrmGerarArquivoFermoju.cxGridPesquisaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
{$REGION 'Variáveis'}
var
  viColumn: TcxCustomGridTableItem;
{$ENDREGION}
begin
  try
    viColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName(
      'PENDENCIA');

    if VarToStr(
      AViewInfo.RecordViewInfo.GridRecord.Values[viColumn.Index]).Equals(
        'S') then
      ACanvas.Font.Color := clRed;
  except on E: Exception do
     begin
       Application.MessageBox(Pchar('Falha ao ' + E.Message), 'Alerta', MB_OK + MB_ICONWARNING);
     end;
  end;
end;

procedure TfrmGerarArquivoFermoju.DefinirMostrarSelo(vpNumeroGrupo : Integer);
var
  viCodServentia: string;
  viListCodServentia: TStringDynArray;
begin
  viListCodServentia := SplitString(vlCodServentiaSeloDigital, ';');

  for viCodServentia in viListCodServentia do
  begin
    if vpNumeroGrupo = StrToIntDef(viCodServentia, 0) then
    begin
      ClientFermojuSELO_INICIAL.AsString := '';
      ClientFermojuSELO_FINAL.AsString   := '';
    end;
  end;
end;

procedure TfrmGerarArquivoFermoju.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmGerarArquivoFermoju.edtPesqDataInicialExit(Sender: TObject);
begin
  if edtPesqDataFinal.EditValue = Null then
    edtPesqDataFinal.EditValue := edtPesqDataInicial.EditValue;
end;

procedure TfrmGerarArquivoFermoju.FormActivate(Sender: TObject);
begin
  edtPesqDataInicial.SetFocus;
end;

function TfrmGerarArquivoFermoju.FormatarCodigoAto: string;
begin
  Result := string.Format(
    '%.6d',
    [ClientFermojuCODIGO.AsInteger]);
end;

procedure TfrmGerarArquivoFermoju.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                 := caFree;
  frmGerarArquivoFermoju := nil;
end;

procedure TfrmGerarArquivoFermoju.FormCreate(Sender: TObject);
begin
  vlCodServentiaSeloDigital := dtmControles.BuscarConfig('SELO', 'CEARA', 'COD_SERVENTIA_SELO_DIGITAL', 'S');
  FPendeciaList := TListFactory<string>
    .New
    .GetInstance;
end;

procedure TfrmGerarArquivoFermoju.FormDestroy(Sender: TObject);
begin
  FPendeciaList.Clear;
end;

procedure TfrmGerarArquivoFermoju.MarcarDesmarcarTodos(vpMarcar : String; vpCodigo : Integer = 0);
  procedure Marcar(vpOpcao : string);
  begin
    ClientFermoju.Edit;
    ClientFermojuCHECK.AsString := vpOpcao;
    ClientFermoju.Post;
  end;
begin
  Screen.Cursor := crHourGlass;
  ClientFermoju.DisableControls;
  ClientFermoju.First;
  while not ClientFermoju.Eof do
  begin
    if vpMarcar = 'S' then
    begin
      if vpCodigo = 0 then
        Marcar('S')
      else
        if ClientFermojuCODIGO.AsInteger = vpCodigo then
          Marcar('S');
    end
    else Marcar('N');
    ClientFermoju.Next;
  end;

  ClientFermoju.First;
  ClientFermoju.EnableControls;
  Screen.Cursor := crDefault;
  lblCodigo.Enabled      := (vpMarcar = 'N') or (vpCodigo > 0);
  edtCodigo.Enabled      := (vpMarcar = 'N') or (vpCodigo > 0);
  btnMarcarItens.Enabled := (vpMarcar = 'N') or (vpCodigo > 0);
end;

procedure TfrmGerarArquivoFermoju.PesquisarAberturaFirmaDetalhada;

{$REGION 'Constantes'}
const
  // G = Serviços Gerais
  CI_TIPO_ITEM: string = 'G';

  // F = Fechado
  CI_SITUACAO_ITEM: string = 'F';

  // 2006 = Abertura de Firma
  CI_CODIGO: Integer = 2006;

  CI_SITUACAO_CARTAO: string = 'A';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viCaixaServicoID: Integer;
  viSQL: string;
  viServicoTipoID: Integer;
  viEmolumento: Currency;
  viFERMOJU: Currency;
  viValorSelo: Currency;
  viTotal: Currency;
  viTalao: string;
  viServicoPedidoID: Integer;
  viData: TDateTime;
{$ENDREGION}

{  Function ExclusaoAbertura:Integer;
  begin
    Result := dtmControles.GetInt(' SELECT SUM(QTD) AS QTD '+
                                  '  FROM T_SERVICO_ITEMPEDIDO SIP '+
                                  '    INNER JOIN T_SERVICO_PEDIDO SP '+
                                  '    ON SIP.SERVICO_PEDIDO_ID = SP.SERVICO_PEDIDO_ID '+
                                  '  WHERE (SP.DATA_PEDIDO '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date)+ ')'+
                                  '    AND SIP.SERVICO_TIPO_ID IN (5,51,69,77,80,81,78,50) '+
                                  '    AND SIP.TIPO_ITEM = ''R'''+
                                  '    AND SIP.SITUACAO = ''F''');
  end;}

begin
  viCaixaServicoID := dtmControles.BuscarConfig(
    'REGISTRO_DIARIO',
    'GERAL',
    'SERVICO_CAIXA_ABERTURAFIRMA',
    'I');

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'SERVICO_TIPO_ID ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'T_SERVICO_TIPO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'SERVICO_CAIXA_ID = ' + viCaixaServicoID.ToString;
    {$ENDREGION}

  {$ENDREGION}

  viServicoTipoID := dtmControles.GetInt(
    viSQL);

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'SIP.EMOLUMENTO, ' +
    'SIP.TAXA_JUDICIARIA, ' +
    'SIP.OUTRA_TAXA1, ' +
    'SP.DATA_PEDIDO, ' +
    'SIP.QTD, ' +
    'P.CPF_CNPJ, ' +
    'SP.SERVICO_PEDIDO_ID, ' +
    'PC.NUMERO ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'T_SERVICO_ITEMPEDIDO SIP ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'T_SERVICO_PEDIDO SP ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'SIP.SERVICO_PEDIDO_ID = SP.SERVICO_PEDIDO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'T_PESSOA P ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'SIP.PESSOA_ID = P.PESSOA_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'T_PESSOA_CARTAO PC ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'P.PESSOA_ID = PC.PESSOA_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    '(SP.DATA_PEDIDO ' + MontarSqlData(
      edtPesqDataInicial.Date,
      edtPesqDataFinal.Date) + ') AND ' +
    'SIP.SERVICO_TIPO_ID = ' + viServicoTipoID.ToString + ' AND ' +
    'SIP.TIPO_ITEM = ' + CI_TIPO_ITEM.QuotedString + ' AND ' +
    'SIP.SITUACAO = ' + CI_SITUACAO_ITEM.QuotedString + ' AND ' +
    'PC.RENOVADO IS NULL AND ' +
    'PC.SITUACAO = ' + CI_SITUACAO_CARTAO.QuotedString + ' ' +
    {$ENDREGION}

    {$REGION 'Cláusula ORDER BY'}
    'ORDER BY ' +
    'SP.DATA_PEDIDO';
    {$ENDREGION}

  {$ENDREGION}

//  viQtdExclusaoAbertura := ExclusaoAbertura;
  ExecutaSqlAuxiliar(
    viSQL,
    ZeroValue);

  try
    if dtmControles.sqlAuxiliar.IsEmpty then
      Exit;

    dtmControles.sqlAuxiliar.First;
    while dtmControles.sqlAuxiliar.Eof.&Not do
      try
        ClientFermoju.Append;

        ClientFermojuSISTEMA_ID.AsInteger := vcTabelionato;
        ClientFermojuCODIGO.AsInteger := CI_CODIGO;

        viEmolumento := dtmControles.sqlAuxiliar.FieldByName(
          'EMOLUMENTO').AsCurrency;

        ClientFermojuEMOLUMENTO.AsCurrency := viEmolumento;

        viFERMOJU := dtmControles.sqlAuxiliar.FieldByName(
          'TAXA_JUDICIARIA').AsCurrency;

        ClientFermojuFERMOJU.AsCurrency := viFERMOJU;

        viValorSelo := dtmControles.sqlAuxiliar.FieldByName(
          'OUTRA_TAXA1').AsCurrency;

        ClientFermojuVALOR_SELO.AsCurrency := viValorSelo;

        viTotal := viEmolumento + viFERMOJU + viValorSelo;
        ClientFermojuTOTAL.AsCurrency := viTotal;

        viData := dtmControles.sqlAuxiliar.FieldByName(
          'DATA_PEDIDO').AsDateTime;

        ClientFermojuDATA.AsDateTime := viData;
        ClientFermojuSELO_TIPO.AsString := '99';

        ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';

        ClientFermojuQTD_ATOS.AsInteger := dtmControles.sqlAuxiliar.FieldByName(
          'QTD').AsInteger;

        ClientFermojuPESSOA_CPF.AsString := dtmControles.sqlAuxiliar.
          FieldByName(
            'CPF_CNPJ').AsString;

        viServicoPedidoID := dtmControles.sqlAuxiliar.FieldByName(
          'SERVICO_PEDIDO_ID').AsInteger;

        viTalao := GetTalao(
          viData,
          viServicoPedidoID);

        ClientFermojuTALAO.AsString := viTalao;

        ClientFermojuNUMERO_CARTAO_AUTOGRAFO.AsString :=
          dtmControles.sqlAuxiliar.FieldByName(
            'NUMERO').AsString;

        ClientFermojuCHECK.AsString := 'S';
        ClientFermojuPENDENCIA.AsString := 'N';
        ClientFermoju.Post;

{        if (ClientFermoju.RecordCount = (dtmControles.sqlAuxiliar.RecordCount - viQtdExclusaoAbertura)) then
          break;   }

      finally
        dtmControles.sqlAuxiliar.Next;
      end;
  finally
    dtmControles.sqlAuxiliar.Close;
  end;
end;

procedure TfrmGerarArquivoFermoju.PesquisarAtosBalcaoDetalhada;
{$REGION 'Variáveis'}
var
  viSigla: string;
  viSQL: string;
  viSeloGrupoID: Integer;
  viEmolumentoPeriodoID: Integer;
  viCodigo: Integer;
  viSeloTipo: string;
  viSeloInicial: string;
  viNumero: Integer;
  viSeloFinal: string;
  viEmolumento: Currency;
  viFERMOJU: Currency;
  viValorSelo: Currency;
  viTotal: Currency;
  viQtdAtos: Integer;
  viQtdSelos: Integer;
  viTalao: string;
  viNumeroLivro: string;
  viFolhaInicial: Integer;
  viFolhaFinal: Integer;
  viServicoPedidoID: Integer;
  viReconhecimentoTipoID: Variant;
  viCPF : String;
  viCont : Integer;
  viData: TDateTime;
{$ENDREGION}
begin
  viEmolumentoPeriodoID := dtmControles.BuscarParametroOutroSistema(
    'PERIODO_PADRAO',
    'VALOR',
    'PRINCIPAL',
    '2');

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'SELO_GRUPO_ID, ' +
    'NUMERO ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_SELO_GRUPO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'CONTROLE_AUTOMATICO = ' + string('S').QuotedString;
    {$ENDREGION}

  {$ENDREGION}

  ExecutaSqlAuxiliar(
    viSQL,
    ZeroValue);

  try
    if dtmControles.sqlAuxiliar.IsEmpty then
      Exit;

    dtmControles.sqlAuxiliar.First;

    while dtmControles.sqlAuxiliar.Eof.&Not do
      try
        viSeloGrupoID := dtmControles.sqlAuxiliar.FieldByName(
          'SELO_GRUPO_ID').AsInteger;

        viSeloTipo := dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsString;

        viSQL := {$REGION 'Comando SQL SELECT'}
          'SELECT ' +

          {$REGION 'Colunas'}
          'SL.NUMERO, ' +
          'SL.SIGLA, ' +
          'SL.DATA, ' +
          'SL.VALOR_EMOLUMENTO, ' +
          'SL.VALOR_TAXA_JUDICIARIA, ' +
          'SL.VALOR_ISSQN, ' +
          'SG.NUMERO AS GRUPO_NUMERO, ' +
          'P.CPF_CNPJ, ' +
          'SIP.SERVICO_PEDIDO_ID, ' +
          'SDI.LIVRO, ' +
          'SDI.FOLHA, ' +
          'T_ST.TB_RECONHECIMENTOTIPO_ID ' +
          {$ENDREGION}

          {$REGION 'Cláusula FROM'}
          'FROM ' +
          'G_SELO_LIVRO SL ' +
          {$ENDREGION}

          {$REGION 'Cláusula LEFT OUTER JOIN'}
          'LEFT OUTER JOIN ' +
          'G_SELO_LOTE ST ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'SL.SELO_LOTE_ID = ST.SELO_LOTE_ID ' +
          'LEFT OUTER JOIN ' +
          'G_SELO_GRUPO SG ' +
          'ON ' +
          'ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID ' +
          {$ENDREGION}


          {$REGION 'Cláusula LEFT OUTER JOIN'}
          'LEFT OUTER JOIN ' +
          'T_SERVICO_ITEMPEDIDO SIP ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'SL.TABELA = ' + 'T_SERVICO_ITEMPEDIDO'.QuotedString + ' AND ' +
          'SL.CAMPO_ID = SIP.SERVICO_ITEMPEDIDO_ID ' +
          {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Cláusula LEFT OUTER JOIN'}
          'LEFT OUTER JOIN ' +
          'T_PESSOA P ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'SIP.PESSOA_ID = P.PESSOA_ID ' +
          {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Cláusula LEFT OUTER JOIN'}
          'LEFT OUTER JOIN ' +
          'T_SERVICO_DOCUMENTOIMPRESSO SDI ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'SIP.SERVICO_PEDIDO_ID = SDI.SERVICO_PEDIDO_ID AND ' +
          'SIP.PESSOA_ID = SDI.PESSOA_ID ' +
          {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Cláusula LEFT OUTER JOIN'}
          'LEFT OUTER JOIN ' +
          'T_SERVICO_TIPO T_ST ' +

          {$REGION 'Cláusula ON'}
          'ON ' +
          'T_ST.SERVICO_TIPO_ID = SIP.SERVICO_TIPO_ID ' +
          {$ENDREGION}

          {$ENDREGION}

          {$REGION 'Cláusula WHERE e Parâmetros'}
          'WHERE ' +
          '(SL.DATA '+ MontarSqlData(
            edtPesqDataInicial.Date,
            edtPesqDataFinal.Date) + ') AND ' +
          'SL.SELO_SITUACAO_ID = 2 AND ' +
          'ST.SELO_GRUPO_ID = ' + viSeloGrupoID.ToString + ' AND ' +
          'SL.TABELA <> ' + string.Empty.QuotedString + ' AND ' +
          'SL.CAMPO_ID IS NOT NULL ' +
          {$ENDREGION}

          {$REGION 'Cláusula ORDER BY'}
          'ORDER BY ' +
          'SIP.SERVICO_PEDIDO_ID, '+
          'P.CPF_CNPJ, '+
          'T_ST.TB_RECONHECIMENTOTIPO_ID, ' +
          'SL.SIGLA, ' +
          'SL.NUMERO';
          {$ENDREGION}

        {$ENDREGION}

        ExecutaSimpleDSAux(
          viSQL,
          ZeroValue);

        try
          if dtmControles.SimpleAuxiliar.IsEmpty then
            Continue;

          dtmControles.SimpleAuxiliar.First;
          viCont := 0;
          while dtmControles.SimpleAuxiliar.Eof.&Not do
            try
              viCPF :=  dtmControles.SimpleAuxiliar.FieldByName(
                'CPF_CNPJ').AsString;

              ClientFermoju.Append;

              viSQL := {$REGION 'Comando SQL SELECT'}
                'SELECT ' +

                {$REGION 'Colunas'}
                'FIRST 1 CODIGO ' +
                {$ENDREGION}

                {$REGION 'Cláusula FROM'}
                'FROM ' +
                'G_EMOLUMENTO_ITEM ' +
                {$ENDREGION}

                {$REGION 'Cláusula WHERE e Parâmetros'}
                'WHERE ' +
                'CODIGO_SELO = ' + viSeloTipo.QuotedString + ' AND ' +
                'EMOLUMENTO_PERIODO_ID  = ' + viEmolumentoPeriodoID.ToString;
                {$ENDREGION}

              {$ENDREGION}

              viCodigo := dtmControles.GetInt(
                viSQL);

              ClientFermojuSISTEMA_ID.AsInteger := vcTabelionato;

              ClientFermojuCODIGO.AsInteger := viCodigo;

              viSigla := dtmControles.SimpleAuxiliar.FieldByName(
                'SIGLA').AsString;

              viNumero := dtmControles.SimpleAuxiliar.FieldByName(
                'NUMERO').AsInteger;

              viSeloInicial := string.Format(
                '%s%.6d',
                [viSigla,
                viNumero]);

              ClientFermojuSELO_INICIAL.AsString := viSeloInicial;

              viSeloFinal := viSeloInicial;
              ClientFermojuSELO_FINAL.AsString := viSeloFinal;
              DefinirMostrarSelo(dtmControles.SimpleAuxiliar.FieldByName('GRUPO_NUMERO').AsInteger);

              viEmolumento := dtmControles.SimpleAuxiliar.FieldByName(
                'VALOR_EMOLUMENTO').AsCurrency;

              ClientFermojuEMOLUMENTO.AsCurrency := viEmolumento;

              viFERMOJU := dtmControles.SimpleAuxiliar.FieldByName(
                'VALOR_TAXA_JUDICIARIA').AsCurrency;

              ClientFermojuFERMOJU.AsCurrency := viFERMOJU;

              viValorSelo := dtmControles.SimpleAuxiliar.FieldByName(
                'VALOR_ISSQN').AsCurrency;

              ClientFermojuVALOR_SELO.AsCurrency := viValorSelo;

              viTotal := viEmolumento + viFERMOJU + viValorSelo;
              ClientFermojuTOTAL.AsCurrency := viTotal;

              viData := dtmControles.SimpleAuxiliar.FieldByName(
                'DATA').AsDateTime;

              ClientFermojuDATA.AsDateTime := viData;
              ClientFermojuSELO_GRUPO_ID.AsInteger := viSeloGrupoID;
              ClientFermojuSELO_TIPO.AsString := viSeloTipo;
              ClientFermojuVALOR_DOCUMENTO.AsCurrency := ZeroValue;
              //ClientFermojuTIPO_MOVIMENTACAO.AsString := 'DETALHADA';
              ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';

              viQtdAtos := 1;
              ClientFermojuQTD_ATOS.AsInteger := viQtdAtos;

              viQtdSelos := viQtdAtos;
              ClientFermojuQTD_SELOS.AsInteger := viQtdSelos;

              viServicoPedidoID := dtmControles.SimpleAuxiliar.FieldByName(
                'SERVICO_PEDIDO_ID').AsInteger;

              viTalao := GetTalao(
                viData,
                viServicoPedidoID);

              ClientFermojuTALAO.AsString := viTalao;

              if viSeloGrupoID in [2, 3] then
              begin
                ClientFermojuPESSOA_CPF.AsString := dtmControles.SimpleAuxiliar.
                  FieldByName('CPF_CNPJ').AsString;

                viNumeroLivro := string.Empty;

                if dtmControles.SimpleAuxiliar.FieldByName(
                  'LIVRO').IsNull.&Not then
                  viNumeroLivro := dtmControles.SimpleAuxiliar.FieldByName(
                    'LIVRO').AsString;

                ClientFermojuNUMERO_LIVRO.AsString := viNumeroLivro;

                if dtmControles.SimpleAuxiliar.FieldByName(
                  'FOLHA').IsNull.&Not then
                begin
                  viFolhaInicial := dtmControles.SimpleAuxiliar.FieldByName(
                    'FOLHA').AsInteger;

                  ClientFermojuFOLHA_INICIAL.AsInteger := viFolhaInicial;

                  viFolhaFinal := viFolhaInicial;
                  ClientFermojuFOLHA_FINAL.AsInteger := viFolhaFinal;
                end;
              end;

              ClientFermojuCHECK.AsString := 'S';
              ClientFermojuPENDENCIA.AsString := 'N';

              viReconhecimentoTipoID := dtmControles.SimpleAuxiliar.FieldByName(
                'TB_RECONHECIMENTOTIPO_ID').Value;

              // 2 = AUTENTICIDADE
              if not VarIsNull(
                viReconhecimentoTipoID) then
                ClientFermojuRECONHECIMENTO_FIRMA_POR_AUTENT.AsString :=
                  IfThen(
                    viReconhecimentoTipoID = 2,
                    'S',
                    'N');

              if (ClientFermojuRECONHECIMENTO_FIRMA_POR_AUTENT.AsString = 'S') then
              begin
                ClientFermojuREC_TIPO.AsString := 'V';
                if (viCont = 0) or (viCodigo = 2021) then
                     ClientFermojuREC_INFORMAR.AsString := 'V'
                else ClientFermojuREC_INFORMAR.AsString := 'S';
              end
              else
              begin
                 ClientFermojuREC_TIPO.AsString     := 'S';
                 ClientFermojuREC_INFORMAR.AsString := 'S';
              end;

              ClientFermojuAPOSTILAMENTO.AsString := 'N';
              ClientFermoju.Post;
            finally
              dtmControles.SimpleAuxiliar.Next;
              if viCPF = dtmControles.SimpleAuxiliar.FieldByName('CPF_CNPJ').AsString then
                   inc(viCont)
              else viCont := 0;
            end;
        finally
          dtmControles.SimpleAuxiliar.Close;
        end;
      finally
        dtmControles.sqlAuxiliar.Next;
      end;
  finally
    dtmControles.sqlAuxiliar.Close;
  end;
end;

procedure TfrmGerarArquivoFermoju.PesquisarDigitalizacaoDetalhada;
{$REGION 'Constantes'}
const
  // F = Fechado
  CI_SITUACAO_ITEM: string = 'F';

  // 5023 = Digitalização
  CI_CODIGO: Integer = 5023;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viCaixaServicoID: Integer;
  viSQL: string;
  viListServicoTipoID: string;
  viEmolumento: Currency;
  viFERMOJU: Currency;
  viValorSelo: Currency;
  viTotal: Currency;
  viTalao: string;
  viSigla: string;
  viNumero: Integer;
  viSeloInicial: string;
  viServicoPedidoID: Integer;
  viSeloFinal: string;
  viQuantidadeAtos: Integer;
  viQuantidadeSelos: Integer;
  viData: TDateTime;
{$ENDREGION}
begin
  viCaixaServicoID := dtmControles.BuscarConfig(
    'REGISTRO_DIARIO',
    'GERAL',
    'SERVICO_CAIXA_DIGITALIZACAO',
    'I');

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'LIST(SERVICO_TIPO_ID) ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'T_SERVICO_TIPO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'SERVICO_CAIXA_ID = ' + viCaixaServicoID.ToString;
    {$ENDREGION}

  {$ENDREGION}

  viListServicoTipoID := dtmControles.GetStr(
    viSQL);

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'SIP.EMOLUMENTO, ' +
    'SIP.TAXA_JUDICIARIA, ' +
    'SIP.OUTRA_TAXA1, ' +
    'SP.DATA_PEDIDO, ' +
    'P.CPF_CNPJ, ' +
    'SP.SERVICO_PEDIDO_ID, ' +
    'G_SL.SELO_LIVRO_ID, ' +
    'G_SL.SIGLA, ' +
    'G_SL.NUMERO, ' +
    'G_ST.SELO_GRUPO_ID '+
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'T_SERVICO_ITEMPEDIDO SIP ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'T_SERVICO_PEDIDO SP ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'SIP.SERVICO_PEDIDO_ID = SP.SERVICO_PEDIDO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'T_PESSOA P ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'SIP.PESSOA_ID = P.PESSOA_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_SELO_LIVRO G_SL ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_SL.TABELA = ' + 'T_SERVICO_ITEMPEDIDO'.QuotedString + ' AND ' +
    'G_SL.CAMPO_ID = SIP.SERVICO_ITEMPEDIDO_ID ' +

    'INNER JOIN ' +
    'G_SELO_LOTE G_ST ON ' +
    'G_SL.SELO_LOTE_ID = G_ST.SELO_LOTE_ID '+

    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    '(SP.DATA_PEDIDO ' + MontarSqlData(
      edtPesqDataInicial.Date,
      edtPesqDataFinal.Date) + ') AND ' +
    'SIP.SERVICO_TIPO_ID IN (' + viListServicoTipoID + ') AND ' +
    'SIP.SITUACAO = ' + CI_SITUACAO_ITEM.QuotedString + ' ' +
    {$ENDREGION}

    {$REGION 'Cláusula ORDER BY'}
    'ORDER BY ' +
    'SP.DATA_PEDIDO';
    {$ENDREGION}

  {$ENDREGION}

  ExecutaSqlAuxiliar(
    viSQL,
    ZeroValue);

  try
    if dtmControles.sqlAuxiliar.IsEmpty then
      Exit;

    dtmControles.sqlAuxiliar.First;
    while dtmControles.sqlAuxiliar.Eof.&Not do
      try
        ClientFermoju.Append;

        ClientFermojuSISTEMA_ID.AsInteger := vcTabelionato;

        ClientFermojuCODIGO.AsInteger := CI_CODIGO;

        viSigla := dtmControles.sqlAuxiliar.FieldByName(
          'SIGLA').AsString;

        viNumero := dtmControles.sqlAuxiliar.FieldByName(
          'NUMERO').AsInteger;

        viSeloInicial := string.Format(
          '%s%.6d',
          [viSigla,
          viNumero]);

        ClientFermojuSELO_INICIAL.AsString := viSeloInicial;

        viSeloFinal := viSeloInicial;
        ClientFermojuSELO_FINAL.AsString := viSeloFinal;

        viEmolumento := dtmControles.sqlAuxiliar.FieldByName(
          'EMOLUMENTO').AsCurrency;

        ClientFermojuEMOLUMENTO.AsCurrency := viEmolumento;

        viFERMOJU := dtmControles.sqlAuxiliar.FieldByName(
          'TAXA_JUDICIARIA').AsCurrency;

        ClientFermojuFERMOJU.AsCurrency := viFERMOJU;

        viValorSelo := dtmControles.sqlAuxiliar.FieldByName(
          'OUTRA_TAXA1').AsCurrency;

        ClientFermojuVALOR_SELO.AsCurrency := viValorSelo;

        viTotal := viEmolumento + viFERMOJU + viValorSelo;
        ClientFermojuTOTAL.AsCurrency := viTotal;

        viData := dtmControles.sqlAuxiliar.FieldByName(
          'DATA_PEDIDO').AsDateTime;

        ClientFermojuDATA.AsDateTime := viData;
        ClientFermojuSELO_TIPO.AsString := '1';
        ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';

        viQuantidadeAtos := 1;
        ClientFermojuQTD_ATOS.AsInteger := viQuantidadeAtos;

        viQuantidadeSelos := viQuantidadeAtos;
        ClientFermojuQTD_SELOS.AsInteger := viQuantidadeSelos;

        ClientFermojuPESSOA_CPF.AsString := dtmControles.sqlAuxiliar.
          FieldByName(
            'CPF_CNPJ').AsString;

        ClientFermojuSELO_GRUPO_ID.AsString := dtmControles.sqlAuxiliar.
          FieldByName(
            'SELO_GRUPO_ID').AsString;

        viServicoPedidoID := dtmControles.sqlAuxiliar.FieldByName(
          'SERVICO_PEDIDO_ID').AsInteger;

        viTalao := GetTalao(
          viData,
          viServicoPedidoID);

        ClientFermojuTALAO.AsString := viTalao;
        ClientFermojuCHECK.AsString := 'S';
        ClientFermojuPENDENCIA.AsString := 'N';
        ClientFermojuCUSTAS_POSTERGADAS_QUIT_DEVEDOR.AsString := 'N';
        ClientFermojuNR_REGISTRO_ORDEM_AVERB_PREN.AsString := viTalao;
        ClientFermojuMICROFILMAGEM_COPI_REF_PROT_TIT.AsString := 'N';
        ClientFermoju.Post;
      finally
        dtmControles.sqlAuxiliar.Next;
      end;
  finally
    dtmControles.sqlAuxiliar.Close;
  end;
end;

procedure TfrmGerarArquivoFermoju.PesquisarPJ;
{$REGION 'Variáveis'}
var
  viDocumentoID: Integer;
  viTalao, viSql: string;
  viData: TDateTime;
{$ENDREGION}
begin
  viSql := ' SELECT D.DOCUMENTO_ID, D.NUMERO_REGISTRO, D.LIVRO_PAGINA_INI, D.LIVRO_PAGINA_FIM, '+
           '        D.DATA_REGISTRO, D.APRESENTANTE, D.CPF_CNPJ, D.LIVRO_NUMERO, '+
           '        DI.VALOR_EMOLUMENTO, DI.VALOR_TAXA_JUDICIARIA, DI.VALOR_DOCUMENTO, '+
           '        DI.VALOR_FUNDESP, DI.VALOR_OUTRA_TAXA1, DI.VALOR_TOTAL, '+
           '        E.SELO_GRUPO_ID, SL.SIGLA, SG.NUMERO AS GRUPO_NUMERO, '+
           '        (SL.SIGLA ||RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) AS NUMEROSIGLA, '+
           '        EI.CODIGO '+
           ' FROM D_DOCUMENTO D LEFT OUTER JOIN D_DOCUMENTO_ITENS DI ON '+
           '   D.DOCUMENTO_ID = DI.DOCUMENTO_ID '+
           '   LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
           '   DI.EMOLUMENTO_ITEM_ID = EI.EMOLUMENTO_ITEM_ID '+
           '   LEFT OUTER JOIN G_EMOLUMENTO E ON '+
           '   DI.EMOLUMENTO_ID = E.EMOLUMENTO_ID '+
           '   LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
           '   SL.CAMPO_ITEM_ID = DI.DOCUMENTO_ITENS_ID AND '+
           '   SL.TABELA_ITEM = ''D_DOCUMENTO_ITENS'''+
           '   LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
           '   E.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
           ' WHERE DATA_REGISTRO '+ MontarSqlData(edtPesqDataInicial.Date , edtPesqDataFinal.Date);
  ExecutaSqlAuxiliar(viSql,0);

  dtmControles.sqlAuxiliar.First;
  while not dtmControles.sqlAuxiliar.eof do
  begin
    ClientFermoju.Insert;
    if
      (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 5010) or
      (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 5022)
    then
    begin
      ClientFermojuTIPO_MOVIMENTACAO.AsString           := 'DETALHADA';
      ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO.AsString := 'N';
    end
    else
    begin
      ClientFermojuTIPO_MOVIMENTACAO.AsString           := 'RESUMIDA';
      ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO.AsString := 'S';
    end;

    ClientFermojuSISTEMA_ID.AsInteger       := vcRTD;

    viData := dtmControles.sqlAuxiliar.FieldByName(
      'DATA_REGISTRO').AsDateTime;

    ClientFermojuDATA.AsDateTime := viData;
    ClientFermojuCODIGO.AsString            := dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsString;
    ClientFermojuVALOR_DOCUMENTO.AsCurrency := dtmControles.sqlAuxiliar.FieldByName('VALOR_DOCUMENTO').AsCurrency;
    ClientFermojuSELO_GRUPO_ID.AsInteger    := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
    ClientFermojuSELO_TIPO.AsString         := dtmControles.sqlAuxiliar.FieldByName('GRUPO_NUMERO').AsString;
    ClientFermojuSELO_INICIAL.AsString      := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;
    ClientFermojuSELO_FINAL.AsString        := dtmControles.sqlAuxiliar.FieldByName('NUMEROSIGLA').AsString;

//    DefinirMostrarSelo(dtmControles.sqlAuxiliar.FieldByName('GRUPO_NUMERO').AsInteger);

    ClientFermojuPESSOA_CPF.AsString := dtmControles.sqlAuxiliar.FieldByName('CPF_CNPJ').AsString;
    viDocumentoID := dtmControles.sqlAuxiliar.FieldByName('DOCUMENTO_ID').AsInteger;

    viTalao := GetTalao(
      viData,
      viDocumentoID);

    ClientFermojuQTD_ATOS.AsInteger         := 1;
    ClientFermojuQTD_SELOS.AsInteger        := 1;
    ClientFermojuEMOLUMENTO.AsCurrency      := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('VALOR_EMOLUMENTO').AsCurrency,2);
    ClientFermojuFERMOJU.AsCurrency         := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency,2);
    ClientFermojuVALOR_SELO.AsCurrency      := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency,2);
    ClientFermojuTOTAL.AsCurrency           := Arredondamento(dtmControles.MetodoArredondamento,(ClientFermojuEMOLUMENTO.AsCurrency + ClientFermojuFERMOJU.AsCurrency +
                                               ClientFermojuVALOR_SELO.AsCurrency),2);

    ClientFermojuTALAO.AsString := viTalao;
    ClientFermojuPENDENCIA.AsString := 'N';
    ClientFermojuCHECK.AsString := 'N';
    ClientFermojuNR_REGISTRO_ORDEM_AVERB_PREN.AsString  := viTalao;

    if (dtmControles.sqlAuxiliar.FieldByName('CODIGO').AsInteger = 5023) then
    begin
      ClientFermojuCUSTAS_POSTERGADAS_QUIT_DEVEDOR.AsString := 'N';
      ClientFermojuMICROFILMAGEM_COPI_REF_PROT_TIT.AsString := 'N';
    end;

    ClientFermoju.Post;
    dtmControles.sqlAuxiliar.next;
  end;
end;

procedure TfrmGerarArquivoFermoju.PesquisarProcuracaoEOutrosDetalhada(vpDigitalizacao : Boolean);
{$REGION 'Variáveis'}
var
  viQtdAtos: Integer;
  viQtdSelos: Integer;
  viEmolumento: Currency;
  viFERMOJU: Currency;
  viValorSelo: Currency;
  viSQL: string;
  viTotal: Currency;
  viTalao: string;
  viAtoID: Integer;
  viNumeroLivro: string;
  viQtdOutorgantes: Integer;
  viQuantidade: Integer;
  viVinculoParte: TI9Query;
  viSelo: TI9Query;
  viNumeroSigla: string;
  viPessoaCPF: string;
  viData: TDateTime;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'A.ATO_ID, ' +
    'LA.NUMERO_LIVRO, ' +
    'A.DATA_LAVRATURA, ' +
    'A.FOLHA_INICIAL, ' +
    'A.FOLHA_FINAL, ' +
    'AVV.EMOLUMENTO, ' +
    'AVV.TAXA_JUDICIARIA, ' +
    'SG.NUMERO SELO_TIPO, ' +
    'SG.SELO_GRUPO_ID, ' +
    'AVV.QUANTIDADE, ' +
    'AVV.VALOR_OUTRA_TAXA1, ' +
    'EI.CODIGO ' + {, ' +
    'AVP.PESSOA_CPF ' +}
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'T_ATO A ' +
    {$ENDREGION}

    {$REGION 'Cláusula LEFT JOIN'}
    'LEFT JOIN ' +
    'T_LIVRO_ANDAMENTO LA ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'A.LIVRO_ANDAMENTO_ID = LA.LIVRO_ANDAMENTO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula LEFT JOIN'}
    'LEFT JOIN ' +
    'T_ATO_VINCULOVALOR AVV ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'A.ATO_ID = AVV.ATO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula LEFT JOIN'}
    'LEFT JOIN ' +
    'G_EMOLUMENTO E ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'AVV.EMOLUMENTO_ID = E.EMOLUMENTO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula LEFT JOIN'}
    'LEFT JOIN ' +
    'G_SELO_GRUPO SG ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'E.SELO_GRUPO_ID = SG.SELO_GRUPO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula LEFT JOIN'}
    'LEFT JOIN ' +
    'G_EMOLUMENTO_ITEM EI ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'AVV.EMOLUMENTO_ITEM_ID = EI.EMOLUMENTO_ITEM_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula LEFT JOIN'}
    {'LEFT JOIN ' +
    'T_ATO_VINCULOPARTE AVP ' +}

    {$REGION 'Cláusula ON'}
    {'ON ' +
    //'A.ATO_ID = AVP.ATO_ID AND ' +
    //'AVP.TIPO_VINCULO IN (' +
      string('0').QuotedString + ', ' +
      string('1').QuotedString + ') AND ' +
    'AVP.ORDEM = 1 ' +}
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula - Digitalizacao'}
    'LEFT JOIN ' +
    'G_NATUREZA_TITULO NT ON ' +
    'AVV.NATUREZA_TITULO_ID = NT.NATUREZA_TITULO_ID '+
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    ' WHERE ' +
    ' (A.DATA_LAVRATURA '+ MontarSqlData(
      edtPesqDataInicial.Date,
      edtPesqDataFinal.Date) + ') AND '+
    ' (AVV.VALOR_DOCUMENTO IS NULL OR AVV.VALOR_DOCUMENTO = 0) AND ' +
    ' A.NATUREZA_ID IN (1, 2, 3, 4) ';
    {$ENDREGION}

    {$REGION 'Cláusula Digitalizacao'}
    if vpDigitalizacao then
         viSQL := viSQL +  ' AND COALESCE(NT.TIPO_RECIBO,'''') = ''7'''
    else viSQL := viSQL +  ' AND COALESCE(NT.TIPO_RECIBO,'''') <> ''7''';
    {$ENDREGION}

    {$REGION 'Cláusula ORDER BY'}
    viSQL := viSQL +
        'ORDER BY ' +
        'A.DATA_LAVRATURA';
    {$ENDREGION}

  {$ENDREGION}

  ExecutaSqlAuxiliar(
    viSQL,
    ZeroValue);

  try
    if dtmControles.sqlAuxiliar.IsEmpty then
      Exit;

    viVinculoParte := TI9Query.Create(
      nil);

    viSelo := TI9Query.Create(
      nil);

    try
      viVinculoParte.Connection := dtmControles.DB;

      viVinculoParte.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'T_AVP.ATO_VINCULOPARTE_ID, ' +
        'T_AVP.PESSOA_CPF ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'T_ATO_VINCULOPARTE T_AVP ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        '(T_AVP.ATO_ID = :P_ATO_ID) AND ' +
        '(T_AVP.TIPO_VINCULO IN (''0'', ''1'')) AND ' +
        '(T_AVP.ORDEM BETWEEN :P_ORDEM_INICIAL AND :P_ORDEM_FINAL) ' +
        {$ENDREGION}

        {$REGION 'Cláusula ORDER BY'}
        'ORDER BY ' +
        'T_AVP.ORDEM';
        {$ENDREGION}

      {$ENDREGION}

      viSelo.Connection := dtmControles.DB;

      viSelo.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'G_SL.SELO_LIVRO_ID, ' +
        '(G_SL.SIGLA || RIGHT(''000000'' || CAST(G_SL.NUMERO AS INTEGER), 6)) AS NUMERO_SIGLA ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LIVRO G_SL ' +
        {$ENDREGION}

        {$REGION 'Cláusula LEFT OUTER JOIN'}
        'LEFT OUTER JOIN ' +
        'G_SELO_LOTE G_SLO ' +

        {$REGION 'Cláusula ON'}
        'ON ' +
        'G_SLO.SELO_LOTE_ID = G_SL.SELO_LOTE_ID ' +
        {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        '(G_SL.TABELA = :P_TABELA) AND ' +
        '(G_SL.CAMPO_ID = :P_CAMPO_ID) AND ' +

        string.Format(
          '(G_SLO.SELO_GRUPO_ID %s 7) ',
          [IfThen(
            vpDigitalizacao,
            '=',
            '<>')]) +

        {$ENDREGION}

        {$REGION 'Cláusula ORDER BY'}
        'ORDER BY ' +
        'NUMERO_SIGLA';
        {$ENDREGION}

      {$ENDREGION}

      dtmControles.sqlAuxiliar.First;
      while not dtmControles.sqlAuxiliar.Eof do
        try
          viAtoID := dtmControles.sqlAuxiliar.FieldByName(
            'ATO_ID').AsInteger;

          viQuantidade := dtmControles.sqlAuxiliar.FieldByName(
            'QUANTIDADE').AsInteger;

          {$REGION 'Preencher valores dos parâmetros'}
          viVinculoParte.ParamByName(
            'P_ATO_ID').AsInteger := viAtoID;

          viVinculoParte.ParamByName(
            'P_ORDEM_INICIAL').AsInteger := 1;

          viVinculoParte.ParamByName(
            'P_ORDEM_FINAL').AsInteger := viQuantidade;

          viSelo.ParamByName(
            'P_TABELA').AsString := 'T_ATO';

          viSelo.ParamByName(
            'P_CAMPO_ID').AsInteger := viAtoID;
          {$ENDREGION}

          viVinculoParte.Open;
          viSelo.Open;

          try
            if viVinculoParte.RecordCount <> viQuantidade then
            begin
              TMensagemUtils.ExibirMensagemAtencao(
                string.Format(
                  'Quantidade de partes diferente da quantidade ' +
                  'do item no ato de nº %d',
                  [viAtoID]));

              Continue;
            end;

            if viSelo.RecordCount <> viQuantidade then
            begin
              TMensagemUtils.ExibirMensagemAtencao(
                string.Format(
                  'Quantidade de selos diferente da quantidade ' +
                  'do item no ato de nº %d',
                  [viAtoID]));

              Continue;
            end;

            viVinculoParte.First;
            viSelo.First;

            while not viVinculoParte.Eof do
              try
                ClientFermoju.Append;

                ClientFermojuSISTEMA_ID.AsInteger := vcTabelionato;
                ClientFermojuCODIGO.AsInteger := dtmControles.sqlAuxiliar.FieldByName(
                  'CODIGO').AsInteger;

                {$REGION 'Capturar Selo Inicial e Selo Final'}

                {viSQL := }{$REGION 'Comando SQL SELECT'}
                  //'SELECT ' +

                  {$REGION 'Colunas'}
                  {'(SL.SIGLA || RIGHT(''000000'' || CAST(SL.NUMERO AS INTEGER), 6)) ' +
                    'AS NUMEROSIGLA ' +}
                  {$ENDREGION}

                  {$REGION 'Cláusula FROM'}
                  {'FROM ' +
                  'G_SELO_LIVRO SL ' +
                  'LEFT OUTER JOIN G_SELO_LOTE ST ON '+
                  'SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+}
                  {$ENDREGION}

                  {$REGION 'Cláusula WHERE e Parâmetros'}
                  {'WHERE ' +
                  'SL.CAMPO_ID = ' + viAtoID.ToString + ' AND ' +
                  'SL.TABELA = ' + 'T_ATO'.QuotedString + ' AND ';}
                  {$ENDREGION}

                  {$REGION 'Cláusula Digitalizacao'}
                  {if vpDigitalizacao then
                       viSQL := viSQL +  ' ST.SELO_GRUPO_ID = 7 '
                  else viSQL := viSQL +  ' NOT ST.SELO_GRUPO_ID = 7 ';}
                  {$ENDREGION}

                  {$REGION 'Cláusula ORDER BY'}
                  {viSQL := viSQL +
                     'ORDER BY ' +
                     'NUMEROSIGLA';}
                  {$ENDREGION}

                {$ENDREGION}

                {ExecutaSimpleDSAux(
                  viSQL,
                  ZeroValue);}

                {try
                  if dtmControles.SimpleAuxiliar.IsEmpty.&Not then
                  begin
                    // Selo Inicial
                    dtmControles.SimpleAuxiliar.First;

                    ClientFermojuSELO_INICIAL.AsString := dtmControles.SimpleAuxiliar.
                      FieldByName('NUMEROSIGLA').AsString;

                    // Selo Final
                    dtmControles.SimpleAuxiliar.Last;

                    ClientFermojuSELO_FINAL.AsString := dtmControles.SimpleAuxiliar.
                      FieldByName('NUMEROSIGLA').AsString;
                  end;
                finally
                  dtmControles.SimpleAuxiliar.Close;
                end;}
                {$ENDREGION}

                viNumeroSigla := viSelo.FieldByName(
                  'NUMERO_SIGLA').AsString;

                ClientFermojuSELO_INICIAL.AsString := viNumeroSigla;
                ClientFermojuSELO_FINAL.AsString := viNumeroSigla;

                viEmolumento := dtmControles.sqlAuxiliar.FieldByName(
                  'EMOLUMENTO').AsCurrency / viQuantidade;

                ClientFermojuEMOLUMENTO.AsCurrency := viEmolumento;

                viFERMOJU := dtmControles.sqlAuxiliar.FieldByName(
                  'TAXA_JUDICIARIA').AsCurrency / viQuantidade;

                ClientFermojuFERMOJU.AsCurrency := viFERMOJU;

                viValorSelo := dtmControles.sqlAuxiliar.FieldByName(
                  'VALOR_OUTRA_TAXA1').AsCurrency / viQuantidade;

                ClientFermojuVALOR_SELO.AsCurrency := viValorSelo;

                viTotal := viEmolumento + viFERMOJU + viValorSelo;
                ClientFermojuTOTAL.AsCurrency := viTotal;

                viData := dtmControles.sqlAuxiliar.FieldByName(
                  'DATA_LAVRATURA').AsDateTime;

                ClientFermojuDATA.AsDateTime := viData;

                ClientFermojuSELO_GRUPO_ID.AsInteger :=
                  dtmControles.sqlAuxiliar.FieldByName(
                    'SELO_GRUPO_ID').AsInteger;

                ClientFermojuSELO_TIPO.AsString :=
                  dtmControles.sqlAuxiliar.FieldByName(
                    'SELO_TIPO').AsString;

                DefinirMostrarSelo(dtmControles.sqlAuxiliar.FieldByName('SELO_TIPO').AsInteger);

                ClientFermojuVALOR_DOCUMENTO.AsCurrency := ZeroValue;
                //ClientFermojuTIPO_MOVIMENTACAO.AsString := 'DETALHADA';
                ClientFermojuTIPO_MOVIMENTACAO.AsString := 'RESUMIDA';

                {viQtdAtos := dtmControles.sqlAuxiliar.FieldByName(
                  'QUANTIDADE').AsInteger;}

                viQtdAtos := 1;
                ClientFermojuQTD_ATOS.AsInteger := viQtdAtos;

                viQtdSelos := viQtdAtos;
                ClientFermojuQTD_SELOS.AsInteger := viQtdSelos;

                viPessoaCPF := viVinculoParte.FieldByName(
                  'PESSOA_CPF').AsString;

                ClientFermojuPESSOA_CPF.AsString := viPessoaCPF;

                if vpDigitalizacao then
                     viTalao := viAtoID.ToString
                else viTalao := '';

                viTalao := GetTalao(
                  viData,
                  viAtoID);

                ClientFermojuTALAO.AsString         := viTalao;
                ClientFermojuAPOSTILAMENTO.AsString := 'N';

                if CompareValue(
                  ClientFermojuCODIGO.AsInteger,
                  2007) = EqualsValue then
                begin
                  ClientFermojuATA_NOTARIAL.AsString := 'N';
                  ClientFermojuREG_ATO_SEM_VALOR_ECONOMICO.AsString := 'N';
                  ClientFermojuSEGUNDA_VIA_REGISTRO_CRC.AsString    := 'N';
                  ClientFermojuREC_TIPO.AsString                    := 'E';
                end;

                viNumeroLivro := string.Empty;

                if dtmControles.sqlAuxiliar.FieldByName(
                  'NUMERO_LIVRO').IsNull.&Not then
                  viNumeroLivro := dtmControles.sqlAuxiliar.FieldByName(
                    'NUMERO_LIVRO').AsString;

                ClientFermojuNUMERO_LIVRO.AsString := viNumeroLivro;

                ClientFermojuFOLHA_INICIAL.AsInteger :=
                  dtmControles.sqlAuxiliar.FieldByName(
                    'FOLHA_INICIAL').AsInteger;

                ClientFermojuFOLHA_FINAL.AsInteger :=
                  dtmControles.sqlAuxiliar.FieldByName(
                    'FOLHA_FINAL').AsInteger;

                viQtdOutorgantes := viQtdSelos;
                ClientFermojuQTD_OUTORGANTES.AsInteger := viQtdOutorgantes;

                ClientFermojuCHECK.AsString := 'S';
                ClientFermojuPENDENCIA.AsString := 'N';

                if ClientFermojuSELO_GRUPO_ID.AsInteger = 7 then
                begin
                  ClientFermojuCUSTAS_POSTERGADAS_QUIT_DEVEDOR.AsString := 'N';
                  ClientFermojuMICROFILMAGEM_COPI_REF_PROT_TIT.AsString := 'N';
                  ClientFermojuNR_REGISTRO_ORDEM_AVERB_PREN.AsString    := viTalao;
                  ClientFermojuREC_TIPO.AsString := 'E';
                end;
                ClientFermoju.Post;
              finally
                viVinculoParte.Next;
                viSelo.Next;
              end;
          finally
            viVinculoParte.Close;
            viSelo.Close;
          end;
        finally
          dtmControles.sqlAuxiliar.Next;
        end;
    finally
      viVinculoParte.Free;
      viSelo.Free;
    end;
  finally
    dtmControles.sqlAuxiliar.Close;
  end;
end;

procedure TfrmGerarArquivoFermoju.ppAgruparServentiaClick(Sender: TObject);
begin
  cxGridPesquisa.OptionsView.GroupFooters := gfInvisible;
  cxGridPesquisaSERVENTIA.Visible         := False;
  cxGridPesquisaSERVENTIA.GroupIndex      := 0;
end;

procedure TfrmGerarArquivoFermoju.ppAgruparTodosClick(Sender: TObject);
begin
  cxGridPesquisa.OptionsView.GroupFooters := gfInvisible;
  cxGridPesquisaSERVENTIA.Visible         := False;
  cxGridPesquisaCODIGO.Visible            := False;
  cxGridPesquisaTIPO_MOVIMENTACAO.Visible := False;

  cxGridPesquisaSERVENTIA.GroupIndex         := 0;
  cxGridPesquisaCODIGO.GroupIndex            := 1;
  cxGridPesquisaTIPO_MOVIMENTACAO.GroupIndex := 2;
end;

procedure TfrmGerarArquivoFermoju.ppContrairTodosClick(Sender: TObject);
begin
  cxGridPesquisa.DataController.Groups.FullCollapse;
end;

procedure TfrmGerarArquivoFermoju.ppDesagruparServentiaClick(Sender: TObject);
begin
  cxGridPesquisa.OptionsView.GroupFooters := gfInvisible;
  cxGridPesquisaSERVENTIA.Visible         := True;
  cxGridPesquisaSERVENTIA.GroupIndex      := -1;
end;

procedure TfrmGerarArquivoFermoju.ppDesagruparTodosClick(Sender: TObject);
begin
  cxGridPesquisa.OptionsView.GroupFooters := gfVisibleWhenExpanded;
  cxGridPesquisaSERVENTIA.Visible         := True;
  cxGridPesquisaCODIGO.Visible            := True;
  cxGridPesquisaTIPO_MOVIMENTACAO.Visible := True;

  cxGridPesquisaSERVENTIA.GroupIndex         := -1;
  cxGridPesquisaCODIGO.GroupIndex            := -1;
  cxGridPesquisaTIPO_MOVIMENTACAO.GroupIndex := -1;
end;

procedure TfrmGerarArquivoFermoju.ppExpandirTodosClick(Sender: TObject);
begin
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmGerarArquivoFermoju.RadioButton1Click(Sender: TObject);
begin
  edtCodigo.Clear;
  MarcarDesmarcarTodos('S');
end;

procedure TfrmGerarArquivoFermoju.RadioButton2Click(Sender: TObject);
begin
  MarcarDesmarcarTodos('N');
end;

function TfrmGerarArquivoFermoju.GetTalao(
  const vpData: TDateTime;
  const vpNumero: Integer): string;
{$REGION 'Variáveis'}
var
  viData: string;
  viNumero: string;
{$ENDREGION}
begin
  viData := FormatDateTime(
    'yyyymmdd',
    vpData);

  viNumero := string.Format(
    '%.6d',
    [vpNumero]);

  Result := viData + viNumero;
end;

procedure TfrmGerarArquivoFermoju.tbcFermojuChange(Sender: TObject);
begin
  ClientFermoju.Filtered := False;
  if tbcFermoju.TabIndex = 0 then
       ClientFermoju.Filter   := '((DEDUTIVEL = '+QuotedStr('N')+') OR (DEDUTIVEL = NULL) OR (DEDUTIVEL = '+ QuotedStr('')+'))'
  else ClientFermoju.Filter   := 'DEDUTIVEL = '+QuotedStr('S');
  ClientFermoju.Filtered := True;

  btnValidar.Enabled := (tbcFermoju.TabIndex = 0) and (ClientFermoju.RecordCount > 0);
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmGerarArquivoFermoju.Validar;
{$REGION 'Variáveis'}
var
  viRecNo: Integer;
  viCursor: TCursor;
{$ENDREGION}

  procedure AdicionarPendencia(
    const vpValue: string);
  begin
    FPendeciaList.Add(
      string.Format(
        'Data: %s%s' +
        'Pendência: %s%s' +
        'Cód. Ato: %s%s' +
        'Pedido: %s',
        [ClientFermojuDATA.AsString,
        sLineBreak,
        vpValue,
        sLineBreak,
        FormatarCodigoAto,
        sLineBreak,
        ClientFermojuTALAO.AsString]));

    ClientFermoju.Edit;
    ClientFermojuPENDENCIA.AsString := 'S';
    ClientFermoju.Post;
  end;

begin
  viCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  FPendeciaList.Clear;
  viRecNo := ClientFermoju.RecNo;
  ClientFermoju.DisableControls;

  try
    ClientFermoju.First;
    while not ClientFermoju.Eof do
      try
        if ClientFermojuCHECK.AsString.Equals(
          'N') then
          Continue;

        if ClientFermojuPESSOA_CPF.IsNull or
          ClientFermojuPESSOA_CPF.AsString.IsEmpty then
          Continue;

        if ValidarCPFCNPJ(
          ClientFermojuPESSOA_CPF.AsString) then
          Continue;

        AdicionarPendencia(
          'CPF/CNPJ do Requerente inválido');
      finally
        ClientFermoju.Next;
      end;
  finally
    ClientFermoju.RecNo := viRecNo;
    ClientFermoju.EnableControls;
    Screen.Cursor := viCursor;
  end;

  btnConfirmar.Enabled := FPendeciaList.IsEmpty;
  if btnConfirmar.Enabled then
  begin
    btnConfirmar.SetFocus;
    Exit;
  end;

  memPendencias.Clear;

  memPendencias.Text := string.Join(
    TStringUtils.GetQuebraLinhaDupla,
    FPendeciaList.ToArray);

  TMensagemUtils.ExibirMensagemAtencao(
    string.Format(
      'Foram encontradas pendências na validação.%sPor favor, verifique.',
      [sLineBreak]));

  pgcFERMOJU.ActivePage := tbsPendencias;
  memPendencias.SetFocus;
end;

end.
