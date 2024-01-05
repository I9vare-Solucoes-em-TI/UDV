unit Geral.View.Financeiro.CalculoRapido;

interface

uses
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
  StdCtrls,
  cxGroupBox,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxMaskEdit,
  cxDropDownEdit,
  cxImageComboBox,
  cxTextEdit,
  cxCurrencyEdit,
  cxControls,
  cxContainer,
  cxEdit,
  cxLabel,
  cxButtons,
  ExtCtrls,
  DB,
  DBClient,
  cxSpinEdit,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData,
  DbxDevartInterBase,
  SimpleDS,
  dxBarBuiltInMenu,
  cxPC,
  System.Actions,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  Geral.Model.Entity.Spec.DataSet,
  Geral.Model.Entity.AnonymousMethods,
  Geral.Model.Entity.Spec.CalculoEmolumentos,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinscxPCPainter;

type

  TDadosCalculo = Record
    SistemaId, TipoNaturezaId, Qtd, Tabela : Integer;
    ValorDocumento : Currency;
    CalculoAutomatico, SelecaoAutomatica, SelecaoConfirmada : Boolean;
    Descricao : String;
    ValorTotal : Currency;
  End;

  TfrmCalculoRapido = class(TForm)
    ClientItensCalcRapido: TClientDataSet;
    dtsItensCalcRapido: TDataSource;
    ClientItensCalcRapidoTabelaCalculo: TIntegerField;
    ClientItensCalcRapidoTipoCalculo: TIntegerField;
    ClientItensCalcRapidoQtdImovel: TIntegerField;
    ClientItensCalcRapidoVlrDocumento: TCurrencyField;
    ClientItensCalcRapidoVlrEmolumento: TCurrencyField;
    ClientItensCalcRapidoTxJudiciaria: TCurrencyField;
    ClientItensCalcRapidoFERC: TCurrencyField;
    ClientItensCalcRapidoFundesp: TCurrencyField;
    ClientItensCalcRapidoTotalCalc: TCurrencyField;
    ClientItensCalcRapidoVlrOutros: TCurrencyField;
    sqlServicosSequenciais: TI9Query;
    sqlServicosSequenciaisCODIGO_NATUREZA_SEF: TBCDField;
    sqlServicosSequenciaisEMOLUMENTO_ID: TBCDField;
    sqlServicosSequenciaisNATUREZA_TITULO_ID: TBCDField;
    sqlServicosSequenciaisDESCRICAO: TStringField;
    sqlServicosSequenciaisPRAZO: TBCDField;
    sqlServicosSequenciaisSITUACAO: TStringField;
    sqlServicosSequenciaisABRIR_MATRICULA: TStringField;
    sqlServicosSequenciaisSISTEMA_ID: TBCDField;
    sqlServicosSequenciaisCODIGO_DOI: TBCDField;
    sqlServicosSequenciaisTIPO_COBRANCA: TStringField;
    sqlServicosSequenciaisTIPO_TITULO: TStringField;
    sqlServicosSequenciaisPOSSUI_VALOR: TStringField;
    sqlServicosSequenciaisNATUREZA_TITULO2_ID: TBCDField;
    sqlServicosSequenciaisNATUREZA_TITULO_ID_1: TBCDField;
    ClientItensCalcRapidoNaturezaTituloId: TIntegerField;
    sqlTipoNatureza: TI9Query;
    dtsTipoNatureza: TDataSource;
    sqlTipoNaturezaNATUREZA_TITULO_ID: TBCDField;
    sqlTipoNaturezaDESCRICAO: TStringField;
    sqlTipoNaturezaEMOLUMENTO_ID: TBCDField;
    tbcSistemas: TcxTabControl;
    Panel1: TPanel;
    lblNome: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    lblValorTxJud1: TLabel;
    lblValorOutraTaxa1: TLabel;
    Label4: TLabel;
    lblValorFundos: TLabel;
    grpItens: TcxGroupBox;
    cxGrid1: TcxGrid;
    gridItensCalcRapido: TcxGridDBTableView;
    gridItensCalcRapidoTabelaCalculo: TcxGridDBColumn;
    gridItensCalcRapidoQtdImovel: TcxGridDBColumn;
    gridItensCalcRapidoVlrDocumento: TcxGridDBColumn;
    gridItensCalcRapidoColumn2: TcxGridDBColumn;
    gridItensCalcRapidoVlrEmolumento: TcxGridDBColumn;
    gridItensCalcRapidoTxJudiciaria: TcxGridDBColumn;
    gridItensCalcRapidoFERC: TcxGridDBColumn;
    gridItensCalcRapidoFundos: TcxGridDBColumn;
    gridItensCalcRapidoTotalCalc: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxLabel4: TcxLabel;
    lblNaturezaTitulo: TcxLabel;
    lcxTabelaCalculo: TcxLookupComboBox;
    edtQtdImovel: TcxSpinEdit;
    lcxNaturezaTitulo: TcxLookupComboBox;
    edtValorDocumento: TcxCurrencyEdit;
    edtValorOutros: TcxCurrencyEdit;
    btnConfirmar: TcxButton;
    btnSequenciais: TcxButton;
    btnImprimir: TcxButton;
    sqlG_Emolumento: TI9Query;
    sqlG_EmolumentoEMOLUMENTO_ID: TBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    dtsG_Emolumento: TDataSource;
    gridItensCalcRapidoNaturezaTitulo: TcxGridDBColumn;
    btnFechar: TcxButton;
    ClientItensCalcRapidoNaturezaDescricao: TStringField;
    btnLimpar: TcxButton;
    btnExcluirItemCalcRapido: TcxButton;
    edtValorEmolumento: TcxCurrencyEdit;
    edtValortaxaJud: TcxCurrencyEdit;
    edtValorOutraTaxa1: TcxCurrencyEdit;
    edtValorFundos: TcxCurrencyEdit;
    edtValorTotalItem: TcxCurrencyEdit;
    btnAdItem: TcxButton;
    edtAtosAcrescidos: TcxSpinEdit;
    lblAtosAcrescidos: TcxLabel;
    sqlEmolumentoTodos: TI9Query;
    sqlEmolumentoTodosEMOLUMENTO_ID: TBCDField;
    sqlEmolumentoTodosDESCRICAO: TStringField;
    sqlTipoNaturezaTodos: TI9Query;
    sqlTipoNaturezaTodosNATUREZA_TITULO_ID: TBCDField;
    sqlTipoNaturezaTodosDESCRICAO: TStringField;
    dtsEmolumentoTodos: TDataSource;
    dtsNaturezaTituloTodos: TDataSource;
    btnSelecionar: TcxButton;
    ClientItensCalcRapidoTabelaCalculoDescricao: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edtValorDocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdItemClick(Sender: TObject);
    procedure ClientItensCalcRapidoCalcFields(DataSet: TDataSet);
    procedure btnExcluirItemCalcRapidoClick(Sender: TObject);
    procedure btnSequenciaisClick(Sender: TObject);
    procedure ClientItensCalcRapidoAfterScroll(DataSet: TDataSet);
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure tbcSistemasChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure lcxTabelaCalculoPropertiesEditValueChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
    vlAbrindoForm : Boolean;
    vlCalculaFundos: Boolean;
    vlTabPadraoCalcRapido: Integer;
    vlNaturezaPadrao: Integer;
    FFundosCalculados: IDataSetAPI<TFDMemTable>;

    function AbaRISelecionada: Boolean;
    function AbaTNSelecionada: Boolean;

    function EmolumentoID: Integer;
    function EmolumentoPeriodoID: Integer;
    function ValorBaseCalculo: Currency;
    function Quantidade: Integer;

    function EmolumentoIDPaginaExtra(
      const vpDataSet: IDataSetAPI<TDataSet>): Integer;

    function QuantidadePaginaExtra: Integer;
    function CalculoEmolumentos: ICalculoEmolumentos<IDataSetAPI<TDataSet>>;
    function BloquearAtosAcrescidos: Boolean;
    function TituloTaxaJudiciaria: string;
    function UsarOutraTaxa: Boolean;
    function TituloOutraTaxa: string;
    function TituloFundos: string;
    function BuscarTabelaPadrao: Integer;
    function BuscarNaturezaTituloPadrao: Integer;
    function BuscarSistemaId: Integer;

    function EmolumentoPossuiPaginaExtra(
      const vpEmolumentoID: Integer;
      const vpEmolumentoPeriodoID: Integer): Boolean;

    function PaginaExtra: Integer;

    procedure CarregarNaturezaEmolumento(
      vpSistemaId : Integer);
  public
    procedure CalculoAutomaticoRapido;
  end;

