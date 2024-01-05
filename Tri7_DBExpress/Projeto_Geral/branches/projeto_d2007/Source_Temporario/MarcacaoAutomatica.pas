unit MarcacaoAutomatica;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, DB, DBClient, SimpleDS,
  StdCtrls, cxButtons, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, cxGraphics;

type
  TfrmMarcacaoAutomatica = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Shape2: TShape;
    cxLabel2: TcxLabel;
    Bevel1: TBevel;
    sqlMarcacao: TI9Query;
    dtsMarcacao: TDataSource;
    sqlMarcacaoNOME: TStringField;
    sqlMarcacaoDESCRICAO: TStringField;
    cbxGrupoMarcacao: TcxComboBox;
    dblMarcacao: TcxLookupComboBox;
    rdbManter: TRadioButton;
    rdbMaiusculo: TRadioButton;
    rdbMinusculo: TRadioButton;
    rdbMaiusculoMinusculo: TRadioButton;
    chkConferencia: TCheckBox;
    btnSelecionar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lcbMarcacaoPropertiesChange(Sender: TObject);
    procedure cbxGrupoMarcacaoPropertiesChange(Sender: TObject);
    procedure dblMarcacaoPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    vgTipoMarcacao, vgMarcacaoDisplay, vgMarcacaoInterna : string;
    vgConferencia : Boolean;

  end;

var
  frmMarcacaoAutomatica: TfrmMarcacaoAutomatica;

implementation

uses Controles, Rotinas;

{$R *.dfm}

procedure TfrmMarcacaoAutomatica.FormCreate(Sender: TObject);
var
  viSql : string;
begin
  sqlMarcacao.Connection := dtmControles.DB;
  vgMarcacaodisplay := '';

  // Carregar Grupo de Marcações
  Screen.Cursor := crHourGlass;

  viSql := 'SELECT DISTINCT(GRUPO) '+
           ' FROM G_MARCACAO_TIPO '+
           ' WHERE SISTEMA_ID = '+ IntToStr(vgId)+
           '   AND GRUPO_TIPO = '+ QuotedStr('V');

  if vgMarcacaoAutoGrupo <> '' then
    viSql := viSql + ' AND GRUPO = '+ QuotedStr(vgMarcacaoAutoGrupo);

  viSql := viSql +' ORDER BY GRUPO ';
  ExecutaSqlAuxiliar(viSql,0);

  cbxGrupoMarcacao.Properties.Items.Clear;
  While not dtmControles.sqlAuxiliar.Eof do
  begin
    cbxGrupoMarcacao.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('GRUPO').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;

  if vgMarcacaoAutoGrupo <> '' then
    cbxGrupoMarcacao.ItemIndex := 0;
  vgMarcacaoAutoGrupo := '';

  Screen.Cursor := crDefault;
end;

procedure TfrmMarcacaoAutomatica.btnSelecionarClick(Sender: TObject);
begin
  vgMarcacaoDisplay := sqlMarcacaoNOME.AsString;
  vgMarcacaoInterna := sqlMarcacaoNOME.AsString;

  if rdbMaiusculo.Checked then
  begin
    vgMarcacaoDisplay := AnsiUpperCase(vgMarcacaoDisplay);
    vgMarcacaoInterna := '¿'+vgMarcacaoInterna
  end
  else vgMarcacaoDisplay := MaiusculoMinusculo(vgMarcacaoDisplay);

  if rdbMaiusculoMinusculo.Checked then
    vgMarcacaoInterna := 'ÿ'+vgMarcacaoInterna
  else
    if rdbMinusculo.Checked then
    begin
       vgMarcacaoDisplay := AnsiLowerCase(vgMarcacaoDisplay);
       vgMarcacaoInterna := 'û'+vgMarcacaoInterna;
    end;

  if not chkConferencia.Checked then
  begin
    vgMarcacaoDisplay := '¢'+Trim(vgMarcacaoDisplay);
    vgMarcacaoInterna := '¢'+Trim(vgMarcacaoInterna);
    vgConferencia     := False;
  end
  else vgConferencia := True;
end;

procedure TfrmMarcacaoAutomatica.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMarcacaoAutomatica.FormActivate(Sender: TObject);
begin
  if cbxGrupoMarcacao.Text = '' then
       cbxGrupoMarcacao.SetFocus
  else dblMarcacao.SetFocus;
end;

procedure TfrmMarcacaoAutomatica.lcbMarcacaoPropertiesChange(
  Sender: TObject);
begin
  btnSelecionar.Enabled := True;
end;

procedure TfrmMarcacaoAutomatica.cbxGrupoMarcacaoPropertiesChange(
  Sender: TObject);
begin
  btnSelecionar.Enabled := False;
  Screen.Cursor := crHourGlass;
  sqlMarcacao.Active := False;
  sqlMarcacao.ParamByName('GRUPO').AsString := cbxGrupoMarcacao.Text;
  sqlMarcacao.ParamByName('SISTEMA').AsBCD  := vgId;
  sqlMarcacao.Active := True;
  Screen.Cursor := crDefault;
  dblMarcacao.Enabled := True;
end;

procedure TfrmMarcacaoAutomatica.dblMarcacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  btnSelecionar.Enabled := True;
end;

procedure TfrmMarcacaoAutomatica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlMarcacao.Close;
end;

end.
