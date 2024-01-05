unit Geral.View.Sel.Animal;

interface

uses
  cxButtons,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxNavigator,
  cxStyles,
  cxTextEdit,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TfrmSelAnimal = class(TForm)
    BtnPesquisar: TcxButton;
    BtnSelecionar: TcxButton;
    DtsPesquia: TDataSource;
    EdtNome: TcxTextEdit;
    GrdPesquisa: TcxGrid;
    GrdPesquisaDbTableView: TcxGridDBTableView;
    GrdPesquisaDbTableViewCOR: TcxGridDBColumn;
    GrdPesquisaDbTableViewNOME: TcxGridDBColumn;
    GrdPesquisaDbTableViewRACA: TcxGridDBColumn;
    GrdPesquisaDbTableViewSEXO: TcxGridDBColumn;
    GrdPesquisaLevel: TcxGridLevel;
    LblNome: TcxLabel;
    PnlFiltros: TPanel;
    PnlResultado: TPanel;
    tblPesquisa: TFDMemTable;
    tblPesquisaANIMAL_ID: TIntegerField;
    tblPesquisaCOR: TStringField;
    tblPesquisaNOME: TStringField;
    tblPesquisaRACA: TStringField;
    tblPesquisaSEXO: TStringField;

    procedure BtnSelecionarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GrdPesquisaDbTableViewDblClick(Sender: TObject);

  private
    vlAnimalId: Integer;

    function BuscarNome: string;

    procedure ExecutarPesquisa;

    procedure Pesquisar(
      const vpNome: string;
      var vpTblPesquisa: TFDMemTable);

    procedure Selecionar(
      const vpTblPesquisa: TFDMemTable); overload;
  public
    class function Selecionar: Integer; overload;
  end;

implementation

uses
  Geral.Controller.Animal,
  MensagemUtils;

{$R *.dfm}

procedure TfrmSelAnimal.BtnPesquisarClick(Sender: TObject);
begin
  ExecutarPesquisa;
end;

procedure TfrmSelAnimal.BtnSelecionarClick(Sender: TObject);
begin
  Selecionar(tblPesquisa);
end;

function TfrmSelAnimal.BuscarNome: string;
begin
  Result := Trim(EdtNome.Text);
end;

procedure TfrmSelAnimal.EdtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ExecutarPesquisa;
end;

procedure TfrmSelAnimal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblPesquisa.Close;
end;

procedure TfrmSelAnimal.FormCreate(Sender: TObject);
begin
  vlAnimalId := 0;
end;

procedure TfrmSelAnimal.FormShow(Sender: TObject);
begin
  ExecutarPesquisa;
  EdtNome.SetFocus;
end;

procedure TfrmSelAnimal.GrdPesquisaDbTableViewDblClick(Sender: TObject);
begin
  Selecionar(tblPesquisa);
end;

procedure TfrmSelAnimal.ExecutarPesquisa;
begin
  Pesquisar(
    BuscarNome,
    tblPesquisa);
end;

procedure TfrmSelAnimal.Pesquisar(
  const vpNome: string;
  var vpTblPesquisa: TFDMemTable);
var
  viDataSetAnimal: TDataSet;
begin
  vpTblPesquisa.Open;
  vpTblPesquisa.EmptyDataSet;

  viDataSetAnimal := nil;
  try
    viDataSetAnimal := TAnimalController.Consultar(vpNome);

    if viDataSetAnimal = nil then
      Exit;

    if viDataSetAnimal.IsEmpty then
      Exit;

    try
      vpTblPesquisa.BeginBatch;

      viDataSetAnimal.First;
      while not viDataSetAnimal.Eof do
      begin
        vpTblPesquisa.AppendRecord([
          { ANIMAL_ID } viDataSetAnimal.FieldByName('ANIMAL_ID').AsInteger,
          { NOME      } viDataSetAnimal.FieldByName('NOME').AsString,
          { SEXO      } viDataSetAnimal.FieldByName('SEXO').AsString,
          { RACA      } viDataSetAnimal.FieldByName('RACA').AsString,
          { COR       } viDataSetAnimal.FieldByName('COR').AsString]);

        viDataSetAnimal.Next;
      end;

      vpTblPesquisa.EndBatch;

    except
      on e: Exception do
      begin
        TMensagemUtils.ExibirMensagemErro(
          'Erro ao pesquisar' + sLineBreak +
          e.Message);

        Exit;
      end;
    end;

  finally
    FreeAndNil(viDataSetAnimal);
  end;
end;

class function TfrmSelAnimal.Selecionar: Integer;
var
  viFrmSelAnimal: TFrmSelAnimal;
begin
  Result := 0;
  viFrmSelAnimal := nil;
  try
    viFrmSelAnimal := TfrmSelAnimal.Create(nil);
    viFrmSelAnimal.Parent := Screen.ActiveForm;
    viFrmSelAnimal.Position := poMainFormCenter;

    if viFrmSelAnimal.ShowModal = mrOk then
    begin
      Result := viFrmSelAnimal.vlAnimalId;
      Exit;
    end;

  finally
    FreeAndNil(viFrmSelAnimal);
  end;
end;

procedure TfrmSelAnimal.Selecionar(
  const vpTblPesquisa: TFDMemTable);
begin
  if vpTblPesquisa.isEmpty then
    Exit;

  vlAnimalId := vpTblPesquisa.FieldByName('ANIMAL_ID').AsInteger;

  Self.ModalResult := mrOk;
end;

end.