var
  frmCalculoRapido: TfrmCalculoRapido;
  vgDadosCalculo : TDadosCalculo;

implementation

uses
  Lookup,
  Controles,
  ReciboOrcamento,
  Geral.Controller.Impl.CalculoEmolumentos,
  Geral.Model.Sistema,
  System.Math,
  Geral.Model.Entity.Impl.DataSet,
  System.Types,
  System.StrUtils;

{$R *.dfm}

function TfrmCalculoRapido.AbaRISelecionada: Boolean;
var
  viSistemaId: Integer;
begin
  viSistemaId := BuscarSistemaId;
  Result := viSistemaId = CI_COD_SISTEMA_REGISTRO_IMOVEIS;
end;

function TfrmCalculoRapido.AbaTNSelecionada: Boolean;
var
  viSistemaId: Integer;
begin
  viSistemaId := BuscarSistemaId;
  Result := viSistemaId = CI_COD_SISTEMA_TABELIONATO_DE_NOTAS;
end;

function TfrmCalculoRapido.BloquearAtosAcrescidos: Boolean;
begin
  Result := False;

  if AbaTNSelecionada then
    Exit;

  Result := string(
    dtmControles.BuscarParametroOutroSistema(
      'BLOQUEAR_ATOS_ACRESCIDOS',
      'GERAL',
      'PEDIDO',
      BuscarSistemaId.ToString))
  .Equals(
    'S');
