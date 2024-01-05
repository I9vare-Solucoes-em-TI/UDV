unit Geral.View.Show.Message;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, cxControls, cxContainer,
  cxEdit, cxLabel, cxGraphics, Vcl.ComCtrls, cxListView, System.Generics.Collections,
  AdvListV;

type
  TTipoItemMessage = (mlDefault, mlAutho, mlNoAutho);
  TTipoMessageDlg = (tmAlert, tmInfo, tmOk, tmError, tmQuestion);

  TMessageItem = record
    Mensagem: string;
    Tipo: TTipoItemMessage;
  end;

  TfrmShowMessage = class(TForm)
    pnlTop: TPanel;
    pnlButton: TPanel;
    btnOk: TcxButton;
    btnCopiar: TcxButton;
    ImageList1: TImageList;
    imgAction: TImage;
    lblCaptionMsg: TcxLabel;
    Bevel1: TBevel;
    btnCancelar: TcxButton;
    rchMessage: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FIdxImagem: Integer;
    function Status: string;
    procedure SetListView(const vpMessageList: TList<TMessageItem>);
  public
    { Public declarations }
    class function ShowMessageDlg(const vpMessageList: TList<TMessageItem>;
      const vpCaption: string;
      const vpTipoMsg: TTipoMessageDlg): Boolean; overload;

    class function ShowMessageDlg(const vpTexto: string;
      const vpCaption: string;
      const vpTipoMsg: TTipoMessageDlg): Boolean; overload;

    class function ShowMessageDlg(const vpTexto: string;
      const vpTipoMsg: TTipoMessageDlg): Boolean; overload;
  end;

implementation

{$R *.dfm}

procedure TfrmShowMessage.btnCopiarClick(Sender: TObject);

begin
  rchMessage.SelectAll;
  rchMessage.CopyToClipboard;

  ShowMessage('Copiado para o Clipboard!');
end;

procedure TfrmShowMessage.FormCreate(Sender: TObject);
begin
  rchMessage.Clear;
end;

procedure TfrmShowMessage.FormShow(Sender: TObject);
begin
  Beep;
end;

class function TfrmShowMessage.ShowMessageDlg(const vpMessageList: TList<TMessageItem>;
  const vpCaption: string;
  const vpTipoMsg: TTipoMessageDlg): Boolean;
var
  viFrmShowMessage: TfrmShowMessage;
begin
  viFrmShowMessage := nil;
  try
    viFrmShowMessage := TfrmShowMessage.Create(nil);
    viFrmShowMessage.FIdxImagem := Ord(vpTipoMsg);
    viFrmShowMessage.SetListView(vpMessageList);

    if vpCaption.IsEmpty then
    begin
      viFrmShowMessage.Caption := 'Tri7 Soluções em TI';
      viFrmShowMessage.lblCaptionMsg.Style.Font.Size := 14;
      viFrmShowMessage.lblCaptionMsg.Caption := viFrmShowMessage.Status;
    end
    else
    begin
      viFrmShowMessage.Caption := viFrmShowMessage.Status;
      viFrmShowMessage.lblCaptionMsg.Style.Font.Size := 11;
      viFrmShowMessage.lblCaptionMsg.Caption := vpCaption;
    end;

    Result := viFrmShowMessage.ShowModal = mrOk;
  finally
    viFrmShowMessage.Release;
  end;
end;

procedure TfrmShowMessage.SetListView(const vpMessageList: TList<TMessageItem>);
var
  viMsg: TMessageItem;
  viItem: TListItem;
begin
  for viMsg in vpMessageList do
  begin
    if viMsg.Tipo = mlAutho then
      rchMessage.SelAttributes.Color := clBlue
    else
    if viMsg.Tipo = mlNoAutho then
      rchMessage.SelAttributes.Color := clRed
    else
      rchMessage.SelAttributes.Color := clBlack;

    rchMessage.SelAttributes.Size  := 10;
    rchMessage.SelAttributes.Style := [];
    rchMessage.SelText := viMsg.Mensagem;
  end;
end;

class function TfrmShowMessage.ShowMessageDlg(const vpTexto: string;
  const vpTipoMsg: TTipoMessageDlg): Boolean;
begin
  Result := TfrmShowMessage.ShowMessageDlg(
    vpTexto,
    EmptyStr,
    vpTipoMsg);
end;

class function TfrmShowMessage.ShowMessageDlg(const vpTexto, vpCaption: string;
  const vpTipoMsg: TTipoMessageDlg): Boolean;
var
  viMessageList: TList<TMessageItem>;
  viMsg: TMessageItem;
begin
  viMessageList := TList<TMessageItem>.Create;

  viMsg.Mensagem := vpTexto;
  viMsg.Tipo := mlDefault;
  viMessageList.Add(viMsg);

  try
    Result := TfrmShowMessage.ShowMessageDlg(
      viMessageList,
      vpCaption,
      vpTipoMsg);
  finally
    FreeAndNil(viMessageList);
  end;
end;

function TfrmShowMessage.Status: string;
begin
  Result := EmptyStr;

  ImageList1.GetBitmap(FIdxImagem, imgAction.Picture.Bitmap);
  btnCancelar.Visible := False;
  btnOk.Caption := 'Ok';

  case FIdxImagem of
    0 : Result := 'Atenção';
    1 : Result := 'Informação';
    2 : Result := 'Confirmação';
    3 : Result := 'Erro';
    4 : begin
          Result := 'Pergunta';
          btnOk.Caption := 'Sim';
          btnCancelar.Visible := True;
        end;
  end;
end;

end.
