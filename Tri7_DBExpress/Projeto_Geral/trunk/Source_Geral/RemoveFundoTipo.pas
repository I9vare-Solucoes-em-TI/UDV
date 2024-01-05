unit RemoveFundoTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Emolumento, Datasnap.DBClient, DbxDevartInterBase, SimpleDS, cxCheckComboBox,
  cxCheckBox;

type
  TfrmRemoveFundoTipo = class(TForm)
    grdRemoveFundo: TcxGrid;
    cxGridDBTableViewRemoveFundo: TcxGridDBTableView;
    cxGridDBTableViewRemoveFundoDescricao: TcxGridDBColumn;
    cxGridDBTableViewRemoveFundoPercentual: TcxGridDBColumn;
    cxGridDBTableViewRemoveFundoValorCalculado: TcxGridDBColumn;
    cxGridLevelRemoveFundo: TcxGridLevel;
    pnlInferior: TPanel;
    btnFechar: TcxButton;
    cdsRemoveFundo: TClientDataSet;
    dtsRemoveFundo: TDataSource;
    cdsRemoveFundoFUNDO_TIPO_ID: TIntegerField;
    cdsRemoveFundoDESCRICAO: TStringField;
    cdsRemoveFundoPERCENTUAL: TCurrencyField;
    sqlFundoConfig: TSimpleDataSet;
    sqlFundoConfigCONFIGURACAO_FUNDO_ID: TFMTBCDField;
    sqlFundoConfigFUNDO_TIPO_ID: TFMTBCDField;
    sqlFundoConfigEMOLUMENTO_ID: TFMTBCDField;
    cdsRemoveFundoCALC_REMOVE: TBooleanField;
    cdsRemoveFundoEMOLUMENTO_ID: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableViewRemoveFundoValorCalculadoPropertiesChange(
      Sender: TObject);
  private
    { Private declarations }
    procedure CarregarFundoTipo(const vpEmolumentoId: Integer);
  public
    { Public declarations }
    class procedure Configurar(const vpEmolumentoId: Integer);
  end;

var
  frmRemoveFundoTipo: TfrmRemoveFundoTipo;

implementation

uses
  Controles, Lookup;

{$R *.dfm}

{ TfrmRemoveFundoTipo }

procedure TfrmRemoveFundoTipo.CarregarFundoTipo(const vpEmolumentoId: Integer);
begin
  ExecutaSqlAuxiliar(
    'SELECT ' +
    ' FUNDO_TIPO_ID, ' +
    ' DESCRICAO, ' +
    ' PERCENTUAL ' +
    'FROM ' +
    ' G_FUNDO_TIPO ',0);

  if dtmControles.sqlAuxiliar.IsEmpty then
  begin
    Application.MessageBox('Não existe fundos para ser removido! ','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  cdsRemoveFundo.EmptyDataSet;
  cdsRemoveFundo.Open;
  cdsRemoveFundo.First;
  while not dtmControles.sqlAuxiliar.Eof do
  begin
    try
      cdsRemoveFundo.Insert;

      cdsRemoveFundoFUNDO_TIPO_ID.AsInteger := dtmControles.sqlAuxiliar.FieldByName('FUNDO_TIPO_ID').AsInteger;
      cdsRemoveFundoDESCRICAO.AsString      := dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString;
      cdsRemoveFundoPERCENTUAL.AsCurrency   := dtmControles.sqlAuxiliar.FieldByName('PERCENTUAL').AsCurrency;
      cdsRemoveFundoEMOLUMENTO_ID.AsInteger := vpEmolumentoId;
      cdsRemoveFundoCALC_REMOVE.AsBoolean   := False;
    finally
      cdsRemoveFundo.Post;
    end;
    dtmControles.sqlAuxiliar.Next;
  end;

  sqlFundoConfig.Close;
  sqlFundoConfig.DataSet.ParamByName('EMOLUMENTO_ID').AsInteger := cdsRemoveFundoEMOLUMENTO_ID.AsInteger;
  sqlFundoConfig.Open;

  if sqlFundoConfig.IsEmpty then
    Exit;

  cdsRemoveFundo.First;
  while not cdsRemoveFundo.eof do
  begin
    sqlFundoConfig.First;
    while not sqlFundoConfig.Eof do
    begin
      if cdsRemoveFundoFUNDO_TIPO_ID.AsInteger = sqlFundoConfigFUNDO_TIPO_ID.AsInteger then
      begin
        cdsRemoveFundo.Edit;
        cdsRemoveFundoCALC_REMOVE.AsBoolean := True;
        cdsRemoveFundo.Post;
      end;

      sqlFundoConfig.Next;
    end;
    cdsRemoveFundo.Next;
  end;
  sqlFundoConfig.Close;
end;

class procedure TfrmRemoveFundoTipo.Configurar(const vpEmolumentoId: Integer);
var
  viFrmRemoveFundoTipo: TfrmRemoveFundoTipo;
begin
  Application.CreateForm(Self, viFrmRemoveFundoTipo);
  viFrmRemoveFundoTipo.CarregarFundoTipo(vpEmolumentoId);
  viFrmRemoveFundoTipo.ShowModal;
end;

procedure TfrmRemoveFundoTipo.cxGridDBTableViewRemoveFundoValorCalculadoPropertiesChange(
  Sender: TObject);
begin
  if cdsRemoveFundoCALC_REMOVE.AsBoolean then
  begin
    with dtmControles.sqlAuxiliar do
    begin
      dtmControles.sqlAuxiliar.Active := False;
      Sql.Clear;
      Sql.Add(' INSERT INTO G_FUNDO_CONFIG (');
      Sql.Add('  CONFIGURACAO_FUNDO_ID,');
      Sql.Add('  FUNDO_TIPO_ID,');
      Sql.Add('  EMOLUMENTO_ID');
      Sql.Add(' ) VALUES (:P1,:P2,:P3)');

      Params[0].AsCurrency := dtmControles.GerarSequencia('G_FUNDO_CONFIG');
      Params[1].AsInteger  := cdsRemoveFundoFUNDO_TIPO_ID.AsInteger;
      Params[2].AsInteger  := cdsRemoveFundoEMOLUMENTO_ID.AsInteger;
      ExecSQL(False);
    end;
  end
  else
  begin
    ExecutaSqlAuxiliar('DELETE FROM G_FUNDO_CONFIG ' +
      ' WHERE EMOLUMENTO_ID = ' + IntToStr(cdsRemoveFundoEMOLUMENTO_ID.AsInteger) +
      ' AND FUNDO_TIPO_ID = ' + IntToStr(cdsRemoveFundoFUNDO_TIPO_ID.AsInteger) ,1);
  end;
end;

procedure TfrmRemoveFundoTipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRemoveFundoTipo.FormCreate(Sender: TObject);
begin
  sqlFundoConfig.Connection := dtmControles.DB;
end;

end.