end;

procedure TfrmCalculoRapido.btnAdItemClick(Sender: TObject);
begin
  if lcxNaturezaTitulo.EditValue = null then
  begin
    Application.MessageBox('Tipo Natureza não selecionado!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if lcxTabelaCalculo.EditValue = null then
  begin
    Application.MessageBox('Tabela de Cálculo não selecionada!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  ClientItensCalcRapido.Append;
  ClientItensCalcRapidoTabelaCalculo.AsInteger         := lcxTabelaCalculo.EditValue;
  ClientItensCalcRapidoTabelaCalculoDescricao.AsString := lcxTabelaCalculo.Text;
  ClientItensCalcRapidoTipoCalculo.AsInteger           := 2;
  ClientItensCalcRapidoQtdImovel.AsInteger             := edtQtdImovel.Value;
  ClientItensCalcRapidoVlrDocumento.AsCurrency         := edtValorDocumento.Value;
  ClientItensCalcRapidoVlrOutros.AsCurrency            := edtValorOutros.Value;
  ClientItensCalcRapidoVlrEmolumento.AsCurrency        := edtValorEmolumento.Value;
  ClientItensCalcRapidoTxJudiciaria.AsCurrency         := edtValortaxaJud.Value;
  ClientItensCalcRapidoFERC.AsCurrency                 := edtValorOutraTaxa1.Value;
  ClientItensCalcRapidoFundesp.AsCurrency              := edtValorFundos.Value;

  ClientItensCalcRapidoNaturezaTituloId.AsInteger := lcxNaturezaTitulo.EditValue;
  ClientItensCalcRapidoNaturezaDescricao.AsString := lcxNaturezaTitulo.Text;

  if AbaRISelecionada then
    ClientItensCalcRapido.CopyFields(FFundosCalculados.DataSet);

  ClientItensCalcRapido.Post;

  lcxTabelaCalculo.Clear;
  edtQtdImovel.Clear;
  edtAtosAcrescidos.Clear;
  edtValorDocumento.Clear;
  edtValorOutros.Clear;
  edtValorEmolumento.Clear;
  edtValortaxaJud.Clear;
  edtValorOutraTaxa1.Clear;
  edtValorFundos.Clear;
  edtValorTotalItem.Clear;
  FFundosCalculados.DataSet.EmptyDataSet;

  btnExcluirItemCalcRapido.Enabled := not ClientItensCalcRapido.IsEmpty;
  btnImprimir.Enabled := True;
  lcxTabelaCalculo.SetFocus;
end;

procedure TfrmCalculoRapido.btnConfirmarClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  viValorEmolumento: Currency;
  viValorTaxaJudiciaria: Currency;
  viValorFundos: Currency;
  viValorISSQN: Currency;
  viValorTotal: Currency;
  vlPeriodo_Padrao : Integer;
{$ENDREGION}
begin
  if AbaRISelecionada then
  begin
    viValorEmolumento := ZeroValue;
    viValorTaxaJudiciaria := ZeroValue;
    viValorFundos := ZeroValue;
    viValorISSQN := ZeroValue;
    viValorTotal := ZeroValue;
    FFundosCalculados.DataSet.EmptyDataSet;

    CalculoEmolumentos
    .Calcular
    .ForEach(
      procedure(
        const vpCalculoEmolumentos: TDataSet)
      begin
        viValorEmolumento := viValorEmolumento + vpCalculoEmolumentos.FieldByName(
          'VALOR_EMOLUMENTO').AsCurrency;

        viValorTaxaJudiciaria :=  viValorTaxaJudiciaria +
          vpCalculoEmolumentos.FieldByName(
            'VALOR_TAXA_JUDICIARIA').AsCurrency;

        viValorFundos := viValorFundos + vpCalculoEmolumentos.FieldByName(
          'VALOR_FUNDOS').AsCurrency;

        viValorISSQN := viValorISSQN + vpCalculoEmolumentos.FieldByName(
          'VALOR_ISSQN').AsCurrency;

        viValorTotal := viValorTotal + vpCalculoEmolumentos.FieldByName(
          'VALOR_TOTAL').AsCurrency;

        FFundosCalculados.Edit
        .ExecuteAction(
          procedure(
            const vpFundosCalculados: TFDMemTable)
          {$REGION 'Variáveis'}
          var
            viField: TField;
          {$ENDREGION}
          begin
            for viField in vpFundosCalculados.Fields do
              viField.AsCurrency := viField.AsCurrency +
                vpCalculoEmolumentos.FieldByName(
                  viField.FieldName).AsCurrency;
          end)
        .Post;
      end);

    edtValorEmolumento.EditValue := viValorEmolumento;
    edtValortaxaJud.EditValue := viValorTaxaJudiciaria;
    edtValorFundos.EditValue := viValorFundos;
    edtValorOutraTaxa1.EditValue := viValorISSQN;
    edtValorTotalItem.EditValue := viValorTotal;
    if not vlAbrindoForm then
      btnAdItem.SetFocus;
    Exit;
  end;

  vgValoresCobranca.TipoCobranca    := 2;
  vgValoresCobranca.ItemComplementar:= null;
  vgValoresCobranca.ItemManual      := 'N';
  vgValoresCobranca.ItemPadrao      := 'N';
  vgValoresCobranca.Desconto        := 0;

  vlPeriodo_Padrao := EmolumentoPeriodoID;
  vgValoresCobranca.CobrarFundos   := vlCalculaFundos;
  vgValoresCobranca.CobrarOutraTaxa := UsarOutraTaxa;

  vgValoresCobranca.vlValorDocumentoUnico := False;
  if edtQtdImovel.EditValue > 1 then
  begin
    vgValoresCobranca.QtdIMovel             := edtQtdImovel.EditValue;
    vgValoresCobranca.vlValorDocumentoUnico := True;
  end
  else vgValoresCobranca.QtdIMovel := 1;

  Geral.Controller.Impl.CalculoEmolumentos
  .CalculoEmolumentosEscritura(edtValorDocumento.Value,
    vlPeriodo_Padrao,lcxTabelaCalculo.EditValue,
    vgValoresCobranca.QtdIMovel,False,'N',0,0,0);

  edtValortaxaJud.EditValue    := vgValoresCobranca.TaxaJud;
  edtValorOutraTaxa1.EditValue := vgValoresCobranca.OutraTaxa;
  edtValorFundos.EditValue     := vgValoresCobranca.Fundos + vgValoresCobranca.Taxa2;
  edtValorEmolumento.EditValue := vgValoresCobranca.Emolumento;
  edtValorTotalItem.EditValue  := vgValoresCobranca.ValorTotal + edtValorOutros.Value;

  if not vlAbrindoForm then
    btnAdItem.SetFocus;
end;

procedure TfrmCalculoRapido.btnExcluirItemCalcRapidoClick(Sender: TObject);
begin
  ClientItensCalcRapido.Delete;
  btnExcluirItemCalcRapido.Enabled := not ClientItensCalcRapido.IsEmpty;
end;

procedure TfrmCalculoRapido.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalculoRapido.btnImprimirClick(Sender: TObject);
begin
  if frmReciboOrcamento = nil then
    Application.CreateForm(TfrmReciboOrcamento, frmReciboOrcamento);

  frmReciboOrcamento.frxdtsCalculoRapido.FieldAliases.Clear;
  frmReciboOrcamento.frxdtsCalculoRapido.DataSource := dtsItensCalcRapido;
  frmReciboOrcamento.ShowModal;
end;

procedure TfrmCalculoRapido.btnLimparClick(Sender: TObject);
begin
  ClientItensCalcRapido.EmptyDataSet;
end;

procedure TfrmCalculoRapido.btnSelecionarClick(Sender: TObject);
begin
  vgDadosCalculo.Descricao  := '';
  vgDadosCalculo.ValorTotal := 0;
  ClientItensCalcRapido.First;
  while not ClientItensCalcRapido.Eof do
  begin
    if vgDadosCalculo.Descricao = '' then
         vgDadosCalculo.Descricao := ClientItensCalcRapidoNaturezaDescricao.AsString
    else vgDadosCalculo.Descricao := vgDadosCalculo.Descricao + ', '+ ClientItensCalcRapidoNaturezaDescricao.AsString;

    vgDadosCalculo.ValorTotal := vgDadosCalculo.ValorTotal + ClientItensCalcRapidoTotalCalc.AsCurrency;
    ClientItensCalcRapido.Next;
  end;
  vgDadosCalculo.SelecaoConfirmada := True;
  close;
end;

procedure TfrmCalculoRapido.btnSequenciaisClick(Sender: TObject);
var
  vlValorDocumento : Currency;
begin
  if Application.MessageBox('Confirma carregamento dos sequenciais deste serviço?', 'Pergunta',
    mb_IconQuestion + mb_YesNo) = idNO then
    exit;

  vlValorDocumento := ClientItensCalcRapidoVlrDocumento.AsCurrency;
  ClientItensCalcRapido.DisableControls;
  sqlServicosSequenciais.DisableControls;
  ClientItensCalcRapido.AfterScroll := nil;

  sqlServicosSequenciais.First;
  dtmControles.StartTransaction;
  try
    While not sqlServicosSequenciais.Eof do
    begin
      if not ClientItensCalcRapido.Locate('NaturezaTituloId', sqlServicosSequenciaisNATUREZA_TITULO_ID.AsInteger, [loCaseInsensitive]) then
      begin
        tbcSistemas.TabIndex := sqlServicosSequenciaisSISTEMA_ID.AsInteger-1;
        tbcSistemasChange(self);

        lcxNaturezaTitulo.EditValue := sqlServicosSequenciaisNATUREZA_TITULO_ID.AsInteger;
        if sqlServicosSequenciaisPOSSUI_VALOR.AsString = 'S' then
          edtValorDocumento.EditValue := vlValorDocumento;
        btnConfirmarClick(self);
        btnAdItemClick(self);
      end;
      sqlServicosSequenciais.Next;
    end;

    dtmControles.Commit;
  except
    on E: exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar('Error - ' + E.Message), 'Aviso',
        mb_IconExclamation);
    end;
  end;
  ClientItensCalcRapido.EnableControls;
  sqlServicosSequenciais.EnableControls;
  ClientItensCalcRapido.AfterScroll := ClientItensCalcRapidoAfterScroll;
end;

procedure TfrmCalculoRapido.CalculoAutomaticoRapido;
begin
  if vgDadosCalculo.CalculoAutomatico then
  begin
    with frmCalculoRapido do
    begin
      tbcSistemas.TabIndex        := vgDadosCalculo.SistemaId;
      lcxNaturezaTitulo.EditValue := vgDadosCalculo.TipoNaturezaId;
      lcxTabelaCalculo.EditValue  := vgDadosCalculo.Tabela;
      edtQtdImovel.EditValue      := vgDadosCalculo.Qtd;
      edtValorDocumento.EditValue := vgDadosCalculo.ValorDocumento;
      btnConfirmarClick(self);
    end;
  end;
end;

function TfrmCalculoRapido.CalculoEmolumentos:
  ICalculoEmolumentos<IDataSetAPI<TDataSet>>;
begin
  Result := TCalculoEmolumentos.New(
    EmolumentoID,
    EmolumentoPeriodoID,
    ValorBaseCalculo,
    Quantidade,
    EmolumentoIDPaginaExtra,
    QuantidadePaginaExtra,
    PaginaExtra,
    0,
    Controles.vgUF,
    BuscarSistemaId);
end;

procedure TfrmCalculoRapido.CarregarNaturezaEmolumento(vpSistemaId: Integer);
var
  viSQL: String;
begin
  if vpSistemaId = CI_COD_SISTEMA_RTD then
  begin
    viSQL :=
      ' SELECT D_TD.TIPO_DOCUMENTO_ID NATUREZA_TITULO_ID '+
      '      , D_TD.DESCRICAO '+
      '      , D_TD.EMOLUMENTO_ID '+
      '   FROM D_TIPO_DOCUMENTO D_TD '+
      '  WHERE D_TD.SITUACAO = ''A'' '+
      '  ORDER BY DESCRICAO ';
  end
  else
  begin
    viSQL :=
      ' SELECT NATUREZA_TITULO_ID '+
      '      , DESCRICAO '+
      '      , EMOLUMENTO_ID '+
      '   FROM G_NATUREZA_TITULO '+
      '  WHERE SISTEMA_ID = ' + IntToStr(vpSistemaId) +
      '    AND SITUACAO = ''A'' '+
      '  ORDER BY DESCRICAO ';
  end;

  sqlTipoNatureza.SQL.Text := viSQL;
  sqlTipoNatureza.Active := False;
  sqlTipoNatureza.Active := True;

  sqlG_Emolumento.Active := False;
  sqlG_Emolumento.ParamByName('SISTEMA_ID').AsInteger := vpSistemaId;
  sqlG_Emolumento.Active := True;
end;

procedure TfrmCalculoRapido.ClientItensCalcRapidoAfterScroll(DataSet: TDataSet);
begin
  sqlServicosSequenciais.Active := False;
  sqlServicosSequenciais.ParamByName('NATUREZA_TITULO_ID').AsInteger := ClientItensCalcRapidoNaturezaTituloId.AsInteger;
  sqlServicosSequenciais.Active := True;

  btnSequenciais.Enabled := (not sqlServicosSequenciais.IsEmpty) and (not ClientItensCalcRapido.IsEmpty);
end;

procedure TfrmCalculoRapido.ClientItensCalcRapidoCalcFields(DataSet: TDataSet);
begin
  if ClientItensCalcRapido.State = dsInternalCalc then
  begin
    ClientItensCalcRapidoTotalCalc.AsCurrency :=
      ClientItensCalcRapidoVlrEmolumento.AsCurrency +
      ClientItensCalcRapidoVlrOutros.AsCurrency +
      ClientItensCalcRapidoTxJudiciaria.AsCurrency ;

    if gridItensCalcRapidoFERC.Visible then
      ClientItensCalcRapidoTotalCalc.AsCurrency :=
        ClientItensCalcRapidoTotalCalc.AsCurrency +
        ClientItensCalcRapidoFERC.AsCurrency;

    if gridItensCalcRapidoFundos.Visible then
      ClientItensCalcRapidoTotalCalc.AsCurrency :=
        ClientItensCalcRapidoTotalCalc.AsCurrency +
        ClientItensCalcRapidoFundesp.AsCurrency;
  end;
end;

procedure TfrmCalculoRapido.cxLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  lcxTabelaCalculo.EditValue := sqlTipoNaturezaEMOLUMENTO_ID.AsInteger;
end;

procedure TfrmCalculoRapido.edtValorDocumentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    edtValorDocumento.PostEditValue;
    btnConfirmarClick(Self);
  end;
end;

function TfrmCalculoRapido.EmolumentoID: Integer;
begin
  if VarIsNull(
    lcxTabelaCalculo.EditValue) then
    Exit(
      ZeroValue);

  Result := lcxTabelaCalculo.EditValue;
end;

function TfrmCalculoRapido.EmolumentoIDPaginaExtra(
  const vpDataSet: IDataSetAPI<TDataSet>): Integer;
begin
  Result := StrToIntDef(
    vpDataSet.DataSet.FieldByName(
      'CODIGO_TABELA').AsString,
    ZeroValue);
end;

function TfrmCalculoRapido.EmolumentoPeriodoID: Integer;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    'PERIODO_PADRAO',
    IfThen(
      AbaRISelecionada,
      'ITENS DO PEDIDO',
      IfThen(
        AbaTNSelecionada,
        'VALOR',
        'GERAL')),
    IfThen(
      AbaRISelecionada,
      'PEDIDO',
      'PRINCIPAL'),
    BuscarSistemaId.ToString);
