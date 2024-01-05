unit FramePessoaExposta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxImageComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxLabel, cxGroupBox,
  cxRadioGroup, dxGDIPlusClasses, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query, Datasnap.DBClient,
  dxBarBuiltInMenu, cxPC, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter;

type
  TfmePessoaExposta = class(TFrame)
    sqlVinculoPessoaExposta: TI9Query;
    dtsVinculoPessoaExposta: TDataSource;
    cdsPessoaExposta: TClientDataSet;
    dtsPessoaExposta: TDataSource;
    pgcDadosPessoa: TcxPageControl;
    tbsDocumento: TcxTabSheet;
    tbsHistorico: TcxTabSheet;
    icbExpostaPoliticamente: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    edtDataCarencia: TcxDBDateEdit;
    cxLabel69: TcxLabel;
    Image2: TImage;
    gridPessoaExposta: TcxGrid;
    PessoaExpostaTv1: TcxGridDBTableView;
    PessoaExpostaTv1NOME: TcxGridDBColumn;
    PessoaExpostaTv1CPF_AUXILIAR: TcxGridDBColumn;
    PessoaExpostaTv1FUNCAO: TcxGridDBColumn;
    PessoaExpostaTv1NOME_ORGAO: TcxGridDBColumn;
    PessoaExpostaTv1DATA_INICIO_EXERCICIO: TcxGridDBColumn;
    PessoaExpostaTv1DATA_FIM_CARENCIA: TcxGridDBColumn;
    PessoaExpostaLv1: TcxGridLevel;
    cdsPessoaExpostaEXPOSTA_POLITICAMENTE: TStringField;
    cdsPessoaExpostaDATA_CARENCIA: TDateField;
    sqlVinculoPessoaExpostaPESSOA_EXPOSTA_ID: TBCDField;
    sqlVinculoPessoaExpostaNOME: TStringField;
    sqlVinculoPessoaExpostaCPF_AUXILIAR: TStringField;
    sqlVinculoPessoaExpostaFUNCAO: TStringField;
    sqlVinculoPessoaExpostaDATA_INICIO_EXERCICIO: TSQLTimeStampField;
    sqlVinculoPessoaExpostaDATA_FIM_CARENCIA: TSQLTimeStampField;
    sqlVinculoPessoaExpostaNOME_ORGAO: TStringField;
    PessoaExpostaTv1DATA_FIM_EXERCICIO: TcxGridDBColumn;
    sqlVinculoPessoaExpostaDATA_FIM_EXERCICIO: TSQLTimeStampField;
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    procedure CarregarVinculoPessoaExposta(
      const vpCPF: string);

    procedure Modo(vpEnabled: Boolean; vpGridEnabled: Boolean);
  end;

implementation

uses
  Controles,
  Lookup;

{$R *.dfm}


{ TfmePessoaExposta }

procedure TfmePessoaExposta.CarregarVinculoPessoaExposta(
  const vpCPF: string);
begin
  sqlVinculoPessoaExposta.Close;
  sqlVinculoPessoaExposta.ParamByName('CPF').AsString := vpCPF;
  sqlVinculoPessoaExposta.Open;
end;

constructor TfmePessoaExposta.Create(AOwner: TComponent);
begin
  inherited;
  sqlVinculoPessoaExposta.Connection := dtmControles.DB;
end;

procedure TfmePessoaExposta.Image2Click(Sender: TObject);
begin
  Application.MessageBox(
    'Agentes públicos que desempenham ' + sLineBreak +
    'ou tenham desempenhado, nos últimos cinco anos, ' + sLineBreak +
    'cargos, empregos ou funções públicas relevantes!',
    'Atenção', MB_OK + MB_ICONINFORMATION);
end;

procedure TfmePessoaExposta.Modo(vpEnabled: Boolean; vpGridEnabled: Boolean);
begin
  gridPessoaExposta.Enabled       := vpGridEnabled;
  icbExpostaPoliticamente.Enabled := vpEnabled;
  edtDataCarencia.Enabled         := vpEnabled;
end;

end.
