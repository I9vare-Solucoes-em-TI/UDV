unit OrdemServicoSolicitar;


{ Tipo Inclusao

  0 = Inclusão de Ordem de Serviço pelos Sistemas
  1 = Inclusão de Item no Caixa com Ordem de Serviço
  2 = Alteração de Item do Caixa
  3 = Inclusão de Item no Caixa Tipo Credito ou Retirada de Valor na OS}

interface

uses
  I9Query,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, dxBarBuiltInMenu, cxPC,
  Vcl.StdCtrls, cxRadioGroup, cxButtons, Vcl.ExtCtrls, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  DbxDevartInterBase, Data.DB, Datasnap.DBClient, SimpleDS, Data.FMTBcd,
  cxDBEdit, cxCurrencyEdit, cxImageComboBox, Data.SqlExpr, Datasnap.Provider,
  cxGroupBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, dxBar, dxBarExtItems, Vcl.ImgList, cxCheckBox,
  cxSpinEdit, MaskUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, cxProgressBar;

Type

  TCaixaDados = Record
    TipoCaixa, OrdemServicoID : String;
    CaixaId, CaixaItemID : Integer;
    Data : TDate;
    ValorCalculo : Currency;
    NovoAuto : Boolean;
  End;

  TCaixaNovoItem = Record
    Situacao, Registrado, TipoTransacao, OSTipo, OSTransacao, OSSaida,
    Descricao, CaixaItemId, Apresentante, OrdemServicoID, Observacao : string;
    RetornoId, CaixaID, ChaveServico, Qtd, ReciboId, DesmembradoId : Integer;
    Valor : Currency;
    Data, Hora : String;
  end;

  TfrmOrdemServicoSolicitar = class(TForm)
    pnlTop: TPanel;
    lblInformacao: TcxLabel;
    pnlImagem: TPanel;
    imgTitulo: TImage;
    pnlBotoes: TPanel;
    dtsOrdemServico: TDataSource;
    sqlOrdemServico: TI9Query;
    sqlOrdemServicoDESCRICAO: TStringField;
    pgcOS: TcxPageControl;
    tbcOS: TcxTabSheet;
    sqlCaixaServicos: TI9Query;
    sqlCaixaServicosCAIXA_SERVICO_ID: TBCDField;
    sqlCaixaServicosDESCRICAO: TStringField;
    sqlCaixaServicosSITUACAO: TStringField;
    sqlCaixaServicosTIPO_TRANSACAO: TStringField;
    sqlCaixaServicosSISTEMA_ID: TBCDField;
    sqlCaixaServicosINTERNO_SISTEMA: TStringField;
    dtsCaixaServicos: TDataSource;
    ClientAncestral: TI9Query;
    dtsClientAncestral: TDataSource;
    ClientAncestralESPECIE_PAGAMENTO: TStringField;
    ClientAncestralCAIXA_ITEM_ID: TBCDField;
    ClientAncestralCAIXA_SERVICO_ID: TBCDField;
    ClientAncestralUSUARIO_SERVICO_ID: TBCDField;
    ClientAncestralUSUARIO_CAIXA_ID: TBCDField;
    ClientAncestralCHAVE_SERVICO: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralDATA_PAGAMENTO: TSQLTimeStampField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO_DOCUMENTO: TStringField;
    ClientAncestralTIPO_TRANSACAO: TStringField;
    ClientAncestralVALOR_SERVICO: TBCDField;
    ClientAncestralVALOR_PAGO: TBCDField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralCAIXA_CHEQUE_ID: TBCDField;
    ClientAncestralHORA_PAGAMENTO: TStringField;
    ClientAncestralCAIXA_ID: TBCDField;
    ClientAncestralRECIBO_ID: TBCDField;
    ClientAncestralTIPO_SERVICO: TStringField;
    ClientAncestralQTD: TBCDField;
    ClientAncestralAPRESENTANTE: TStringField;
    ClientAncestralMENSALISTA_ID: TBCDField;
    ClientAncestralQUITADO_CAIXA_ID: TBCDField;
    ClientAncestralREGISTRADO: TStringField;
    ClientAncestralEMOLUMENTO: TBCDField;
    ClientAncestralTAXA_JUDICIARIA: TBCDField;
    ClientAncestralFUNDESP: TBCDField;
    ClientAncestralDESCONTO: TBCDField;
    ClientAncestralVALOR_DOCUMENTO: TBCDField;
    ClientAncestralOUTRA_TAXA1: TBCDField;
    ClientAncestralCHAVE_SERVICO_SEC: TBCDField;
    ClientAncestralEMOLUMENTO_ITEM_ID: TBCDField;
    ClientAncestralCAIXA_REGISTROSELO_ID: TBCDField;
    ClientAncestralFUNDO_RI: TBCDField;
    ClientAncestralVALOR_RECIBO: TBCDField;
    ClientAncestralIMPORTADO: TStringField;
    ClientAncestralTAXA2: TBCDField;
    ClientAncestralCODIGO: TStringField;
    ClientAncestralESPECIE_PAGAMENTO2: TStringField;
    ClientAncestralVALOR_PRIMEIRO: TBCDField;
    ClientAncestralVALOR_SEGUNDO: TBCDField;
    ClientAncestralTIPO_CAIXA: TStringField;
    ClientAncestralRECIBO_NOTAS_ID: TBCDField;
    ClientAncestralMENSALISTA_GRUPO_ID: TBCDField;
    ClientAncestralQTD_PAGA: TBCDField;
    ClientAncestralCAIXA_DESTINO_ID: TBCDField;
    ClientAncestralCAIXA_FECHAMENTO_SAIDA_ID: TBCDField;
    ClientAncestralCAIXA_FECHAMENTO_ENTRADA_ID: TBCDField;
    ClientAncestralREG_FINANCEIRO: TStringField;
    ClientAncestralSERVICO_PEDIDO_ID: TBCDField;
    ClientAncestralTIPO_CARTAO_ID: TBCDField;
    ClientAncestralDEPOSITO_PREVIO: TStringField;
    ClientAncestralDEPOSITO_CONVERTIDO: TStringField;
    ClientAncestralRELATORIO: TStringField;
    sqlCaixaServicosOS_TIPO: TStringField;
    ClientAncestralOS_TIPO: TStringField;
    sqlCaixaItens: TI9Query;
    dtsCaixaItens: TDataSource;
    sqlCaixaItenscalc_Debitos: TCurrencyField;
    sqlCaixaItenscalc_creditos: TCurrencyField;
    sqlCaixaItenscalc_Numero: TStringField;
    sqlCaixaItensCAIXA_ITEM_ID: TBCDField;
    sqlCaixaItensCAIXA_SERVICO_ID: TBCDField;
    sqlCaixaItensUSUARIO_SERVICO_ID: TBCDField;
    sqlCaixaItensUSUARIO_CAIXA_ID: TBCDField;
    sqlCaixaItensCHAVE_SERVICO: TBCDField;
    sqlCaixaItensDESCRICAO: TStringField;
    sqlCaixaItensDATA_PAGAMENTO: TSQLTimeStampField;
    sqlCaixaItensSITUACAO: TStringField;
    sqlCaixaItensTIPO_TRANSACAO: TStringField;
    sqlCaixaItensVALOR_SERVICO: TBCDField;
    sqlCaixaItensVALOR_PAGO: TBCDField;
    sqlCaixaItensOBSERVACAO: TStringField;
    sqlCaixaItensHORA_PAGAMENTO: TStringField;
    sqlCaixaItensCAIXA_ID: TBCDField;
    sqlCaixaItensRECIBO_ID: TBCDField;
    sqlCaixaItensTIPO_SERVICO: TStringField;
    sqlCaixaItensQTD: TBCDField;
    sqlCaixaItensAPRESENTANTE: TStringField;
    sqlCaixaItensMENSALISTA_ID: TBCDField;
    sqlCaixaItensREGISTRADO: TStringField;
    sqlCaixaItensTIPO_CAIXA: TStringField;
    sqlCaixaItensSISTEMA_ID: TBCDField;
    sqlCaixaItensCALC_OS: TStringField;
    pnlOrdem: TPanel;
    rdbOrdemNova: TcxRadioButton;
    rdbOrdemAberta: TcxRadioButton;
    pgcOrdemServico: TcxPageControl;
    tabOrdemNova: TcxTabSheet;
    tabOrdemAberta: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    gbxInclusao: TcxGroupBox;
    Label17: TLabel;
    lbDescricao: TLabel;
    Label4: TLabel;
    tbcPesquisa: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    pnlAdicionar: TPanel;
    edtPesquisaOS: TcxTextEdit;
    edtPesquisaIdentificacao: TcxTextEdit;
    edtPesquisaDataIni: TcxDateEdit;
    edtPesquisaDataFin: TcxDateEdit;
    Label5: TLabel;
    icxPesquisaSituacao: TcxImageComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    ClientAncestralOS_TRANSACAO: TStringField;
    sqlPesquisaOS: TI9Query;
    dtsPesquisaOS: TDataSource;
    sqlPesquisaOSDESCRICAO: TStringField;
    sqlPesquisaOSSITUACAO: TStringField;
    sqlPesquisaOSDATA: TSQLTimeStampField;
    sqlPesquisaOSDATA_FECHAMENTO: TSQLTimeStampField;
    sqlPesquisaOSUSUARIO_ID: TBCDField;
    sqlPesquisaOSOBSERVACAO: TStringField;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    sqlPesquisaOSCALC_OS: TStringField;
    pnlFechar: TPanel;
    cxBtnFechar: TcxButton;
    pnlConfirmar: TPanel;
    btnCancelar: TcxButton;
    pnlNovaOS: TPanel;
    btnNovaOrdem: TcxButton;
    btnConfirmar: TcxButton;
    Label3: TLabel;
    sqlCaixaItensOS_TIPO: TStringField;
    sqlServicosSequenciais: TI9Query;
    sqlServicosSequenciaisCAIXA_SERVICO_SEQUENCIAL_ID: TBCDField;
    sqlServicosSequenciaisNATUREZA_TITULO_ID: TBCDField;
    sqlServicosSequenciaisEMOLUMENTO_ID: TBCDField;
    sqlServicosSequenciaisQUANTIDADE: TBCDField;
    sqlServicosSequenciaisCAIXA_SERVICO_ID: TBCDField;
    sqlServicosSequenciaisPADRAO_SELECAO: TStringField;
    dtsServicoSequencial: TDataSource;
    sqlCaixaServicosTIPO_VALOR: TStringField;
    sqlServicosSequenciaisCALC_SELECIONADO: TStringField;
    sqlServicosSequenciaisCALC_VALOR: TCurrencyField;
    sqlServicosSequenciaisCALC_QTD: TCurrencyField;
    sqlG_Emolumento: TI9Query;
    sqlG_EmolumentoEMOLUMENTO_ID: TBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    dtsG_Emolumento: TDataSource;
    sqlServicosSequenciaisDESCRICAO: TStringField;
    sqlNaturezaTitulo: TI9Query;
    sqlNaturezaTituloNATUREZA_TITULO_ID: TBCDField;
    sqlNaturezaTituloDESCRICAO: TStringField;
    sqlNaturezaTituloEMOLUMENTO_ID: TBCDField;
    dtsNaturezaTitulo: TDataSource;
    ClientItensSequencia: TClientDataSet;
    dtsItensSequencia: TDataSource;
    ClientItensSequenciaNATUREZA_TITULO_ID: TBCDField;
    ClientItensSequenciaEMOLUMENTO_ID: TBCDField;
    ClientItensSequenciaQUANTIDADE: TBCDField;
    ClientItensSequenciaPADRAO_SELECAO: TStringField;
    ClientItensSequenciaCAIXA_SERVICO_ID: TBCDField;
    ClientItensSequenciaCALC_VALOR: TCurrencyField;
    ClientItensSequenciaCALC_SELECIONADO: TStringField;
    ClientItensSequenciaCALC_QTD: TCurrencyField;
    ClientItensSequenciaDESCRICAO: TStringField;
    sqlCaixaItensSERVICO_RETORNO_ENTRADA: TBCDField;
    sqlCaixaItensSERVICO_RETONO_SAIDA: TBCDField;
    sqlCaixaItensCALC_RETORNO: TStringField;
    sqlCaixaItensSERVICO_CONFIRMADO: TBCDField;
    pgcItensOS: TcxPageControl;
    tbcItensOs: TcxTabSheet;
    pnlMostrarSaldo: TPanel;
    cxGroupBox4: TcxGroupBox;
    edtSaldoOS: TcxCurrencyEdit;
    cxGroupBox5: TcxGroupBox;
    edtSaldoRegistro: TcxCurrencyEdit;
    cxGroupBox6: TcxGroupBox;
    edtSaldoNotas: TcxCurrencyEdit;
    cxGroupBox7: TcxGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    edtSaldoAguardandoC: TcxCurrencyEdit;
    edtSaldoAguardandoD: TcxCurrencyEdit;
    cxGroupBox8: TcxGroupBox;
    edtSaldoADevolver: TcxCurrencyEdit;
    tbcItensOSSelecionar: TcxTabSheet;
    Panel1: TPanel;
    lblNome: TcxLabel;
    edtValorDocumento: TcxCurrencyEdit;
    btnCalcular: TcxButton;
    cxGroupBox2: TcxGroupBox;
    lcxNaturezaTitulo: TcxLookupComboBox;
    lblNaturezaTitulo: TcxLabel;
    btnAdicionarItem: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    btnExcluirOS: TcxButton;
    sqlOrdemServicoSITUACAO: TStringField;
    dtsItensVinculados: TDataSource;
    sqlItensVinculados: TI9Query;
    sqlItensVinculadosORDEM_ITEM_SEQUENCIA_ID: TBCDField;
    sqlItensVinculadosCAIXA_ITEM_ID: TBCDField;
    sqlItensVinculadosNATUREZA_TITULO_ID: TBCDField;
    sqlItensVinculadosQUANTIDADE: TBCDField;
    sqlItensVinculadosCAIXA_SERVICO_ID: TBCDField;
    sqlItensVinculadosVALOR: TBCDField;
    sqlItensVinculadosEMOLUMENTO_ID: TBCDField;
    tbcServicosRetorno: TcxTabSheet;
    Panel2: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    lcxServicoRetorno: TcxLookupComboBox;
    btnPesquisarRetorno: TcxButton;
    cxLabel8: TcxLabel;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    sqlServicoRetorno: TI9Query;
    dtsServicoRetorno: TDataSource;
    sqlServicoRetornoCAIXA_SERVICO_ID: TBCDField;
    sqlServicoRetornoDESCRICAO: TStringField;
    sqlItensRetorno: TI9Query;
    dtsItensRetorno: TDataSource;
    sqlItensRetornoCAIXA_ITEM_ID: TBCDField;
    sqlItensRetornoCAIXA_SERVICO_ID: TBCDField;
    sqlItensRetornoUSUARIO_SERVICO_ID: TBCDField;
    sqlItensRetornoDESCRICAO: TStringField;
    sqlItensRetornoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlItensRetornoSITUACAO: TStringField;
    sqlItensRetornoVALOR_SERVICO: TBCDField;
    sqlItensRetornoVALOR_PAGO: TBCDField;
    sqlItensRetornoAPRESENTANTE: TStringField;
    cxGridDBTableView6Column2: TcxGridDBColumn;
    cxGridDBTableView6Column5: TcxGridDBColumn;
    sqlItensRetornoCALC_OS: TStringField;
    sqlItensRetornoCALC_SELECIONADO: TStringField;
    btnRegistrarrRetorno: TcxButton;
    sqlItensRetornoCALC_SITUACAO: TStringField;
    sqlItensRetornoQTD: TBCDField;
    cxGridDBTableView6Column3: TcxGridDBColumn;
    sqlItensRetornoCS_SERVICO_RETORNO_ID: TBCDField;
    sqlItensRetornoCAIXA_SERVICO_RETORNO_ID: TBCDField;
    sqlItensRetornoCAIXA_SERVICO_ENTRADA_ID: TBCDField;
    btnAtualiza: TcxButton;
    dxBarManager1: TdxBarManager;
    dxBarManagerRotulo: TdxBar;
    dxBarProgressDinheiro: TdxBarProgressItem;
    dxBarProgressCheque: TdxBarProgressItem;
    dxBarStatic1: TdxBarStatic;
    dxBarProgressCartao: TdxBarProgressItem;
    gbxValorServico: TcxGroupBox;
    edtValorServico: TcxCurrencyEdit;
    sqlCaixaItensValorPagoCalc: TCurrencyField;
    Label7: TLabel;
    dxBarProgressItem1: TdxBarProgressItem;
    dxBarProgressItem2: TdxBarProgressItem;
    sqlCaixaItensOS_TRANSACAO: TStringField;
    ClientAncestralOS_SAIDA: TStringField;
    cxGroupBox9: TcxGroupBox;
    edtSaldoOutros: TcxCurrencyEdit;
    sqlItensDetalhes: TI9Query;
    dtsItensDetalhes: TDataSource;
    sqlItensDetalhesCAIXA_ITEM_ID: TBCDField;
    sqlItensDetalhesOBSERVACAO: TStringField;
    sqlItensDetalhesAUTORIZACAO_TIPO: TStringField;
    sqlItensDetalhesAUTORIZACAO_ID: TBCDField;
    imgCadBasicos: TImageList;
    dxBarOsAntigaSaldo: TdxBarProgressItem;
    sqlOrdemServicoOS_ANTIGA: TBCDField;
    gbxOSAntiga: TcxGroupBox;
    edtNumOSAntiga: TcxTextEdit;
    sqlPesquisaOSCALC_OBSERVACAO: TStringField;
    cxGridDBTableView3Obs: TcxGridDBColumn;
    sqlPesquisaOSOS_ANTIGA: TBCDField;
    Panel3: TPanel;
    cxLabel4: TcxLabel;
    icxTipoCliente: TcxImageComboBox;
    pgcIdentificacao: TcxPageControl;
    tbcIdentificacaoPadrao: TcxTabSheet;
    edtIdentificacao: TcxTextEdit;
    tbcIdentificacaoMensalista: TcxTabSheet;
    lcxMensalista: TcxLookupComboBox;
    sqlOrdemServicoMENSALISTA_ID: TBCDField;
    dxBarMensalista: TdxBarProgressItem;
    sqlCaixaItensORDEM_SERVICO_ID: TBCDField;
    ClientAncestralORDEM_SERVICO_ID: TBCDField;
    sqlItensVinculadosORDEM_SERVICO_ID: TBCDField;
    sqlPesquisaOSORDEM_SERVICO_ID: TBCDField;
    sqlItensRetornoORDEM_SERVICO_ID: TBCDField;
    sqlOrdemServicoORDEM_SERVICO_ID: TBCDField;
    popOS: TPopupMenu;
    mniComDireto_OSCredito: TMenuItem;
    mniComOSCredito_Direto: TMenuItem;
    N1: TMenuItem;
    mniComSomenteItemMensalista: TMenuItem;
    mniComOsMensalista: TMenuItem;
    N2: TMenuItem;
    mniComACompensar: TMenuItem;
    mniComAAguardando: TMenuItem;
    N3: TMenuItem;
    mniTrocarOS: TMenuItem;
    sqlCaixaServicosVALOR: TBCDField;
    Label9: TLabel;
    sqlItensRetornoCALC_VALOR_DEDUZIR: TCurrencyField;
    cxGridDBTableValorUtilizado: TcxGridDBColumn;
    sqlCaixaServicosVALOR_FIXO_RETORNO: TStringField;
    sqlItensRetornoVALOR_FIXO_RETORNO: TStringField;
    cxGridDBTableViewFixoRetorno: TcxGridDBColumn;
    sqlServicoRetornoVALOR_FIXO_RETORNO: TStringField;
    N4: TMenuItem;
    mniComDireto_DeducaoOS: TMenuItem;
    mniComOSDeducao_Direto: TMenuItem;
    sqlCaixaItensOS_SAIDA: TStringField;
    sqlCaixaItensCALC_IMPRESSAO: TBooleanField;
    N5: TMenuItem;
    mniAcertoOS: TMenuItem;
    mniConverterOSCreditoDevolucao: TMenuItem;
    dxBarCreditoDevolvido: TdxBarProgressItem;
    dxBarEntradaCaixa: TdxBarProgressItem;
    dxBarSaidaCaixa: TdxBarProgressItem;
    mniDesmembrar: TMenuItem;
    N6: TMenuItem;
    sqlCaixaItensQUITADO_CAIXA_ID: TBCDField;
    dxBarProgressCaixaAConfirmar: TdxBarProgressItem;
    dxBarProgressMensRecebido: TdxBarProgressItem;
    rdbEntradas: TcxRadioButton;
    rdbSaidas: TcxRadioButton;
    rdbOSAntiga: TcxRadioButton;
    lbxServico: TcxDBLookupComboBox;
    edtQtd: TcxDBSpinEdit;
    IbxTransacao: TcxDBImageComboBox;
    icxServentia: TcxImageComboBox;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TcxDBTextEdit;
    edtObservacao: TcxDBTextEdit;
    edtValorPago: TcxDBCurrencyEdit;
    icxTipoRegistro: TcxDBImageComboBox;
    sqlCaixaItensCALC_VALOR_OS: TCurrencyField;
    sqlPesquisaOSMENSALISTA_ID: TBCDField;
    cxGridDBTableViewMensalista: TcxGridDBColumn;
    tbcItensAtivos: TcxTabControl;
    grdOS: TcxGrid;
    cxGridDBTableItensOS: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBTableItensOSColumn5: TcxGridDBColumn;
    cxGridDBDescricao: TcxGridDBColumn;
    cxGridDBTableItensOSServco: TcxGridDBColumn;
    cxGridDBTableItensOSColumn3: TcxGridDBColumn;
    cxGridDBTableValorItem: TcxGridDBColumn;
    cxGridDBTableCredito: TcxGridDBColumn;
    cxGridDBTableDebito: TcxGridDBColumn;
    cxGridDBTableItensOSColumn2: TcxGridDBColumn;
    cxGridDBTableItensOSColumn6: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBTableObservacao: TcxGridDBColumn;
    cxGridDBTableItensOSColumn4: TcxGridDBColumn;
    cxGridDBTableItensOSReciboImp: TcxGridDBColumn;
    grdOSDBTableView1: TcxGridDBTableView;
    grdOSDBTableView1Column1: TcxGridDBColumn;
    grdOSDBTableView1Column2: TcxGridDBColumn;
    grdOSDBTableView1Column3: TcxGridDBColumn;
    grdOSDBTableView2: TcxGridDBTableView;
    grdOSDBTableView2Column1: TcxGridDBColumn;
    grdOSDBTableView2Column2: TcxGridDBColumn;
    grdOSDBTableView2Column3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    grdOSLevel1: TcxGridLevel;
    grdOSLevel2: TcxGridLevel;
    mniConverterOSMensalistaOSPadrao: TMenuItem;
    N7: TMenuItem;
    sqlCaixaItensCALC_OBSERVACAO: TStringField;
    sqlCaixaItensLOGIN: TStringField;
    cxGridDBTableItensOSColumn1: TcxGridDBColumn;
    sqlItensDetalhesLOGIN: TStringField;
    sqlItensDetalhesCALC_OBSERVACAO: TStringField;
    popDesativarAcerto: TPopupMenu;
    MenuItem21: TMenuItem;
    sqlCaixaItensFINALIZACAO: TStringField;
    cxGridDBTableItensOSFinalizacao: TcxGridDBColumn;
    dxBarProgressItem3: TdxBarProgressItem;
    sqlCaixaItensCALC_ITEM_COMPENSADOR: TIntegerField;
    edtOS: TcxTextEdit;
    btnPesquisarOS: TcxButton;
    lcxIdentificacao: TcxLookupComboBox;
    cbxTipoRegistro: TcxGroupBox;
    icxTipoPagamento: TcxImageComboBox;
    Panel4: TPanel;
    btnCancelarItem: TcxButton;
    btnAdItem: TcxButton;
    btnCalculoRapido: TcxButton;
    btnExcluirItem: TcxButton;
    btnAdNovo: TcxButton;
    pnlOsAntiga: TPanel;
    lblOSAntiga: TcxLabel;
    edtOSAntiga: TcxTextEdit;
    cxTestAlerta: TcxTextEdit;
    sqlCaixaItensDATA_REGISTRO: TSQLTimeStampField;
    sqlItensRetornoRECIBO_ID: TBCDField;
    sqlCaixaItensDESMEMBRADO_ID: TBCDField;
    sqlItensRetornoCAIXA_ID: TBCDField;
    sqlItensRetornoUSUARIO_CAIXA_ID: TBCDField;
    tbcGerenciarOS: TcxTabSheet;
    Panel5: TPanel;
    sqlSaldoOS: TI9Query;
    dtsSaldoOS: TDataSource;
    sqlSaldoOSCALC_OS: TStringField;
    pgcListagem: TcxPageControl;
    tbcListaOS: TcxTabSheet;
    tbcLog: TcxTabSheet;
    cxGridSaldoOS: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBSaldoOS: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn38: TcxGridDBColumn;
    cxGridDBBandedTableView3: TcxGridDBBandedTableView;
    cxGridDBTableView9: TcxGridDBTableView;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridDBColumn40: TcxGridDBColumn;
    cxGridDBColumn41: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGrid5: TcxGrid;
    cxGridDBTableView10: TcxGridDBTableView;
    cxGridDBTableView11: TcxGridDBTableView;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBBandedTableView4: TcxGridDBBandedTableView;
    cxGridDBTableView12: TcxGridDBTableView;
    cxGridDBColumn42: TcxGridDBColumn;
    cxGridDBColumn43: TcxGridDBColumn;
    cxGridDBColumn44: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableView10Column1: TcxGridDBColumn;
    cxGridDBTableView10Column2: TcxGridDBColumn;
    ClientLog: TClientDataSet;
    dtsClientLog: TDataSource;
    ClientLogOrdem_Servico: TStringField;
    ClientLogDescricao_Erro: TStringField;
    cxGroupBox11: TcxGroupBox;
    edtTotalQtdOs: TcxCurrencyEdit;
    cxGroupBox10: TcxGroupBox;
    edtTotalSaldoOs: TcxCurrencyEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    sqlSaldoOSCALC_PESSOA: TStringField;
    sqlSaldoOSCALC_TIPO: TStringField;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    sqlSaldoOSCALC_SELECIONADO: TStringField;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxLabel12: TcxLabel;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    cxGridDBTableView1Column9: TcxGridDBColumn;
    Panel6: TPanel;
    cxLabel13: TcxLabel;
    btnOSAtualizarSaldo: TcxButton;
    Panel7: TPanel;
    btnOSAcerto: TcxButton;
    btnOsReabrir: TcxButton;
    sqlSaldoOSCALC_FECHAR: TBooleanField;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    cxLabel14: TcxLabel;
    icxSituacaoOS: TcxImageComboBox;
    icxOsTipo: TcxImageComboBox;
    icxOSSaldo: TcxImageComboBox;
    icxOSPendencia: TcxImageComboBox;
    icxOSOrdenacao: TcxImageComboBox;
    sqlSaldoOSORDEM_SERVICO_ID: TBCDField;
    sqlSaldoOSDESCRICAO: TStringField;
    sqlSaldoOSSITUACAO: TStringField;
    sqlSaldoOSDATA: TSQLTimeStampField;
    sqlSaldoOSMENSALISTA_ID: TBCDField;
    sqlSaldoOSSALDO_OS: TBCDField;
    sqlSaldoOSMENSALISTA: TStringField;
    sqlSaldoOSDATA_INATIVIDADE: TSQLTimeStampField;
    sqlSaldoOSQTD_ITENS_AGUARDANDO: TIntegerField;
    sqlSaldoOSQTD_ITENS_MENSALISTA: TIntegerField;
    sqlSaldoOSQTD_ITENS_COMPENSAR: TIntegerField;
    cxLabel15: TcxLabel;
    icxTipoSistema: TcxImageComboBox;
    btnLimaprTipoServentia: TcxButton;
    cxLabel16: TcxLabel;
    edtDataOcorrencia: TcxDateEdit;
    brnPesquisarSaldoOS: TcxButton;
    sqlSaldoOSIDS_RI: TMemoField;
    cxGridDBTableView1Column10: TcxGridDBColumn;
    sqlSaldoOSCALC_REGISTRADO: TStringField;
    chxRegistradoRi: TcxCheckBox;
    icxSituacaoRI: TcxImageComboBox;
    cxProgressBar1: TcxProgressBar;
    cxLabel17: TcxLabel;
    edtOSPesquisa: TcxTextEdit;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure rdbOrdemNovaClick(Sender: TObject);
    procedure rdbOrdemAbertaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarOSClick(Sender: TObject);
    procedure lcxIdentificacaoPropertiesEditValueChanged(Sender: TObject);
    procedure edtOSKeyPress(Sender: TObject; var Key: Char);
    procedure lbxServicoPropertiesEditValueChanged(Sender: TObject);
    procedure sqlCaixaItensCalcFields(DataSet: TDataSet);
    procedure btnCalculoRapidoClick(Sender: TObject);
    procedure btnAdItemClick(Sender: TObject);
    procedure pgcOSChange(Sender: TObject);
    procedure btnNovaOrdemClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure sqlPesquisaOSCalcFields(DataSet: TDataSet);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure sqlPesquisaOSAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableView3DblClick(Sender: TObject);
    procedure edtPesquisaOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisaIdentificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure icxPesquisaSituacaoPropertiesEditValueChanged(Sender: TObject);
    procedure edtPesquisaOSKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdNovoClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure icxTipoRegistroPropertiesChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure sqlCaixaItensAfterScroll(DataSet: TDataSet);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure sqlServicosSequenciaisCALC_SELECIONADOChange(Sender: TField);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure cxGridDBTableItensOSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnExcluirOSClick(Sender: TObject);
    procedure btnPesquisarRetornoClick(Sender: TObject);
    procedure sqlItensRetornoCalcFields(DataSet: TDataSet);
    procedure sqlItensRetornoCALC_SELECIONADOChange(Sender: TField);
    procedure sqlItensRetornoAfterScroll(DataSet: TDataSet);
    procedure btnRegistrarrRetornoClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure lcxNaturezaTituloPropertiesEditValueChanged(Sender: TObject);
    procedure rdbEntradasClick(Sender: TObject);
    procedure rdbSaidasClick(Sender: TObject);
    procedure edtOSAntigaKeyPress(Sender: TObject; var Key: Char);
    procedure edtOSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdbOSAntigaClick(Sender: TObject);
    procedure edtIdentificacaoExit(Sender: TObject);
    procedure icxTipoClientePropertiesEditValueChanged(Sender: TObject);
    procedure mniComDireto_OSCreditoClick(Sender: TObject);
    procedure mniComOSCredito_DiretoClick(Sender: TObject);
    procedure mniComSomenteItemMensalistaClick(Sender: TObject);
    procedure mniComOsMensalistaClick(Sender: TObject);
    procedure mniComACompensarClick(Sender: TObject);
    procedure mniComAAguardandoClick(Sender: TObject);
    procedure mniTrocarOSClick(Sender: TObject);
    procedure edtQtdPropertiesEditValueChanged(Sender: TObject);
    procedure lcxServicoRetornoPropertiesEditValueChanged(Sender: TObject);
    procedure mniComDireto_DeducaoOSClick(Sender: TObject);
    procedure mniComOSDeducao_DiretoClick(Sender: TObject);
    procedure cxGridDBTableItensOSCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure mniAcertoOSClick(Sender: TObject);
    procedure mniConverterOSCreditoDevolucaoClick(Sender: TObject);
    procedure mniDesmembrarClick(Sender: TObject);
    procedure tbcItensAtivosChange(Sender: TObject);
    procedure mniConverterOSMensalistaOSPadraoClick(Sender: TObject);
    procedure sqlItensDetalhesCalcFields(DataSet: TDataSet);
    procedure mniDesativarAcertoOSClick(Sender: TObject);
    procedure btnOSAtualizarSaldoClick(Sender: TObject);
    procedure sqlSaldoOSCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxLabel13Click(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnOSAcertoClick(Sender: TObject);
    procedure btnLimaprTipoServentiaClick(Sender: TObject);
    procedure brnPesquisarSaldoOSClick(Sender: TObject);
    procedure btnOsReabrirClick(Sender: TObject);
    procedure chxRegistradoRiClick(Sender: TObject);
    procedure icxSituacaoRIPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edtOSPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    vlAbrindoForm, vlNaoAtualizarSaldo, vlNaoFechar, vlSaldoAbertura, vlMontandoSequencial, vlNovaOrdem, OSAntigaSenha : Boolean;
    vlOsNova, vlOsPesquisar, vgFiltroRI  : String;
    procedure SelecionarItensCaixa;
    procedure SelecionarCaixaServico(vpTipoOS : String);

    procedure IncluirAlterarItemCaixa;
    procedure PreencherDadosInclusao;
    procedure PreencherDadosAlteracao;
    procedure PreencherDadosAberturaCaixa;
    procedure CapturarValoresSequenciais;
    procedure CarregarItensSequencia;
    procedure HabilitarPainelNovaOS(vpHabilitar : Boolean);
    procedure CarregarOrdemServico(vpOrdemServico : String);
    procedure CarregarSaldo;
    procedure CarregarListaOSTipoSimples(vpLista : TcxImageComboBox; vpOpcao : Integer);
    procedure CarregarListaOSTipoDB(vpLista : TcxDBImageComboBox; vpOpcao : Integer);

    procedure CarregarListaOSSimplificado(vpLista : TcxImageComboBox);
    function VerificarTipoTransacao:String;
    procedure VerificarOSAntiga;
    Function ConversaoOSItem(vpOSTipo, vpOsTransacao, vpOSSaida,
            vpCaixaId, vpOS, vpMensagem : String; vpACompensar : String = '';
            vpItemCompensador : Integer = 0):Boolean;
    procedure PreencherValorUtilizado;
    function GerarRecibo(vpValor, vpDescricao : String):String;
    procedure VerificarPendenciaMensalista;
    Function PegarAnoMes(vpData : String; vpAnterior : Boolean = False):String;
    procedure AtualizaDadosGerais;
    procedure PesquisarGerenciarOS(vpSituacao : String);
    procedure FechamentoOSLote(vpTipo: String);
    procedure VerificarItensRI;
  public
    function SaldoTotalOS:Currency;
    procedure AcertoOSLoteSelecionado(vpLote : Boolean = False);
  end;

var
  frmOrdemServicoSolicitar: TfrmOrdemServicoSolicitar;
  vgCaixaDados : TCaixaDados;
  vgCaixaNovoItem : TCaixaNovoItem;

implementation

uses
  Controles, Rotinas, Lookup,
  Geral.Model.Entity.Spec.CalculoEmolumentos,
  Geral.View.Financeiro.CalculoRapido,
  ValidarPermissaoUsuario, SelecaoOSMensalista, ReciboOS,
  SelecaoOSDesmembramento, LookupFinancas,
  RI.Model.Entity.Enum.StatusProtocolo, RI.Model.Business.Spec.Protocolo,
  RI.Controller.Factory.Business.Protocolo;

{$R *.dfm}

procedure TfrmOrdemServicoSolicitar.mniAcertoOSClick(Sender: TObject);
begin
  AcertoOSLoteSelecionado(False);
  
  btnAtualizaClick(self);
  vlOsNova := edtOS.EditValue;
  pgcOSChange(self);
  pnlAdicionar.Visible := False;
end;

procedure TfrmOrdemServicoSolicitar.AcertoOSLoteSelecionado(vpLote : Boolean = False);
var
  viMsg : String;

  procedure VerificarServicoAbertoIndividual;
  var
    viFlag : Boolean;
  begin
    viFlag := dtmControles.GetInt(' SELECT COUNT(*) FROM C_CAIXA_ITEM '+
                                  ' WHERE  ORDEM_SERVICO_ID = '+sqlOrdemServicoORDEM_SERVICO_ID.AsString +
                                  '   AND  ((SITUACAO = ''3'')'+
                                  '   OR  ((SITUACAO = ''6'') AND (REGISTRADO = ''2''))'+
                                  '   OR  ((SITUACAO = ''7'') AND (REGISTRADO = ''2'')))') = 0;
    if not viFlag then
    begin
      Application.MessageBox('Existe(m) Item(s) em Aberto na OS!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      abort;
    end;
    viMsg := 'Acertar e Finalizar OS?';
  end;

  procedure VerificarServicoAbertoLote;
  begin
    sqlSaldoOS.Filtered := False;
    sqlSaldoOS.Filter   := 'CALC_SELECIONADO = ''S''';
    sqlSaldoOS.Filtered := True;

    if sqlSaldoOS.RecordCount = 0 then
    begin
      Application.MessageBox('Nenhum item de OS selecionado!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      icxSituacaoRIPropertiesEditValueChanged(self);
      abort;
    end;

    sqlSaldoOS.DisableControls;
    Screen.Cursor := crHourGlass;
    sqlSaldoOS.First;

    while not sqlSaldoOS.eof do
    begin
      if not sqlSaldoOSCALC_FECHAR.AsBoolean then
      begin
        icxSituacaoRIPropertiesEditValueChanged(self);
        sqlSaldoOS.EnableControls;
        cxGridSaldoOS.SetFocus;
        Screen.Cursor := crDefault;
        Application.MessageBox(Pchar('Existe(m) Item(s) em Aberto na(s) OS(S) Selecionada(s)!!!'+#13+#13+
                                     'Operação de Acerto Cancelado.'),'Atenção', MB_Ok + MB_ICONWARNING);
        abort;
      end
      else sqlSaldoOS.next;
    end;

    sqlSaldoOS.Filtered := False;
    sqlSaldoOS.Filter   := 'CALC_SELECIONADO = ''S''';
    sqlSaldoOS.Filtered := True;

    sqlSaldoOS.EnableControls;
    Screen.Cursor := crDefault;
    viMsg := 'Acertar/Finalizar OS(s) Selecionada(s)?';
  end;

  procedure FinalizarOS(vpOs : String);
  begin
    ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET SITUACAO = '+QuotedStr('F')+','+
                       '       DATA_FECHAMENTO = :DATA_FECHAMENTO '+
                       ' WHERE ORDEM_SERVICO_ID = '+vpOs,2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('DATA_FECHAMENTO').AsString    := dtmControles.DataHoraBanco(5);
      ExecSQL;
    end;
  end;

  procedure AcertoOS(vpOS : String; vpSaldoOS : Currency);
  begin
    vgCaixaNovoItem.Descricao       := 'Acerto de OS Realizado';
    vgCaixaNovoItem.Situacao        := '4';

    if vpSaldoOS > 0 then
    begin
      vgCaixaNovoItem.TipoTransacao   := 'D';
      vgCaixaNovoItem.Valor           := vpSaldoOS;
    end
    else
    begin
      vgCaixaNovoItem.TipoTransacao   := 'C';
      vgCaixaNovoItem.Valor           := vpSaldoOS * -1;
    end;

    vgCaixaNovoItem.Apresentante    := '';
    vgCaixaNovoItem.Observacao      := '';
    vgCaixaNovoItem.Qtd             := 0;
    vgCaixaNovoItem.Registrado      := '3';
    vgCaixaNovoItem.Valor           := vgCaixaNovoItem.Valor;
    vgCaixaNovoItem.OSTipo          := '9';
    vgCaixaNovoItem.OSTransacao     := vgCaixaNovoItem.TipoTransacao;
    vgCaixaNovoItem.OSSaida         := '';
    vgCaixaNovoItem.ReciboId        := 0;
    vgCaixaNovoItem.RetornoId       := 0;
    vgCaixaNovoItem.OrdemServicoID  := vpOS;
    vgCaixaNovoItem.Data            := dtmControles.DataHoraBanco(1);
    vgCaixaNovoItem.Hora            := dtmControles.DataHoraBanco(2);
    vgCaixaNovoItem.DesmembradoId   := 0;
    IncluirItemCaixaOS;
    FinalizarOS(vpOS);
  end;

begin
  if vpLote then
       VerificarServicoAbertoLote
  else VerificarServicoAbertoIndividual;

  if Application.MessageBox(Pchar(viMsg), 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_ACERTO_OS', 6, 20)[6] = '0') then
    Exit;

  vgOrdemServico.AutorizacaoId   := vlUsuarioIdLiberacao.ToInteger;
  vgOrdemServico.AutorizacaoTipo := '3';

  vgCaixaNovoItem.ChaveServico := dtmControles.BuscarParametroOutroSistema('SERVICO_ACERTO_OS', 'GERAL','NOVO_CAIXA','5');
  sqlSaldoOS.DisableControls;
  Screen.Cursor := crHourGlass;

  if vpLote then
  begin
    sqlSaldoOS.Filtered := False;
    sqlSaldoOS.Filter   := 'CALC_SELECIONADO = ''S''';
    sqlSaldoOS.Filtered := True;

    sqlSaldoOS.First;
    IniciarIncrementarProgressBar(cxProgressBar1, sqlSaldoOS.RecordCount);
    vgOrdemServico.AutorizacaoTipo := '4';
    repeat
      if ((sqlSaldoOSCALC_REGISTRADO.AsString <> 'A') and
         ((sqlSaldoOSIDS_RI.AsString <> '') and (chxRegistradoRi.Checked))) or
          (sqlSaldoOSIDS_RI.AsString = '') then
      begin
        if sqlSaldoOSSALDO_OS.AsCurrency = 0 then
             FinalizarOS(sqlSaldoOSORDEM_SERVICO_ID.AsString)
        else AcertoOS(sqlSaldoOSORDEM_SERVICO_ID.AsString, sqlSaldoOSSALDO_OS.AsCurrency);
      end;
      IniciarIncrementarProgressBar(cxProgressBar1, 1, True);
      sqlSaldoOS.Next;
    until sqlSaldoOS.Eof;
  end
  else AcertoOS(sqlOrdemServicoORDEM_SERVICO_ID.AsString, edtSaldoOS.EditValue);

  cxProgressBar1.Visible := False;
  icxSituacaoRIPropertiesEditValueChanged(self);
  sqlSaldoOS.EnableControls;
  Screen.Cursor := crDefault;
  brnPesquisarSaldoOSClick(self);
end;

procedure TfrmOrdemServicoSolicitar.AtualizaDadosGerais;
begin
  vgOrdemServico.MensalistaId := sqlOrdemServicoMENSALISTA_ID.AsInteger;

  if vgOrdemServico.MensalistaId = 0 then
    tabOrdemAberta.Caption := 'Dados da Ordem de Serviço Aberta - Cliente Padrão'
  else
  begin
    tabOrdemAberta.Caption      := 'Dados da Ordem de Serviço Aberta - Cliente MENSALISTA '+
                                   dtmControles.GetStr(' SELECT DESCRICAO FROM C_MENSALISTA WHERE MENSALISTA_ID = '+ sqlOrdemServicoMENSALISTA_ID.AsString);
    tabOrdemAberta.ImageIndex   := 10;
  end;

  tbcItensAtivos.TabIndex := 0;
  tbcItensAtivosChange(self);
  tbcItensAtivos.HideTabs := dtmControles.GetInt(' SELECT COUNT(CAIXA_ITEM_ID) FROM C_CAIXA_ITEM '+
                                                 '  WHERE SITUACAO = ''5'''+
                                                 '    AND ORDEM_SERVICO_ID = '+sqlOrdemServicoORDEM_SERVICO_ID.AsString) = 0;
end;

procedure TfrmOrdemServicoSolicitar.btnAdicionarItemClick(Sender: TObject);
begin
  ClientItensSequencia.Append;
  ClientItensSequenciaNATUREZA_TITULO_ID.AsInteger := lcxNaturezaTitulo.EditValue;
  ClientItensSequenciaEMOLUMENTO_ID.AsInteger      := sqlNaturezaTituloEMOLUMENTO_ID.AsInteger;
  ClientItensSequenciaQUANTIDADE.AsInteger         := 1;
  ClientItensSequenciaPADRAO_SELECAO.AsString      := 'N';
  ClientItensSequenciaCALC_SELECIONADO.AsString    := 'S';
  ClientItensSequenciaCAIXA_SERVICO_ID.AsInteger   := sqlCaixaServicosSISTEMA_ID.AsInteger;
  ClientItensSequenciaDESCRICAO.AsString           := lcxNaturezaTitulo.Text;
  ClientItensSequencia.Post;
  btnCalcularClick(SELF);

  btnAdicionarItem.Enabled    := False;
  lcxNaturezaTitulo.EditValue := NULL;
  lcxNaturezaTitulo.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.btnAdItemClick(Sender: TObject);
var
  viQtdPalavras : Integer;

  procedure Validar;
  begin
    if gbxInclusao.Visible then
    begin
      ClientAncestralVALOR_SERVICO.AsCurrency := ClientAncestralVALOR_PAGO.AsCurrency;
      VerificarPreenchimentoLCX_DB(lbxServico.Text, 'Serviço',lbxServico);
      VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descricao',edtDescricao);
      VerificarPreenchimentoCUR_DB(edtValorPago.EditValue, 'Valor a Registrar',edtValorPago);
      VerificarPreenchimentoICX_DB(icxTipoRegistro.Text, 'Tipo Registro', icxTipoRegistro);

      if rdbOSAntiga.Checked then
        VerificarPreenchimentoEDT_TX(edtOSAntiga.Text, 'OS Antiga', edtOSAntiga);
    end;

    if tbcOS.TabVisible then
    begin
      pgcOS.ActivePage := tbcOS;
      if rdbOrdemNova.Checked then
      begin
        VerificarPreenchimentoEDT_TX(edtIdentificacao.Text, 'Apresentante/Descricao',edtIdentificacao);

        viQtdPalavras := Rotinas.RetornatQdtPalavras(edtIdentificacao.text);
        if viQtdPalavras < 2 then
        begin
          Application.MessageBox('Nome Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
          edtIdentificacao.SetFocus;
          exit;
        end;
        vgOrdemServico.Identificacao := edtIdentificacao.EditValue;
      end
      else
      begin
        if not gbxInclusao.Visible then
        begin
          VerificarPreenchimentoLCX_TX(lcxIdentificacao.Text, 'Identificação da OS', lcxIdentificacao);
          VerificarPreenchimentoICX_TX(icxTipoPagamento.Text, 'Tipo de Pagamento', icxTipoPagamento);
          vgOrdemServico.Ordem := lcxIdentificacao.EditValue;
        end;
      end;
    end;
  end;

  procedure GravarItensOrdemSequencia(vpCaixaItemId : String);
  var
    viSql : String;
  begin
    if not tbcItensOSSelecionar.TabVisible then
      exit;

    ClientItensSequencia.DisableControls;
    ClientItensSequencia.First;
    while not ClientItensSequencia.Eof do
    begin
      if ClientItensSequenciaCALC_SELECIONADO.AsString = 'S' then
      begin
        viSql := 'INSERT INTO C_ORDEM_ITEM_SEQUENCIA (ORDEM_ITEM_SEQUENCIA_ID, CAIXA_ITEM_ID, ORDEM_SERVICO_ID, NATUREZA_TITULO_ID, QUANTIDADE, CAIXA_SERVICO_ID, VALOR, EMOLUMENTO_ID) ' +
               'VALUES ( ' + dtmControles.GerarSequencia('C_ORDEM_ITEM_SEQUENCIA') + ',' +
                             vpCaixaItemId+','+
                             sqlOrdemServicoORDEM_SERVICO_ID.AsString+','+
                             ClientItensSequenciaNATUREZA_TITULO_ID.AsString+','+
                             ClientItensSequenciaQUANTIDADE.AsString+','+
                             ClientItensSequenciaCAIXA_SERVICO_ID.AsString+','+
                             TrocaVirgPPto(ClientItensSequenciaCALC_VALOR.AsString) + ',' +
                             ClientItensSequenciaEMOLUMENTO_ID.AsString+ ')';
        dtmControles.ExecSQL(viSql);
      end;
      ClientItensSequencia.Next
    end;
    ClientItensSequencia.EnableControls;
  end;

begin
  Validar;
  VerificarPendenciaMensalista;

  if OSAntigaSenha then
  begin
    if Application.MessageBox('Já existe um item de OS Antiga. Confirma o cadastro de um novo item?', 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
      exit;

    if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS', 6, 20)[6] = '0') then
      Exit;
  end;

  if gbxInclusao.Visible then
  begin
    if vgCaixaDados.CaixaItemID = 0 then
    begin
      ClientAncestralCAIXA_ITEM_ID.AsInteger  := dtmControles.GerarSequencia('C_CAIXA_ITEM');
      ClientAncestralVALOR_SERVICO.AsCurrency := ClientAncestralVALOR_PAGO.AsCurrency;

      if pgcOrdemServico.ActivePageIndex = 0 then
           ClientAncestralAPRESENTANTE.AsString := edtIdentificacao.Text
      else ClientAncestralAPRESENTANTE.AsString := lcxIdentificacao.Text;
    end;

    if tbcOS.TabVisible then
    begin
      if rdbOSAntiga.Checked then
      begin
        GravarOrdemServico(StrToInt(edtOSAntiga.EditValue));
        VerificarOSAntiga;
        ClientAncestralDESCRICAO.AsString := ClientAncestralDESCRICAO.AsString + ' - OS ANTIGA '+edtOSAntiga.Text;
      end
      else GravarOrdemServico;

      ClientAncestralORDEM_SERVICO_ID.AsCurrency := vgOrdemServico.Ordem;
    end;

    if (rdbSaidas.Checked) and (ClientAncestralOS_TIPO.AsString <> '5') then
    begin
      if ClientAncestralOS_TIPO.AsString = '1' then
        ClientAncestralOS_SAIDA.AsString := 'S'
      else
      begin
        if ClientAncestralOS_TIPO.AsString = '9' then
             ClientAncestralOS_TIPO.AsString  := '3'
        else ClientAncestralOS_SAIDA.AsString := 'R';
      end;
    end;

    ClientAncestralOS_TRANSACAO.AsString := VerificarTipoTransacao;
    ClientAncestral.Post;
  end;
  GravarItensOrdemSequencia(ClientAncestralCAIXA_ITEM_ID.AsString);

  sqlCaixaItens.Refresh;
  sqlItensVinculados.Refresh;
  sqlItensDetalhes.Refresh;

  vgCaixaDados.ValorCalculo := 0;
  lbxServico.Clear;
  edtDescricao.Clear;
  edtValorPago.Clear;
  btnCancelarItemClick(self);
  CarregarSaldo;
  ClientAncestral.First;
  btnAdNovo.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.btnAdNovoClick(Sender: TObject);
begin
  sqlCaixaItens.First;
  if (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensOS_TIPO.AsInteger = 4)
    and (sqlCaixaItensSITUACAO.AsString = '3') then
  begin
    Application.MessageBox('OS Aguardando Confirmação do Saldo da OS Antiga !!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    abort;
  end;

  OSAntigaSenha := False;
  if rdbOSAntiga.Checked then
  begin
    sqlCaixaItens.DisableControls;
    sqlCaixaItens.First;
    while not sqlCaixaItens.Eof do
    begin
      if (sqlCaixaItensOS_TIPO.AsString = '4') and (sqlCaixaItensSITUACAO.AsString <> '5') then
      begin
        OSAntigaSenha := True;
        Break;
      end;
      sqlCaixaItens.Next
    end;
    sqlCaixaItens.EnableControls;
  end;

  if rdbEntradas.Checked then
       rdbEntradasClick(self)
  else rdbSaidasClick(self);

  gbxInclusao.Visible     := True;
  btnAdNovo.Enabled       := False;
  btnCancelarItem.Enabled := True;
  btnAdItem.Enabled       := True;
  btnExcluirItem.Enabled  := False;
  cxBtnFechar.Enabled     := False;
  btnNovaOrdem.Enabled    := False;
  btnAtualiza.Enabled     := False;
  grdOS.Enabled           := False;
  tbcPesquisa.Enabled        := False;
  tbcServicosRetorno.Enabled := False;
  vgCaixaDados.TipoCaixa      := '2';

  if vgCaixaDados.ValorCalculo > 0 then
    edtValorDocumento.EditValue := vgCaixaDados.ValorCalculo;

  IncluirAlterarItemCaixa;
  lbxServico.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.btnAtualizaClick(Sender: TObject);
begin
  if sqlCaixaItens.Active then
  begin
    sqlCaixaItens.Refresh;
    sqlOrdemServico.Refresh;
  end;
  CarregarSaldo;
end;

procedure TfrmOrdemServicoSolicitar.btnCalculoRapidoClick(Sender: TObject);
begin
  vgDadosCalculo.SelecaoAutomatica := True;
  ExibirFormulario(tfrmCalculoRapido, frmCalculoRapido, True);
  if vgDadosCalculo.SelecaoConfirmada then
  begin
    ClientAncestralDESCRICAO.AsString    := vgDadosCalculo.Descricao;
    ClientAncestralVALOR_PAGO.AsCurrency := vgDadosCalculo.ValorTotal;
  end;
  vgDadosCalculo.SelecaoAutomatica := False;
  vgDadosCalculo.SelecaoConfirmada := False;
end;

procedure TfrmOrdemServicoSolicitar.btnCancelarClick(Sender: TObject);
begin
  vlNovaOrdem := False;
  if (vgOrdemServico.TipoInclusao <> 0) and not vgCaixaDados.NovoAuto then
  begin
    pnlConfirmar.Visible           := False;
    pnlNovaOS.Visible              := True;
    tbcPesquisa.TabVisible         := True;
    tbcServicosRetorno.TabVisible  := True;
    gbxInclusao.Enabled            := True;
    pnlAdicionar.Enabled           := True;
    dxBarManagerRotulo.Visible     := pgcOS.ActivePage = tbcOS;

    pgcOS.ActivePageIndex  := 0;
    pgcOSChange(self);
  end
  else
  begin
    vlNaoFechar := False;
    vgOrdemServico.Flag := False;
    Close;
  end;
end;

procedure TfrmOrdemServicoSolicitar.btnCancelarItemClick(Sender: TObject);
begin
  gbxInclusao.Visible     := False;
  btnAdNovo.Enabled       := True;
  btnCancelarItem.Enabled := False;
  btnAdItem.Enabled       := False;
  cxBtnFechar.Enabled     := True;
  btnNovaOrdem.Enabled    := True;
  btnAtualiza.Enabled     := True;
  grdOS.Enabled           := True;
  tbcPesquisa.Enabled        := True;
  tbcServicosRetorno.Enabled := True;

  tbcItensOSSelecionar.TabVisible := False;
  tbcItensOs.TabVisible           := True;
  pgcItensOS.ActivePageIndex      := 0;
end;

procedure TfrmOrdemServicoSolicitar.btnConfirmarClick(Sender: TObject);
var
  viQtdPalavras : Integer;

  procedure Validar;
  begin
    if gbxInclusao.Visible then
    begin
      ClientAncestralVALOR_SERVICO.AsCurrency := ClientAncestralVALOR_PAGO.AsCurrency;
      VerificarPreenchimentoLCX_DB(lbxServico.Text, 'Serviço',lbxServico);
      VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descricao',edtDescricao);
      VerificarPreenchimentoCUR_DB(edtValorPago.EditValue, 'Valor a Registrar',edtValorPago);
    end;

    if tbcOS.TabVisible then
    begin
      pgcOS.ActivePage := tbcOS;
      if rdbOrdemNova.Checked then
      begin
        vgOrdemServico.MensalistaId := 0;

        if icxTipoCliente.EditValue = '1' then
          VerificarPreenchimentoEDT_TX(edtIdentificacao.Text, 'Apresentante/Descricao',edtIdentificacao)
        else
        begin
          VerificarPreenchimentoLCX_TX(lcxMensalista.Text, 'Mensalista',lcxMensalista);
          edtIdentificacao.EditValue  := lcxMensalista.Text;
          vgOrdemServico.MensalistaId := lcxMensalista.EditValue;
        end;

        viQtdPalavras := Rotinas.RetornatQdtPalavras(edtIdentificacao.text);
        if viQtdPalavras < 2 then
        begin
          Application.MessageBox('Nome Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
          edtIdentificacao.SetFocus;
          Abort;
        end;
        vgOrdemServico.Identificacao := edtIdentificacao.EditValue;
        vgOrdemServico.OSTipo        := '1';
        vgOrdemServico.TransacaoOS   := vgOrdemServico.TransacaoItem;
      end
      else
      begin
        VerificarPreenchimentoLCX_TX(lcxIdentificacao.Text, 'Identificação da OS', lcxIdentificacao);
        if cbxTipoRegistro.Visible then
        begin
          VerificarPreenchimentoICX_TX(icxTipoPagamento.Text, 'Tipo do Registro', icxTipoPagamento);
          vgOrdemServico.OSTipo := icxTipoPagamento.EditValue;
        end
        else vgOrdemServico.OSTipo := icxTipoPagamento.EditValue;

        vgOrdemServico.Ordem  := lcxIdentificacao.EditValue;
        VerificarTipoTransacao;
      end;
    end;
  end;

  function VerificarSaldo:Boolean;
  begin
    case vgId of
       1 : Result := (edtSaldoRegistro.EditValue >= edtValorServico.EditValue) and (edtSaldoOS.EditValue >= edtValorServico.EditValue);
       2 : Result := (edtSaldoNotas.EditValue >= edtValorServico.EditValue) and (edtSaldoOS.EditValue >= edtValorServico.EditValue);
     else result := edtSaldoOS.EditValue >= edtValorServico.EditValue;
    end;
    vgOrdemServico.OSSaldo := edtSaldoOS.EditValue - (edtValorServico.EditValue);
  end;

begin
  if not vlNovaOrdem then
  begin
    if sqlOrdemServicoSITUACAO.AsString = 'F' then
    begin
      Application.MessageBox('Ordem de Serviço Fechada!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      exit;
    end;

    if sqlOrdemServicoSITUACAO.AsString = 'C' then
    begin
      Application.MessageBox('Ordem de Serviço Cancelada!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      exit;
    end;
  end;

  if btnAdItem.Visible then
    Close;

  vlNaoFechar := True;
  if pgcOrdemServico.ActivePageIndex = 0 then
    VerificarPreenchimentoICX_TX(icxTipoCliente.Text, 'Tipo Cliente da OS',icxTipoCliente);

  vgOrdemServico.AutorizacaoId   := 0;
  vgOrdemServico.AutorizacaoTipo := '';
  Validar;

  VerificarPendenciaMensalista;

  if vgOrdemServico.TipoInclusao = 3 then
  begin
    vlNovaOrdem := False;
    vgCaixaDados.NovoAuto := False;
    GravarOrdemServico;
    vlOsNova := IntToStr(Trunc(vgOrdemServico.Ordem));
    sqlOrdemServico.Refresh;
    pnlConfirmar.Visible          := False;
    pnlNovaOS.Visible             := True;
    tbcPesquisa.TabVisible        := True;
    tbcServicosRetorno.TabVisible := True;
    gbxInclusao.Enabled           := True;
    pnlAdicionar.Enabled          := True;
    dxBarManagerRotulo.Visible    := pgcOS.ActivePage = tbcOS;
    sqlPesquisaOS.Refresh;
    pgcOSChange(self);
    vlOsNova := '';
    btnAdNovo.SetFocus;
  end
  else
  begin
    // Verifica Saldo Disponivel da Dedução
    if (vgOrdemServico.TipoInclusao = 0) and (icxTipoPagamento.EditValue = '3') then
    begin
      if not VerificarSaldo then
      begin
        if Application.MessageBox('Saldo Insuficiente na OS. Deseja continuar assim mesmo?', 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
          exit;

        if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS',6,20)[6] = '0') then
            Exit;
        vgOrdemServico.AutorizacaoId   := vlUsuarioIdLiberacao.ToInteger;
        vgOrdemServico.AutorizacaoTipo := '1';
      end;
    end;
    VerificarTipoTransacao;
    vlNaoFechar := False;
    vgOrdemServico.Flag := True;
    Close;
  end;
end;

procedure TfrmOrdemServicoSolicitar.btnExcluirItemClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Estornar Item selecionado?'), 'Pergunta',
       mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlCaixaItens.Refresh;
  if sqlCaixaItensSITUACAO.AsString = '4' then
  begin
    Application.MessageBox('Operação Cancelada. Item já Confirmado no Caixa!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    exit;
  end;

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET SITUACAO = '+QuotedStr('5')+','+
                     '         CAIXA_SERVICO_RETORNO_ID = NULL '+
                     ' WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,1);

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET CAIXA_SERVICO_ENTRADA_ID = NULL '+
                     ' WHERE CAIXA_SERVICO_ENTRADA_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,1);

  sqlCaixaItens.Refresh;
  VerificarOSAntiga;
  AtualizaDadosGerais;
  CarregarSaldo;
end;

procedure TfrmOrdemServicoSolicitar.btnExcluirOSClick(Sender: TObject);
var
  viQtdConfirmados : Integer;
  viSql : String;
begin
  if Application.MessageBox(Pchar('Excluir OS Selecionada?'), 'Pergunta',
       mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  // Verifica se na OS tem itens ja confirmados.
  viSql := ' SELECT COUNT(CAIXA_ITEM_ID) '+
           ' FROM C_CAIXA_ITEM '+
           ' WHERE ORDEM_SERVICO_ID = '+ sqlPesquisaOSORDEM_SERVICO_ID.AsString +
           '   AND SITUACAO <> ''3''';
  viQtdConfirmados := dtmControles.GetInt(viSql);
  if viQtdConfirmados > 0 then
  begin
    Application.MessageBox(Pchar('OS não pode ser Excluída!!!'+#13+#13+
                                 'Já existe itens registrados na OS.'), 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

  ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET SITUACAO = ''C'' WHERE ORDEM_SERVICO_ID = '+sqlPesquisaOSORDEM_SERVICO_ID.AsString,1);

  sqlPesquisaOS.Refresh;
end;

procedure TfrmOrdemServicoSolicitar.btnLimaprTipoServentiaClick(
  Sender: TObject);
begin
  icxTipoSistema.EditValue := null;
end;

procedure TfrmOrdemServicoSolicitar.btnLimparClick(Sender: TObject);
begin
  edtPesquisaOS.Clear;
  edtPesquisaIdentificacao.Clear;
  edtPesquisaDataIni.Clear;
  edtPesquisaDataFin.Clear;
  icxPesquisaSituacao.EditValue := null;
  btnPesquisarClick(self);
end;

procedure TfrmOrdemServicoSolicitar.btnNovaOrdemClick(Sender: TObject);
begin
  vlNovaOrdem := True;
  pgcIdentificacao.ActivePageIndex := 0;
  icxTipoCliente.EditValue         := -1; 
  LockWindowUpdate(Handle);
  HabilitarPainelNovaOS(True);
  rdbOrdemNovaClick(self);
  LockWindowUpdate(0);
end;

procedure TfrmOrdemServicoSolicitar.btnPesquisarClick(Sender: TObject);
var
  viSql, viCondicao, viData : String;

  procedure CarregarCondicao;
  begin
    viCondicao := '';

    if edtPesquisaOS.Text <> '' then
      viCondicao := '  AND ORDEM_SERVICO_ID = '+edtPesquisaOS.EditValue+
                    '  OR OS_ANTIGA = '+edtPesquisaOS.EditValue;

    if edtPesquisaIdentificacao.Text <> '' then
      viCondicao := viCondicao + ' AND DESCRICAO LIKE '+QuotedStr('%'+edtPesquisaIdentificacao.Text+'%');

    if (edtPesquisaDataIni.EditValue <> null) and (edtPesquisaDataFin.EditValue <> null) then
      viCondicao := viCondicao + ' AND DATA '+ Controles.MontarSqlData(StrToDate(edtPesquisaDataIni.Text),StrToDate(edtPesquisaDataFin.Text));

    if icxPesquisaSituacao.Text <> '' then
      viCondicao := viCondicao + '  AND SITUACAO = '+QuotedStr(icxPesquisaSituacao.EditValue);

  end;

begin
  viSql := ' SELECT * FROM C_ORDEM_SERVICO '+
           ' WHERE NOT ORDEM_SERVICO_ID IS NULL ';

  CarregarCondicao;
  if viCondicao = '' then
  begin
    viData := dtmControles.DataHoraBanco(4);
    viCondicao := ' AND (DATA '+ Controles.MontarSqlData(StrToDate(viData),StrToDate(viData)) +
                  ' AND SITUACAO = '+QuotedStr('A')+')';
  end;

  viSql := viSql + viCondicao +
           ' ORDER BY ORDEM_SERVICO_ID ';

  sqlPesquisaOS.Active := False;
  sqlPesquisaOS.SQL.Text := viSql;
  sqlPesquisaOS.Active := True;
end;

procedure TfrmOrdemServicoSolicitar.btnPesquisarOSClick(Sender: TObject);
var
  S: string;
begin
  if vlNovaOrdem then
    exit;

  if edtOS.CanPostEditValue then
    edtOS.PostEditValue;

  if (edtOS.EditValue = null) then
    edtOS.EditValue := '0';

  CarregarOrdemServico(edtOS.Text);
  if sqlOrdemServico.IsEmpty then
  begin
    Application.MessageBox('Ordem de Serviço não encontrada!', 'Informação', mb_Ok + MB_ICONINFORMATION);
    lcxIdentificacao.EditValue := null;
    edtOS.SetFocus;
    edtOS.SelectAll;
  end
  else
  begin
    S := (RetornarOrdemServicoNova(edtOS.Text));
    if S.IsEmpty then
    begin
      lcxIdentificacao.Clear;
      sqlCaixaItens.Close;
      Exit;
    end
    else
    begin
      vlNaoAtualizarSaldo        := True;
      lcxIdentificacao.EditValue := S;
      vlNaoAtualizarSaldo        := False
    end;

    edtOS.Enabled              := vgOrdemServico.TipoInclusao <> 3;
    lcxIdentificacao.Enabled   := vgOrdemServico.TipoInclusao <> 3;
    vgOrdemServico.Ordem       := edtOS.EditValue;
    SelecionarItensCaixa;
    cxGridDBTableItensOS.DataController.Groups.FullExpand;
    VerificarOSAntiga;
  end;

  if sqlOrdemServicoSITUACAO.AsString = 'A' then
       grdOS.PopupMenu := popOS
  else grdOS.PopupMenu := popDesativarAcerto;
end;

procedure TfrmOrdemServicoSolicitar.btnPesquisarRetornoClick(Sender: TObject);
begin
  sqlItensRetorno.Active := False;
  sqlItensRetorno.ParamByName('CAIXA_SERVICO_ID').AsInteger := lcxServicoRetorno.EditValue;
  sqlItensRetorno.Active := True;

  dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', sqlItensRetorno);
  PreencherValorUtilizado;
end;

procedure TfrmOrdemServicoSolicitar.btnRegistrarrRetornoClick(Sender: TObject);


  {$REGION 'AtualizarRegistroRetorno'}
  procedure AtualizarRegistroRetorno(vpValorRestante, vpValorOrigem : Currency;
          vpDesmembradoId : Integer = 0);
  var
    viSql : String;
    viValorRecebido : Currency;
  begin
    viValorRecebido := vpValorOrigem - vpValorRestante;

    viSql := ' UPDATE C_CAIXA_ITEM SET CAIXA_SERVICO_ENTRADA_ID = '+vgCaixaNovoItem.CaixaItemId;
    if vpValorRestante = 0 then
    begin
      viSql := viSql + ' WHERE CAIXA_ITEM_ID = '+ sqlItensRetornoCAIXA_ITEM_ID.AsString;
      ExecutaSqlAuxiliar(viSql, 1);
    end
    else
    begin
      viSql := viSql + ', VALOR_PAGO = :VALOR_PAGO '+
                       ', OBSERVACAO = :OBSERVACAO '+
                       ', DESMEMBRADO_ID = '+ IntToStr(vpDesmembradoId);
      viSql := viSql + ' WHERE CAIXA_ITEM_ID = '+ sqlItensRetornoCAIXA_ITEM_ID.AsString;
      ExecutaSqlAuxiliar(viSql, 2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('VALOR_PAGO').AsCurrency := viValorRecebido;
        ParamByName('OBSERVACAO').AsString   := 'Valor Origem = '+FormatFloat(',#0.00', vpValorOrigem) + ' - Utilizado Parcialmente, restante do valor desmembrado em novo item.';
        ExecSQL;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'DuplicarServicoRetornoRestante'}
  procedure DuplicarServicoRetornoRestante(vpSqlI9 : TI9Query);
  var
    viValorRestante : Currency;
  begin
    viValorRestante := sqlItensRetornoVALOR_PAGO.AsCurrency - sqlItensRetornoCALC_VALOR_DEDUZIR.AsCurrency;
    if viValorRestante = 0 then
    begin
      AtualizarRegistroRetorno(0,0);
      exit;
    end;

    vgCaixaNovoItem.ChaveServico    := sqlItensRetornoCAIXA_SERVICO_ID.AsInteger;
    vgCaixaNovoItem.Descricao       := sqlItensRetornoDESCRICAO.AsString;
    vgCaixaNovoItem.Observacao      := 'Desmembrado do Item de '+sqlItensRetornoDESCRICAO.AsString + ' - IDº '+
                                        sqlItensRetornoCAIXA_ITEM_ID.AsString;
    vgCaixaNovoItem.Data            := FormatDateTime('YYYY/MM/DD',sqlItensRetornoDATA_PAGAMENTO.AsDateTime);
    vgCaixaNovoItem.Hora            := FormatDateTime('hh:mm', sqlItensRetornoDATA_PAGAMENTO.AsDateTime);
    vgCaixaNovoItem.Situacao        := '4';
    vgCaixaNovoItem.TipoTransacao   := 'C';
    vgCaixaNovoItem.Valor           := viValorRestante;
    vgCaixaNovoItem.Apresentante    := sqlItensRetornoAPRESENTANTE.AsString;
    vgCaixaNovoItem.Qtd             := sqlItensRetornoQTD.AsInteger;
    vgCaixaNovoItem.Registrado      := '3';
    vgCaixaNovoItem.OSTipo          := '2';
    vgCaixaNovoItem.OSTransacao     := 'C';
    vgCaixaNovoItem.OSSaida         := '';
    vgCaixaNovoItem.ReciboId        := sqlItensRetornoRECIBO_ID.AsInteger;
    vgCaixaNovoItem.RetornoId       := 0;
    vgCaixaNovoItem.OrdemServicoID  := sqlItensRetornoORDEM_SERVICO_ID.AsString;
    vgCaixaNovoItem.DesmembradoId   := sqlItensRetornoCAIXA_ITEM_ID.AsInteger;

    IncluirItemCaixaOS(sqlItensRetornoUSUARIO_CAIXA_ID.AsInteger,  sqlItensRetornoCAIXA_ID.AsInteger);
    AtualizarRegistroRetorno(viValorRestante, sqlItensRetornoVALOR_PAGO.AsCurrency);
  end;
  {$ENDREGION}

  {$REGION 'IncluirServicoRetorno'}
  procedure IncluirServicoRetorno;
  begin
    vgCaixaNovoItem.ChaveServico    := sqlItensRetornoCS_SERVICO_RETORNO_ID.AsInteger;
    vgCaixaNovoItem.Descricao       := 'Pagamento do '+lcxServicoRetorno.Text;
    vgCaixaNovoItem.Observacao      := '';
    vgCaixaNovoItem.Situacao        := '4';
    vgCaixaNovoItem.TipoTransacao   := 'D';
    vgCaixaNovoItem.Valor           := sqlItensRetornoCALC_VALOR_DEDUZIR.AsCurrency;
    vgCaixaNovoItem.Apresentante    := sqlItensRetornoAPRESENTANTE.AsString;
    vgCaixaNovoItem.Qtd             := sqlItensRetornoQTD.AsInteger;
    vgCaixaNovoItem.Registrado      := '3';
    vgCaixaNovoItem.OSTipo          := '3';
    vgCaixaNovoItem.OSTransacao     := 'D';
    vgCaixaNovoItem.OSSaida         := 'R';
    vgCaixaNovoItem.ReciboId        := GerarRecibo(sqlItensRetornoCALC_VALOR_DEDUZIR.AsString, sqlItensRetornoAPRESENTANTE.AsString).ToInteger;
    vgCaixaNovoItem.RetornoId       := sqlItensRetornoCAIXA_ITEM_ID.AsInteger;
    vgCaixaNovoItem.OrdemServicoID  := sqlItensRetornoORDEM_SERVICO_ID.AsString;
    vgCaixaNovoItem.Data            := dtmControles.DataHoraBanco(1);
    vgCaixaNovoItem.Hora            := dtmControles.DataHoraBanco(2);
    vgCaixaNovoItem.DesmembradoId   := 0;
    IncluirItemCaixaOS(vgUsuarioID.ToInteger);
  end;
  {$ENDREGION}

  {$REGION 'RegistrarPagamentoOS'}
  procedure RegistrarPagamentoOS;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO C_CAIXA_REGISTRO( ' +
            '              CAIXA_REGISTRO_ID, '+
            '              ORDEM_SERVICO_ID, ' +
            '              ESPECIE, ' +
            '              TIPO_CARTAO_ID, ' +
            '              TAXA_CARTAO, ' +
            '              VALOR_ESPECIE, ' +
            '              TAXA_VALOR, ' +
            '              VALOR_SOMA, ' +
            '              PARCELA_QTD, ' +
            '              PARCELA_VALOR, ' +
            '              TIPO, ' +
            '              SITUACAO, ' +
            '              OPERACAO, ' +
            '              DATA, ' +
            '              RECIBO_ID, ' +
            '              CAIXA_ID) '+
            ' VALUES(      :CAIXA_REGISTRO_ID, ' +
            '              :ORDEM_SERVICO_ID, ' +
            '              :ESPECIE, ' +
            RetNullInteger(0) +','+
            '              :TAXA_CARTAO, ' +
            '              :VALOR_ESPECIE, ' +
            '              :TAXA_VALOR, ' +
            '              :VALOR_SOMA, ' +
            '              :PARCELA_QTD, ' +
            '              :PARCELA_VALOR, ' +
            '              :TIPO, ' +
            '              :SITUACAO, ' +
            '              :OPERACAO, ' +
            QuotedStr(dtmControles.DataHoraBanco(1))+',' +
            '              :RECIBO_ID, ' +
            '              :CAIXA_ID)', 2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('CAIXA_REGISTRO_ID').AsBCD     := dtmControles.GerarSequencia('C_CAIXA_REGISTRO');
      ParamByName('ORDEM_SERVICO_ID').AsCurrency := sqlItensRetornoORDEM_SERVICO_ID.AsCurrency;
      ParamByName('ESPECIE').AsString            := 'D';
      ParamByName('TAXA_CARTAO').AsCurrency      := 0;
      ParamByName('VALOR_ESPECIE').AsCurrency    := sqlItensRetornoCALC_VALOR_DEDUZIR.AsCurrency;
      ParamByName('TAXA_VALOR').AsCurrency       := 0;
      ParamByName('VALOR_SOMA').AsCurrency       := sqlItensRetornoCALC_VALOR_DEDUZIR.AsCurrency;
      ParamByName('PARCELA_QTD').AsBCD           := 1;
      ParamByName('PARCELA_VALOR').AsCurrency    := sqlItensRetornoCALC_VALOR_DEDUZIR.AsCurrency;
      ParamByName('CAIXA_ID').AsInteger          := vgCaixaNovoItem.CaixaID;
      ParamByName('RECIBO_ID').AsInteger         := vgCaixaNovoItem.ReciboId;
      ParamByName('TIPO').AsInteger              := 0;
      ParamByName('SITUACAO').AsString           := 'F';
      ParamByName('OPERACAO').AsString           := 'D';
      ExecSQL;
    end;
  {$ENDREGION}
end;

begin
  if sqlItensRetorno.IsEmpty then
  begin
    sqlItensRetorno.Filtered := False;
    Application.MessageBox('Operação Cancelada. Nenhum item selecionado!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

  if Application.MessageBox(Pchar('Confirmar Pagamento do(s) item(s) selecionado(s) de '+lcxServicoRetorno.Text+'?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
  begin
    sqlItensRetorno.Filtered := False;
    exit;
  end;

  vgCaixaNovoItem.CaixaID := dtmControles.GetInt(' SELECT CAIXA_ITEM_ID FROM C_CAIXA_ITEM WHERE SITUACAO = '+QuotedStr('1')+
                                                 '    AND USUARIO_CAIXA_ID = '+vgUsuarioID);

  if vgCaixaNovoItem.CaixaID = 0 then
  begin
    sqlItensRetorno.Filtered := False;
    Application.MessageBox('Nenhum Caixa Aberto foi encontrado para o Usuário Logado!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

  try
    dtmControles.StartTransaction;
    sqlItensRetorno.First;
    sqlItensRetorno.DisableControls;
    while not sqlItensRetorno.Eof do
    begin
      if sqlItensRetornoCALC_SELECIONADO.AsString = 'S' then
      begin
        IncluirServicoRetorno;
        RegistrarPagamentoOS;
        DuplicarServicoRetornoRestante(sqlItensRetorno);
      end;
      sqlItensRetorno.Next;
    end;
    dtmControles.Commit;
  except
     on E: Exception do
      begin
        dtmControles.Rollback;
        Application.MessageBox(PChar('Erro ao Registrar Serviço de Retorno!!!' +
          sLineBreak + '[' + E.message + ']'), 'Informação',
          MB_OK + MB_ICONINFORMATION);
      end;
  end;
  sqlItensRetorno.First;
  sqlItensRetorno.EnableControls;
  btnPesquisarRetornoClick(self);
end;

procedure TfrmOrdemServicoSolicitar.CapturarValoresSequenciais;
var
  viPosicao : Integer;
begin
  viPosicao := ClientItensSequencia.RecNo;
  ClientItensSequencia.DisableControls;
  vgDadosCalculo.Descricao := '';
  vgDadosCalculo.ValorTotal     := 0;
  ClientItensSequencia.First;
  while not ClientItensSequencia.eof do
  begin
    if ClientItensSequenciaCALC_SELECIONADO.AsString = 'S' then
    begin
      if vgDadosCalculo.Descricao = '' then
           vgDadosCalculo.Descricao := ClientItensSequenciaDESCRICAO.AsString
      else vgDadosCalculo.Descricao := vgDadosCalculo.Descricao + ', '+ ClientItensSequenciaDESCRICAO.AsString;

      vgDadosCalculo.ValorTotal := vgDadosCalculo.ValorTotal + ClientItensSequenciaCALC_VALOR.AsCurrency;
    end;
    ClientItensSequencia.Next;
  end;
  ClientItensSequencia.RecNo := viPosicao;
  ClientItensSequencia.EnableControls;
  ClientAncestralVALOR_PAGO.AsCurrency := vgDadosCalculo.ValorTotal;
  ClientAncestralDESCRICAO.AsString    := vgDadosCalculo.Descricao;
end;

procedure TfrmOrdemServicoSolicitar.CarregarItensSequencia;
begin
  sqlServicosSequenciais.Active := False;
  sqlServicosSequenciais.ParamByName('CAIXA_SERVICO_ID').AsInteger := sqlCaixaServicosCAIXA_SERVICO_ID.AsInteger;
  sqlServicosSequenciais.Active := True;

  ClientItensSequencia.EmptyDataSet;
  sqlServicosSequenciais.First;
  while not sqlServicosSequenciais.Eof do
  begin
    ClientItensSequencia.Append;
    ClientItensSequenciaNATUREZA_TITULO_ID.AsInteger := sqlServicosSequenciaisNATUREZA_TITULO_ID.AsInteger;
    ClientItensSequenciaEMOLUMENTO_ID.AsInteger      := sqlServicosSequenciaisEMOLUMENTO_ID.AsInteger;
    ClientItensSequenciaQUANTIDADE.AsInteger         := sqlServicosSequenciaisQUANTIDADE.AsInteger;
    ClientItensSequenciaPADRAO_SELECAO.AsString      := sqlServicosSequenciaisPADRAO_SELECAO.AsString;
    ClientItensSequenciaCALC_SELECIONADO.AsString    := sqlServicosSequenciaisPADRAO_SELECAO.AsString;
    ClientItensSequenciaCAIXA_SERVICO_ID.AsInteger   := sqlServicosSequenciaisCAIXA_SERVICO_ID.AsInteger;
    ClientItensSequenciaDESCRICAO.AsString           := sqlServicosSequenciaisDESCRICAO.AsString;
    ClientItensSequencia.Post;
    sqlServicosSequenciais.Next;
  end;
end;

procedure TfrmOrdemServicoSolicitar.CarregarListaOSTipoDB(
  vpLista: TcxDBImageComboBox; vpOpcao: Integer);
begin
  vpLista.Properties.Items.Clear;

   case vpOpcao of
    1 : begin
          dtmLookup.CarregarIcxComboBoxDB('1', 'Compensação Direta', vpLista);
          if vgOrdemServico.MensalistaId > 0 then
            dtmLookup.CarregarIcxComboBoxDB('5', 'Mensalista a Compensar', vpLista);
        end;
    2 : begin
          if vgOrdemServico.MensalistaId > 0 then
               dtmLookup.CarregarIcxComboBoxDB('5', 'Mensalista a Compensar', vpLista)
          else dtmLookup.CarregarIcxComboBoxDB('2', 'OS Valor de Crédito', vpLista);
        end;
    3 : begin
          dtmLookup.CarregarIcxComboBoxDB('1', 'Compensação Direta', vpLista);
          if vgOrdemServico.MensalistaId > 0 then
               dtmLookup.CarregarIcxComboBoxDB('5', 'Mensalista a Compensar', vpLista)
          else dtmLookup.CarregarIcxComboBoxDB('2', 'OS Valor de Crédito', vpLista);
        end;
    4 : dtmLookup.CarregarIcxComboBoxDB('1', 'Compensação Direta', vpLista);
    5 : dtmLookup.CarregarIcxComboBoxDB('3', 'OS Retirada/Dedução', vpLista);
    6 : begin
          dtmLookup.CarregarIcxComboBoxDB('1', 'Compensação Direta', vpLista);
          dtmLookup.CarregarIcxComboBoxDB('3', 'OS Retirada/Dedução', vpLista);
        end;
    7 : dtmLookup.CarregarIcxComboBoxDB('4', 'OS Antiga Saldo', vpLista);
    8 : dtmLookup.CarregarIcxComboBoxDB('5', 'Mensalista a Compensar - Devolução', vpLista);
    9 : dtmLookup.CarregarIcxComboBoxDB('9', 'OS Dedução Direta', vpLista);
   end;

   if ClientAncestral.State in [dsEdit, dsInsert] then
   begin

     if vgOrdemServico.MensalistaId > 0 then
       ClientAncestralOS_TIPO.AsString := '5'
     else
       if vpOpcao in [1,3,4,6] then
         ClientAncestralOS_TIPO.AsString := '1'
       else
         if vpOpcao = 2 then
              ClientAncestralOS_TIPO.AsString := '2'
         else ClientAncestralOS_TIPO.AsString := '3';
   end;
 end;

procedure TfrmOrdemServicoSolicitar.CarregarListaOSSimplificado(vpLista : TcxImageComboBox);
begin
  if not icxTipoPagamento.Enabled then
    exit;

  vpLista.Properties.Items.Clear;

  if vgOrdemServico.TransacaoItem = 'D' then
    dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta (Devolver)', vpLista)
  else
  begin
    dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta (Receber)', vpLista);

    if vgOrdemServico.MensalistaId = 0 then
         dtmLookup.CarregarIcxComboBox('3', 'Deduzir na OS', vpLista)
    else
    begin
      dtmLookup.CarregarIcxComboBox('5', 'Mensalista a Compensar', vpLista);
      vpLista.EditValue := '5';
    end;
  end;
end;

procedure TfrmOrdemServicoSolicitar.CarregarListaOSTipoSimples(vpLista : TcxImageComboBox;
        vpOpcao : Integer);
begin
  vpLista.Properties.Items.Clear;

  case vpOpcao of
    1 : begin
          dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta', vpLista);
          if vgOrdemServico.MensalistaId > 0 then
            dtmLookup.CarregarIcxComboBox('5', 'Mensalista a Compensar', vpLista);
        end;
    2 : begin
          if vgOrdemServico.MensalistaId > 0 then
               dtmLookup.CarregarIcxComboBox('5', 'Mensalista a Compensar', vpLista)
          else dtmLookup.CarregarIcxComboBox('2', 'OS Valor de Crédito', vpLista);
        end;
    3 : begin
          dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta', vpLista);
          if vgOrdemServico.MensalistaId > 0 then
               dtmLookup.CarregarIcxComboBox('5', 'Mensalista a Compensar', vpLista)
          else dtmLookup.CarregarIcxComboBox('2', 'OS Valor de Crédito', vpLista);
        end;
    4 : dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta', vpLista);
    5 : dtmLookup.CarregarIcxComboBox('3', 'OS Retirada/Dedução', vpLista);
    6 : begin
          dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta', vpLista);
          dtmLookup.CarregarIcxComboBox('3', 'OS Retirada/Dedução', vpLista);
        end;
    7 : dtmLookup.CarregarIcxComboBox('4', 'OS Antiga Saldo', vpLista);
  end;

  if vgOrdemServico.MensalistaId > 0 then
    vpLista.ItemIndex := 1;
end;

procedure TfrmOrdemServicoSolicitar.CarregarOrdemServico(
  vpOrdemServico: String);
var
  viOrdemServicoId : Currency;
begin
  if vpOrdemServico = '' then
       viOrdemServicoId := 0
  else viOrdemServicoId := StrToCurr(vpOrdemServico);

  sqlOrdemServico.Active := False;
  sqlOrdemServico.Active := True;
  vgOrdemServico.Ordem   := viOrdemServicoId;

  sqlItensVinculados.Active := False;
  sqlItensVinculados.ParamByName('ORDEM_SERVICO_ID').AsCurrency := viOrdemServicoId;
  sqlItensVinculados.Active := True;

  sqlItensDetalhes.Active := False;
  sqlItensDetalhes.ParamByName('ORDEM_SERVICO_ID').AsCurrency := viOrdemServicoId;
  sqlItensDetalhes.Active := True;
  VerificarOSAntiga;
end;

procedure TfrmOrdemServicoSolicitar.CarregarSaldo;
begin
  if vlNaoAtualizarSaldo then
  begin
    vlNaoAtualizarSaldo := False;
    exit;
  end;

  CalcularSaldoOS(edtOS.Text, True, True, False, nil, True);
  edtSaldoOS.EditValue            := vgOrdemSaldo.SaldoOSDisponivel;
  if vgOrdemSaldo.SaldoOSDisponivel < 0 then
       edtSaldoOS.StyleDisabled.TextColor := clRed
  else edtSaldoOS.StyleDisabled.TextColor := clBlack;

  edtSaldoRegistro.EditValue      := 0;
  edtSaldoNotas.EditValue         := 0;
  edtSaldoOutros.EditValue        := 0;
  edtSaldoADevolver.EditValue     := 0;
  edtSaldoAguardandoC.EditValue   := 0;
  edtSaldoAguardandoD.EditValue   := 0;

  if sqlOrdemServicoSITUACAO.AsString <> 'F' then
  begin
    edtSaldoRegistro.EditValue      := vgOrdemSaldo.SaldoOSRI;
    edtSaldoNotas.EditValue         := vgOrdemSaldo.SaldoOSNotas;
    edtSaldoOutros.EditValue        := vgOrdemSaldo.SaldoOSGeral;
    edtSaldoADevolver.EditValue     := vgOrdemSaldo.SaldoOSDevolver;

    edtSaldoAguardandoC.EditValue   := vgOrdemSaldo.SaldoOSAguardandoC;
    edtSaldoAguardandoD.EditValue   := vgOrdemSaldo.SaldoOSAguardandoD;
    cxGridDBTableItensOS.DataController.Groups.FullExpand;
  end;

  vgOrdemServico.OSSaldo := 0;
end;

procedure TfrmOrdemServicoSolicitar.chxRegistradoRiClick(Sender: TObject);
begin
  icxSituacaoRI.Enabled := chxRegistradoRi.Checked;
  if not chxRegistradoRi.Checked then
    icxSituacaoRI.EditValue := 'T';
end;

procedure TfrmOrdemServicoSolicitar.mniComAAguardandoClick(
  Sender: TObject);
begin
  ConversaoOSItem(sqlCaixaItensOS_TIPO.AsString, sqlCaixaItensOS_TRANSACAO.AsString, '', '', sqlCaixaItensORDEM_SERVICO_ID.AsString,
                  'Confirma conversão do item: '+ #13+#13+ '>> À Compensar em Aguardando?', '3');
end;

Function TfrmOrdemServicoSolicitar.ConversaoOSItem(vpOSTipo, vpOsTransacao, vpOsSaida,
            vpCaixaId, vpOS, vpMensagem : String; vpACompensar : String = '';
            vpItemCompensador : Integer = 0):Boolean;
var
  viSql : String;

  procedure VerificaConversaoMensalista;
  var
    viQtd : Integer;
  begin
    viQtd := dtmControles.GetInt(' SELECT COUNT(CAIXA_ITEM_ID) FROM C_CAIXA_ITEM '+
                                 ' WHERE (OS_TIPO = ''3'' OR OS_TIPO = ''2'' OR OS_TIPO = ''4'') AND ' +
                                 '   AND SITUACAO = ''4''' +
                                 '   AND ORDEM_SERVICO_ID = '+vpOS);
    if viQtd > 0 then
    begin
      Application.MessageBox('OS não pode ser convertida!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      abort;
    end;
  end;

begin
  Result := False;

  if Application.MessageBox(PChar(vpMensagem), 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS', 6, 20)[6] = '0') then
      Exit;

  vgNovoMensalista := '';
  if (vpOSTipo = '5') then
  begin
    vgNovoMensalista := sqlOrdemServicoMENSALISTA_ID.AsString;
    if (vpOS <> '') and (vgNovoMensalista = '') then
    begin
      ExibirFormulario(TfrmSelecaoOSMensalista, frmSelecaoOSMensalista, True);
      if vgNovoMensalista = '' then
        exit;

      ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET MENSALISTA_ID = '+vgNovoMensalista+
                         ' WHERE ORDEM_SERVICO_ID = '+vpOS,1);
    end;
  end;

  if vpACompensar <> '' then
  begin
    viSql := ' UPDATE C_CAIXA_ITEM SET ';

    if vpACompensar = '7' then
      viSql := viSql + ' SITUACAO = '+QuotedStr(vpACompensar)+', REGISTRADO = '+QuotedStr('2')+
                       ' , COMPENSAR_SITUACAO = '+QuotedStr('1')+
                       ' WHERE ORDEM_SERVICO_ID = '+vpOS +' AND SITUACAO = '+QuotedStr('3')
    else
      viSql := viSql + ' SITUACAO = '+QuotedStr(vpACompensar)+', REGISTRADO = '+QuotedStr('1')+
                       ' , COMPENSAR_SITUACAO = '+QuotedStr('2')+
                       ' ,DATA_PAGAMENTO = '+ QuotedStr(dtmControles.DataHoraBanco(1))+
                       ' WHERE ORDEM_SERVICO_ID = '+vpOS +' AND SITUACAO = '+QuotedStr('7') +
                       '    AND REGISTRADO = ''2''';
  end
  else
  begin
    viSql := ' UPDATE C_CAIXA_ITEM SET OS_TIPO =' +QuotedStr(vpOSTipo)+','+
             '                    OS_TRANSACAO = '+QuotedStr(vpOsTransacao);

    if vpOSTipo = '5' then
      viSql := viSql + ', SITUACAO = '+QuotedStr('3');

    if vpOSSaida <> '' then
      viSql := viSql + ', OS_SAIDA = '+QuotedStr(vpOSSaida);

    if vpOSTipo = '6' then
      viSql := viSql + ', SITUACAO = ''4'', REGISTRADO = ''3'', OS_SAIDA = NULL';

    if vpCaixaId <> '' then
    begin
      viSql := viSql + ' WHERE ((CAIXA_ITEM_ID = '+vpCaixaId+')';

      if vpItemCompensador > 0 then
        viSql := viSql + ' OR (CAIXA_ITEM_ID = '+vpItemCompensador.ToString+')';
      viSql := viSql +')';
    end
    else
    begin
      if vgNovoMensalista <> '' then
           viSql := viSql + ', REGISTRADO = ''1'''+
                            '  WHERE ((SITUACAO = ''3'') OR (SITUACAO = ''7'')) AND ORDEM_SERVICO_ID = '+vpOS
      else viSql := viSql + ' WHERE ORDEM_SERVICO_ID = '+vpOS;
    end;
  end;
  ExecutaSqlAuxiliar(viSql,1);

  if (vpOSTipo = '5') then
  begin
    viSql := ' UPDATE C_CAIXA_ITEM SET OS_TIPO =' +QuotedStr(vpOSTipo)+','+
             '                    OS_TRANSACAO = '+QuotedStr(vpOsTransacao)+
             ' WHERE ORDEM_SERVICO_ID = '+ sqlCaixaItensORDEM_SERVICO_ID.AsString +
             '   AND TIPO_SERVICO = '+QuotedStr('14')+
             '   AND OS_TIPO = '+QuotedStr(sqlCaixaItensOS_TIPO.AsString)+
             '   AND OS_TRANSACAO = '+QuotedStr(sqlCaixaItensOS_TRANSACAO.AsString)+
             '   AND SITUACAO = '+ QuotedStr(sqlCaixaItensSITUACAO.AsString);
    ExecutaSqlAuxiliar(viSql,1);
  end;

  Result := True;
  sqlOrdemServico.Refresh;
  sqlCaixaItens.Refresh;
  AtualizaDadosGerais;
  CarregarSaldo;
  Application.MessageBox('Item(s) Convertido(s)!!!', 'Informação', MB_Ok + MB_ICONINFORMATION);
end;

procedure TfrmOrdemServicoSolicitar.mniConverterOSCreditoDevolucaoClick(
  Sender: TObject);
begin
  ConversaoOSItem('6', 'S','', sqlCaixaItensCAIXA_ITEM_ID.AsString, '',
                  'Confirma conversão somente deste item em: '+#13+#13+'>> OS de Crédito Devolução?');
end;

procedure TfrmOrdemServicoSolicitar.mniConverterOSMensalistaOSPadraoClick(
  Sender: TObject);
var
  viSql, viOrdemServico : String;

  procedure ValidaConversao;
  var
    viBarraConversao : Boolean;
  begin
    viBarraConversao := dtmControles.GetInt(' SELECT COUNT(CAIXA_ITEM_ID) FROM C_CAIXA_ITEM '+
                                              ' WHERE SITUACAO = ''6'' AND NOT QUITADO_CAIXA_ID IS NULL '+
                                              ' AND ORDEM_SERVICO_ID = '+sqlOrdemServicoORDEM_SERVICO_ID.AsString) > 0;
    if viBarraConversao then
    begin
      Application.MessageBox('Conversão não permitida. Já existe(m) item(s) quitado nesta OS!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      abort;
    end;
  end;
begin

  ValidaConversao;

  if Application.MessageBox('Converter OS Mensalista em OS Padrão. Confirma?', 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS', 6, 20)[6] = '0') then
    Exit;

  // Modificar Itens da OS
  viOrdemServico := sqlCaixaItensORDEM_SERVICO_ID.AsString;
  sqlCaixaItens.First;
  while not sqlCaixaItens.Eof do
  begin
    if sqlCaixaItensSITUACAO.AsString = '3' then
    begin
      viSql := ' UPDATE C_CAIXA_ITEM SET SITUACAO = '+QuotedStr('3')+', REGISTRADO = '+ QuotedStr('1')+
               '                       , MENSALISTA_ID = NULL, RECIBO_ID = NULL, CAIXA_ID = NULL, USUARIO_CAIXA_ID = NULL '+
               '                       , DATA_PAGAMENTO = '+ QuotedStr(dtmControles.DataHoraBanco(1))+',';
      if sqlCaixaItensTIPO_TRANSACAO.AsString = 'C' then
           viSql := viSql + ' OS_TIPO = '+ QuotedStr('1')+', OS_TRANSACAO = '+QuotedStr('C')
      else viSql := viSql + ' OS_TIPO = '+ QuotedStr('6')+', OS_TRANSACAO = '+QuotedStr('S');
    end
    else
    begin
      viSql := ' UPDATE C_CAIXA_ITEM SET SITUACAO = '+QuotedStr('3')+', REGISTRADO = '+ QuotedStr('1')+
               '                       , MENSALISTA_ID = NULL, RECIBO_ID = NULL, CAIXA_ID = NULL, USUARIO_CAIXA_ID = NULL '+
               '                       , DATA_PAGAMENTO = '+ QuotedStr(dtmControles.DataHoraBanco(1))+',';
      if sqlCaixaItensTIPO_TRANSACAO.AsString = 'C' then
           viSql := viSql + ' OS_TIPO = '+ QuotedStr('1')+', OS_TRANSACAO = '+QuotedStr('C')
      else viSql := viSql + ' OS_TIPO = '+ QuotedStr('1')+', OS_TRANSACAO = '+QuotedStr('D');
    end;

    viSql := viSql + ' WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString;
    ExecutaSqlAuxiliar(viSql,1);
    sqlCaixaItens.Next;
  end;

  // Modificar OS
  ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET MENSALISTA_ID = NULL '+
                     ' WHERE ORDEM_SERVICO_ID = '+viOrdemServico,1);

  sqlOrdemServico.Refresh;
  sqlCaixaItens.Refresh;
  AtualizaDadosGerais;
  CarregarSaldo;
  Application.MessageBox('OS Convertida!!!', 'Informação', MB_Ok + MB_ICONINFORMATION);
end;

procedure TfrmOrdemServicoSolicitar.mniComSomenteItemMensalistaClick(
  Sender: TObject);
begin
  ConversaoOSItem('5', 'M','', sqlCaixaItensCAIXA_ITEM_ID.AsString, '',
                  'Confirma conversão somente deste item em: '+#13+#13+'>> Mensalista?');
end;

procedure TfrmOrdemServicoSolicitar.mniComOSCredito_DiretoClick(
  Sender: TObject);
begin
  ConversaoOSItem('1', sqlCaixaItensOS_TRANSACAO.AsString, '', sqlCaixaItensCAIXA_ITEM_ID.AsString, '',
                  'Confirma conversão do item de: '+#13+#13+ '>> OS de Crédito em Compensação Direta?');
end;

procedure TfrmOrdemServicoSolicitar.mniComOSDeducao_DiretoClick(
  Sender: TObject);
var
  viOSTransacao, viOsSaida, viReciboId, viSituacao : String;
begin
  // Caso de Crédito com Dedução ja Confirmada no Caixa
  viSituacao := sqlCaixaItensSITUACAO.AsString;
  if  (viSituacao = '4') and (sqlCaixaItensOS_SAIDA.IsNull) then
  begin
    Application.MessageBox('Conversão não permitida. Item já confirmado no caixa!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

  if (sqlCaixaItensOS_SAIDA.IsNull) then
  begin
    if sqlCaixaItensTIPO_TRANSACAO.AsString = 'C' then
         viOSTransacao := 'C'
    else viOSTransacao := 'D';
    viOsSaida := '';
  end
  else
  begin
    viOSTransacao := 'D';
    viOsSaida     := 'S';
  end;

  viReciboId := sqlCaixaItensRECIBO_ID.AsString;
  ConversaoOSItem('1', viOSTransacao, viOsSaida, sqlCaixaItensCAIXA_ITEM_ID.AsString, '',
                  'Confirma conversão do item: '+ #13+#13+ '>> Dedução OS em Compensação Direta?','',
                  sqlCaixaItensCALC_ITEM_COMPENSADOR.AsInteger);

  if (viSituacao = '4') and (viOsSaida <> '') then
    ExecutaSqlAuxiliar(' UPDATE C_RECIBO SET SITUACAO = '+QuotedStr('A')+
                       ' WHERE RECIBO_ID = '+ viReciboId,1);

end;

procedure TfrmOrdemServicoSolicitar.mniComOsMensalistaClick(
  Sender: TObject);

  procedure ValidaConversao;
  var
    viBarraConversao : Boolean;
  begin
    viBarraConversao := dtmControles.GetInt(' SELECT COUNT(CAIXA_ITEM_ID) FROM C_CAIXA_ITEM '+
                                            ' WHERE OS_TIPO = ''2'''+
                                            ' AND ORDEM_SERVICO_ID = '+sqlOrdemServicoORDEM_SERVICO_ID.AsString) > 0;
    if viBarraConversao then
    begin
      Application.MessageBox('Conversão não permitida. Existem item(s) de OS de Crédito nesta OS!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      abort;
    end;
  end;

begin
  ValidaConversao;

  if ConversaoOSItem('5', 'M', '', '', sqlCaixaItensORDEM_SERVICO_ID.AsString,
                  'Confirma conversão da OS em MENSALISTA: '+#13+#13+
                  '>> Serão convertidos somente os itens não confirmados!!!') then
    pgcOSChange(self);
end;

procedure TfrmOrdemServicoSolicitar.mniComACompensarClick(Sender: TObject);
begin
  ConversaoOSItem(sqlCaixaItensOS_TIPO.AsString, sqlCaixaItensOS_TRANSACAO.AsString, '', '', sqlCaixaItensORDEM_SERVICO_ID.AsString,
                  'Confirma conversão do item: '+ #13+#13+ '>> Aguardando em à Compensar?', '7');
end;

procedure TfrmOrdemServicoSolicitar.mniComDireto_DeducaoOSClick(
  Sender: TObject);
var
  viOsSaida, viReciboId, viSituacao : String;
begin
  viSituacao := sqlCaixaItensSITUACAO.AsString;
  if  (viSituacao = '4') and (sqlCaixaItensOS_SAIDA.IsNull) then
  begin
    Application.MessageBox('Conversão não permitida. Item já confirmado no caixa!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

  if (sqlCaixaItensOS_SAIDA.IsNull) then
       viOsSaida := ''
  else viOsSaida := 'R';

  viReciboId := sqlCaixaItensRECIBO_ID.AsString;
  ConversaoOSItem('3', 'D', viOsSaida, sqlCaixaItensCAIXA_ITEM_ID.AsString, '',
                  'Confirma conversão do item: '+ #13+#13+ '>> Compensação Direta em Dedução de OS?', '',
                  sqlCaixaItensCALC_ITEM_COMPENSADOR.AsInteger);

  if (viSituacao = '4') and (viOsSaida <> '') then
    ExecutaSqlAuxiliar(' UPDATE C_RECIBO SET SITUACAO = '+QuotedStr('D')+
                       ' WHERE RECIBO_ID = '+ viReciboId,1);
end;

procedure TfrmOrdemServicoSolicitar.mniComDireto_OSCreditoClick(
  Sender: TObject);
begin
  ConversaoOSItem('2', 'C', '', sqlCaixaItensCAIXA_ITEM_ID.AsString, '',
                  'Confirma conversão do item: '+ #13+#13+ '>> Compensação Direta em OS de Crédito?');
end;

procedure TfrmOrdemServicoSolicitar.cxBtnFecharClick(Sender: TObject);
begin
  vlNaoFechar := False;
  Close;
end;

procedure TfrmOrdemServicoSolicitar.cxButton1Click(Sender: TObject);
begin
  icxSituacaoOS.ItemIndex := 0;
  icxOsTipo.ItemIndex     := 0;
  icxOSSaldo.ItemIndex    := 2;
  icxOSPendencia.ItemIndex:= 0;
  icxOSOrdenacao.ItemIndex:= 0;
  icxTipoSistema.ItemIndex:= -1;
  edtDataOcorrencia.Clear;
  chxRegistradoRi.Checked := False;
  chxRegistradoRiClick(self);
  edtOSPesquisa.Clear;
end;

procedure TfrmOrdemServicoSolicitar.brnPesquisarSaldoOSClick(Sender: TObject);
begin
  btnLimaprTipoServentia.Enabled := icxTipoSistema.EditValue <> null;

  PesquisarGerenciarOS(icxSituacaoOS.EditValue);
  edtTotalSaldoOs.EditValue := SaldoTotalOS;
  edtTotalQtdOs.EditValue   := sqlSaldoOS.RecordCount;
end;

procedure TfrmOrdemServicoSolicitar.btnOSAcertoClick(Sender: TObject);
begin
  AcertoOSLoteSelecionado(True);
end;

procedure TfrmOrdemServicoSolicitar.btnOSAtualizarSaldoClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Confirma Atualização do Saldo das OS(s)?'+#13+#13+
                                  'Será Atualizado o Saldo de todas as OS(s) Pesquisadas'), 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
    exit;

  ClientLog.EmptyDataSet;
  sqlSaldoOS.DisableControls;
  IniciarIncrementarProgressBar(cxProgressBar1, sqlSaldoOS.RecordCount);
  sqlSaldoOS.First;
  while not sqlSaldoOS.Eof do
  begin
    CalcularSaldoOS(sqlSaldoOSORDEM_SERVICO_ID.AsString, True, False, True, ClientLog, True);
    sqlSaldoOS.Next;
    IniciarIncrementarProgressBar(cxProgressBar1, 1, True);
  end;
  sqlSaldoOS.EnableControls;
  cxProgressBar1.Visible := False;
  tbcLog.TabVisible      := ClientLog.RecordCount > 0;
  Application.MessageBox('Atualização Efetuada com Sucesso!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
end;

procedure TfrmOrdemServicoSolicitar.btnOsReabrirClick(Sender: TObject);
begin
  sqlSaldoOS.Filtered := False;
  sqlSaldoOS.Filter   := '(CALC_SELECIONADO = ''S'') AND (SITUACAO = ''F'')';
  sqlSaldoOS.Filtered := True;

  if sqlSaldoOS.IsEmpty then
  begin
    Application.MessageBox('Seleciona a(s) OS(s) que deseja       reabrir!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    sqlSaldoOS.Filtered := False;
    exit;
  end;

  IniciarIncrementarProgressBar(cxProgressBar1, sqlSaldoOS.RecordCount);
  while not sqlSaldoOS.Eof do
  begin
    // Cancela Item de Acerto se tiver
    ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET SITUACAO = '+QuotedStr('5')+
                       ' WHERE ORDEM_SERVICO_ID = '+sqlSaldoOSORDEM_SERVICO_ID.AsString +
                       '   AND SITUACAO = '+QuotedStr('9'),1);

    // reabre a Ordem de Serviço
    ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET SITUACAO = '+QuotedStr('A')+
                       ' WHERE ORDEM_SERVICO_ID = '+sqlSaldoOSORDEM_SERVICO_ID.AsString,1);

    IniciarIncrementarProgressBar(cxProgressBar1, 1, True);
    CalcularSaldoOS(sqlSaldoOSORDEM_SERVICO_ID.AsString,True);
    sqlSaldoOS.Next;
  end;

  cxProgressBar1.Visible := False;
  sqlSaldoOS.Filtered    := False;
  icxSituacaoRIPropertiesEditValueChanged(self);
  Screen.Cursor := crDefault;
  brnPesquisarSaldoOSClick(self);
end;

procedure TfrmOrdemServicoSolicitar.btnCalcularClick(Sender: TObject);
begin
  vgDadosCalculo.SistemaId := sqlCaixaServicosSISTEMA_ID.AsInteger - 1;
  if edtValorDocumento.Text = '' then
    edtValorDocumento.EditValue := 0;

  ClientItensSequencia.First;
  ClientItensSequencia.DisableControls;
  vgDadosCalculo.CalculoAutomatico := True;
  vgDadosCalculo.ValorDocumento    := edtValorDocumento.EditValue;
  frmCalculoRapido := TfrmCalculoRapido.Create(nil);
  vlMontandoSequencial := True;
  while not ClientItensSequencia.Eof do
  begin
    vgDadosCalculo.TipoNaturezaId := ClientItensSequenciaNATUREZA_TITULO_ID.AsInteger;
    vgDadosCalculo.Qtd            := ClientItensSequenciaQUANTIDADE.AsInteger;
    vgDadosCalculo.Tabela         := ClientItensSequenciaEMOLUMENTO_ID.AsInteger;
    frmCalculoRapido.CalculoAutomaticoRapido;
    ClientItensSequencia.Edit;
    ClientItensSequenciaCALC_VALOR.AsCurrency := frmCalculoRapido.edtValorTotalItem.EditValue;
    ClientItensSequencia.Next;
  end;

  FreeAndNil(frmCalculoRapido);
  vlMontandoSequencial := False;
  CapturarValoresSequenciais;
  ClientItensSequencia.EnableControls;
end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableItensOSCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  AColumn: TcxGridDBColumn;
begin
  AColumn := ACellViewInfo.Item as TcxGridDBColumn;
  if (AColumn.DataBinding.FieldName = 'CALC_IMPRESSAO') and (sqlCaixaItensCALC_IMPRESSAO.AsBoolean) then
  begin
    vgReciboID        := sqlCaixaItensRECIBO_ID.AsString;
    vgOSNumero        := sqlCaixaItensORDEM_SERVICO_ID.AsString;
    vgUsuarioCaixaId  := sqlCaixaItensUSUARIO_CAIXA_ID.AsString;
    vgProtocoloRecibo := '';

    ExibirFormulario(TfrmReciboOS, frmReciboOS, True);
  end;
end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableItensOSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[17]) = 'S' then
    ACanvas.Font.Color  := clOlive
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[10]) = '9' then
    begin
      ACanvas.Font.Color  := clWhite;
      ACanvas.Brush.Color := clBlack;
    end
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[12]) = '5' then
      ACanvas.Font.Color := clGray
  else
    if (((AViewInfo.RecordViewInfo.GridRecord.Values[10]) = '4') or ((AViewInfo.RecordViewInfo.GridRecord.Values[10]) = '6')) then
      ACanvas.Font.Color  := clGreen
  else
    if ((AViewInfo.RecordViewInfo.GridRecord.Values[10]) = '3') or
       (((AViewInfo.RecordViewInfo.GridRecord.Values[10]) = '1') and ((AViewInfo.RecordViewInfo.GridRecord.Values[10]) = 'D')) then
    begin
      ACanvas.Brush.Color := $00DADADA;
      ACanvas.Font.Color  := clRed;
    end
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[12]) = '5' then
      ACanvas.Font.Color := clOlive
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[12]) = '1' then
      ACanvas.Font.Color := clBlack
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[9]) > 0 then
      ACanvas.Font.Color := clRed
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[8]) > 0 then
         ACanvas.Font.Color := clBlue
end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if not (AViewInfo.RecordViewInfo.GridRecord.Values[0]) then
    ACanvas.Font.Color  := clRed
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[6]) = 'F' then
      ACanvas.Font.Color  := clSilver;

end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableView1DblClick(Sender: TObject);
begin
  vlOsPesquisar := sqlSaldoOSORDEM_SERVICO_ID.AsString;
  pgcOS.ActivePage := tbcOS;
end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableView3DblClick(Sender: TObject);
begin
  vlOsPesquisar := sqlPesquisaOSORDEM_SERVICO_ID.AsString;
  pgcOS.ActivePage := tbcOS;
end;

procedure TfrmOrdemServicoSolicitar.cxLabel13Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  sqlSaldoOS.DisableControls;
  sqlSaldoOS.First;
  IniciarIncrementarProgressBar(cxProgressBar1, sqlSaldoOS.RecordCount);
  while not sqlSaldoOS.Eof do
  begin
    sqlSaldoOS.Edit;
    sqlSaldoOSCALC_SELECIONADO.AsString := 'S';
    sqlSaldoOS.Post;
    IniciarIncrementarProgressBar(cxProgressBar1, 1, True);
    sqlSaldoOS.Next;
  end;
  cxProgressBar1.Visible := False;
  sqlSaldoOS.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmOrdemServicoSolicitar.mniDesativarAcertoOSClick(Sender: TObject);
begin
  if Application.MessageBox('Desativar Acerto de OS. Confirma?', 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS', 6, 20)[6] = '0') then
    Exit;

  ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET SITUACAO = '+QuotedStr('A')+
                     ' WHERE ORDEM_SERVICO_ID = '+sqlCaixaItensORDEM_SERVICO_ID.AsString,1);

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET SITUACAO = '+QuotedStr('5')+
                     ' WHERE ORDEM_SERVICO_ID = '+sqlCaixaItensORDEM_SERVICO_ID.AsString+
                     '   AND OS_TIPO = '+QuotedStr('9'),1);

  btnAtualizaClick(self);
  vlOsNova := edtOS.EditValue;
  pgcOSChange(self);
  pnlAdicionar.Visible := True;
end;

procedure TfrmOrdemServicoSolicitar.mniDesmembrarClick(
  Sender: TObject);
var
  viValorNovo : Currency;
begin
  if edtSaldoOS.EditValue >= sqlCaixaItensVALOR_PAGO.AsCurrency then
       vgDesmembramento.SaldoOsAntiga := sqlCaixaItensVALOR_PAGO.AsCurrency
  else vgDesmembramento.SaldoOsAntiga := edtSaldoOS.EditValue;

  if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS', 6, 20)[6] = '0') then
    Exit;

  ExibirFormulario(TfrmSelecaoOSDesmembramento, frmSelecaoOSDesmembramento, True);

  if not vgDesmembramento.Flag then
    exit;

  ExecutaSimpleDSAux(' SELECT * FROM C_CAIXA_ITEM WHERE CAIXA_ITEM_ID = 0',0);
  with dtmControles.SimpleAuxiliar do
  begin
    Append;
    FieldByName('CAIXA_ITEM_ID').AsInteger      := dtmControles.GerarSequencia('C_CAIXA_ITEM');
    FieldByName('CAIXA_SERVICO_ID').AsInteger   := vgDesmembramento.ServicoId;
    FieldByName('USUARIO_SERVICO_ID').AsString  := vgUsuarioID;
    FieldByName('USUARIO_CAIXA_ID').AsInteger   := sqlCaixaItensUSUARIO_CAIXA_ID.AsInteger;
    FieldByName('DESCRICAO').AsString           := vgDesmembramento.Descricao;
    FieldByName('DATA_PAGAMENTO').AsString      := sqlCaixaItensDATA_PAGAMENTO.AsString;
    FieldByName('TIPO_DOCUMENTO').AsString      := 'C';
    FieldByName('TIPO_TRANSACAO').AsString      := 'C';
    FieldByName('VALOR_SERVICO').AsCurrency     := vgDesmembramento.ValorDesmembrar;
    FieldByName('VALOR_PAGO').AsCurrency        := vgDesmembramento.ValorDesmembrar;
    FieldByName('OBSERVACAO').AsString          := 'Valor Desmembrado do item '+sqlCaixaServicosDESCRICAO.AsString;
    FieldByName('HORA_PAGAMENTO').AsVariant     := sqlCaixaItensHORA_PAGAMENTO.AsVariant;
    FieldByName('CAIXA_ID').AsInteger           := sqlCaixaItensCAIXA_ID.AsInteger;
    FieldByName('RECIBO_ID').AsInteger          := sqlCaixaItensRECIBO_ID.AsInteger;
    FieldByName('QTD').AsInteger                := 1;
    FieldByName('APRESENTANTE').AsString        := sqlCaixaItensAPRESENTANTE.AsString;
    FieldByName('REGISTRADO').AsString          := '3';
    FieldByName('SITUACAO').AsString            := '4';
    FieldByName('ORDEM_SERVICO_ID').AsCurrency  := sqlCaixaItensORDEM_SERVICO_ID.AsCurrency;
    FieldByName('OS_TIPO').AsString             := sqlCaixaItensOS_TIPO.AsString;
    FieldByName('OS_TRANSACAO').AsString        := sqlCaixaItensOS_TRANSACAO.AsString;
    Post;
    Active := False;
  end;
  viValorNovo := sqlCaixaItensVALOR_PAGO.AsCurrency - vgDesmembramento.ValorDesmembrar;

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET VALOR_SERVICO = :VALOR_SERVICO, VALOR_PAGO = :VALOR_PAGO '+
                     ' WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('VALOR_SERVICO').AsCurrency := viValorNovo;
    ParamByName('VALOR_PAGO').AsCurrency := viValorNovo;
    ExecSQL;
  end;
  btnAtualizaClick(SELF);
end;

procedure TfrmOrdemServicoSolicitar.edtIdentificacaoExit(Sender: TObject);
begin
// btnConfirmar.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.edtOSAntigaKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmOrdemServicoSolicitar.edtOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edtOS.Text <> '') and
    (Key = VK_RETURN) then
  begin
    edtOS.PostEditValue;
    btnPesquisarOSClick(self);
  end;
end;

procedure TfrmOrdemServicoSolicitar.edtOSKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmOrdemServicoSolicitar.edtOSPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    brnPesquisarSaldoOS.SetFocus;
    brnPesquisarSaldoOSClick(self);
  end;
end;

procedure TfrmOrdemServicoSolicitar.edtPesquisaIdentificacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnPesquisar.SetFocus;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmOrdemServicoSolicitar.edtPesquisaOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnPesquisar.SetFocus;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmOrdemServicoSolicitar.edtPesquisaOSKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(key);
end;

procedure TfrmOrdemServicoSolicitar.edtQtdPropertiesEditValueChanged(
  Sender: TObject);
begin
  if sqlCaixaServicosTIPO_VALOR.AsString <> '3' then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralVALOR_PAGO.AsCurrency := sqlCaixaServicosVALOR.AsCurrency * edtQtd.EditValue;
end;

procedure TfrmOrdemServicoSolicitar.FechamentoOSLote(vpTipo : String);
var
  viSql : String;
begin
  //viSql :=


end;

procedure TfrmOrdemServicoSolicitar.FormActivate(Sender: TObject);
begin
  inherited;

  LockWindowUpdate(Handle);
  tbcPesquisa.TabVisible         := (vgOrdemServico.TipoInclusao <> 0) and (vgOrdemServico.Ordem = 0);
  tbcServicosRetorno.TabVisible  := tbcPesquisa.TabVisible;
  cbxTipoRegistro.Visible        := vgOrdemServico.TipoInclusao = 0;
  if vgOrdemServico.TipoInclusao = 0 then
  begin
    frmOrdemServicoSolicitar.Height := 245;
    edtValorServico.EditValue       := vgOrdemServico.OSValor;
  end;
  tbcOS.TabVisible           := (vgCaixaDados.TipoCaixa = '2') or (vgOrdemServico.TipoInclusao = 0) or (vgOrdemServico.Ordem > 0);
  pnlAdicionar.Visible       := (vgOrdemServico.TipoInclusao <> 0) and (vgCaixaDados.TipoCaixa <> '2');
  dxBarManagerRotulo.Visible := (vgOrdemServico.TipoInclusao > 0) and (pgcOS.ActivePage = tbcOS);
  gbxValorServico.Visible    := vgOrdemServico.TipoInclusao = 0;

  if tbcPesquisa.TabVisible then
  begin
    pgcOS.ActivePage := tbcPesquisa;
    btnPesquisarClick(self);
    edtPesquisaOS.SetFocus;
  end
  else pgcOS.ActivePage := tbcOS;

  if vgOrdemServico.TipoInclusao <> 0 then
    IncluirAlterarItemCaixa;

  if (tbcOS.TabVisible and (pgcOS.ActivePage = tbcOS)) then
  begin
    if vgOrdemServico.Ordem = 0 then
    begin
      if vgOrdemServico.TipoInclusao = 0 then
      begin
        pnlNovaOS.Visible    := False;
        pnlConfirmar.Visible := True;
      end;

      rdbOrdemNova.Checked := True;
      rdbOrdemNovaClick(self);
      edtIdentificacao.EditValue := vgOrdemServico.Identificacao;
    end
    else
    begin
      rdbOrdemAberta.Checked := True;
      rdbOrdemAbertaClick(self);
      edtOS.EditValue          := vgOrdemServico.Ordem;
      rdbOrdemNova.Enabled     := True;
      btnPesquisarOSClick(self);
      rdbOrdemAberta.Enabled      := False;
      rdbOrdemNova.Enabled        := False;

      pnlNovaOS.Visible        := (vgOrdemServico.TipoInclusao = 0) and (not icxTipoPagamento.Enabled);
      pgcOrdemServico.Enabled  := vgOrdemServico.TipoInclusao = 0;
      pnlConfirmar.Visible     := vgOrdemServico.TipoInclusao = 0;
      cxBtnFechar.Enabled      := vgOrdemServico.TipoInclusao <> 0;
      vlNaoAtualizarSaldo      := True;
    end;
  end
  else edtPesquisaOS.SetFocus;

  if not vlNaoAtualizarSaldo then
    CarregarSaldo;

  sqlOrdemServico.Active := True;

  if vgCaixaDados.NovoAuto then
    btnNovaOrdemClick(self);

  LockWindowUpdate(0);
end;

procedure TfrmOrdemServicoSolicitar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if vlNaoFechar then
    abort;

  sqlOrdemServico.Active := False;
  vgCaixaDados.NovoAuto  := False;
  vgOrdemServico.TransacaoItem := string.Empty;
  
  Action := caFree;
  frmOrdemServicoSolicitar := nil;
end;

procedure TfrmOrdemServicoSolicitar.FormCreate(Sender: TObject);
var
  viPermissao : String;
begin
  sqlOrdemServico.Connection        := dtmControles.DB;
  sqlCaixaServicos.Connection       := dtmControles.DB;
  ClientAncestral.Connection        := dtmControles.DB;
  sqlCaixaItens.Connection          := dtmControles.DB;
  sqlPesquisaOS.Connection          := dtmControles.DB;
  sqlServicosSequenciais.Connection := dtmControles.DB;
  sqlG_Emolumento.Connection        := dtmControles.DB;
  sqlNaturezaTitulo.Connection      := dtmControles.DB;
  sqlItensVinculados.Connection     := dtmControles.DB;
  sqlServicoRetorno.Connection      := dtmControles.DB;
  sqlItensRetorno.Connection        := dtmControles.DB;
  sqlItensDetalhes.Connection       := dtmControles.DB;
  sqlSaldoOS.Connection             := dtmControles.DB;

  sqlServicoRetorno.Active        := True;
  sqlG_Emolumento.Active          := True;
  tbcItensOSSelecionar.TabVisible := False;
  pnlConfirmar.Visible            := False;
  vlAbrindoForm                   := True;
  tbcPesquisa.TabVisible          := False;
  vlNaoAtualizarSaldo             := False;
  tbcLog.TabVisible               := False;
  pgcListagem.ActivePageIndex     := 0;

  viPermissao :=  dtmControles.CodPermissao('ESP_LIBERAR_RECIBO_OS', 20);
  cxGridDBTableItensOSReciboImp.Visible := (viPermissao[6] = '1');
  viPermissao :=  dtmControles.CodPermissao('ESP_LIBERAR_RECIBO_OS', 20);

  viPermissao :=  dtmControles.CodPermissao('ESP_GERENCIAR_OS', 20);
  tbcGerenciarOS.TabVisible := (vgId = 20);// AND (viPermissao[6] = '1');
end;

function TfrmOrdemServicoSolicitar.GerarRecibo(vpValor, vpDescricao : String):String;
  var
    viSql : String;
begin
  Result := dtmControles.GerarSequencia('C_RECIBO');
  viSql  := 'INSERT INTO C_RECIBO (RECIBO_ID, VALOR_RECIBO, APRESENTANTE, DATA, SITUACAO, OS_TRANSACAO, USUARIO_ID, RECEBIDO, TROCO) ' +
         'VALUES (' + Result + ',' +
                    TrocaVirgPPto(vpValor) + ', '+
                    QuotedStr(vpDescricao)+', '+
                    QuotedStr(dtmControles.DataHoraBanco(1))+ ', '+
                    QuotedStr('D')+', '+
                    QuotedStr('D')+', '+
                    vgUsuarioID + ', '+
                    TrocaVirgPPto(vpValor) + ', '+
                    TrocaVirgPPto('0')+')';
  dtmControles.ExecSQL(viSql);
end;

procedure TfrmOrdemServicoSolicitar.HabilitarPainelNovaOS(vpHabilitar: Boolean);
begin
  tbcPesquisa.TabVisible        := not vpHabilitar;
  tbcServicosRetorno.TabVisible := not vpHabilitar;
  tbcOS.TabVisible              := vpHabilitar;
  pgcOS.ActivePage              := tbcOS;
  rdbOrdemNova.Checked          := vpHabilitar;
  rdbOrdemAberta.Enabled        := not vpHabilitar;
  rdbOrdemNova.Enabled          := vpHabilitar;
  pnlAdicionar.Visible          := vpHabilitar;
  pnlAdicionar.Enabled          := vpHabilitar;
  pnlNovaOS.Visible             := not vpHabilitar;
  pnlConfirmar.Visible          := vpHabilitar;
  dxBarManagerRotulo.Visible    := not vpHabilitar and (pgcOS.ActivePage = tbcOS);
  cxBtnFechar.Enabled           := not vpHabilitar;
  gbxInclusao.Enabled           := not vpHabilitar;
  gbxOSAntiga.Visible           := not vpHabilitar;
end;

procedure TfrmOrdemServicoSolicitar.icxPesquisaSituacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if icxPesquisaSituacao.Text <> '' then
    btnPesquisarClick(self);
end;

procedure TfrmOrdemServicoSolicitar.icxSituacaoRIPropertiesEditValueChanged(
  Sender: TObject);
begin
  vgFiltroRI := '';
  sqlSaldoOS.Filtered := False;
  if icxSituacaoRI.EditValue = 'T' then
    exit;
  vgFiltroRI := 'CALC_REGISTRADO = '+QuotedStr(icxSituacaoRI.EditValue);
  sqlSaldoOS.Filter   := vgFiltroRI;
  sqlSaldoOS.Filtered := True;
end;

procedure TfrmOrdemServicoSolicitar.icxTipoClientePropertiesEditValueChanged(
  Sender: TObject);
begin

  tbcIdentificacaoPadrao.TabVisible     := (icxTipoCliente.EditValue = '1') or (icxTipoCliente.text = '');
  tbcIdentificacaoMensalista.TabVisible := icxTipoCliente.EditValue = '2';
  
  if icxTipoCliente.Text = '' then
  begin
    pgcIdentificacao.ActivePageIndex := 0;      
    exit; 
  end;
    
  if tbcIdentificacaoPadrao.TabVisible then
  begin
    lcxMensalista.EditValue := null;
    pgcIdentificacao.ActivePageIndex := 0;
  end
  else
  begin
    edtIdentificacao.Clear;
    pgcIdentificacao.ActivePageIndex := 1;
  end;
end;

procedure TfrmOrdemServicoSolicitar.icxTipoRegistroPropertiesChange(
  Sender: TObject);
begin
  icxTipoPagamento.EditValue := icxTipoRegistro.EditValue;
end;

procedure TfrmOrdemServicoSolicitar.IncluirAlterarItemCaixa;
begin
  vlAbrindoForm := False;

  if not gbxInclusao.Visible then
    exit;

  ClientAncestral.Active := False;
  ClientAncestral.ParamByName('CAIXA_ITEM_ID').AsInteger := vgCaixaDados.CaixaItemID;
  ClientAncestral.Active := True;

  if vgOrdemServico.TipoInclusao in [1,3] then
  begin
    ClientAncestral.Insert;
    ClientAncestralSITUACAO.AsString           := '3';
    ClientAncestralQTD.AsInteger               := 1;
    ClientAncestralUSUARIO_SERVICO_ID.AsString := vgUsuarioID;
    ClientAncestralDATA_PAGAMENTO.AsDateTime   := vgCaixaDados.Data;
    ClientAncestralHORA_PAGAMENTO.AsString     := dtmControles.DataHoraBanco(2);
    ClientAncestralTIPO_TRANSACAO.AsString     := 'C';//Credito
    ClientAncestralVALOR_PAGO.AsCurrency       := 0;
    ClientAncestralOS_TIPO.AsString            := '3';
  end;

  if vgCaixaDados.TipoCaixa = '1' then // Abertura de Caixa
    PreencherDadosAberturaCaixa
  else
    if vgCaixaDados.TipoCaixa = '2' then // Inclusão Diversas
      PreencherDadosInclusao
  else
    if vgCaixaDados.TipoCaixa = '3' then // Alteração
      PreencherDadosAlteracao;
end;

procedure TfrmOrdemServicoSolicitar.lbxServicoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if vlAbrindoForm then
    exit;

  vlMontandoSequencial := True;
  if ClientAncestral.State in [dsEdit, dsInsert] then
  begin
    ClientAncestralVALOR_PAGO.AsCurrency   := 0;
    ClientAncestralDESCRICAO.AsString      := '';
    ClientAncestralTIPO_TRANSACAO.AsString := sqlCaixaServicosTIPO_TRANSACAO.AsString;
    ClientAncestralOS_TIPO.AsString        := sqlCaixaServicosOS_TIPO.AsString;
    ClientAncestralDESCRICAO.AsString      := lbxServico.Text;

    tbcItensOSSelecionar.TabVisible := sqlCaixaServicosTIPO_VALOR.AsString = '1';
    edtValorPago.Enabled            := sqlCaixaServicosTIPO_VALOR.AsString = '2';
    tbcItensOs.TabVisible           := sqlCaixaServicosTIPO_VALOR.AsString <> '1';
    edtQtd.Enabled                  := sqlCaixaServicosTIPO_VALOR.AsString = '3';
    icxServentia.EditValue          := sqlCaixaServicosSISTEMA_ID.AsVariant;

    if tbcItensOs.TabVisible then
      pgcItensOS.ActivePage := tbcItensOs
    else
    begin
      pgcItensOS.ActivePage := tbcItensOSSelecionar;

      sqlNaturezaTitulo.Active := False;
      sqlNaturezaTitulo.Active := True;

      CarregarItensSequencia;
      btnCalcularClick(self);
    end;
  end;

  if icxTipoRegistro.EditValue = null then
  begin
    icxTipoRegistro.Properties.Items.Clear;
    exit;
  end;

  icxTipoRegistro.Enabled := lbxServico.EditValue <> null;
  pnlOsAntiga.Visible     := rdbOSAntiga.Checked;

  if not rdbOSAntiga.Checked then
    edtOSAntiga.Clear;

  CarregarListaOSTipoSimples(icxTipoPagamento, icxTipoRegistro.EditValue);
  CarregarListaOSTipoDB(icxTipoRegistro, icxTipoRegistro.EditValue);
  vlMontandoSequencial := False;
  edtQtdPropertiesEditValueChanged(self);
end;

procedure TfrmOrdemServicoSolicitar.lcxIdentificacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  icxTipoPagamento.Enabled := btnConfirmar.Enabled and lcxIdentificacao.Enabled;
  
  edtOS.EditValue := trunc(sqlOrdemServicoORDEM_SERVICO_ID.AsCurrency);
  if lcxIdentificacao.Text <> '' then
       frmOrdemServicoSolicitar.Height := 700
  else frmOrdemServicoSolicitar.Height := 245;
  SelecionarItensCaixa;
end;

procedure TfrmOrdemServicoSolicitar.lcxNaturezaTituloPropertiesEditValueChanged(
  Sender: TObject);
begin
  btnAdicionarItem.Enabled := lcxNaturezaTitulo.EditValue <> null;
end;

procedure TfrmOrdemServicoSolicitar.lcxServicoRetornoPropertiesEditValueChanged(
  Sender: TObject);
begin
  btnPesquisarRetorno.Enabled         := lcxServicoRetorno.EditValue <> NULL;
//  cxGridDBTableValorUtilizado.Visible := sqlServicoRetornoVALOR_FIXO_RETORNO.AsString <> 'S';
  if btnPesquisarRetorno.Enabled then
    btnPesquisarRetornoClick(self);
end;

procedure TfrmOrdemServicoSolicitar.pgcOSChange(Sender: TObject);
begin
  if vlAbrindoForm then
    exit;

  gbxOSAntiga.Visible := False;
  dxBarManagerRotulo.Visible := pgcOS.ActivePage = tbcOS;
  if pgcOS.ActivePage = tbcOS then
  begin
    cxTestAlerta.Visible             := False;
    pgcIdentificacao.ActivePageIndex := 0;
    tbcOS.TabVisible                 := True;
    pgcItensOS.ActivePageIndex       := 0 ;
    rdbOrdemNova.Enabled             := False;
    rdbOrdemAberta.Checked           := True;

    rdbOrdemAbertaClick(self);
    if vlOsNova = '' then
         edtOS.EditValue := vlOsPesquisar
    else edtOS.EditValue := vlOsNova;

    btnPesquisarOSClick(self);
    frmOrdemServicoSolicitar.Height := 700;
    cxBtnFechar.Enabled             := True;
    gbxInclusao.Enabled             := True;
    pnlAdicionar.Enabled            := sqlOrdemServicoSITUACAO.AsString = 'A';
    pnlAdicionar.Visible            := (vgOrdemServico.TipoInclusao <> 0) and (sqlOrdemServicoSITUACAO.AsString = 'A');

    if sqlOrdemServicoSITUACAO.AsString = 'A' then
      lblInformacao.Caption := 'Ordem de Serviço'
    else
      if sqlOrdemServicoSITUACAO.AsString = 'F' then
        lblInformacao.Caption := 'Ordem de Serviço FECHADA'
    else
      if sqlOrdemServicoSITUACAO.AsString = 'C' then
        lblInformacao.Caption := 'Ordem de Serviço CANCELADA';

    CarregarSaldo;
  end
  else
    if pgcOS.ActivePage = tbcPesquisa then
    begin
      frmOrdemServicoSolicitar.Height := 700;
      cxBtnFechar.Enabled             := True;
    end
  else
    if pgcOS.ActivePage = tbcServicosRetorno then
      lcxServicoRetorno.SetFocus
  else
    if pgcOS.ActivePage = tbcGerenciarOS then
    begin
      chxRegistradoRiClick(SELF);
      if not sqlSaldoOS.Active  then
        dtmLookup.CarregarListaSistemas(icxTipoSistema, False, True);
    end;
  vlOsNova := '';

end;

procedure TfrmOrdemServicoSolicitar.PreencherDadosAberturaCaixa;
begin
  vlSaldoAbertura       := dtmControles.BuscarParametroOutroSistema('VALOR_ABERTURA_FECHAMENTO', 'GERAL','PRINCIPAL','5') = 'S';
  lblInformacao.Caption := 'ABERTURA DO CAIXA';
  lbxServico.Enabled    := False;

  ClientAncestralCAIXA_SERVICO_ID.AsInteger := 1;
  ClientAncestralREGISTRADO.AsInteger       := 3;
  ClientAncestralDESCRICAO.AsString         := 'ABERTURA DE CAIXA';
  ClientAncestralTIPO_SERVICO.AsString      := '14';
  ClientAncestralSITUACAO.AsString          := '1';
  lbxServicoPropertiesEditValueChanged(lbxServico);

  if vlSaldoAbertura then
  begin
    ClientAncestralVALOR_SERVICO.AsCurrency  := dtmControles.GetFloat(' SELECT FIRST(1) SALDO_FINAL '+
                                                                      ' FROM C_CAIXA_ANDAMENTO '+
                                                                      ' WHERE ANDAMENTO_CAIXA = '+ QuotedStr('4')+
                                                                      ' ORDER BY CAIXA_ANDAMENTO_ID DESC');
    edtDescricao.SetFocus;
  end
  else
  begin
    ClientAncestralVALOR_SERVICO.AsCurrency   := dtmControles.BuscarParametroOutroSistema('VALOR_PADRAO_ABERTURA', 'GERAL','PRINCIPAL','5');
    edtValorPago.SetFocus;
  end;
end;

procedure TfrmOrdemServicoSolicitar.PreencherDadosAlteracao;
begin
  lblInformacao.Caption := 'Ordem de Serviço - Alteração Dados do Item Selecionado';
  lbxServico.Enabled   := not (ClientAncestralSITUACAO.AsInteger in [1,2]);
  edtValorPago.Enabled := not (ClientAncestralSITUACAO.AsInteger in [1,2]);
  lbxServicoPropertiesEditValueChanged(lbxServico);
  lbxServico.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.PreencherDadosInclusao;
begin
  lblInformacao.Caption               := 'Ordem de Serviço';
  ClientAncestral.edit;
  ClientAncestralREGISTRADO.AsInteger := 1;
  ClientAncestralSITUACAO.AsString    := '3'; //Aguardando
  if vgCaixaDados.CaixaId > 0 then
    ClientAncestralCAIXA_ID.AsInteger := vgCaixaDados.CaixaId;
  lbxServico.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.PreencherValorUtilizado;
begin
  sqlItensRetorno.DisableControls;
  sqlItensRetorno.First;
  while not sqlItensRetorno.Eof do
  begin
    sqlItensRetorno.Edit;
    sqlItensRetornoCALC_VALOR_DEDUZIR.AsCurrency := sqlItensRetornoVALOR_PAGO.AsCurrency;
    sqlItensRetorno.Post;
    sqlItensRetorno.Next;
  end;
  sqlItensRetorno.First;
  sqlItensRetorno.EnableControls;
end;

procedure TfrmOrdemServicoSolicitar.rdbEntradasClick(Sender: TObject);
begin
  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralCAIXA_SERVICO_ID.AsVariant  := null;
  SelecionarCaixaServico('E');
end;

procedure TfrmOrdemServicoSolicitar.rdbOrdemAbertaClick(Sender: TObject);
begin
  if pgcOS.ActivePage = tbcPesquisa then
    exit;

  tabOrdemNova.TabVisible    := False;
  tabOrdemAberta.TabVisible  := True;
  pgcOrdemServico.ActivePage := tabOrdemAberta;
  try
    if (pgcOS.ActivePage = tbcOS) and (edtOS.Enabled) then
      edtOS.SetFocus;
  except

  end;
end;

procedure TfrmOrdemServicoSolicitar.rdbOrdemNovaClick(Sender: TObject);
begin
  pgcOS.ActivePage                 := tbcOS;
  sqlCaixaItens.Active             := False;
  tabOrdemNova.TabVisible          := True;
  tabOrdemAberta.TabVisible        := False;
  pgcOrdemServico.ActivePage       := tabOrdemNova;
  vgOrdemServico.Ordem             := 0;
  edtIdentificacao.Clear;

  if vgOrdemServico.TipoInclusao <> 0 then
    frmOrdemServicoSolicitar.Height := 245;

  icxTipoClientePropertiesEditValueChanged(self);

  if pgcOS.ActivePage = tbcOS then
    icxTipoCliente.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.rdbOSAntigaClick(Sender: TObject);
begin
  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralCAIXA_SERVICO_ID.AsVariant  := null;
  SelecionarCaixaServico('A');
end;

procedure TfrmOrdemServicoSolicitar.rdbSaidasClick(Sender: TObject);
begin
  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralCAIXA_SERVICO_ID.AsVariant  := null;
  SelecionarCaixaServico('S');
end;

procedure TfrmOrdemServicoSolicitar.mniTrocarOSClick(Sender: TObject);
var
  viOS, viSql : String;
  viDadosOS : TStringList;

  procedure Validar;
  begin
    repeat
      if InputQuery('Troca de OS', 'Nova OS:', viOS) then
      begin
        try
          viOS := Trim(viOS);
          viOS := RetornaNumerico(viOS);
        except
          viOS := '';
          Application.MessageBox('Número da OS Inválida!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
          Continue;
        end;

        if viOS = sqlOrdemServicoORDEM_SERVICO_ID.AsString then
        begin
          viOS := '';
          Application.MessageBox('Número da OS deve ser diferente da OS Atual!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
          Continue;
        end;

        viDadosOS := dtmControles.GetFields(' SELECT DESCRICAO, MENSALISTA_ID FROM C_ORDEM_SERVICO '+
                                            ' WHERE ORDEM_SERVICO_ID = '+viOS);
        if viDadosOS.Values['DESCRICAO'] = '' then
        begin
          viOS := '';
          Application.MessageBox('Número da OS Inexistente!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
        end;
      end
      else abort;
    until viOS <> '';
  end;

begin
  viOS := '';
  Validar;

  if Application.MessageBox(PChar('Confirma Troca do Item de OS?'+#13+#13+
                                  'OS Nova Nº '+viOS + ' - ' + viDadosOS.Values['DESCRICAO']), 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
  begin
    FreeAndNil(viDadosOS);
    exit;
  end;

  viSql := ' UPDATE C_CAIXA_ITEM SET ORDEM_SERVICO_ID = '+viOS;
  if viDadosOS.Values['MENSALISTA_ID'] <> '' then
    viSql := viSql + ' ,OS_TIPO = '+QuotedStr('5')+', OS_TRANSACAO = '+QuotedStr('M')+', SITUACAO = '+QuotedStr('3');

  viSql := viSql + 'WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString;

  ExecutaSqlAuxiliar(viSql,1);

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_REGISTRO SET ORDEM_SERVICO_ID = '+viOS+
                     ' WHERE RECIBO_ID = '+sqlCaixaItensRECIBO_ID.AsString,1);

  sqlOrdemServico.Refresh;
  sqlCaixaItens.Refresh;
  CarregarSaldo;
  Application.MessageBox('Troca de OS realizada!!!', 'Informação', MB_Ok + MB_ICONINFORMATION);
end;

function TfrmOrdemServicoSolicitar.PegarAnoMes(vpData: String;
  vpAnterior: Boolean): String;
var
  viAno, viMes : Integer;
begin
  viAno := StrToInt(copy(vpData,7,4));
  viMes := StrToInt(copy(vpData,4,2));

  if vpAnterior then
  begin
    if (viMes = 1) then
    begin
      Dec(viAno);
      viMes := 12;
    end
    else Dec(viMes);
  end;
  result := FormatFloat('00', viAno) + FormatFloat('00', viMes);
end;

procedure TfrmOrdemServicoSolicitar.PesquisarGerenciarOS(vpSituacao: String);
var
  viSql : String;

  function VerificarCondicaoSistema(vpSistemaId, vpCampo : String):String;
  begin
    Result := ',(SELECT COUNT(C5.CAIXA_ITEM_ID) FROM C_CAIXA_ITEM C5 '+
              '  LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
              '  C5.CAIXA_SERVICO_ID = CS.CAIXA_SERVICO_ID '+
              ' WHERE C5.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
              '   AND C5.SITUACAO <> ''5'''+
              '   AND CS.SISTEMA_ID = '+vpSistemaId+') AS '+ vpCampo;
  end;

  function VerificarFiltroSistema(vpSistemaId : String):String;
  var
    viFiltro : String;
    function PreencherFiltro(vpId, vpCampo : String): String;
    begin
      if vpId = vpSistemaId then
        exit;

      if viFiltro = '' then
           Result := ' AND (('+vpCampo +'= 0)'
      else Result := ' AND ('+vpCampo +'= 0)'
    end;

  begin
    viFiltro := '';
    viFiltro := viFiltro + PreencherFiltro('1','X.QTD_NOTAS');
    viFiltro := viFiltro + PreencherFiltro('2','X.QTD_RI');
    viFiltro := viFiltro + PreencherFiltro('3','X.QTD_CIVIL');
    viFiltro := viFiltro + PreencherFiltro('4','X.QTD_RTD');
    viFiltro := viFiltro + PreencherFiltro('5','X.QTD_PROTESTO');
    viFiltro := viFiltro + PreencherFiltro('9','X.QTD_GERAL');

    viFiltro := viFiltro + ')';
    Result := viFiltro;
  end;

begin
  Screen.Cursor := crHourGlass;
  viSql := ' SELECT X.ORDEM_SERVICO_ID, '+
           '        X.DESCRICAO, '+
           '        X.SITUACAO, '+
           '        X.DATA, '+
           '        X.MENSALISTA_ID, '+
           '        X.SALDO_OS, '+
           '        X.MENSALISTA, '+
           '        X.DATA_INATIVIDADE, '+
           '        X.QTD_ITENS_COMPENSAR, '+
           '        X.QTD_ITENS_AGUARDANDO, '+
           '        X.QTD_ITENS_MENSALISTA, '+
           '        X.IDS_RI';
  if icxTipoSistema.EditValue <> null then
    viSql := viSql +
           '       ,X.QTD_RI ' +
           '       ,X.QTD_NOTAS ' +
           '       ,X.QTD_CIVIL ' +
           '       ,X.QTD_RTD ' +
           '       ,X.QTD_PROTESTO ' +
           '       ,X.QTD_GERAL ';

    viSql := viSql +
           ' FROM ( SELECT '+
           '        OS.ORDEM_SERVICO_ID, '+
           '        OS.DESCRICAO, '+
           '        OS.SITUACAO, '+
           '        OS.DATA, '+
           '        OS.MENSALISTA_ID, '+
           '        OS.SALDO_OS, '+
           '        M.DESCRICAO AS MENSALISTA, '+
           '  (SELECT FIRST 1 C1.DATA_PAGAMENTO FROM C_CAIXA_ITEM C1 '+
           '   WHERE C1.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
           '   ORDER BY C1.DATA_PAGAMENTO DESC) AS DATA_INATIVIDADE, '+

           '  (SELECT COUNT(C2.CAIXA_ITEM_ID) FROM C_CAIXA_ITEM C2 '+
           '   WHERE C2.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
           '     AND C2.SITUACAO = ''7'''+
           '     AND C2.REGISTRADO = ''2'') AS QTD_ITENS_COMPENSAR, '+

           '  (SELECT COUNT(C3.CAIXA_ITEM_ID) FROM C_CAIXA_ITEM C3 '+
           '   WHERE C3.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
           '     AND C3.SITUACAO = ''3'''+
           '     AND C3.REGISTRADO = ''1'') AS QTD_ITENS_AGUARDANDO, '+

           '  (SELECT COUNT(C4.CAIXA_ITEM_ID) FROM C_CAIXA_ITEM C4 '+
           '   WHERE C4.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
           '     AND C4.SITUACAO = ''6'''+
           '     AND C4.REGISTRADO = ''2'') AS QTD_ITENS_MENSALISTA, '+

           '  (SELECT LIST(DISTINCT(CAST(C6.CHAVE_SERVICO AS INTEGER))) '+
           '  FROM C_CAIXA_ITEM C6 '+
           '    LEFT OUTER JOIN C_CAIXA_SERVICO CS1 ON '+
           '   C6.CAIXA_SERVICO_ID = CS1.CAIXA_SERVICO_ID '+
           '  WHERE C6.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
           '    AND C6.SITUACAO <> ''5'''+
           '    AND CS1.SISTEMA_ID = 1) AS IDS_RI ';

  if icxTipoSistema.EditValue <> null then
  begin
    viSql := viSql + VerificarCondicaoSistema('1','QTD_RI');
    viSql := viSql + VerificarCondicaoSistema('2','QTD_NOTAS');
    viSql := viSql + VerificarCondicaoSistema('12','QTD_CIVIL');
    viSql := viSql + VerificarCondicaoSistema('7','QTD_RTD');
    viSql := viSql + VerificarCondicaoSistema('13','QTD_PROTESTO');
    viSql := viSql + VerificarCondicaoSistema('9','QTD_GERAL');
  end;

  viSql := viSql +
           ' FROM C_ORDEM_SERVICO OS '+
           '  LEFT OUTER JOIN C_MENSALISTA M ON '+
           '  OS.MENSALISTA_ID = M.MENSALISTA_ID '+
           ' WHERE NOT ORDEM_SERVICO_ID IS NULL ';

  case StrToInt(icxOSOrdenacao.EditValue) of
    1 : viSql := viSql + ' ORDER BY OS.ORDEM_SERVICO_ID DESC';
    2 : viSql := viSql + ' ORDER BY OS.SALDO_OS, OS.ORDEM_SERVICO_ID DESC';
    3 : viSql := viSql + ' ORDER BY DATA_INATIVIDADE, OS.ORDEM_SERVICO_ID';
  end;

  viSql := viSql + ' ) X '+
                   ' WHERE NOT X.ORDEM_SERVICO_ID IS NULL ';

  if vpSituacao <> 'T' then
    viSql := viSql + ' AND X.SITUACAO = '+QuotedStr(vpSituacao);

  if edtOSPesquisa.Text <> '' then
    viSql := viSql + ' AND X.ORDEM_SERVICO_ID = '+edtOSPesquisa.Text;

  case StrToInt(icxOsTipo.EditValue) of
    1 : viSql := viSql + ' AND X.MENSALISTA_ID IS NULL ';
    2 : viSql := viSql + ' AND NOT X.MENSALISTA_ID IS NULL';
  end;

  case StrToInt(icxOSSaldo.EditValue) of
    1 : viSql := viSql + ' AND ((X.SALDO_OS > 0) OR (X.SALDO_OS < 0))';
    2 : viSql := viSql + ' AND X.SALDO_OS = 0';
    3 : viSql := viSql + ' AND ((X.SALDO_OS > 0) AND (X.SALDO_OS < 1.00))';
    4 : viSql := viSql + ' AND ((X.SALDO_OS > 0) AND (X.SALDO_OS < 5.00))';
    5 : viSql := viSql + ' AND ((X.SALDO_OS > 0) AND (X.SALDO_OS < 10.00))';
    6 : viSql := viSql + ' AND ((X.SALDO_OS > 0) AND (X.SALDO_OS < 50.00))';
    7 : viSql := viSql + ' AND X.SALDO_OS < 0';
  end;

  case StrToInt(icxOSPendencia.EditValue) of
    2 : viSql := viSql + ' AND ((X.QTD_ITENS_COMPENSAR > 0) OR (X.QTD_ITENS_AGUARDANDO > 0) OR (X.QTD_ITENS_MENSALISTA > 0) OR (X.SALDO_OS < 0))';
    3 : viSql := viSql + ' AND (X.QTD_ITENS_COMPENSAR = 0) AND (X.QTD_ITENS_AGUARDANDO = 0) AND (X.QTD_ITENS_MENSALISTA = 0) AND (X.SALDO_OS >= 0)';
    4 : viSql := viSql + ' AND (X.QTD_ITENS_AGUARDANDO > 0) ';
    5 : viSql := viSql + ' AND (X.QTD_ITENS_COMPENSAR > 0) ';
    6 : viSql := viSql + ' AND (X.QTD_ITENS_MENSALISTA > 0) ';
  end;

  if icxTipoSistema.EditValue <> null then
    viSql := viSql + VerificarFiltroSistema(IntToStr(icxTipoSistema.EditValue));

  if (edtDataOcorrencia.EditValue <> null) and ValidarData(edtDataOcorrencia.Text) then
    viSql := viSql + ' AND X.DATA_INATIVIDADE <= '+ QuotedStr(TrocaBarraPPonto(DateToStr(edtDataOcorrencia.Date)));

  sqlSaldoOS.Active    := False;
  sqlSaldoOS.SQL.Clear;
  sqlSaldoOS.SQL.Text  := viSql;
  sqlSaldoOS.Active    := True;
  btnOSAcerto.Enabled         := not sqlSaldoOS.IsEmpty;
  btnOsReabrir.Enabled        := not sqlSaldoOS.IsEmpty;
  btnOSAtualizarSaldo.Enabled := not sqlSaldoOS.IsEmpty;

  if chxRegistradoRi.Checked then
    VerificarItensRI;

  Screen.Cursor := crDefault;
end;

function TfrmOrdemServicoSolicitar.SaldoTotalOS:Currency;
var
  viSql : String;
  viSaldo : Currency;
begin
{  viSql := ' SELECT SUM(COALESCE(SALDO_OS,0)) AS SALDO '+
           ' FROM C_ORDEM_SERVICO ';
  if vpOSSituacao <> 'T' then
    viSql := viSql + ' WHERE SITUACAO = '+ QuotedStr(vpOSSituacao);
  Result := dtmControles.GetFloat(viSql);}

  Screen.Cursor := crHourGlass;
  viSaldo := 0 ;
  sqlSaldoOS.DisableControls;
  sqlSaldoOS.First;
  while not sqlSaldoOS.Eof do
  begin
    viSaldo := viSaldo + sqlSaldoOSSALDO_OS.AsCurrency;
    sqlSaldoOS.Next;
  end;
  sqlSaldoOS.EnableControls;
  Result := viSaldo;
  Screen.Cursor := crDefault;
end;

procedure TfrmOrdemServicoSolicitar.SelecionarCaixaServico(vpTipoOS : String);
var
  Sql, Aux : String;
begin
  sqlCaixaServicos.Close;
  vgSistemas := dtmControles.BuscarParametroOutroSistema('SISTEMA_CAIXA', 'GERAL','NOVO_CAIXA','5');
  Aux := dtmLookup.SelecionarSistema(vgSistemas, 'SISTEMA_ID');

  Sql := 'SELECT * ' +
         'FROM C_CAIXA_SERVICO ' +
         'WHERE (SISTEMA_ID = 9 OR ' + Aux;

  if sqlOrdemServicoMENSALISTA_ID.AsInteger > 0 then
       Sql := Sql + ' AND OS_TIPO IN (''1'',''4'',''8'')'
  else
    if vpTipoOS = 'E' then
       Sql := Sql + ' AND OS_TIPO IN (''1'',''2'',''3'')'
  else
    if vpTipoOS = 'S' then
         Sql := Sql + ' AND OS_TIPO IN (''4'',''5'',''6'',''9'')'
    else Sql := Sql + ' AND OS_TIPO IN (''7'')';

  Sql := Sql + ' AND SITUACAO = '+QuotedStr('A')+' ORDER BY DESCRICAO';

  sqlCaixaServicos.SQL.Text := Sql;
    sqlCaixaServicos.Open;
end;

procedure TfrmOrdemServicoSolicitar.SelecionarItensCaixa;
var
  viSql : String;
begin
  sqlCaixaItens.Active := False;

  if edtOS.Text <> '' then
  begin
    viSql := '  SELECT CI.CAIXA_ITEM_ID, CI.CAIXA_SERVICO_ID, CI.USUARIO_SERVICO_ID, CI.USUARIO_CAIXA_ID, '+
             '  CI.CHAVE_SERVICO, CI.DESCRICAO, CI.DATA_PAGAMENTO, CI.SITUACAO, CI.TIPO_TRANSACAO, '+
             '  CI.VALOR_SERVICO, CI.VALOR_PAGO, CI.OBSERVACAO, CI.HORA_PAGAMENTO, '+
             '  CI.CAIXA_ID, CI.RECIBO_ID, TIPO_SERVICO, CI.QTD, CI.APRESENTANTE, CI.MENSALISTA_ID, '+
             '  CI.REGISTRADO, CI.TIPO_CAIXA, CI.ORDEM_SERVICO_ID, CI.OS_TIPO, CI.OS_TRANSACAO, '+
             '  CS.CAIXA_SERVICO_RETORNO_ID AS SERVICO_RETORNO_ENTRADA, CI.OS_SAIDA, '+
             '  CI.CAIXA_SERVICO_RETORNO_ID AS SERVICO_RETONO_SAIDA, CI.QUITADO_CAIXA_ID, '+
             '  CI.CAIXA_SERVICO_ENTRADA_ID AS SERVICO_CONFIRMADO, CI.DESMEMBRADO_ID,'+
             '  CS.SISTEMA_ID, CI.AUTORIZACAO_TIPO, CI.AUTORIZACAO_ID, U.LOGIN, CI.FINALIZACAO, CI.DATA_REGISTRO '+
             '  FROM C_CAIXA_ITEM CI '+
             '  LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
             '  CI.CAIXA_SERVICO_ID = CS.CAIXA_SERVICO_ID '+
             '  LEFT OUTER JOIN G_USUARIO U ON '+
             '  CI.AUTORIZACAO_ID = U.USUARIO_ID '+
             ' WHERE ORDEM_SERVICO_ID = '+ IntToStr(edtOS.EditValue)+
             ' AND CI.REGISTRADO <> ''6'' AND' +
             ' NOT EXISTS ' +
             '(' +
             'SELECT 1 FROM C_CAIXA_ITEM C_CI2 WHERE C_CI2.SITUACAO = ''7'' AND ' +
             'C_CI2.REGISTRADO = ''6'' AND ' +
             'C_CI2.QUITADO_CAIXA_ID = CI.CAIXA_ITEM_ID' +
             ')' +
             ' AND CI.REGISTRADO <> ''5'''+
             '   ORDER BY CI.CAIXA_ITEM_ID ';

    sqlCaixaItens.SQL.Text := viSql;
    sqlCaixaItens.Active := True;
  end;

  tbcItensOS.TabVisible       := sqlCaixaItens.Active and not sqlCaixaItens.IsEmpty;
  pgcItensOS.ActivePage       := tbcItensOs;
  tabOrdemAberta.ImageIndex   := -1;
  AtualizaDadosGerais;

  CarregarSaldo;
  CarregarListaOSSimplificado(icxTipoPagamento);
end;

procedure TfrmOrdemServicoSolicitar.sqlCaixaItensAfterScroll(DataSet: TDataSet);
begin
  if sqlCaixaItensFINALIZACAO.AsString = 'S' then
       grdOS.PopupMenu := nil
  else grdOS.PopupMenu := popOS;

  try
    btnExcluirItem.Enabled              := ((sqlCaixaItensSITUACAO.AsString = '3') and (sqlCaixaItensCHAVE_SERVICO.IsNull)) or
                                           ((sqlCaixaItensOS_TIPO.AsString = '5') and (sqlCaixaItensQUITADO_CAIXA_ID.IsNull) and (sqlCaixaItensCHAVE_SERVICO.IsNull));

    mniComDireto_OSCredito.Enabled      := (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensOS_TRANSACAO.AsString[1] = 'C')
                                            and (sqlCaixaItensOS_TIPO.AsString = '1') and (sqlCaixaItensSITUACAO.AsString <> '5')
                                            and sqlCaixaItensCHAVE_SERVICO.IsNull;
    mniComOSCredito_Direto.Enabled      := (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensOS_TRANSACAO.AsString[1] = 'C') and (sqlCaixaItensOS_TIPO.AsString = '2') and (sqlCaixaItensSITUACAO.AsString <> '5');

    mniComDireto_DeducaoOS.Enabled      := (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensOS_TIPO.AsString = '1') and
                                            (sqlCaixaItensSITUACAO.AsString <> '5') and
                                            ((sqlCaixaItensOS_TRANSACAO.AsString[1] = 'D') or
                                            ((sqlCaixaItensOS_TRANSACAO.AsString[1] = 'C') and (not sqlCaixaItensCHAVE_SERVICO.IsNull)))
                                            and (sqlCaixaItensRECIBO_ID.IsNull);

    mniComOSDeducao_Direto.Enabled      := (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensOS_TRANSACAO.AsString[1] = 'D') and
                                           (sqlCaixaItensOS_TIPO.AsString = '3') and (sqlCaixaItensSITUACAO.AsString <> '5');

    mniComSomenteItemMensalista.Enabled := (not sqlCaixaItens.IsEmpty) and (CharInSet(sqlCaixaItensOS_TRANSACAO.AsString[1], ['C','D'])) and
                                            (not sqlOrdemServicoMENSALISTA_ID.IsNull) and
                                            (CharInSet(sqlCaixaItensSITUACAO.AsString[1], ['3','7']));
    mniComOsMensalista.Enabled          := (not sqlCaixaItens.IsEmpty) and (CharInSet(sqlCaixaItensOS_TRANSACAO.AsString[1], ['C','D'])) and
                                           (CharInSet(sqlCaixaItensSITUACAO.AsString[1], ['3','7']));

    mniConverterOSMensalistaOSPadrao.Enabled:= (not sqlCaixaItens.IsEmpty) and (not sqlOrdemServicoMENSALISTA_ID.IsNull);

    mniComAAguardando.Enabled               := (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensSITUACAO.AsString = '7');
    mniComACompensar.Enabled                := (not sqlCaixaItens.IsEmpty) and (sqlCaixaItensSITUACAO.AsString = '3');
    mniConverterOSCreditoDevolucao.Enabled  := (not sqlCaixaItens.IsEmpty) and (CharInSet(sqlCaixaItensSITUACAO.AsString[1], ['3','7'])) and
                                               (not sqlCaixaItensCHAVE_SERVICO.Isnull) and (sqlCaixaItensTIPO_TRANSACAO.AsString = 'D');

    mniTrocarOS.Enabled                 := (not sqlCaixaItens.IsEmpty) and (CharInSet(sqlCaixaItensSITUACAO.AsString[1], ['3','4','7']));
    mniAcertoOS.Enabled                 := (not sqlCaixaItens.IsEmpty) and (sqlOrdemServicoMENSALISTA_ID.IsNull) and (sqlOrdemServicoSITUACAO.AsString = 'A');
    mniDesmembrar.Enabled               := (not sqlCaixaItens.IsEmpty) and (sqlOrdemServicoSITUACAO.AsString = 'A') and ((sqlCaixaItensOS_TIPO.AsString = '4') or (sqlCaixaItensOS_TIPO.AsString = '2'))
                                            and (edtSaldoOS.EditValue > 0) and (sqlCaixaItensOBSERVACAO.IsNull);
  except
     on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao carregar Itens da OS no AfterScrool!!!' +
          sLineBreak + '[' + E.message + ']'), 'Informação',
          MB_OK + MB_ICONINFORMATION);
      end;
  end;
end;

procedure TfrmOrdemServicoSolicitar.sqlCaixaItensCalcFields(DataSet: TDataSet);

  {$Region 'ServicoRetorno}
  Procedure ServicoRetorno;
  begin
    // SITUAÇÃO DE SERVIÇO DE RETORNO
    try
      if sqlCaixaItensSERVICO_CONFIRMADO.AsInteger > 0 then
        sqlCaixaItensCALC_RETORNO.AsString := '3'
      else
        if sqlCaixaItensSERVICO_RETONO_SAIDA.AsInteger > 0 then
             sqlCaixaItensCALC_RETORNO.AsString := '3'
      else
        if sqlCaixaItensSERVICO_RETORNO_ENTRADA.AsInteger > 0 then
          sqlCaixaItensCALC_RETORNO.AsString := '1'
      else
        if (sqlCaixaItensOS_TIPO.AsString = '1') then
          sqlCaixaItensCALC_RETORNO.AsString := sqlCaixaItensOS_TRANSACAO.AsString
      else
        if (CharInSet(sqlCaixaItensOS_TIPO.AsString[1], ['2','3'])) and (sqlCaixaItensCHAVE_SERVICO.IsNull) then
        begin
          if (sqlCaixaItensOS_SAIDA.AsString = '') and (sqlCaixaItensOS_TIPO.AsString = '3') then
               sqlCaixaItensCALC_RETORNO.AsString := ''
          else sqlCaixaItensCALC_RETORNO.AsString := sqlCaixaItensOS_TRANSACAO.AsString;
        end
      else
        if (sqlCaixaItensOS_TIPO.AsString = '9') then
        begin
          if sqlCaixaItensOS_TRANSACAO.AsString = 'D' then
               sqlCaixaItensCALC_RETORNO.AsString := 'C'
          else sqlCaixaItensCALC_RETORNO.AsString := 'D';
        end
      else
        if (sqlCaixaItensOS_TIPO.AsString = '6') then
        begin
          if sqlCaixaItensOS_SAIDA.IsNull then
            sqlCaixaItensCALC_RETORNO.AsString := '4'
          else
            if (sqlCaixaItensOS_SAIDA.AsString = 'V') and (sqlCaixaItensSITUACAO.AsString = '4') then
              sqlCaixaItensCALC_RETORNO.AsString := 'D';
        end
      else
        if sqlCaixaItensOS_TIPO.AsString = '7' then
          sqlCaixaItensCALC_RETORNO.AsString := 'C'
      else
        if sqlCaixaItensOS_TIPO.AsString = '5' then
        begin
          if sqlCaixaItensQUITADO_CAIXA_ID.IsNull then
            sqlCaixaItensCALC_RETORNO.AsString := '1'
          else
            if sqlCaixaItensREGISTRADO.AsString = '2' then
                 sqlCaixaItensCALC_RETORNO.AsString := '5'
            else sqlCaixaItensCALC_RETORNO.AsString := '3';
        end;
    except
     on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao carregar Itens da OS. Procedure ServicoRetorno!!!' +
          sLineBreak + '[' + E.message + ']'), 'Informação',
          MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end;
  {$EndRegion}

  Function MontarObservacao:String;
  var
    viObs : String;
  begin
    viObs := sqlCaixaItensOBSERVACAO.AsString;
    if sqlCaixaItensLOGIN.AsString <> '' then
      viObs := viObs + ' >> Autorizado por '+sqlCaixaItensLOGIN.AsString;
    Result := viObs;
  end;

begin
  try
    sqlCaixaItensValorPagoCalc.AsCurrency := sqlCaixaItensVALOR_PAGO.AsCurrency;

     if sqlCaixaItensTIPO_SERVICO.AsString.Equals(
        '5') then
     begin
       vgOrdemServico.ItemCompensador := 0;
       sqlCaixaItensValorPagoCalc.AsCurrency := Reprotocolo(sqlCaixaItensValorPagoCalc.AsCurrency, sqlCaixaItensCHAVE_SERVICO.AsInteger);

       if vgOrdemServico.ItemCompensador > 0 then
         sqlCaixaItensCALC_ITEM_COMPENSADOR.AsInteger := vgOrdemServico.ItemCompensador;
       vgOrdemServico.ItemCompensador := 0;
     end;
  except
     on E: Exception do
      begin
        cxTestAlerta.Visible := True;
        cxTestAlerta.Text := 'Erro ao carregar Dados Reprotocolo. IdCaixaItem '+ sqlCaixaItensCAIXA_ITEM_ID.AsString+'!!! ' + E.message + ']';
      end;
  end;

    if (sqlCaixaItensSITUACAO.AsInteger = 4) and (sqlCaixaItensOS_TIPO.AsInteger <> 1) then
    begin
      if ((sqlCaixaItensTIPO_TRANSACAO.AsString = 'C') and (sqlCaixaItensOS_TIPO.AsInteger = 2)) or
         ((sqlCaixaItensOS_TRANSACAO.AsString = 'A') and (sqlCaixaItensOS_TIPO.AsInteger = 4)) or
         ((sqlCaixaItensOS_TRANSACAO.AsString = 'C') and (sqlCaixaItensOS_TIPO.AsInteger = 9)) or
         ((sqlCaixaItensOS_SAIDA.IsNull) and (sqlCaixaItensOS_TIPO.AsInteger = 6)) then
           sqlCaixaItenscalc_creditos.AsCurrency := sqlCaixaItensValorPagoCalc.AsCurrency
      else
        if  ((sqlCaixaItensOS_SAIDA.AsString = 'V') and (sqlCaixaItensOS_TIPO.AsInteger = 6) and (sqlCaixaItensSITUACAO.AsString = '4')) then
        begin
          sqlCaixaItenscalc_creditos.AsCurrency := sqlCaixaItensValorPagoCalc.AsCurrency;
          sqlCaixaItenscalc_Debitos.AsCurrency   := sqlCaixaItensValorPagoCalc.AsCurrency;
        end
      else sqlCaixaItenscalc_Debitos.AsCurrency  := sqlCaixaItensValorPagoCalc.AsCurrency;
    end;

    sqlCaixaItensCALC_IMPRESSAO.AsBoolean := sqlCaixaItensRECIBO_ID.AsInteger > 0;

    if (((sqlCaixaItensOS_TRANSACAO.AsString = 'D') and (CharInSet(sqlCaixaItensOS_TIPO.AsString[1], ['1', '3']))) or
       ((sqlCaixaItensOS_TRANSACAO.AsString = 'C') and (sqlCaixaItensOS_TIPO.AsString = '1'))) and
       (sqlCaixaItensSITUACAO.AsString <> '7') then
      sqlCaixaItensCALC_VALOR_OS.AsCurrency := sqlCaixaItensVALOR_PAGO.AsCurrency;

  ServicoRetorno;
  sqlCaixaItensCALC_OBSERVACAO.AsString := MontarObservacao;
end;

procedure TfrmOrdemServicoSolicitar.sqlItensDetalhesCalcFields(
  DataSet: TDataSet);

  Function MontarObservacao:String;
  var
    viObs : String;
  begin
    viObs := sqlItensDetalhesOBSERVACAO.AsString;
    if sqlItensDetalhesLOGIN.AsString <> '' then
      viObs := viObs + ' >> Autorizado por '+sqlItensDetalhesLOGIN.AsString;
    Result := viObs;
  end;
begin
  sqlItensDetalhesCALC_OBSERVACAO.AsString := MontarObservacao;

end;

procedure TfrmOrdemServicoSolicitar.sqlItensRetornoAfterScroll(
  DataSet: TDataSet);
begin
  btnRegistrarrRetorno.Enabled := not sqlItensRetorno.IsEmpty;
end;

procedure TfrmOrdemServicoSolicitar.sqlItensRetornoCalcFields(
  DataSet: TDataSet);
begin
  sqlItensRetornoCALC_OS.AsString := MascaraOS(sqlItensRetornoORDEM_SERVICO_ID.AsCurrency);

  if (sqlItensRetornoCAIXA_SERVICO_RETORNO_ID.IsNull) AND
     (sqlItensRetornoCAIXA_SERVICO_ENTRADA_ID.IsNull) then
    sqlItensRetornoCALC_SITUACAO.AsString := '1'
  else
    if (sqlItensRetornoCAIXA_SERVICO_RETORNO_ID.AsInteger > 0) AND
       (sqlItensRetornoCAIXA_SERVICO_ENTRADA_ID.IsNull) then
       sqlItensRetornoCALC_SITUACAO.AsString := '2'
  else sqlItensRetornoCALC_SITUACAO.AsString := '3';
end;

procedure TfrmOrdemServicoSolicitar.sqlItensRetornoCALC_SELECIONADOChange(
  Sender: TField);
begin
  if sqlItensRetorno.State in [dsEdit, dsInsert] then
   sqlItensRetorno.Post;
end;

procedure TfrmOrdemServicoSolicitar.sqlPesquisaOSAfterScroll(DataSet: TDataSet);
begin
  tbcOS.TabVisible    := not sqlOrdemServico.IsEmpty;
  btnExcluirOS.Enabled:= not sqlOrdemServico.IsEmpty;
end;

procedure TfrmOrdemServicoSolicitar.sqlPesquisaOSCalcFields(DataSet: TDataSet);
begin
  sqlPesquisaOSCALC_OS.AsString := MascaraOS(sqlPesquisaOSORDEM_SERVICO_ID.AsCurrency);
  if sqlPesquisaOSOS_ANTIGA.AsString <> '' then
    sqlPesquisaOSCALC_OBSERVACAO.AsString := 'OS Antiga '+sqlPesquisaOSOS_ANTIGA.AsString;

  if sqlPesquisaOSOBSERVACAO.AsString <> '' then
  begin
    if sqlPesquisaOSCALC_OBSERVACAO.AsString <> '' then
         sqlPesquisaOSCALC_OBSERVACAO.AsString := sqlPesquisaOSCALC_OBSERVACAO.AsString + ' - '+ sqlPesquisaOSOBSERVACAO.AsString
    else sqlPesquisaOSCALC_OBSERVACAO.AsString := sqlPesquisaOSOBSERVACAO.AsString;
  end;

end;

procedure TfrmOrdemServicoSolicitar.sqlSaldoOSCalcFields(DataSet: TDataSet);
begin
  sqlSaldoOSCALC_OS.AsString      := MascaraOS(sqlSaldoOSORDEM_SERVICO_ID.AsCurrency);
  sqlSaldoOSCALC_FECHAR.AsBoolean := (sqlSaldoOSQTD_ITENS_COMPENSAR.AsInteger = 0) and
                                     (sqlSaldoOSQTD_ITENS_AGUARDANDO.AsInteger = 0) and
                                     (sqlSaldoOSQTD_ITENS_MENSALISTA.AsInteger = 0) and
                                     (sqlSaldoOSSALDO_OS.AsCurrency >= 0);

  if sqlSaldoOSMENSALISTA_ID.AsInteger > 0 then
  begin
    sqlSaldoOSCALC_PESSOA.AsString := sqlSaldoOSMENSALISTA.AsString;
    sqlSaldoOSCALC_TIPO.AsString   := '2';
  end
  else
  begin
    sqlSaldoOSCALC_PESSOA.AsString := sqlSaldoOSDESCRICAO.AsString;
    sqlSaldoOSCALC_TIPO.AsString   := '1';
  end;
end;

procedure TfrmOrdemServicoSolicitar.sqlServicosSequenciaisCALC_SELECIONADOChange(
  Sender: TField);
begin
  if sqlServicosSequenciais.State in [dsEdit, dsInsert] then
  begin
    sqlServicosSequenciais.Post;
    if vlMontandoSequencial then
      exit;
    CapturarValoresSequenciais;
  end;
end;

procedure TfrmOrdemServicoSolicitar.tbcItensAtivosChange(Sender: TObject);
begin
  sqlCaixaItens.Filtered := False;
  if tbcItensAtivos.TabIndex = 0 then
       sqlCaixaItens.Filter   := 'SITUACAO <> ''5'''
  else sqlCaixaItens.Filter   := 'SITUACAO = ''5''';
  sqlCaixaItens.Filtered := True;
  cxGridDBTableItensOS.DataController.Groups.FullExpand;
end;

procedure TfrmOrdemServicoSolicitar.VerificarItensRI;
var
  viIVerificar, viResultado, viId : String;
  viGetStatusProtocolo: IGetStatusProtocolo;
  viStatusProtocolo   : TStatusProtocolo;
begin
  sqlSaldoOS.First;
  sqlSaldoOS.DisableControls;
  IniciarIncrementarProgressBar(cxProgressBar1, sqlSaldoOS.RecordCount);

  IniciarIncrementarProgressBar(cxProgressBar1, sqlSaldoOS.RecordCount);
  while not sqlSaldoOS.Eof do
  begin
    viId := sqlSaldoOSIDS_RI.AsString;
    if (viId = '') then
      viResultado := 'N'
    else
    begin
      viResultado := 'R';
      viId  := sqlSaldoOSIDS_RI.AsString;
      viGetStatusProtocolo := TGetStatusProtocoloFactory.New.GetInstance;
      repeat
        try
          viIVerificar      := RetornarValorListaString(viId,',');
          viStatusProtocolo := viGetStatusProtocolo.StatusProtocolo(viIVerificar.ToInteger);

          if (viStatusProtocolo <> TStatusProtocolo.spRegistrado) then
          begin
            viResultado := 'A';
            Break;
          end;
        except
          viResultado := 'A';
          Break;
        end;
      until viId = '';
    end;

    sqlSaldoOS.Edit;
    sqlSaldoOSCALC_REGISTRADO.AsString := viResultado;
    sqlSaldoOS.Post;
    sqlSaldoOS.Next;
    IniciarIncrementarProgressBar(cxProgressBar1, 1, True);
  end;

  sqlSaldoOS.First;
  sqlSaldoOS.EnableControls;
  cxProgressBar1.Visible := False;
end;

procedure TfrmOrdemServicoSolicitar.VerificarOSAntiga;
var
  viOSAntiga : String;
begin
  viOSAntiga := dtmControles.GetStr(' SELECT OS_ANTIGA FROM C_ORDEM_SERVICO WHERE ORDEM_SERVICO_ID = '+ CurrToStr(vgOrdemServico.Ordem));
  edtNumOSAntiga.EditValue := viOSAntiga;
  gbxOSAntiga.Visible      := viOSAntiga <> '';
end;

procedure TfrmOrdemServicoSolicitar.VerificarPendenciaMensalista;
var
  viDiaAcerto, viMesAtual, viDataVerifica, viDataLimite, viAnoAtual, viData, viAnoMes, viPendenciaAntiga : string;
  viValorAberto : Currency;

  Function VerificarPendenciaMaisAntiga:Boolean;
  begin
    viPendenciaAntiga := dtmControles.GetStr(' SELECT FIRST 1 '+
                                               '    (extract(year from DATA_PAGAMENTO) || '+
                                               '    lpad(extract(month from DATA_PAGAMENTO),2,''0'')) as AnoMes'+
                                               ' FROM C_CAIXA_ITEM C '+
                                               '   LEFT OUTER JOIN C_ORDEM_SERVICO OS ON '+
                                               '   C.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
                                               ' WHERE OS.MENSALISTA_ID = '+vgOrdemServico.MensalistaId.ToString+
                                               '   AND C.OS_TIPO = ''5'''+
                                               '   AND C.REGISTRADO = ''2'''+
                                               '   AND C.SITUACAO = ''6'''+
                                               '   AND DATA_PAGAMENTO < '+ QuotedStr(TrocaBarraPPonto(viDataVerifica))+
                                               ' ORDER BY DATA_PAGAMENTO');
    if viPendenciaAntiga <> '' then
         Result := viPendenciaAntiga < viAnoMes
    else Result := False;
  end;

  procedure MostrarMensagemPendencia(vpMensagem : String);
  begin
    if Application.MessageBox(Pchar(vpMensagem+#13+#13+
                                    'Deseja Continuar?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = IDNO then
      abort;

    if (LiberarPermissaoUsuario('ESP_LIBERAR_ALTERA_OS', 6, 20)[6] = '0') then
      abort;

    vgOrdemServico.AutorizacaoId   := vlUsuarioIdLiberacao.ToInteger;
    vgOrdemServico.AutorizacaoTipo := '2';
  end;

begin
  if vgOrdemServico.MensalistaId = 0 then
    exit;

  viDiaAcerto := RetZeros(dtmControles.GetStr(' SELECT DIA_PAGAMENTO FROM C_MENSALISTA WHERE MENSALISTA_ID = '+ vgOrdemServico.MensalistaId.ToString),2);
  if viDiaAcerto = '' then
    exit;

  viData         := dtmControles.DataHoraBanco(4);
  viAnoMes       := PegarAnoMes(viData,True);
  viDataVerifica := dtmLookupFinancas.PegarDataFinalMes(viAnoMes);

  if VerificarPendenciaMaisAntiga then
    MostrarMensagemPendencia('Existe Pendência Financeira em aberto pra este Mensalista '+#13+#13+
                             'VENCIDAS A MAIS DE 1 MÊS!!!')
  else
  begin
    viMesAtual   := Copy(viData, 4,2);
    viAnoAtual   := Copy(viData, 7,4);
    viDataLimite := viDiaAcerto+'/'+viMesAtual+'/'+viAnoAtual;

    if viData <= viDataLimite then
      exit;

    viValorAberto := dtmControles.GetFloat(' SELECT coalesce(SUM(VALOR_PAGO),0) AS SOMA '+
                                           ' FROM C_CAIXA_ITEM C '+
                                           '   LEFT OUTER JOIN C_ORDEM_SERVICO OS ON '+
                                           '   C.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID '+
                                           ' WHERE OS.MENSALISTA_ID = '+vgOrdemServico.MensalistaId.ToString+
                                           '   AND C.OS_TIPO = ''5'''+
                                           '   AND C.REGISTRADO = ''2'''+
                                           '   AND C.SITUACAO = ''6'''+
                                           '   AND DATA_PAGAMENTO < '+ QuotedStr(TrocaBarraPPonto(viDataVerifica)));
    if viValorAberto > 0 then
      MostrarMensagemPendencia('Existe Pendência Financeira em aberto pra este Mensalista!!!');
  end; 
end;

function TfrmOrdemServicoSolicitar.VerificarTipoTransacao:String;
  procedure VerificarMensalista;
  begin
    if icxTipoCliente.EditValue = '2' then
    begin
      vgOrdemServico.TransacaoOS := 'M';
      vgOrdemServico.OSTipo      := '5';
    end

  end;

begin
  if vgOrdemServico.TipoInclusao = 0 then
  begin
    vgOrdemServico.OSSaida := string.Empty;
    if icxTipoPagamento.EditValue = '3' then
      vgOrdemServico.TransacaoOS := 'D'
    else
      if icxTipoPagamento.EditValue = '5' then
      begin
        vgOrdemServico.TransacaoOS := 'M';
        vgOrdemServico.OSTipo      := '5';
      end
    else
      if icxTipoPagamento.EditValue = null then
         VerificarMensalista
    else
      if vgOrdemServico.TransacaoItem = 'D' then
      begin
        vgOrdemServico.TransacaoOS := 'D';
        vgOrdemServico.OSSaida     := 'V';
        vgOrdemServico.OSTipo      := '6';
      end
      else
        vgOrdemServico.TransacaoOS := 'C';
  end
  else
    case StrToInt(icxTipoRegistro.EditValue) of
      1 : vgOrdemServico.TransacaoOS := IbxTransacao.EditValue;
      2 : vgOrdemServico.TransacaoOS := 'C';
      3 : vgOrdemServico.TransacaoOS := 'D';
      4 : vgOrdemServico.TransacaoOS := 'A';
      5 : vgOrdemServico.TransacaoOS := 'M';
    end;
  Result := vgOrdemServico.TransacaoOS;

end;

end.

