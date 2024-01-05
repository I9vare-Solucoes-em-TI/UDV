unit TarefaGrupo;

interface

uses
  CadBasico,
  cxButtons,
  cxCheckBox,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxDBEdit,
  cxDropDownEdit,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxImageComboBox,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxMaskEdit,
  cxNavigator,
  cxStyles,
  cxTextEdit,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,
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
  I9Query,
  System.Actions,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows, cxEditRepositoryItems;

type
  TfrmTarefaGrupo = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    controle: TcxGrid;
    controleDBTableView1: TcxGridDBTableView;
    controleDBTableView1Codigo: TcxGridDBColumn;
    controleDBTableView1DESCRICAO: TcxGridDBColumn;
    controleDBTableView1Serventia: TcxGridDBColumn;
    controleDBTableView1SITUACAO: TcxGridDBColumn;
    controleLevel1: TcxGridLevel;
    edtDescricao: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    ibxSistema: TcxDBImageComboBox;
    ClientAncestralTAREFA_GRUPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralSERVENTIA: TBCDField;
    cxLabel2: TcxLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);

  private

    procedure PreencherSistemas;

  public

  end;

var
  frmTarefaGrupo: TfrmTarefaGrupo;

implementation

{$R *.dfm}

uses
  Controles,
  Lookup,
  Rotinas;

procedure TfrmTarefaGrupo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmTarefaGrupo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  ibxSistema.SetFocus;
end;

procedure TfrmTarefaGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmTarefaGrupo.FormCreate(Sender: TObject);
begin
  PreencherSistemas;

  ClientAncestral.active := True;
  inherited;
  vgNomeTabela    := 'G_TAREFA_GRUPO';
  vgChavePrimaria := 'TAREFA_GRUPO_ID';
end;

procedure TfrmTarefaGrupo.PreencherSistemas;
var
  viQry : TI9Query;
  viSQL : String;
  viItem : TcxImageComboBoxItem;
begin
  inherited;
  ibxSistema.Properties.Items.Clear;

  viItem := ibxSistema.Properties.Items.Add;
  viItem.ImageIndex := 0;
  viItem.Description := 'GERAL';
  viItem.Value := 9;
  viItem.Tag := 0;

  viQry := TI9Query.Create(nil);
  try
    viQry.Connection := dtmControles.DB;

    viSql :=
      ' SELECT ' +
      '        G_ST.SISTEMA_ID, ' +
      '        G_ST.DESCRICAO ' +
      '   FROM G_SISTEMA G_ST ' +
      '  WHERE 1 = 1 ' +
      '    AND G_ST.SITUACAO = ''A'' ';

    viQry.SQL.Text := viSql;
    viQry.Open;

    viQry.First;
    while not viQry.Eof do
    begin
      viItem := ibxSistema.Properties.Items.Add;
      viItem.ImageIndex := 0;
      viItem.Description := viQry.FieldByName('DESCRICAO').AsString;
      viItem.Value := viQry.FieldByName('SISTEMA_ID').AsInteger;
      viItem.Tag := 0;

      viQry.Next;
    end;

  finally
    FreeAndNil(viQry);
  end;
end;

end.