end;

function TfrmCalculoRapido.EmolumentoPossuiPaginaExtra(
  const vpEmolumentoID: Integer;
  const vpEmolumentoPeriodoID: Integer): Boolean;
begin
  Result := CompareValue(
    dtmControles.DB.ExecSQLScalar(
      {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'COUNT(*) ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_EMOLUMENTO_ITEM ' +
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'EMOLUMENTO_ID = :P_EMOLUMENTO_ID AND ' +
      'EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND ' +
      'CODIGO_TABELA <> :P_CODIGO_TABELA'
      {$ENDREGION}

      {$ENDREGION},
      [vpEmolumentoID,
      vpEmolumentoPeriodoID,
      string.Empty]),
    ZeroValue) = GreaterThanValue;
end;

procedure TfrmCalculoRapido.FormActivate(Sender: TObject);
begin
  vlAbrindoForm := False;
  vgDadosCalculo.SelecaoConfirmada := False;
  btnSelecionar.Visible := vgDadosCalculo.SelecaoAutomatica;
  lcxNaturezaTitulo.SetFocus;
end;

procedure TfrmCalculoRapido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCalculoRapido := nil;
end;

procedure TfrmCalculoRapido.FormCreate(Sender: TObject);
{$REGION 'Variáveis'}
var
  viFundosCalculados: TFDMemTable;
{$ENDREGION}
begin
  vlAbrindoForm := True;

  sqlServicosSequenciais.Connection := dtmControles.DB;
  sqlTipoNatureza.Connection := dtmControles.DB;
  sqlG_Emolumento.Connection := dtmControles.DB;
  sqlEmolumentoTodos.Connection := dtmControles.DB;
  sqlTipoNaturezaTodos.Connection := dtmControles.DB;

  vlCalculaFundos := dtmControles.GetInt(
    'SELECT COUNT(*) FROM G_FUNDO_TIPO') > 0;

  edtValorFundos.Visible := vlCalculaFundos;
  lblValorFundos.Visible := edtValorFundos.Visible;
  gridItensCalcRapidoFundos.Visible := edtValorFundos.Visible;

  ClientItensCalcRapido.FieldDefs.Clear;

  TCamposFundosFactory.New(
    ClientItensCalcRapido)
  .GetInstance;

  ClientItensCalcRapido.CreateDataSet;

  viFundosCalculados := TFDMemTable.Create(
    nil);

  TCamposFundosFactory.New(
    viFundosCalculados)
  .GetInstance;

  FFundosCalculados := TDataSetAPI<TFDMemTable>.New(
    viFundosCalculados)
  .AutoClose
  .AutoDestroy
  .Open;

  sqlEmolumentoTodos.Open;
  sqlTipoNaturezaTodos.Open;

  dtmControles.CarregarSistemasTab(tbcSistemas, False, True);
  tbcSistemasChange(self);
  lcxTabelaCalculo.EditValue := vlTabPadraoCalcRapido;
  ClientItensCalcRapido.EmptyDataSet;
end;

procedure TfrmCalculoRapido.FormDestroy(Sender: TObject);
begin
  sqlEmolumentoTodos.Close;
  sqlTipoNaturezaTodos.Close;
end;

procedure TfrmCalculoRapido.lcxTabelaCalculoPropertiesEditValueChanged(
  Sender: TObject);
{$REGION 'Variáveis'}
var
  viEmolumentoID: Integer;
{$ENDREGION}
begin
  edtQtdImovel.EditValue := 1;

  viEmolumentoID := EmolumentoID;
  if CompareValue(
    viEmolumentoID,
    ZeroValue) = EqualsValue then
    Exit;

  lblAtosAcrescidos.Visible := EmolumentoPossuiPaginaExtra(
    viEmolumentoID,
    EmolumentoPeriodoID);

  edtAtosAcrescidos.Visible := lblAtosAcrescidos.Visible;
end;

function TfrmCalculoRapido.BuscarNaturezaTituloPadrao: Integer;
begin
  Result := 0;

  if AbaTNSelecionada then
  begin
    Result := dtmControles.BuscarParametroOutroSistema(
      'NATUREZA_TITULO_PADRAO_TABELIONATO',
      'CALCULO_RAPIDO',
      'PRINCIPAL',
      IntToStr(CI_COD_SISTEMA_TABELIONATO_DE_NOTAS));
  end;
end;

function TfrmCalculoRapido.PaginaExtra: Integer;
begin
  Result := 0;
end;

function TfrmCalculoRapido.Quantidade: Integer;
begin
  if VarIsNull(
    edtQtdImovel.EditValue) then
    Exit(
      ZeroValue);

  Result := edtQtdImovel.EditValue;
end;

function TfrmCalculoRapido.QuantidadePaginaExtra: Integer;
begin
  if VarIsNull(
    edtAtosAcrescidos.EditValue) then
    Exit(
      ZeroValue);

  Result := edtAtosAcrescidos.EditValue;
end;

function TfrmCalculoRapido.BuscarSistemaId: Integer;
begin
  Result := vgListaSistemas[tbcSistemas.TabIndex];
end;

function TfrmCalculoRapido.BuscarTabelaPadrao: Integer;
begin
  Result := 0;

  if AbaTNSelecionada then
  begin
    Result := dtmControles.BuscarParametroOutroSistema(
      'TABELA_PADRAO_TABELIONATO',
      'CALCULO_RAPIDO',
      'PRINCIPAL',
      IntToStr(CI_COD_SISTEMA_TABELIONATO_DE_NOTAS));
  end;
end;

procedure TfrmCalculoRapido.tbcSistemasChange(Sender: TObject);
begin
  if CompareValue(
    tbcSistemas.TabIndex,
    -1) = EqualsValue then
    Exit;

  vlTabPadraoCalcRapido := BuscarTabelaPadrao;
  vlNaturezaPadrao := BuscarNaturezaTituloPadrao;

  CarregarNaturezaEmolumento(
    vgListaSistemas[tbcSistemas.TabIndex]);

  edtAtosAcrescidos.Enabled := not BloquearAtosAcrescidos;

  lblValorTxJud1.Caption := TituloTaxaJudiciaria;
  gridItensCalcRapidoTxJudiciaria.Caption := lblValorTxJud1.Caption;

  lblValorOutraTaxa1.Visible := UsarOutraTaxa;
  edtValorOutraTaxa1.Visible := lblValorOutraTaxa1.Visible;
  gridItensCalcRapidoFERC.Visible := lblValorOutraTaxa1.Visible;

  lblValorOutraTaxa1.Caption := TituloOutraTaxa;
  gridItensCalcRapidoFERC.Caption := lblValorOutraTaxa1.Caption;

  lblValorFundos.Caption := TituloFundos;
  gridItensCalcRapidoFundos.Caption := lblValorFundos.Caption;

  lcxNaturezaTitulo.EditValue := vlNaturezaPadrao;

  if not vlAbrindoForm then
  begin
    if (lcxNaturezaTitulo.Enabled)
    and (lcxNaturezaTitulo.CanFocus) then
      lcxNaturezaTitulo.SetFocus;
  end;
end;

function TfrmCalculoRapido.TituloFundos: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    string.Format(
      '%s_FUNDESP',
      [IfThen(
        AbaRISelecionada,
        'TITULO',
        'CAPTION_VALOR')]),
    IfThen(
      AbaRISelecionada,
      'ITENS DO PEDIDO',
      'VALOR'),
    IfThen(
      AbaRISelecionada,
      'PEDIDO',
      'PRINCIPAL'),
    BuscarSistemaId.ToString);
