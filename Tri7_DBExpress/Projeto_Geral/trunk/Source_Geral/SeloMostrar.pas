unit SeloMostrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadAuxiliar, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, cxLabel, cxHyperLinkEdit;

type
  TfrmSeloMostrar = class(TfrmCadAuxiliar)
    ClientAncestralSIGLA: TStringField;
    ClientAncestralNUMERO: TIntegerField;
    ClientAncestralSELO_LIVRO_ID: TBCDField;
    ClientAncestralDESCRICAO_COMPLETA: TStringField;
    lblInformacao: TcxLabel;
    ClientAncestralcalc_Selo: TStringField;
    cxGrid2: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumnSeloNumero: TcxGridDBColumn;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    cxGridLevel8: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeloMostrar: TfrmSeloMostrar;
  vgSeloMostrarTabela, vgSeloMostrarCampoId, vgSeloMostrarCodBusca1, vgSeloMostrarCodBusca2 : string;

implementation

uses
  Controles, SeloSelecionado;

{$R *.dfm}

procedure TfrmSeloMostrar.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
  ClientAncestralcalc_Selo.AsString := dtmControles.FormatarMascaraSelo(ClientAncestralSIGLA.AsString,ClientAncestralNUMERO.AsInteger);
end;

procedure TfrmSeloMostrar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmSeloMostrar := nil;
end;

procedure TfrmSeloMostrar.FormCreate(Sender: TObject);
var
  viSql : String;
begin
  inherited;

  viSql := ' SELECT SL.SIGLA, CAST(SL.NUMERO AS INTEGER) AS NUMERO, SL.SELO_LIVRO_ID, '+
           '               SG.DESCRICAO_COMPLETA '+
           ' FROM G_SELO_LIVRO SL '+
           ' LEFT OUTER JOIN G_SELO_LOTE ST ON '+
           '   SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
           '   LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
           '   ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
           ' WHERE TABELA = '+QuotedStr(vgSeloMostrarTabela);
  if vgSeloMostrarCampoId <> '' then
    viSql := viSql + ' AND CAMPO_ID = '+ QuotedStr(vgSeloMostrarCampoId);

  if vgSeloMostrarCodBusca1 <> '' then
    viSql := viSql + ' AND CODIGO_BUSCA1 = '+ QuotedStr(vgSeloMostrarCodBusca1);

  if vgSeloMostrarCodBusca2 <> '' then
    viSql := viSql + ' AND CODIGO_BUSCA2 = '+ QuotedStr(vgSeloMostrarCodBusca2);

  viSql := viSql + ' ORDER BY SIGLA, NUMERO';

  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := viSql;
  ClientAncestral.Active := True;
  ClientAncestral.ReadOnly := True;

  lblInformacao.Caption := AnsiUpperCase(vgUsuarioNome)+', utilize o(s) seguinte(s) selo(s) neste serviço'
end;

end.
