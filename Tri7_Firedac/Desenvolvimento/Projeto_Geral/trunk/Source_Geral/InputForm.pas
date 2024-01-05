unit InputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  Menus, cxMemo, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver;


type
  TfrmInputForm = class(TForm)
    lblDescricao: TcxLabel;
    btnSelecionar: TcxButton;
    btnCancelar: TcxButton;
    mmoTexto: TcxMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputForm: TfrmInputForm;

implementation

uses Controles;

{$R *.dfm}

end.