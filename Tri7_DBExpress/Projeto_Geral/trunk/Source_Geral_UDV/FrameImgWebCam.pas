unit FrameImgWebCam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, jpeg, ExtCtrls,
  Buttons, ComCtrls, ToolWin, ImgList, cxStyles, cxGraphics, cxEdit,
  cxImage, DB, DBClient, Provider, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer;

type
  TFmeImgWebCam = class(TFrame)
    Panel1: TPanel;
    cxDBVerticalGrid1: TcxDBVerticalGrid;
    cxDBVerticalGrid1DBEditorRow1: TcxDBEditorRow;
    DataSetProvider1: TDataSetProvider;
    sqlImagensDocumentos: TClientDataSet;
    sqlImagensDocumentosNome: TStringField;
    sqlImagensDocumentosImagem: TGraphicField;
    dtsImagensDocumentos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    vgProximaSequencia : String;
    procedure CarregarImagens(vpLocalImagens, vpArquivo : string);
  end;

implementation

uses CapturaFoto;

{$R *.dfm}

{ TFmeImgWebCam }

procedure TFmeImgWebCam.CarregarImagens(vpLocalImagens, vpArquivo : string);
var
  Rec: TSearchRec;
  viDiretorio, viArquivo : string;
begin
  // Carrega as Imagens
  sqlImagensDocumentos.EmptyDataSet;
  if SysUtils.FindFirst(vpLocalImagens+vpArquivo+'?', faAnyFile, Rec) = 0 then
  begin
    repeat
      sqlImagensDocumentos.Insert;
      sqlImagensDocumentosNome.AsString := Rec.Name;
      sqlImagensDocumentosImagem.LoadFromFile(vpLocalImagens+Rec.Name);
      sqlImagensDocumentos.Post;
    until SysUtils.FindNext(Rec) <> 0;
    vgProximaSequencia := IntToStr(StrToInt(copy(sqlImagensDocumentosNome.AsString, pos('spd',sqlImagensDocumentosNome.AsString)+3,2))+1);
    sqlImagensDocumentos.First;
  end
  else vgProximaSequencia := '1';
end;

end.
