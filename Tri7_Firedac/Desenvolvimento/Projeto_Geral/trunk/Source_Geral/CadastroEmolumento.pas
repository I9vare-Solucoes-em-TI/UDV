unit CadastroEmolumento;

interface

uses
  I9Query,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  cxEdit,
  DB,
  cxImageComboBox,
  Buttons,
  cxDBEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxGroupBox,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxControls,
  cxGridCustomView,
  cxGrid,
  cxDropDownEdit,
  cxTextEdit,
  StdCtrls,
  cxButtons,
  cxContainer,
  cxMaskEdit,
  cxPC,
  ExtCtrls,
  cxSplitter,
  DBClient,
  SimpleDS,
  Menus,
  cxLabel,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxBarBuiltInMenu,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData,
  cxCurrencyEdit,
  DbxDevartInterBase,
  dxSkinsCore,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  dxSkinscxPCPainter,
  EmolumentoImpl,
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
  FireDAC.Comp.Client;

const
  CM_FormInicio = WM_USER + 1;

type
  TfrmEmolumento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label14: TLabel;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    sqlG_Emolumento: TI9Query;
    dtsG_Emolumento: TDataSource;
    sqlG_Emolumento_Item: TI9Query;
    sqlG_Emolumento_ItemTotal_Item: TCurrencyField;
    dtsG_Emolumento_Item: TDataSource;
    sqlG_Emolumento_Periodo: TI9Query;
    dtsG_Emolumento_Periodo: TDataSource;
    sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TBCDField;
    sqlG_Emolumento_PeriodoDESCRICAO: TStringField;
    sqlG_Emolumento_PeriodoSITUACAO: TStringField;
    sqlG_EmolumentoEMOLUMENTO_ID: TBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    sqlG_EmolumentoSISTEMA_ID: TBCDField;
    sqlG_Emolumento_ItemVALOR_EMOLUMENTO: TBCDField;
    sqlG_Emolumento_ItemEMOLUMENTO_ITEM_ID: TBCDField;
    sqlG_Emolumento_ItemEMOLUMENTO_ID: TBCDField;
    sqlG_Emolumento_ItemVALOR_INICIO: TBCDField;
    sqlG_Emolumento_ItemVALOR_FIM: TBCDField;
    sqlG_Emolumento_ItemVALOR_TAXA_JUDICIARIA: TBCDField;
    sqlG_Emolumento_ItemEMOLUMENTO_PERIODO_ID: TBCDField;
    sqlG_Emolumento_ItemCODIGO: TBCDField;
    sqlG_Emolumento_ItemPAGINA_EXTRA: TBCDField;
    sqlG_Emolumento_ItemVALOR_PAGINA_EXTRA: TBCDField;
    sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1: TBCDField;
    sqlEmolMemoria: TClientDataSet;
    sqlG_EmolumentoSELO_GRUPO_ID: TBCDField;
    PopExclusao: TPopupMenu;
    AdicionarDescrioComplementar1: TMenuItem;
    sqlG_EmolumentoSITUACAO: TStringField;
    N1: TMenuItem;
    actDesativarEmolumento: TMenuItem;
    N2: TMenuItem;
    ActAtivarEmolumento: TMenuItem;
    sqlG_Emolumento_ItemCALC_FUNDESP: TCurrencyField;
    sqlG_EmolumentoSERVICO_CAIXA_ID: TBCDField;
    btnFechar: TcxButton;
    lcxEmolumentoPeriodo: TcxLookupComboBox;
    btnAdicionarEmolumentoPeriodo: TcxButton;
    btnDuplicar: TcxButton;
    cxButton1: TcxButton;
    btnRelatorio: TcxButton;
    sqlG_Emolumento_ItemCALC_TAXA2: TCurrencyField;
    sqlG_Emolumento_ItemCODIGO_SELO: TStringField;
    sqlEmolumentosExpandido: TI9Query;
    dtsEmolumentosExpandido: TDataSource;
    sqlEmolumentosExpandidoTotal_Item: TCurrencyField;
    sqlEmolumentosExpandidoVALOR_EMOLUMENTO: TBCDField;
    sqlEmolumentosExpandidoEMOLUMENTO_ITEM_ID: TBCDField;
    sqlEmolumentosExpandidoVALOR_INICIO: TBCDField;
    sqlEmolumentosExpandidoVALOR_FIM: TBCDField;
    sqlEmolumentosExpandidoVALOR_TAXA_JUDICIARIA: TBCDField;
    sqlEmolumentosExpandidoEMOLUMENTO_PERIODO_ID: TBCDField;
    sqlEmolumentosExpandidoCODIGO: TBCDField;
    sqlEmolumentosExpandidoPAGINA_EXTRA: TBCDField;
    sqlEmolumentosExpandidoVALOR_PAGINA_EXTRA: TBCDField;
    sqlEmolumentosExpandidoVALOR_OUTRA_TAXA1: TBCDField;
    sqlEmolumentosExpandidoCALC_FUNDESP: TCurrencyField;
    sqlEmolumentosExpandidoCALC_TAXA2: TCurrencyField;
    sqlEmolumentosExpandidoCODIGO_SELO: TStringField;
    sqlEmolumentosExpandidocalc_Novo: TBooleanField;
    sqlEmolumentosExpandidocalc_Atualizar: TBooleanField;
    sqlEmolumentosExpandidoDESCRICAO: TStringField;
    sqlEmolumentosExpandidoTIPO: TStringField;
    sqlEmolumentosExpandidoSISTEMA_ID: TBCDField;
    sqlEmolumentosExpandidoEMOLUMENTO_ID: TBCDField;
    btnSalvar: TcxButton;
    sqlEmolumentosExpandidoORDEM: TBCDField;
    sqlG_Emolumento_ItemORDEM: TBCDField;
    sqlEmolumentosExpandidoSITUACAO: TStringField;
    sqlEmolumentosExpandidocalc_ordem_selo: TIntegerField;
    dtsC_Caixa_Servico: TDataSource;
    sqlC_Caixa_Servico: TI9Query;
    sqlC_Caixa_ServicoINTERNO_SISTEMA: TStringField;
    sqlC_Caixa_ServicoCAIXA_SERVICO_ID: TBCDField;
    sqlC_Caixa_ServicoDESCRICAO: TStringField;
    sqlC_Caixa_ServicoSITUACAO: TStringField;
    sqlC_Caixa_ServicoTIPO_TRANSACAO: TStringField;
    sqlC_Caixa_ServicoSISTEMA_ID: TBCDField;
    N3: TMenuItem;
    AtivarPerodoPadroparaosSistemas1: TMenuItem;
    sqlG_Emolumento_ItemCODIGO_TABELA: TStringField;
    sqlG_Emolumento_ItemCODIGO_KM: TBCDField;
    sqlG_Emolumento_ItemVALOR_FUNDO_RI: TBCDField;
    sqlG_EmolumentoSELAR: TStringField;
    RemoveFundoTipo1: TMenuItem;
    tbcSistemas: TcxTabControl;
    pgcTipo: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox18: TcxGroupBox;
    Panel4: TPanel;
    Label1: TLabel;
    spnDesvincularSelo: TSpeedButton;
    SpeedButton1: TSpeedButton;
    cxDBTextEdit1: TcxDBTextEdit;
    pgcEmolumentos: TcxPageControl;
    tbcEmolumento: TcxTabControl;
    cxGrid2: TcxGrid;
    cxGridDBTableEmolumento: TcxGridDBTableView;
    cxGridDBTableEmolumentoColumn3: TcxGridDBColumn;
    cxGridDBTableEmolumentoDBColumn1: TcxGridDBColumn;
    cxGridDBTableEmolumentoDBColumn2: TcxGridDBColumn;
    cxGridDBTableEmolumentoSeloGrupo: TcxGridDBColumn;
    cxGridDBTableEmolumentoColumn2: TcxGridDBColumn;
    cxGridDBTableEmolumentoColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableViewTxEmol: TcxGridDBColumn;
    cxGridDBTableViewTxOutraTx: TcxGridDBColumn;
    cxGridDBTableViewTxFundos: TcxGridDBColumn;
    cxGridDBTableEmolTaxa2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableViewKM: TcxGridDBColumn;
    cxGridDBTableViewPagExtraValor: TcxGridDBColumn;
    cxGridDBTableViewPagExtraQtd: TcxGridDBColumn;
    cxGridDBTableCodigoTabela: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    Panel5: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    EdtBuscar: TcxTextEdit;
    btnBuscarMarcacao: TcxButton;
    lblTabela: TLabel;
    sqlG_EmolumentoCOD_NOTA: TBCDField;
    cxGridDBTableEmolumentoColumn4: TcxGridDBColumn;
    btnAtualizarEmolumentoItem: TcxButton;
    sqlG_EmolumentoCALCULAR_VALOR_OUTRA_TAXA1: TStringField;
    cxGridDBTableEmolumentoCALCULAR_VALOR_OUTRA_TAXA1: TcxGridDBColumn;
    cxGridDBID_EMOLUMENTO_TJ: TcxGridDBColumn;
    cxGridDBID_TIPO_EMOLUMENTO_TJ: TcxGridDBColumn;
    sqlG_Emolumento_ItemID_EMOLUMENTO_TJ: TBCDField;
    sqlG_Emolumento_ItemID_TIPO_EMOLUMENTO_TJ: TBCDField;
    procedure LerConfig(vpIdSistema : Integer);
    procedure sqlG_Emolumento_ItemCalcFields(DataSet: TDataSet);
    procedure sqlG_EmolumentoAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlG_EmolumentoAfterPost(DataSet: TDataSet);
    procedure sqlG_EmolumentoAfterInsert(DataSet: TDataSet);
    procedure sqlG_Emolumento_ItemAfterInsert(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure lcxEmolumentoPeriodoPropertiesChange(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnAdicionarEmolumentoPeriodoClick(Sender: TObject);
    procedure spnDesvincularSeloClick(Sender: TObject);
    procedure AdicionarDescrioComplementar1Click(Sender: TObject);
    procedure tbcEmolumentoChange(Sender: TObject);
    procedure actDesativarEmolumentoClick(Sender: TObject);
    procedure ActAtivarEmolumentoClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sqlEmolumentosExpandidoAfterInsert(DataSet: TDataSet);
    procedure sqlEmolumentosExpandidoCalcFields(DataSet: TDataSet);
    procedure pgcTipoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlEmolumentosExpandidoAfterEdit(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure sqlEmolumentosExpandidoAfterPost(DataSet: TDataSet);
    procedure sqlEmolumentosExpandidoBeforeDelete(DataSet: TDataSet);
    procedure sqlEmolumentosExpandidoBeforeInsert(DataSet: TDataSet);
    procedure tbcSistemasChange(Sender: TObject);
    procedure AtivarPerodoPadroparaosSistemas1Click(Sender: TObject);
    procedure RemoveFundoTipo1Click(Sender: TObject);
    procedure btnBuscarMarcacaoClick(Sender: TObject);
    procedure EdtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqlG_EmolumentoBeforePost(DataSet: TDataSet);
    procedure btnAtualizarEmolumentoItemClick(Sender: TObject);
    procedure sqlG_Emolumento_ItemVALOR_EMOLUMENTOChange(Sender: TField);
    procedure dtsG_EmolumentoStateChange(Sender: TObject);
  private
    { Private declarations }

    vpPeriodo_Padrao, vpPeriodo_Selecionado,
    vlEmolumentoId, vgSistema : integer;
    vlCartorioAlagoas: Boolean;

    vpUsarOutraTaxa, vpFundosMostrar, vlCalculaFundos  : Boolean;
    vpOutraTaxaTipo : string;
    vlCalcularValorOutraTaxa1Automatico: Boolean;
    vlTaxaValorOutraTaxa1: Double;

    function SistemaID: Integer;
    function MostrarCalcularValorOutraTaxa1: Boolean;
    function CalcularValorOutraTaxa1Automatico: Boolean;
    function TaxaValorOutraTaxa1: Double;

    procedure CarregarEmolumentoExpandido;
    procedure GetEmolumento(vpIDSistema : Integer; vpTodos : Boolean = False);
    procedure FormInicio(var Message: TMessage);
    message   CM_FormInicio;
    function RetornaFundos(vpEmolumentoID: Integer; vpValorEmolumento: Currency): Currency;
  public
    { Public declarations }
    vpUsarCobrancaFundo : string;
  end;

var
  frmEmolumento: TfrmEmolumento;
  PaginaExtra : String;
  vlAbrindoForm, vlAtualizarSistemas : Boolean;

implementation

uses
  Controles,
  Lookup,
  Cadastro,
  CadDuplicaEmolumentos,
  Rotinas,
  ImportarTabelas,
  RemoveFundoTipo,
  SeloFundo,
  SeloFundoDAO,
  Geral.View.Suporte.AtualizacaoEmolumentoItem,
  System.Generics.Collections;

const
  CL_SISTEMA_ID_RI: Integer = 1;
  CL_SISTEMA_ID_PT: Integer = 13;

{$R *.dfm}

procedure TfrmEmolumento.FormInicio(var Message: TMessage);
begin
  Update;
end;

procedure TfrmEmolumento.LerConfig(vpIdSistema : Integer);
var
  viTaxa2Cobrar : Boolean;
begin
  vpFundosMostrar  := False;
  vlCalculaFundos  := False;
  viTaxa2Cobrar    := True;
  cxGridDBTableViewPagExtraValor.Visible  := False;
  cxGridDBTableViewPagExtraQtd.Visible    := False;
  cxGridDBTableCodigoTabela.Visible       := False;
  cxGridDBTableViewKM.Visible             := False;
  vgSistema := vpIdSistema;

  case vpIdSistema of
    1 : begin // Registro de Imoveis
          viTaxa2Cobrar := False;
          vpPeriodo_Padrao  := dtmControles.BuscarParametroOutroSistema('PERIODO_PADRAO', 'ITENS DO PEDIDO','PEDIDO', '1');
          cxGridDBTableEmolTaxa2.Visible       := viTaxa2Cobrar;
          cxGridDBTableCodigoTabela.Visible    := True;
          cxGridDBTableViewPagExtraQtd.Visible := True;
          vlCalculaFundos   := dtmControles.GetInt('SELECT COUNT(*) FROM G_FUNDO_TIPO') > 0;
        end;
    2 : begin // Tabelionato de Notas
          vpPeriodo_Padrao  := dtmControles.BuscarParametroOutroSistema('PERIODO_PADRAO', 'VALOR', 'PRINCIPAL', '2');
          vpUsarOutraTaxa   := dtmControles.BuscarParametroOutroSistema('USAR_OUTRA_TAXA', 'VALOR', 'PRINCIPAL','2') = 'S';
          vpFundosMostrar   := dtmControles.BuscarParametroOutroSistema('MOSTRAR_FUNDESP_EMOLUMENTO', 'VALOR', 'PRINCIPAL','2') = 'S';
          vlCalculaFundos   := dtmControles.GetInt('SELECT COUNT(*) FROM G_FUNDO_TIPO') > 0;

          // Taxa 2
          cxGridDBColumn7.Caption              := cxGridDBTableEmolTaxa2.Caption;

          cxGridDBTableViewTxEmol.Caption      := dtmControles.BuscarParametroOutroSistema('CAPTION_TAXA_JUDICIARIA', 'VALOR', 'PRINCIPAL','2');
          cxGridDBTableViewTxOutraTx.Caption   := dtmControles.BuscarParametroOutroSistema('CAPTION_OUTRA_TAXA1', 'VALOR', 'PRINCIPAL','2');
          cxGridDBTableViewTxFundos.Caption    := dtmControles.BuscarParametroOutroSistema('CAPTION_VALOR_FUNDESP', 'VALOR', 'PRINCIPAL','2');

          cxGridDBColumn4.Caption := cxGridDBTableViewTxEmol.Caption;
          cxGridDBColumn5.Caption := cxGridDBTableViewTxOutraTx.Caption;
          cxGridDBColumn6.Caption := cxGridDBTableViewTxFundos.Caption;
        end;
    7 : begin // RTD
          cxGridDBTableCodigoTabela.Visible    := True;

          vpPeriodo_Padrao                     := dtmControles.BuscarParametroOutroSistema('PERIODO_PADRAO', 'GERAL', 'PRINCIPAL', '7');
          vpUsarOutraTaxa                      := dtmControles.BuscarParametroOutroSistema('USAR_OUTRA_TAXA', 'VALOR', 'PRINCIPAL', '7') = 'S';
          vpOutraTaxaTipo                      := dtmControles.BuscarParametroOutroSistema('OUTRA_TAXA_TIPO', 'VALOR', 'PRINCIPAL', '7');
          cxGridDBTableViewTxEmol.Caption      := dtmControles.BuscarParametroOutroSistema('CAPTION_TAXA_JUDICIARIA', 'VALOR', 'PRINCIPAL', '7');
          cxGridDBTableViewTxOutraTx.Caption   := dtmControles.BuscarParametroOutroSistema('CAPTION_OUTRA_TAXA1', 'VALOR', 'PRINCIPAL', '7');
          vlCalculaFundos                      := dtmControles.GetInt('SELECT COUNT(*) FROM G_FUNDO_TIPO') > 0;
          cxGridDBTableViewKM.Visible          := True;
          cxGridDBTableViewPagExtraQtd.Visible := True;

          cxGridDBColumn4.Caption := cxGridDBTableViewTxEmol.Caption;
          cxGridDBColumn5.Caption := cxGridDBTableViewTxOutraTx.Caption;

          if CharInSet(vpOutraTaxaTipo[1],['2', '3']) then
          begin
            cxGridDBTableViewTxOutraTx.Caption := cxGridDBTableViewTxOutraTx.Caption + ' % ';
            cxGridDBColumn5.Caption := cxGridDBTableViewTxOutraTx.Caption;
          end;
        end;
    12 : begin // Registro Civil
           vpPeriodo_Padrao  := dtmControles.BuscarParametroOutroSistema('PERIODO_PADRAO', 'GERAL', 'PRINCIPAL', '12');
           vpUsarOutraTaxa   := dtmControles.BuscarParametroOutroSistema('USAR_OUTRA_TAXA', 'VALOR', 'PRINCIPAL','12') = 'S';
           vpFundosMostrar   := dtmControles.BuscarParametroOutroSistema('MOSTRAR_FUNDESP_EMOLUMENTO', 'VALOR', 'PRINCIPAL','12') = 'S';
           vlCalculaFundos   := dtmControles.GetInt('SELECT COUNT(*) FROM G_FUNDO_TIPO') > 0;

           cxGridDBTableViewTxOutraTx.Caption   := dtmControles.BuscarParametroOutroSistema('CAPTION_OUTRA_TAXA1', 'VALOR', 'PRINCIPAL','12');
           cxGridDBTableViewTxFundos.Caption   := dtmControles.BuscarParametroOutroSistema('CAPTION_VALOR_FUNDESP', 'VALOR', 'PRINCIPAL','12');

           cxGridDBColumn5.Caption := cxGridDBTableViewTxOutraTx.Caption;
           cxGridDBColumn6.Caption := cxGridDBTableViewTxFundos.Caption;
         end;
    13 : begin // Protesto
           vpPeriodo_Padrao := dtmControles.BuscarParametroOutroSistema('PERIODO_PADRAO', 'GERAL', 'PRINCIPAL', '13');
           cxGridDBTableViewPagExtraValor.Visible  := True;
           cxGridDBTableViewPagExtraQtd.Visible    := True;
           vlCalculaFundos   := dtmControles.GetInt('SELECT COUNT(*) FROM G_FUNDO_TIPO') > 0;
          end;
  end;

  if vpPeriodo_Selecionado <> 0 then
    vpPeriodo_Padrao := vpPeriodo_Selecionado;

//  lcxEmolumentoPeriodo.EditValue := vpPeriodo_Padrao;

  cxGridDBTableEmolumentoSeloGrupo.Visible  := dtmControles.BuscarParametroOutroSistema('NOVO_MODELO', 'GERAL','SELO','5') = 'N';
  cxGridDBTableViewTxFundos.Visible         := dtmControles.BuscarParametroOutroSistema('VISUALIZAR_GRID_TAXA_FUNDOS', 'VALOR', 'PRINCIPAL','5') = 'S';
  cxGridDBTableEmolTaxa2.Visible            := viTaxa2Cobrar and (dtmControles.BuscarParametroOutroSistema('VISUALIZAR_GRID_TAXA_FUNDOS', 'VALOR', 'PRINCIPAL','5') = 'S');
  cxGridDBTableViewTxEmol.Caption           := dtmControles.BuscarParametroOutroSistema('CAPTION_TAXA_JUDICIARIA', 'VALOR', 'PRINCIPAL','5');

  cxGridDBTableViewTxOutraTx.Visible        := True;
  cxGridDBColumn5.Visible  := cxGridDBTableViewTxOutraTx.Visible;
  cxGridDBColumn6.Visible  := cxGridDBTableViewTxFundos.Visible;

  cxGridDBTableEmolumentoCALCULAR_VALOR_OUTRA_TAXA1.Caption := 'Calcular ' +
    cxGridDBTableViewTxOutraTx.Caption;

  cxGridDBTableEmolumentoCALCULAR_VALOR_OUTRA_TAXA1.Visible := MostrarCalcularValorOutraTaxa1;

  vlCalcularValorOutraTaxa1Automatico := CalcularValorOutraTaxa1Automatico;
  cxGridDBTableViewTxOutraTx.Options.Editing := not vlCalcularValorOutraTaxa1Automatico;
  cxGridDBColumn5.Options.Editing := cxGridDBTableViewTxOutraTx.Options.Editing;

  vlTaxaValorOutraTaxa1 := TaxaValorOutraTaxa1;
end;

function TfrmEmolumento.MostrarCalcularValorOutraTaxa1: Boolean;
{$REGION 'Vari�veis'}
var
  viSistemaID: Integer;
{$ENDREGION}
begin
  viSistemaID := SistemaID;
  Result := viSistemaID = CL_SISTEMA_ID_RI;
end;

procedure TfrmEmolumento.pgcTipoChange(Sender: TObject);
begin
  if pgcTipo.ActivePageIndex = 0 then
  begin
    sqlG_Emolumento.AfterScroll := sqlG_EmolumentoAfterScroll;
    GetEmolumento(vgListaSistemas[tbcSistemas.TabIndex]);
    if btnSalvar.Enabled then
      btnSalvarClick(self);
  end
  else CarregarEmolumentoExpandido;

  btnSalvar.Visible := pgcTipo.ActivePageIndex = 1;
end;

procedure TfrmEmolumento.RemoveFundoTipo1Click(Sender: TObject);
begin
  TfrmRemoveFundoTipo.Configurar(sqlG_EmolumentoEMOLUMENTO_ID.AsInteger);
end;

function TfrmEmolumento.RetornaFundos(
  vpEmolumentoID: Integer;
  vpValorEmolumento: Currency): Currency;
{$REGION 'Vari�veis'}
var
  viSeloFundos: TSeloFundos;
  viEmolumento: TEmolumento;
{$ENDREGION}
begin
  viEmolumento := nil;
  try
    viEmolumento := TEmolumento.Create;
    viEmolumento.EmolumentoID := vpEmolumentoID;
    viSeloFundos := dtmLookup.GetFundos(vpValorEmolumento,viEmolumento);

    try
      Result := viSeloFundos.Valor;
    finally
      viSeloFundos.Free;
    end;
  Finally
    viEmolumento.Free;
  End;
end;

function TfrmEmolumento.SistemaID: Integer;
begin
  Result := vgListaSistemas[tbcSistemas.TabIndex];
end;

procedure TfrmEmolumento.SpeedButton1Click(Sender: TObject);
begin
  if not sqlG_Emolumento.IsEmpty then
    if not sqlG_EmolumentoSERVICO_CAIXA_ID.IsNull then
    begin
      sqlG_Emolumento.edit;
      sqlG_EmolumentoSERVICO_CAIXA_ID.AsVariant := null;
      sqlG_Emolumento.Post;
    end;
end;

procedure TfrmEmolumento.sqlG_Emolumento_ItemCalcFields(DataSet: TDataSet);
var
  viValorOutraTaxa : Currency;
begin
  if vlCalculaFundos then
  begin
    sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency := RetornaFundos(
      sqlG_Emolumento_ItemEMOLUMENTO_ID.AsInteger,
      sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsCurrency)
  end
  else
  begin
    if vgListaSistemas[tbcSistemas.TabIndex] = 1 then
         sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency := sqlG_Emolumento_ItemVALOR_FUNDO_RI.AsCurrency
    else sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency := 0;
  end;

  sqlG_Emolumento_ItemTotal_Item.AsCurrency := sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsCurrency +
                                               sqlG_Emolumento_ItemVALOR_TAXA_JUDICIARIA.AsCurrency +
                                               sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency;

  // Outra Taxa 1
  if (vpOutraTaxaTipo = '') or (vpOutraTaxaTipo = '1') then
     sqlG_Emolumento_ItemTotal_Item.AsCurrency := sqlG_Emolumento_ItemTotal_Item.AsCurrency +
                                                  sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1.AsCurrency
  else
  begin
    if sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1.AsCurrency > 0 then
    begin
      if (vpOutraTaxaTipo = '2') then
           viValorOutraTaxa :=  ((sqlG_Emolumento_ItemTotal_Item.AsCurrency)/100)* sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1.AsCurrency
      else viValorOutraTaxa :=  ((sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsCurrency)/100)* sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1.AsCurrency;
      sqlG_Emolumento_ItemTotal_Item.AsCurrency := sqlG_Emolumento_ItemTotal_Item.AsCurrency + viValorOutraTaxa;
    end;
  end;
end;

procedure TfrmEmolumento.sqlG_Emolumento_ItemVALOR_EMOLUMENTOChange(Sender: TField);
{$REGION 'Vari�veis'}
var
  viValorEmolumento: Currency;
  viValorOutraTaxa1: Currency;
  viField: TField;
  viValores: TList<Currency>;
{$ENDREGION}
begin
  if not vlCalcularValorOutraTaxa1Automatico then
    Exit;

  viValorEmolumento := Sender.AsCurrency;

  viValores := Rotinas.RetornarListCurrency(
    viValorEmolumento);

  try
    viValorOutraTaxa1 := Rotinas.GetPorcentagem(
      dtmControles.MetodoArredondamento,
      viValores,
      vlTaxaValorOutraTaxa1);

    viField := Sender.DataSet.FieldByName(
      'VALOR_OUTRA_TAXA1');

    viField.AsCurrency := viValorOutraTaxa1;
  finally
    viValores.Free;
  end;
end;

function TfrmEmolumento.TaxaValorOutraTaxa1: Double;
{$REGION 'Vari�veis'}
var
  viSistemaID: Integer;
{$ENDREGION}
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    'ISSQN_TAXA',
    'ISSQN',
    'ATO_PRATICADO',
    '5');

  viSistemaID := SistemaID;

  if viSistemaID = CL_SISTEMA_ID_PT then
    Result := dtmControles.BuscarParametroOutroSistema(
      'PORC_ISSQN',
      'VALORES',
      'TITULO',
      viSistemaID.ToString);
end;

procedure TfrmEmolumento.tbcEmolumentoChange(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  sqlG_Emolumento.AfterScroll := nil;
  sqlG_Emolumento.Filtered := False;
  if tbcEmolumento.TabIndex = 0 then
       sqlG_Emolumento.Filter := '(SITUACAO = ''A'' OR SITUACAO IS NULL)'
  else sqlG_Emolumento.Filter := '(SITUACAO = ''I'')';
  sqlG_Emolumento.Filtered := True;
  sqlG_Emolumento.AfterScroll := sqlG_EmolumentoAfterScroll;
  sqlG_EmolumentoAfterScroll(sqlG_Emolumento);

  ActAtivarEmolumento.Enabled    := (tbcEmolumento.TabIndex = 1) and (not sqlG_Emolumento.IsEmpty);
  actDesativarEmolumento.Enabled := (tbcEmolumento.TabIndex = 0) and (not sqlG_Emolumento.IsEmpty);
  Screen.Cursor := crDefault;
end;

procedure TfrmEmolumento.tbcSistemasChange(Sender: TObject);
begin
  if vlAtualizarSistemas then
    exit;

  Application.ProcessMessages;
  sqlG_Emolumento.AfterScroll := nil;
  LerConfig(vgListaSistemas[tbcSistemas.TabIndex]);
  GetEmolumento(vgListaSistemas[tbcSistemas.TabIndex]);
  sqlG_Emolumento.AfterScroll := sqlG_EmolumentoAfterScroll;
  sqlG_EmolumentoAfterScroll(sqlG_Emolumento);

  if pgcTipo.ActivePageIndex = 1 then
    pgcTipoChange(self);

end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterScroll(DataSet: TDataSet);
begin
  with sqlG_Emolumento_Item do
  begin
    if sqlG_EmolumentoEMOLUMENTO_ID.IsNull then
      exit;

    Active := False;
    Params.ParamByName('EMOLUMENTO_ID').AsInteger := sqlG_EmolumentoEMOLUMENTO_ID.AsInteger;
    Params.ParamByName('EMOLUMENTO_PERIODO_ID').AsInteger := lcxEmolumentoPeriodo.EditValue;
    Active := True;
  end;
end;

procedure TfrmEmolumento.sqlG_EmolumentoBeforePost(DataSet: TDataSet);
begin
  sqlG_Emolumento.AfterScroll := nil;
end;

procedure TfrmEmolumento.FormActivate(Sender: TObject);
begin
  lcxEmolumentoPeriodoPropertiesChange(self);
  vlAbrindoForm := False;
  tbcEmolumentoChange(self);
end;

procedure TfrmEmolumento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmControles.CarregarConfig;

  Action := caFree;
  frmEmolumento := nil;
  dtmLookup.sqlG_Emolumento.Refresh;
  PaginaExtra := '';
end;

procedure TfrmEmolumento.FormCreate(Sender: TObject);
begin
  vlCalcularValorOutraTaxa1Automatico := False;
  vlTaxaValorOutraTaxa1 := 0;
  vlAbrindoForm := True;
  btnDuplicar.visible := vgUsuarioID = '123456';

  sqlG_Emolumento.Connection         := dtmControles.DB;
  sqlG_Emolumento_Item.Connection    := dtmControles.DB;
  sqlG_Emolumento_Periodo.Connection := dtmControles.DB;
  sqlEmolumentosExpandido.Connection := dtmControles. DB;
  sqlC_Caixa_Servico.Connection      := dtmControles.DB;

  vpUsarOutraTaxa := dtmControles.BuscarParametroOutroSistema('CALCULAR_VALOR_ISSQN', 'ISSQN', 'ATO_PRATICADO','5') = 'S';

  vlAtualizarSistemas := True;
  dtmControles.CarregarSistemasTab(tbcSistemas, False, True);
  tbcSistemasChange(Self);
  vlAtualizarSistemas := False;

  tbcEmolumento.TabIndex  := 0;
  LerConfig(vgListaSistemas[tbcSistemas.TabIndex]);
  tbcEmolumentoChange(self);
  pgcTipo.ActivePageIndex := 0;
  tbcSistemasChange(self);

  btnAtualizarEmolumentoItem.Enabled := dtmControles.UsuarioAdministrador;

  vlCartorioAlagoas := dtmControles.BuscarParametroOutroSistema('UF', 'CARTORIO', 'PRINCIPAL', '5') = 'AL';

  cxGridDBID_EMOLUMENTO_TJ.Visible      := vlCartorioAlagoas;
  cxGridDBID_TIPO_EMOLUMENTO_TJ.Visible := vlCartorioAlagoas;
end;

procedure TfrmEmolumento.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FormInicio, 0, 0);
end;

procedure TfrmEmolumento.GetEmolumento(vpIDSistema : Integer; vpTodos : Boolean = False);
var
  viSql : String;
begin
  Screen.Cursor := crSQLWait;
  sqlG_Emolumento_Periodo.Open;
  lcxEmolumentoPeriodo.EditValue := vpPeriodo_Padrao;

  sqlC_Caixa_Servico.Close;
  sqlC_Caixa_Servico.ParamByName('SISTEMA_ID').AsCurrency := vpIdSistema;
  sqlC_Caixa_Servico.Open;

  with sqlG_Emolumento do
  begin

    Active := False;
    AfterScroll := nil;
    viSql := ' SELECT * FROM G_EMOLUMENTO ';
    if not vpTodos then
      viSql := viSql + ' WHERE SISTEMA_ID = :SISTEMA_ID ';

    viSql := viSql+ ' ORDER BY DESCRICAO ';

    SQL.Text := viSql;
    if not vpTodos then
      Params[0].AsCurrency := vpIdSistema;

    Active := True;
    First;
    if pgcTipo.ActivePageIndex = 0 then
      AfterScroll := sqlG_EmolumentoAfterScroll;
  end;

  Screen.Cursor := crDefault;
end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterPost(DataSet: TDataSet);
begin
  dtmLookup.sqlG_Emolumento.Refresh;
  sqlG_Emolumento.AfterScroll := sqlG_EmolumentoAfterScroll;
  sqlG_EmolumentoAfterScroll(sqlG_Emolumento);
end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterInsert(DataSet: TDataSet);
begin
  sqlG_EmolumentoEMOLUMENTO_ID.AsCurrency := dtmControles.GerarSequencia('G_EMOLUMENTO');
  sqlG_EmolumentoSISTEMA_ID.AsCurrency    := vgListaSistemas[tbcSistemas.TabIndex];
end;

procedure TfrmEmolumento.sqlG_Emolumento_ItemAfterInsert(
  DataSet: TDataSet);
begin
  sqlG_Emolumento_ItemEMOLUMENTO_ID.AsCurrency          := sqlG_EmolumentoEMOLUMENTO_ID.AsCurrency;
  sqlG_Emolumento_ItemEMOLUMENTO_ITEM_ID.AsCurrency     := dtmControles.GerarSequencia('G_EMOLUMENTO_ITEM');
  sqlG_Emolumento_ItemEMOLUMENTO_PERIODO_ID.AsCurrency  := lcxEmolumentoPeriodo.EditValue;
end;

procedure TfrmEmolumento.AdicionarDescrioComplementar1Click(Sender: TObject);
begin
  if Application.MessageBox('Apagar emolumento e todos os itens vinculados de todos os per�odos?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' DELETE FROM G_EMOLUMENTO_ITEM'+
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM G_EMOLUMENTO'+
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM G_FUNDO_CONFIG' +
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);

  sqlG_Emolumento.Refresh;
  sqlG_EmolumentoAfterScroll(sqlG_Emolumento);
end;

procedure TfrmEmolumento.AtivarPerodoPadroparaosSistemas1Click(Sender: TObject);
var
  viValor : String;
begin
  if Application.MessageBox('Confirmar Per�odo Ativo como Padr�o para todos os Sistemas?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit
  else
    if Application.MessageBox('TEM CERTEZA QUE DESEJA FAZER ESTA ALTERA��O?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
      exit;

  viValor := IntToStr(lcxEmolumentoPeriodo.EditValue);
  // Registro de Imoveis
  dtmLookup.AtualizarParametro('PERIODO_PADRAO','ITENS DO PEDIDO', 'PEDIDO','1', viValor);
  // Tabelionato de Notas
  dtmLookup.AtualizarParametro('PERIODO_PADRAO','VALOR', 'PRINCIPAL', '2', viValor);
  // Registro Civil
  dtmLookup.AtualizarParametro('PERIODO_PADRAO','GERAL', 'PRINCIPAL', '12', viValor);
  // RTD
  dtmLookup.AtualizarParametro('PERIODO_PADRAO','GERAL', 'PRINCIPAL', '7', viValor);
  // Protesto
  dtmLookup.AtualizarParametro('PERIODO_PADRAO','GERAL', 'PRINCIPAL', '13', viValor);

  Application.MessageBox('Per�odo Padr�o alterado com sucesso!!!','TRI7 INFORMA!!!', MB_ICONINFORMATION + MB_OK);


end;

procedure TfrmEmolumento.btnAdicionarEmolumentoPeriodoClick(Sender: TObject);
begin
  CadEmolumentoPeriodo(True);
  dtmLookup.sqlG_Emolumento_Periodo.Refresh;
end;

procedure TfrmEmolumento.btnAtualizarEmolumentoItemClick(Sender: TObject);
begin
  Rotinas.ExibirFormulario(
    TfrmSuporteAtualizacaoEmolumentoItem,
    frmSuporteAtualizacaoEmolumentoItem);
end;

procedure TfrmEmolumento.btnBuscarMarcacaoClick(Sender: TObject);
begin
  pgcTipoChange(SELF);
end;

procedure TfrmEmolumento.btnDuplicarClick(Sender: TObject);
begin
  ExibirFormulario(TfrmCadDuplicaEmolumento, frmCadDuplicaEmolumento, True);
  LerConfig(vgListaSistemas[tbcSistemas.TabIndex]);
end;

procedure TfrmEmolumento.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmEmolumento.btnSalvarClick(Sender: TObject);
var
  viPosicao : Integer;

  procedure AtualizarItemEmolumento;
  begin
    sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsVariant      := sqlEmolumentosExpandidoVALOR_EMOLUMENTO.AsVariant;
    sqlG_Emolumento_ItemVALOR_INICIO.AsVariant          := sqlEmolumentosExpandidoVALOR_INICIO.AsVariant;
    sqlG_Emolumento_ItemVALOR_FIM.AsVariant             := sqlEmolumentosExpandidoVALOR_FIM.AsVariant;
    sqlG_Emolumento_ItemVALOR_TAXA_JUDICIARIA.AsVariant := sqlEmolumentosExpandidoVALOR_TAXA_JUDICIARIA.AsVariant;
    sqlG_Emolumento_ItemVALOR_PAGINA_EXTRA.AsVariant    := sqlEmolumentosExpandidoVALOR_PAGINA_EXTRA.AsVariant;
    sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1.AsVariant     := sqlEmolumentosExpandidoVALOR_OUTRA_TAXA1.AsVariant;
    sqlG_Emolumento_ItemCODIGO.AsVariant                := sqlEmolumentosExpandidoCODIGO.AsVariant;
    sqlG_Emolumento_ItemPAGINA_EXTRA.AsVariant          := sqlEmolumentosExpandidoPAGINA_EXTRA.AsVariant;
    sqlG_Emolumento_ItemCODIGO_SELO.AsVariant           := sqlEmolumentosExpandidoCODIGO_SELO.AsVariant;
    sqlG_Emolumento_ItemORDEM.AsVariant                 := sqlEmolumentosExpandidoORDEM.AsVariant;
    sqlG_Emolumento_Item.Post;
  end;

begin
  if not sqlEmolumentosExpandido.Active then
    exit;

  with sqlEmolumentosExpandido do
  begin
    Screen.Cursor := crHourGlass;
    DisableControls;
    viPosicao:= RecNo;
    Filtered := False;
    Filter   := '(CALC_NOVO = TRUE) OR (CALC_ATUALIZAR = TRUE)';
    Filtered := True;
    First;
    While not Eof do
    begin
      if FieldByName('CALC_NOVO').AsBoolean then
      begin
        sqlG_Emolumento.Locate('EMOLUMENTO_ID', FieldByName('EMOLUMENTO_ID').AsInteger, [loCaseInsensitive]);
        sqlG_Emolumento_Item.Insert;
      end
      else
      begin
        sqlG_Emolumento_Item.Active := False;
        sqlG_Emolumento_Item.ParamByName('EMOLUMENTO_ID').AsCurrency := FieldByName('EMOLUMENTO_ID').AsInteger;
        sqlG_Emolumento_Item.ParamByName('EMOLUMENTO_PERIODO_ID').AsCurrency := lcxEmolumentoPeriodo.EditValue;
        sqlG_Emolumento_Item.Active := True;
        if sqlG_Emolumento_Item.Locate('EMOLUMENTO_ITEM_ID', FieldByName('EMOLUMENTO_ITEM_ID').AsInteger, [loCaseInsensitive]) then
          sqlG_Emolumento_Item.Edit;
      end;

      AtualizarItemEmolumento;
      Next;
    end;
    sqlG_Emolumento.AfterScroll := nil;
    Filtered := False;
    RecNo    := viPosicao;
    EnableControls;
    Screen.Cursor := crDefault;
  end;

  btnSalvar.Enabled := False;
  ShowMessage('Altera��es Salva!!!');
end;

function TfrmEmolumento.CalcularValorOutraTaxa1Automatico: Boolean;
{$REGION 'Vari�veis'}
var
  viSistemaID: Integer;
{$ENDREGION}
begin
  viSistemaID := SistemaID;
  Result := viSistemaID in [CL_SISTEMA_ID_RI, CL_SISTEMA_ID_PT];
end;

procedure TfrmEmolumento.CarregarEmolumentoExpandido;
var
  viSql : String;
begin
  Screen.Cursor := crHourGlass;
  viSql := ' SELECT E.*, EI.* '+
           ' FROM G_EMOLUMENTO E LEFT OUTER JOIN G_EMOLUMENTO_ITEM EI ON '+
           '     E.EMOLUMENTO_ID = EI.EMOLUMENTO_ID '+
           ' WHERE EI.EMOLUMENTO_PERIODO_ID = '+ IntToStr(vpPeriodo_Padrao)+
           '   AND (E.SITUACAO IS NULL OR E.SITUACAO = '+QuotedStr('A')+')'+
           '   AND SISTEMA_ID = '+IntToStr(vgListaSistemas[tbcSistemas.TabIndex]);
  if Trim(EdtBuscar.Text) <> '' then
    viSql := viSql + ' AND CODIGO_SELO = '+QuotedStr(EdtBuscar.Text);

  viSql := viSql + ' ORDER BY EI.CODIGO_SELO ';

  sqlEmolumentosExpandido.Active := False;
  sqlEmolumentosExpandido.SQL.Text := viSql;
  sqlEmolumentosExpandido.Active := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmEmolumento.cxButton1Click(Sender: TObject);
begin
  ExibirFormulario(TfrmImportarTabelas, frmImportarTabelas, True);
end;

procedure TfrmEmolumento.dtsG_EmolumentoStateChange(Sender: TObject);
begin
  cxGrid1.Enabled := not (sqlG_Emolumento.State in dsEditModes);
end;

procedure TfrmEmolumento.EdtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    pgcTipoChange(SELF);
end;

procedure TfrmEmolumento.ActAtivarEmolumentoClick(Sender: TObject);
begin
  if Application.MessageBox('Ativar emolumento. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' UPDATE G_EMOLUMENTO SET SITUACAO = '+QuotedStr('A')+
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);
  sqlG_Emolumento.Refresh;
end;

procedure TfrmEmolumento.actDesativarEmolumentoClick(Sender: TObject);
begin
  if Application.MessageBox('Desativar emolumento. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' UPDATE G_EMOLUMENTO SET SITUACAO = '+QuotedStr('I')+
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);
  sqlG_Emolumento.Refresh;
end;

procedure TfrmEmolumento.lcxEmolumentoPeriodoPropertiesChange(
  Sender: TObject);
begin
  if lcxEmolumentoPeriodo.EditValue = null then
    exit;

  vpPeriodo_Selecionado := lcxEmolumentoPeriodo.EditValue;

  if pgcTipo.ActivePageIndex = 0 then
  begin
    if not vlAbrindoForm then
      tbcSistemasChange(self);
    exit;
  end;

  if sqlG_Emolumento.Active = True then
  begin
    try
      sqlG_Emolumento.Refresh;
    except
      dtmControles.Commit;
      sqlG_Emolumento.Refresh;
    end;
  end;
end;

procedure TfrmEmolumento.spnDesvincularSeloClick(Sender: TObject);
begin
 if not sqlG_Emolumento.IsEmpty then
    if not sqlG_EmolumentoSELO_GRUPO_ID.IsNull then
    begin
      sqlG_Emolumento.edit;
      sqlG_EmolumentoSELO_GRUPO_ID.AsVariant := null;
      sqlG_Emolumento.Post;
    end;

end;

procedure TfrmEmolumento.sqlEmolumentosExpandidoAfterEdit(DataSet: TDataSet);
begin
  sqlEmolumentosExpandidocalc_Atualizar.AsBoolean := True;
end;

procedure TfrmEmolumento.sqlEmolumentosExpandidoAfterInsert(DataSet: TDataSet);
begin
  sqlEmolumentosExpandidoEMOLUMENTO_ID.AsCurrency          := vlEmolumentoId;
  sqlEmolumentosExpandidoEMOLUMENTO_ITEM_ID.AsCurrency     := dtmControles.GerarSequencia('G_EMOLUMENTO_ITEM');
  sqlEmolumentosExpandidoEMOLUMENTO_PERIODO_ID.AsCurrency  := lcxEmolumentoPeriodo.EditValue;
  sqlEmolumentosExpandidocalc_Novo.AsBoolean               := True;
end;

procedure TfrmEmolumento.sqlEmolumentosExpandidoAfterPost(DataSet: TDataSet);
begin
  btnSalvar.Enabled := True;
end;

procedure TfrmEmolumento.sqlEmolumentosExpandidoBeforeDelete(DataSet: TDataSet);
var
  viPosicao : Integer;
begin
  ExecutaSqlAuxiliar(' DELETE FROM G_EMOLUMENTO_ITEM '+
                     ' WHERE EMOLUMENTO_ITEM_ID = '+sqlEmolumentosExpandidoEMOLUMENTO_ITEM_ID.AsString,1);

  viPosicao := sqlEmolumentosExpandido.RecNo;
  lcxEmolumentoPeriodoPropertiesChange(self);
  sqlEmolumentosExpandido.RecNo := viPOsicao;
  abort;
end;

procedure TfrmEmolumento.sqlEmolumentosExpandidoBeforeInsert(DataSet: TDataSet);
begin
  vlEmolumentoId := sqlEmolumentosExpandidoEMOLUMENTO_ITEM_ID.AsInteger;
end;

procedure TfrmEmolumento.sqlEmolumentosExpandidoCalcFields(DataSet: TDataSet);
var
  viValorOutraTaxa : Currency;
begin
  if vlCalculaFundos then
  begin
    sqlEmolumentosExpandidoCALC_FUNDESP.AsCurrency := RetornaFundos(
      sqlEmolumentosExpandidoEMOLUMENTO_ID.AsInteger,
      sqlEmolumentosExpandidoVALOR_EMOLUMENTO.AsCurrency)
  end
  else sqlEmolumentosExpandidoCALC_FUNDESP.AsCurrency := 0;

  sqlEmolumentosExpandidoTotal_Item.AsCurrency := sqlEmolumentosExpandidoVALOR_EMOLUMENTO.AsCurrency +
                                               sqlEmolumentosExpandidoVALOR_TAXA_JUDICIARIA.AsCurrency +
                                               sqlEmolumentosExpandidoCALC_FUNDESP.AsCurrency;

  // Outra Taxa 1
  if (vpOutraTaxaTipo = '') or (vpOutraTaxaTipo = '1') then
     sqlEmolumentosExpandidoTotal_Item.AsCurrency := sqlEmolumentosExpandidoTotal_Item.AsCurrency +
                                                  sqlEmolumentosExpandidoVALOR_OUTRA_TAXA1.AsCurrency
  else
  begin
    if sqlEmolumentosExpandidoVALOR_OUTRA_TAXA1.AsCurrency > 0 then
    begin
      if (vpOutraTaxaTipo = '2') then
           viValorOutraTaxa :=  ((sqlEmolumentosExpandidoTotal_Item.AsCurrency)/100)* sqlEmolumentosExpandidoVALOR_OUTRA_TAXA1.AsCurrency
      else viValorOutraTaxa :=  ((sqlEmolumentosExpandidoVALOR_EMOLUMENTO.AsCurrency)/100)* sqlEmolumentosExpandidoVALOR_OUTRA_TAXA1.AsCurrency;
      sqlEmolumentosExpandidoTotal_Item.AsCurrency := sqlEmolumentosExpandidoTotal_Item.AsCurrency + viValorOutraTaxa;
    end;
  end;

  if sqlEmolumentosExpandidoCODIGO_SELO.AsString <> '' then
    sqlEmolumentosExpandidocalc_ordem_selo.AsString := RetornaNumerico(sqlEmolumentosExpandidoCODIGO_SELO.AsString);
end;

end.
