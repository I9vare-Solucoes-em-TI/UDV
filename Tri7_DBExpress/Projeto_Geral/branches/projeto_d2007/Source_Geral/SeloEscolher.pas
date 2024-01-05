unit SeloEscolher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, Menus, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxGraphics, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, cxDBEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, cxLookAndFeels;

type
  TfrmSeloEscolher = class(TfrmCadAuxiliar)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cbxTipo: TcxComboBox;
    edtQtd: TcxDBTextEdit;
    edtNumeroFinal: TcxDBTextEdit;
    lcxNumero: TcxLookupComboBox;
    btnConfirmar: TcxButton;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeloEscolher: TfrmSeloEscolher;
  vgSeloPrimeiroNum, vgSeloUltimoNum : Integer;
  vgSeloSigla : String;
  
implementation

uses Rotinas, Controles;

{$R *.dfm}

procedure TfrmSeloEscolher.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  // 
end;

end.
