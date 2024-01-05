unit Emolumento;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox,
  Buttons, WPTbar, WPRuler, cxDBEdit,
  cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxCalendar, cxTextEdit, StdCtrls, cxButtons, cxContainer,
  cxMaskEdit, cxPC, ExtCtrls, cxRadioGroup, cxSplitter, DBClient, SimpleDS,
  dxSkinsCore, dxSkinsDefaultPainters, Menus, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, FMTBcd, SqlExpr,
  Provider, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, dxSkinDevExpressDarkStyle, 
  dxBarBuiltInMenu;
const
  CM_FormInicio = WM_USER + 1;

type
  TfrmEmolumento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    cxGroupBox18: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    Label14: TLabel;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableViewTxEmol: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
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
    Panel4: TPanel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    sqlG_Emolumento_ItemPAGINA_EXTRA: TBCDField;
    sqlG_Emolumento_ItemVALOR_PAGINA_EXTRA: TBCDField;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    sqlG_Emolumento_ItemVALOR_OUTRA_TAXA1: TBCDField;
    cxGridDBTableViewTxOutraTx: TcxGridDBColumn;
    sqlEmolMemoria: TClientDataSet;
    sqlG_EmolumentoSELO_GRUPO_ID: TBCDField;
    spnDesvincularSelo: TSpeedButton;
    PopExclusao: TPopupMenu;
    AdicionarDescrioComplementar1: TMenuItem;
    sqlG_EmolumentoSITUACAO: TStringField;
    pgcEmolumentos: TcxPageControl;
    tbcEmolumento: TcxTabControl;
    cxGrid2: TcxGrid;
    cxGridDBTableEmolumento: TcxGridDBTableView;
    cxGridDBTableEmolumentoDBColumn1: TcxGridDBColumn;
    cxGridDBTableEmolumentoDBColumn2: TcxGridDBColumn;
    cxGridDBTableEmolumentoColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    N1: TMenuItem;
    actDesativarEmolumento: TMenuItem;
    N2: TMenuItem;
    ActAtivarEmolumento: TMenuItem;
    sqlG_Emolumento_ItemCALC_FUNDESP: TCurrencyField;
    cxGridDBTableViewTxFundesp: TcxGridDBColumn;
    sqlG_EmolumentoSERVICO_CAIXA_ID: TBCDField;
    cxGridDBTableEmolumentoColumn2: TcxGridDBColumn;
    SpeedButton1: TSpeedButton;
    btnFechar: TcxButton;
    lcxEmolumentoPeriodo: TcxLookupComboBox;
    btnAdicionarEmolumentoPeriodo: TcxButton;
    btnDuplicar: TcxButton;
    cxButton1: TcxButton;
    btnRelatorio: TcxButton;
    sqlG_Emolumento_ItemCALC_TAXA2: TCurrencyField;
    cxGridDBTableEmolTaxa2: TcxGridDBColumn;
    sqlG_Emolumento_ItemCODIGO_SELO: TStringField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    procedure LerConfig;
    procedure sqlG_Emolumento_ItemCalcFields(DataSet: TDataSet);
    procedure sqlG_EmolumentoAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlG_Emolumento_ItemAfterPost(DataSet: TDataSet);
    procedure sqlG_EmolumentoAfterPost(DataSet: TDataSet);
    procedure sqlG_EmolumentoAfterInsert(DataSet: TDataSet);
    procedure sqlG_Emolumento_ItemAfterInsert(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure lcxEmolumentoPeriodoPropertiesChange(Sender: TObject);
    procedure sqlG_Emolumento_ItemAfterDelete(DataSet: TDataSet);
    procedure sqlG_EmolumentoAfterDelete(DataSet: TDataSet);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnAdicionarEmolumentoPeriodoClick(Sender: TObject);
    procedure spnDesvincularSeloClick(Sender: TObject);
    procedure AdicionarDescrioComplementar1Click(Sender: TObject);
    procedure tbcEmolumentoChange(Sender: TObject);
    procedure actDesativarEmolumentoClick(Sender: TObject);
    procedure ActAtivarEmolumentoClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    vpPeriodo_Padrao : integer;
    vpUsarOutraTaxa, vpFundespMostrar, vpFundespCobrar, vpTaxa2Cobrar  : Boolean;
    vpOutraTaxaTipo : string;
    vpFundespValor, vpTaxa2Percentual : Currency;

    procedure FormInicio(var Message: TMessage);
    message   CM_FormInicio;
  public
    { Public declarations }
  end;

var
  frmEmolumento: TfrmEmolumento;
  PaginaExtra : String;

implementation
uses Controles, Lookup, Cadastro, CadDuplicaEmolumentos, Rotinas, 
  ImportarTabelas;
{$R *.dfm}

procedure TfrmEmolumento.FormInicio(var Message: TMessage);
begin
  Update;
  Screen.Cursor := crSQLWait;
  sqlG_Emolumento_Periodo.Open;
  lcxEmolumentoPeriodo.EditValue := vpPeriodo_Padrao;
  with sqlG_Emolumento do
  begin
    Active := False;
    SQL.Text := ' SELECT * FROM G_EMOLUMENTO '+
                           ' WHERE SISTEMA_ID = :SISTEMA_ID '+
                           ' ORDER BY DESCRICAO ';
    Params[0].AsCurrency := vgId;
    Active := True;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmEmolumento.LerConfig;
begin
  vpUsarOutraTaxa  := False;
  vpFundespMostrar := False;
  vpFundespCobrar  := False;
  vpTaxa2Cobrar    := False;
  case vgId of
    1 : vpPeriodo_Padrao := dtmControles.BuscarConfig('PEDIDO','ITENS DO PEDIDO','PERIODO_PADRAO','I');
    2 : begin
          vpPeriodo_Padrao  := dtmControles.BuscarConfig('PRINCIPAL','VALOR','PERIODO_PADRAO','I');
          vpUsarOutraTaxa   := dtmControles.BuscarConfig('PRINCIPAL','VALOR','USAR_OUTRA_TAXA','S') = 'S';
          vpFundespMostrar  := dtmControles.BuscarConfig('PRINCIPAL','VALOR','MOSTRAR_FUNDESP_EMOLUMENTO','S') = 'S';
          vpFundespCobrar   := dtmControles.BuscarConfig('PRINCIPAL','VALOR','COBRAR_FUNDESP','S') = 'S';
          vpFundespValor    := dtmControles.BuscarConfig('PRINCIPAL','VALOR','PERCENTUAL_FUNDESP','D');

          // Taxa 2
          vpTaxa2Cobrar     := dtmControles.BuscarConfig('PRINCIPAL','VALOR','TAXA_2_COBRAR','S') = 'S';
          vpTaxa2Percentual := dtmControles.BuscarConfig('PRINCIPAL','VALOR','TAXA_2_PERCENTUAL','D');
          cxGridDBTableEmolTaxa2.Caption       := dtmControles.BuscarConfig('PRINCIPAL','VALOR','TAXA_2_CAPTION','S');
          cxGridDBTableEmolTaxa2.Visible       := vpTaxa2Cobrar;

          cxGridDBTableViewTxEmol.Caption      := dtmControles.BuscarConfig('PRINCIPAL','VALOR','CAPTION_TAXA_JUDICIARIA','S');
          cxGridDBTableViewTxOutraTx.Caption   := dtmControles.BuscarConfig('PRINCIPAL','VALOR','CAPTION_OUTRA_TAXA1','S');
          cxGridDBTableViewTxFundesp.Caption := dtmControles.BuscarConfig('PRINCIPAL','VALOR','CAPTION_VALOR_FUNDESP','S');
        end;
    7 : begin
          vpPeriodo_Padrao                   := dtmControles.BuscarConfig('PRINCIPAL','GERAL','PERIODO_PADRAO','I');
          vpUsarOutraTaxa                    := dtmControles.BuscarConfig('PRINCIPAL','VALOR','USAR_OUTRA_TAXA','S') = 'S';
          vpOutraTaxaTipo                    := dtmControles.BuscarConfig('PRINCIPAL','VALOR','OUTRA_TAXA_TIPO','S');
          cxGridDBTableViewTxEmol.Caption    := dtmControles.BuscarConfig('PRINCIPAL','VALOR','CAPTION_TAXA_JUDICIARIA','S');
          cxGridDBTableViewTxOutraTx.Caption := dtmControles.BuscarConfig('PRINCIPAL','VALOR','CAPTION_OUTRA_TAXA1','S');

          if vpOutraTaxaTipo[1] in ['2', '3'] then
           cxGridDBTableViewTxOutraTx.Caption := cxGridDBTableViewTxOutraTx.Caption + ' % ';
        end;
    12 : vpPeriodo_Padrao := dtmControles.BuscarConfig('PRINCIPAL','GERAL','PERIODO_PADRAO','I');
    13 : vpPeriodo_Padrao := dtmControles.BuscarConfig('PRINCIPAL','GERAL','PERIODO_PADRAO','I');
  end;
end;

procedure TfrmEmolumento.SpeedButton1Click(Sender: TObject);
begin
  if not sqlG_Emolumento.IsEmpty then
    if not sqlG_EmolumentoSERVICO_CAIXA_ID.IsNull then
    begin
      sqlG_Emolumento.edit;
      sqlG_EmolumentoSERVICO_CAIXA_ID.AsVariant := null;
      sqlG_Emolumento.ApplyUpdates(-1);
    end;
end;

procedure TfrmEmolumento.sqlG_Emolumento_ItemCalcFields(DataSet: TDataSet);
var
  viValorOutraTaxa, viValorOutraTaxa2 : Currency;
begin
  if vpFundespCobrar then
       sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency := ((sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsCurrency)/100)* vpFundespValor
  else sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency := 0;

  if vpTaxa2Cobrar then
       sqlG_Emolumento_ItemCALC_TAXA2.AsCurrency := ((sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsCurrency)/100)* vpTaxa2Percentual
  else sqlG_Emolumento_ItemCALC_TAXA2.AsCurrency := 0;

  sqlG_Emolumento_ItemTotal_Item.AsCurrency := sqlG_Emolumento_ItemVALOR_EMOLUMENTO.AsCurrency +
                                               sqlG_Emolumento_ItemVALOR_TAXA_JUDICIARIA.AsCurrency +
                                               sqlG_Emolumento_ItemCALC_FUNDESP.AsCurrency +
                                               sqlG_Emolumento_ItemCALC_TAXA2.AsCurrency;

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

procedure TfrmEmolumento.tbcEmolumentoChange(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  sqlG_Emolumento.Filtered := False;
  if tbcEmolumento.TabIndex = 0 then
       sqlG_Emolumento.Filter := 'SITUACAO = ''A'' OR SITUACAO IS NULL'
  else sqlG_Emolumento.Filter := 'SITUACAO = ''I''';
  sqlG_Emolumento.Filtered := True;

  ActAtivarEmolumento.Enabled    := (tbcEmolumento.TabIndex = 1) and (not sqlG_Emolumento.IsEmpty);;
  actDesativarEmolumento.Enabled := (tbcEmolumento.TabIndex = 0) and (not sqlG_Emolumento.IsEmpty);
  Screen.Cursor := crDefault;
end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterScroll(DataSet: TDataSet);
begin
  with sqlG_Emolumento_Item do
  begin
    Active := False;
    Params.ParamByName('EMOLUMENTO_ID').AsCurrency := sqlG_EmolumentoEMOLUMENTO_ID.AsCurrency;
    Params.ParamByName('EMOLUMENTO_PERIODO_ID').AsCurrency := lcxEmolumentoPeriodo.EditValue;
    Active := True;
  end;
end;

procedure TfrmEmolumento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmEmolumento := nil;
  dtmLookup.sqlG_Emolumento.Refresh;
  PaginaExtra := '';
end;

procedure TfrmEmolumento.FormCreate(Sender: TObject);
begin
  btnDuplicar.visible := vgUsuarioID = '123456';

  sqlG_Emolumento.Connection         := dtmControles.DB;
  sqlG_Emolumento_Item.Connection    := dtmControles.DB;
  sqlG_Emolumento_Periodo.Connection := dtmControles.DB;

  LerConfig;
  cxGridDBTableView1DBColumn7.Visible  := PaginaExtra = 'S';
  cxGridDBTableView1DBColumn8.Visible  := cxGridDBTableView1DBColumn7.Visible;
  cxGridDBTableViewTxOutraTx.Visible   := vpUsarOutraTaxa;
  cxGridDBTableViewTxFundesp.Visible   := vpFundespMostrar;
  tbcEmolumento.TabIndex := 0;
  tbcEmolumentoChange(self);
end;

procedure TfrmEmolumento.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FormInicio, 0, 0);
end;

procedure TfrmEmolumento.sqlG_Emolumento_ItemAfterPost(DataSet: TDataSet);
begin
  sqlG_Emolumento_Item.ApplyUpdates(-1);
end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterPost(DataSet: TDataSet);
begin
  sqlG_Emolumento.ApplyUpdates(-1);
  dtmLookup.sqlG_Emolumento.Refresh;
end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterInsert(DataSet: TDataSet);
begin
  sqlG_EmolumentoEMOLUMENTO_ID.AsCurrency := dtmControles.GerarSequencia('G_EMOLUMENTO');
  sqlG_EmolumentoSISTEMA_ID.AsCurrency    := vgId;
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
  if Application.MessageBox('Apagar emolumento e todos os itens vinculados de todos os períodos?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' DELETE FROM G_EMOLUMENTO_ITEM'+
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM G_EMOLUMENTO'+
                     ' WHERE EMOLUMENTO_ID = '+sqlG_EmolumentoEMOLUMENTO_ID.AsString,1);

  sqlG_Emolumento.Refresh;
  sqlG_EmolumentoAfterScroll(sqlG_Emolumento);
end;

procedure TfrmEmolumento.btnAdicionarEmolumentoPeriodoClick(Sender: TObject);
begin
  CadEmolumentoPeriodo(True);
  dtmLookup.sqlG_Emolumento_Periodo.Refresh;
end;

procedure TfrmEmolumento.btnDuplicarClick(Sender: TObject);
begin
  ExibirFormulario(TfrmCadDuplicaEmolumento, frmCadDuplicaEmolumento, True);
end;

procedure TfrmEmolumento.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmEmolumento.cxButton1Click(Sender: TObject);
begin
  ExibirFormulario(TfrmImportarTabelas, frmImportarTabelas, True);
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

procedure TfrmEmolumento.sqlG_Emolumento_ItemAfterDelete(
  DataSet: TDataSet);
begin
  sqlG_Emolumento_Item.ApplyUpdates(-1);
end;

procedure TfrmEmolumento.spnDesvincularSeloClick(Sender: TObject);
begin
 if not sqlG_Emolumento.IsEmpty then
    if not sqlG_EmolumentoSELO_GRUPO_ID.IsNull then
    begin
      sqlG_Emolumento.edit;
      sqlG_EmolumentoSELO_GRUPO_ID.AsVariant := null;
      sqlG_Emolumento.ApplyUpdates(-1);
    end;

end;

procedure TfrmEmolumento.sqlG_EmolumentoAfterDelete(DataSet: TDataSet);
begin
  sqlG_Emolumento.ApplyUpdates(-1);
end;

end.

