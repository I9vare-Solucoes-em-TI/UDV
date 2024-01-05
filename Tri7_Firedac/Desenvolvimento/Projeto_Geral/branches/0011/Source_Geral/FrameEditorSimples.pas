unit FrameEditorSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WPRTEDefs, WPCTRMemo, WPCTRRich, WPRuler, WPTbar, Buttons,
  WPPanel, Menus, ad3Configuration, ad3SpellBase;

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
    N3: TMenuItem;
    AtivarDicionrioPadro1: TMenuItem;
    procedure wptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure mniMarcacaoDesfazerClick(Sender: TObject);
    procedure mniMarcacaoExcluirClick(Sender: TObject);
    procedure wptTextoChangeCursorPos(Sender: TObject);
    procedure mniRetirarProtecaoClick(Sender: TObject);
    procedure AvanarMarcao1Click(Sender: TObject);
    procedure RetornarMarcao1Click(Sender: TObject);
    procedure DicionrioGramatical1Click(Sender: TObject);
    procedure AtivarDicionrioPadro1Click(Sender: TObject);
  private
    { Private declarations }
    FDicionario : Boolean;
  public
    vgEditar : Boolean;

    constructor Create(
      AOwner: TComponent); override;

    destructor Destroy; override;

    procedure AtivarDicionario;
  end;

implementation

uses ControleVariaveis, Controles, WPTAddict;

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

procedure TfmeEditorSimples.AtivarDicionario;
begin
  if FDicionario then
    Exit;
  WPAddict.AddLiveControl (wptTexto);
  FDicionario := True;
end;

procedure TfmeEditorSimples.AtivarDicionrioPadro1Click(Sender: TObject);
begin
  AtivarDicionario;
end;

procedure TfmeEditorSimples.AvanarMarcao1Click(Sender: TObject);
begin
  Marcacao_AvancarRetornar(wptTexto, wptTexto.CPMoveNext);
end;

procedure TfmeEditorSimples.RetornarMarcao1Click(Sender: TObject);
begin
  Marcacao_AvancarRetornar(wptTexto, wptTexto.CPMoveBack);
end;

constructor TfmeEditorSimples.Create(AOwner: TComponent);
begin
  inherited;
  FDicionario := False;
end;

destructor TfmeEditorSimples.Destroy;
begin
  if FDicionario then
    WPAddict.RemoveLiveControl(wptTexto);
  inherited;

end;

end.