end;

function TfrmCalculoRapido.TituloOutraTaxa: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    IfThen(
      AbaRISelecionada,
      'TITULO_ISSQN',
      'CAPTION_OUTRA_TAXA1'),
    IfThen(
      AbaRISelecionada,
      'ITENS DO PEDIDO',
      'VALOR'),
    IfThen(
      AbaRISelecionada,
      'PEDIDO',
      'PRINCIPAL'),
    BuscarSistemaId.ToString);
end;

function TfrmCalculoRapido.TituloTaxaJudiciaria: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    string.Format(
      '%s_TAXA_JUDICIARIA',
      [IfThen(
        AbaRISelecionada,
        'TITULO',
        'CAPTION')]),
    IfThen(
      AbaRISelecionada,
      'ITENS DO PEDIDO',
      'VALOR'),
    IfThen(
      AbaRISelecionada,
      'PEDIDO',
      'PRINCIPAL'),
    BuscarSistemaId.ToString);
end;

function TfrmCalculoRapido.UsarOutraTaxa: Boolean;
begin
  Result := string(
    dtmControles.BuscarParametroOutroSistema(
      string.Format(
        'USAR_%s',
        [IfThen(
          AbaRISelecionada,
          'ISSQN',
          'OUTRA_TAXA')]),
      IfThen(
        AbaRISelecionada,
        'ITENS DO PEDIDO',
        'VALOR'),
      IfThen(
        AbaRISelecionada,
        'PEDIDO',
        'PRINCIPAL'),
      BuscarSistemaId.ToString))
  .Equals(
    'S');
end;

function TfrmCalculoRapido.ValorBaseCalculo: Currency;
begin
  if VarIsNull(
    edtValorDocumento.EditValue) then
    Exit(
      ZeroValue);

  Result := edtValorDocumento.EditValue;
end;

end.
