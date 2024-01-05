unit FrameEditorSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WPRTEDefs, WPCTRMemo, WPCTRRich, WPRuler, WPTbar, Buttons,
  WPPanel, Menus;

type
  TfmeEditorSimples = class(TFrame)
    wptFerramentas: TWPToolBar;
    WPReguaHorizontal: TWPRuler;
    wptTexto: TWPRichText;
    popMinuta: TPopupMenu;
    mniMarcacaoDesfazer: TMenuItem;
    mniMarcacaoExcluir: TMenuItem;
    mniRetirarProtecao: TMenuItem;
    AvanarMarcao1: TMenuItem;
    N1: TMenuItem;
    RetornarMarcao1: TMenuItem;
    N2: TMenuItem;
    DicionrioGramatical1: TMenuItem;
    procedure wptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure mniMarcacaoDesfazerClick(Sender: TObject);
    procedure mniMarcacaoExcluirClick(Sender: TObject);
    procedure wptTextoChangeCursorPos(Sender: TObject);
    procedure mniRetirarProtecaoClick(Sender: TObject);
    procedure AvanarMarcao1Click(Sender: TObject);
    procedure RetornarMarcao1Click(Sender: TObject);
    procedure DicionrioGramatical1Click(Sender: TObject);
  private
    { Private declarations }
  public
    vgEditar : Boolean;
  end;

implementation

uses ControleVariaveis, Controles;

{$R *.dfm}

procedure TfmeEditorSimples.wptTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  AtalhosStylo(wptTexto, key);
end;

procedure TfmeEditorSimples.DicionrioGramatical1Click(Sender: TObject);
begin
  Marcacao_Adicionar(wptTexto,'GRAMATICAL');
end;

procedure TfmeEditorSimples.mniMarcacaoDesfazerClick(Sender: TObject);
begin
  if vgEditar then
    Marcacao_Desfazer(wptTexto, vgTipoMarcacao);
end;

procedure TfmeEditorSimples.mniMarcacaoExcluirClick(Sender: TObject);
begin
  if vgEditar then
    Marcacao_Excluir(wptTexto, vgTipoMarcacao);
end;

procedure TfmeEditorSimples.wptTextoChangeCursorPos(Sender: TObject);
begin
  if wptTexto.SelText = '' then
    Marcacao_TipoDescricao(wptTexto);

end;

procedure TfmeEditorSimples.mniRetirarProtecaoClick(Sender: TObject);
begin
  inherited;
  Marcacao_RetirarProtecao(wptTexto);
end;

procedure TfmeEditorSimples.AvanarMarcao1Click(Sender: TObject);
begin
  Marcacao_AvancarRetornar(wptTexto, wptTexto.CPMoveNext);
end;

procedure TfmeEditorSimples.RetornarMarcao1Click(Sender: TObject);
begin
  Marcacao_AvancarRetornar(wptTexto, wptTexto.CPMoveBack);
end;

end.
