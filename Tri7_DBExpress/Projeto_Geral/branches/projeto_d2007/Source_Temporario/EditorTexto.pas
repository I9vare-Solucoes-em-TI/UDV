unit EditorTexto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxLabel,
  FrameEditor, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, Menus, ComCtrls, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxGraphics;

type
  TfrmEditorTexto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PanelBotaoFechar: TPanel;
    pnlTeste: TPanel;
    lblInformacao: TcxLabel;
    pnlDados: TPanel;
    cxLabel3: TcxLabel;
    cbxQtd: TcxImageComboBox;
    cxLabel1: TcxLabel;
    cbxSexo: TcxImageComboBox;
    fmeEditor: TfmeEditor;
    VoltarTelaAnterior1: TMenuItem;
    cxBtnFechar: TcxButton;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxQtdPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VoltarTelaAnterior1Click(Sender: TObject);
  private
    procedure TestarGramatica;
  public
  end;

var
  frmEditorTexto: TfrmEditorTexto;
  vgTrazerTexto : Boolean;

implementation

uses Controles, ControleVariaveis;

{$R *.dfm}

procedure TfrmEditorTexto.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEditorTexto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if vgTrazerTexto then
    fmeEditor.wptTexto.CopyToClipboard(true);
  vgTrazerTexto  := False;
  
  action         := caFree;
  frmEditorTexto := nil;
end;

procedure TfrmEditorTexto.TestarGramatica;
begin
  if (cbxSexo.EditValue <> null) and (cbxQtd.EditValue <> null) then
  begin
    vgQualificar.Sexo := cbxSexo.EditValue;
    vgQualificar.Qtd  := cbxQtd.EditValue;
    Qualificar_Gramatica(fmeEditor.wptTexto, True);
  end;
end;

procedure TfrmEditorTexto.cbxQtdPropertiesChange(Sender: TObject);
begin
  TestarGramatica;
end;

procedure TfrmEditorTexto.FormShow(Sender: TObject);
begin
  cbxQtd.EditValue := '1';
end;

procedure TfrmEditorTexto.VoltarTelaAnterior1Click(Sender: TObject);
begin
  close;
end;

end.
