unit Geral.View.Cadastro.UsuarioPKI;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  CadBasico,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  I9Query,
  System.Actions,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.ExtCtrls,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxDBEdit,
  cxLabel,
  cxImageComboBox,
  cxDBEditRepository,
  cxClasses,
  cxMaskEdit,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridCustomView,
  cxGrid,
  cxSplitter;

type
  TfrmCadastroUsuarioPKI = class(TfrmCadBasico)
    ClientAncestralUSUARIO_PKI_ID: TBCDField;
    ClientAncestralUSUARIO_ID: TBCDField;
    ClientAncestralNUMERO_SERIE: TStringField;
    ClientAncestralSITUACAO: TStringField;
    lblCodigo: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    qryUsuario: TI9Query;
    qryUsuarioUSUARIO_ID: TBCDField;
    qryUsuarioNOME_COMPLETO: TStringField;
    dtsUsuario: TDataSource;
    lblUsuario: TcxLabel;
    lcbUsuario: TcxDBLookupComboBox;
    cxEditRepository: TcxEditRepository;
    Lista_UsuarioAtivos: TcxEditRepositoryLookupComboBoxItem;
    lblEmissor: TcxLabel;
    edtEmissor: TcxDBTextEdit;
    lblNumeroSerie: TcxLabel;
    edtNumeroSerie: TcxDBTextEdit;
    lblSituacao: TcxLabel;
    icbSituacao: TcxDBImageComboBox;
    btnSelecionar: TcxButton;
    grdUsuarioPKI: TcxGrid;
    grdUsuarioPKIDBTableView: TcxGridDBTableView;
    grdUsuarioPKILevel: TcxGridLevel;
    grdUsuarioPKIDBTableViewUSUARIO_ID: TcxGridDBColumn;
    grdUsuarioPKIDBTableViewEMISSOR: TcxGridDBColumn;
    grdUsuarioPKIDBTableViewNUMERO_SERIE: TcxGridDBColumn;
    grdUsuarioPKIDBTableViewSITUACAO: TcxGridDBColumn;
    grdUsuarioPKIDBTableViewUSUARIO_PKI_ID: TcxGridDBColumn;
    cxSplitter: TcxSplitter;
    ClientAncestralEMISSOR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ClientAncestralAfterInsert(DataSet: TDataSet);
    procedure ExecuteGravarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetState(
      AState: TDataSetState); override;
  end;

var
  frmCadastroUsuarioPKI: TfrmCadastroUsuarioPKI;

implementation

uses
  Controles,
  Lookup,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.PKI,
  Geral.Controller.Factory.Entity.PKI,
  MensagemUtils;

{$R *.dfm}

procedure TfrmCadastroUsuarioPKI.btnSelecionarClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  viX509Certificate: IMaybe<IX509Certificate>;
{$ENDREGION}
begin
  inherited;
  viX509Certificate := TSelecaoCertificadoDigitalFactory.New
  .GetInstance
  .Selecionar;

  if not viX509Certificate.HasValue then
    Exit;

  ClientAncestralEMISSOR.AsString := viX509Certificate.Value.Issuer.CommonName;
  ClientAncestralNUMERO_SERIE.AsString := viX509Certificate.Value.SerialNumber;
end;

procedure TfrmCadastroUsuarioPKI.ClientAncestralAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
end;

procedure TfrmCadastroUsuarioPKI.ExecuteGravarExecute(Sender: TObject);
begin
  if ClientAncestralEMISSOR.AsString.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe o emissor.');

    Exit;
  end;

  if ClientAncestralNUMERO_SERIE.AsString.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe o número série.');

    Exit;
  end;

  inherited;
end;

procedure TfrmCadastroUsuarioPKI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmCadastroUsuarioPKI := nil;
end;

procedure TfrmCadastroUsuarioPKI.FormCreate(Sender: TObject);
begin
  inherited;
  qryUsuario.Connection := dtmControles.DB;
  qryUsuario.Open;

  ClientAncestral.Open;
  vgNomeTabela := 'G_USUARIO_PKI';
  vgChavePrimaria := 'USUARIO_PKI_ID';
end;

procedure TfrmCadastroUsuarioPKI.FormDestroy(Sender: TObject);
begin
  inherited;
  qryUsuario.Close;
end;

procedure TfrmCadastroUsuarioPKI.SetState(
  AState: TDataSetState);
begin
  inherited;
  Lista_UsuarioAtivos.Properties.ReadOnly := AState = TDataSetState.dsEdit;
  grdUsuarioPKI.Enabled := AState = TDataSetState.dsBrowse;
end;

end.
