unit CadastroSubTarefa;

interface

uses
  Classes,
  Controls,
  cxButtons,
  cxCalendar,
  cxCheckBox,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxDBEdit,
  cxDBLookupComboBox,
  cxDBLookupEdit,
  cxDBRichEdit,
  cxDropDownEdit,
  cxEdit,
  cxEditRepositoryItems,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxGroupBox,
  cxImageComboBox,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxLookupEdit,
  cxMaskEdit,
  cxMemo,
  cxNavigator,
  cxPC,
  cxRadioGroup,
  cxRichEdit,
  cxSpinEdit,
  cxStyles,
  cxTextEdit,
  cxTimeEdit,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,
  Dialogs,
  dxBarBuiltInMenu,
  dxGDIPlusClasses,
  dxSkinMcSkin,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  dxSkinsCore,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  Forms,
  Graphics,
  I9Query,
  Messages,
  SysUtils,
  Variants,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Windows;

type
  TfrmCadastroSubTarefa = class(TForm)
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    btnLimpar: TcxButton;
    cbxSituacao: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    dtsTarefaItem: TDataSource;
    dteDataFinal: TcxDBDateEdit;
    dteDataInicial: TcxDBDateEdit;
    dteHoraFinal: TcxDBTimeEdit;
    dteHoraInicial: TcxDBTimeEdit;
    dtsTarefa: TDataSource;
    dtsTarefaGrupo: TDataSource;
    edtDescricao: TcxDBTextEdit;
    gbxTarefa: TcxGroupBox;
    ibxServentia: TcxDBImageComboBox;
    imgTitulo: TImage;
    lblAssunto: TcxLabel;
    lblGrupo: TcxLabel;
    lblInformaca: TcxLabel;
    lblServentia: TcxLabel;
    lblSituacao: TcxLabel;
    lcxTarefaGrupo: TcxDBLookupComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    pnlDados: TPanel;
    pnlPrincipal: TPanel;
    sqlTarefa: TI9Query;
    sqlTarefaASSUNTO: TStringField;
    sqlTarefaDATA_CADASTRO: TSQLTimeStampField;
    sqlTarefaDATA_FINAL: TSQLTimeStampField;
    sqlTarefaDATA_INICIAL: TSQLTimeStampField;
    sqlTarefaDESCRICAO: TStringField;
    sqlTarefaGrupo: TI9Query;
    sqlTarefaGrupoDESCRICAO: TStringField;
    sqlTarefaGrupoSERVENTIA: TBCDField;
    sqlTarefaGrupoSITUACAO: TStringField;
    sqlTarefaGrupoTAREFA_GRUPO_ID: TBCDField;
    sqlTarefaHORA_FINAL: TSQLTimeStampField;
    sqlTarefaHORA_INICIAL: TSQLTimeStampField;
    sqlTarefaItem: TI9Query;
    sqlTarefaItemDATA_FINAL: TSQLTimeStampField;
    sqlTarefaItemDATA_INICIAL: TSQLTimeStampField;
    sqlTarefaItemHORA_FINAL: TSQLTimeStampField;
    sqlTarefaItemHORA_INICIAL: TSQLTimeStampField;
    sqlTarefaItemMOTIVO: TStringField;
    sqlTarefaItemPERCENTUAL: TBCDField;
    sqlTarefaItemSITUACAO: TStringField;
    sqlTarefaItemTAREFA_ID: TBCDField;
    sqlTarefaItemTAREFA_ITEM_ID: TBCDField;
    sqlTarefaMENSAGEM: TBlobField;
    sqlTarefaMENSAGEM_CALC: TStringField;
    sqlTarefaNOTAS: TBlobField;
    sqlTarefaPERCENTUAL: TBCDField;
    sqlTarefaPERIODO_TIPO: TStringField;
    sqlTarefaPRINCIPAL: TStringField;
    sqlTarefaREALIZADO_DATA: TSQLTimeStampField;
    sqlTarefaREALIZADO_OBSERVACAO: TStringField;
    sqlTarefaREALIZADO_TEMPO: TSQLTimeStampField;
    sqlTarefaREPETIR: TStringField;
    sqlTarefaREPETIR_DOMINGO: TStringField;
    sqlTarefaREPETIR_QUARTA: TStringField;
    sqlTarefaREPETIR_QUINTA: TStringField;
    sqlTarefaREPETIR_SABADO: TStringField;
    sqlTarefaREPETIR_SEGUNDA: TStringField;
    sqlTarefaREPETIR_SEXTA: TStringField;
    sqlTarefaREPETIR_TERCA: TStringField;
    sqlTarefaSERVENTIA: TBCDField;
    sqlTarefaSITUACAO: TStringField;
    sqlTarefaTAREFA_GRUPO_ID: TBCDField;
    sqlTarefaTAREFA_ID: TBCDField;
    sqlTarefaTERMINO_DATA: TSQLTimeStampField;
    sqlTarefaTERMINO_OCORRENCIAS: TBCDField;
    sqlTarefaTIPO_TERMINO: TStringField;
    sqlTarefaUSUARIO_ID: TBCDField;
    sqlTarefaItemUSUARIO_ID: TBCDField;
    sqlTarefaItemDATA_HORA_REALIZADO: TSQLTimeStampField;
    sqlTarefaItemOBSERVACAO: TStringField;
    sqlTarefaItemMENSAGEM: TBlobField;
    rdtMensagem: TcxDBRichEdit;
    lblMensagem: TcxLabel;
    LblDataHoraRealizado: TcxLabel;
    dteDataHoraRealizado: TcxDBDateEdit;
    edtObservacao: TcxDBRichEdit;
    lblObservacao: TcxLabel;
    sqlUsuario: TI9Query;
    DtsUsuario: TDataSource;
    LblUsuario: TcxLabel;
    IcxUsuario: TcxDBLookupComboBox;
    sqlUsuarioUSUARIO_ID: TBCDField;
    sqlUsuarioUSUARIO_NOME: TStringField;

    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlTarefaCalcFields(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);

  public
    vlTarefaItemId: Integer;
  end;

var
  frmCadastroSubTarefa: TfrmCadastroSubTarefa;

implementation

uses
  Controles,
  Lookup,
  MensagemUtils,
  Rotinas,
  TarefaProcessos;

{$R *.dfm}

procedure TfrmCadastroSubTarefa.btnCancelarClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmCadastroSubTarefa.btnConfirmarClick(Sender: TObject);
var
  viDescMensagem: string;
  viMensagem: TStringStream;
begin
  if sqlTarefaItemSITUACAO.AsString = 'R' then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Não é possível alterar uma tarefa realizada!');
  end;

  if sqlTarefaItemTAREFA_ITEM_ID.AsInteger <= 0 then
    sqlTarefaItemTAREFA_ITEM_ID.AsInteger := dtmControles.GerarSequencia('G_TAREFA_ITEM');

  viMensagem := TStringStream.Create;
  try
    sqlTarefaItem.Edit;
    sqlTarefaItemMENSAGEM.AsString := String(CompressString(AnsiString(rdtMensagem.Text)));
    sqlTarefaItem.Post;

    sqlTarefaItemMENSAGEM.SaveToStream(viMensagem);
    viMensagem.Position := 0;

    if TTarefaProcessos.GravarTarefaItem(
      sqlTarefaItemTAREFA_ITEM_ID.AsInteger,
      sqlTarefaTAREFA_ID.AsInteger,
      sqlTarefaItemSITUACAO.AsString,
      sqlTarefaItemPERCENTUAL.AsCurrency,
      sqlTarefaItemDATA_INICIAL.AsDateTime,
      sqlTarefaITEMHORA_INICIAL.AsDateTime,
      sqlTarefaItemDATA_FINAL.AsDateTime,
      sqlTarefaItemHORA_FINAL.AsDateTime,
      sqlTarefaItemUSUARIO_ID.AsInteger,
      sqlTarefaItemDATA_HORA_REALIZADO.AsDateTime,
      sqlTarefaItemOBSERVACAO.AsString,
      viMensagem,
      viDescMensagem) <= 0 then
      TMensagemUtils.ExibirMensagemErro(
        viDescMensagem);

  finally
    FreeAndNil(viMensagem);
  end;

  sqlTarefaItem.Close;
  sqlTarefaItem.Open;

  Self.ModalResult := mrOk;
end;

procedure TfrmCadastroSubTarefa.FormClose(
  Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadastroSubTarefa := nil;
end;

procedure TfrmCadastroSubTarefa.FormCreate(Sender: TObject);
begin
  inherited;
  sqlTarefaItem.Connection := dtmControles.DB;
  sqlTarefa.Connection := dtmControles.DB;
  sqlTarefaGrupo.Connection := dtmControles.DB;
end;

procedure TfrmCadastroSubTarefa.FormShow(Sender: TObject);
begin
  inherited;
  sqlUsuario.Close;
  sqlUsuario.Open;

  if vlTarefaItemId > 0 then
  begin
    sqlTarefaItem.Close;
    sqlTarefaItem.Params.ParamByName('TAREFA_ITEM_ID').AsInteger := vlTarefaItemId;
    sqlTarefaItem.Open;
  end;

  if not sqlTarefaItem.IsEmpty then
  begin
    sqlTarefaItem.Edit;
    sqlTarefaItemMENSAGEM.AsString := String(DeCompressString(AnsiString(sqlTarefaItemMENSAGEM.AsString)));
    sqlTarefaItem.Post;
  end;

  sqlTarefaItem.Edit;

  sqlTarefa.Close;
  sqlTarefa.Params.ParamByName('TAREFA_ID').AsInteger := sqlTarefaItemTAREFA_ID.AsInteger;
  sqlTarefa.Open;

  sqlTarefaGrupo.Close;
  sqlTarefaGrupo.Params.ParamByName('TAREFA_GRUPO_ID').AsInteger := sqlTarefaTAREFA_GRUPO_ID.AsInteger;
  sqlTarefaGrupo.Open;
end;

procedure TfrmCadastroSubTarefa.sqlTarefaCalcFields(DataSet: TDataSet);
begin
  inherited;
  sqlTarefaMENSAGEM_CALC.AsString := DeCompressString(sqlTarefaMENSAGEM.AsString);
end;

end.
