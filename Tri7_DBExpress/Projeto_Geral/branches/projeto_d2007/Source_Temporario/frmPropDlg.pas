//------------------------------------------------------------------------------
//  ImageEN Convert To  & Lossless Transform Demo: 1.0
//------------------------------------------------------------------------------

unit frmPropDlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Buttons,
   ExtCtrls, ImageEnView, ImageEn, ImageEnIO, IEView;
   
type
   TPropertiesDlg = class ( TForm )
      OKBtn: TButton;
      txtFilename: TLabel;
      txtSize: TLabel;
      txtColors: TLabel;
      txtmem: TLabel;
      txtFileType: TLabel;
      txtDPI: TLabel;
    GroupBox1: TGroupBox;
      procedure FormKeyDown ( Sender: TObject;var Key: Word;
         Shift: TShiftState );
      procedure FormCreate ( Sender: TObject );
    procedure OKBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
    { Private declarations }
   public
    { Public declarations }
   end;

var
   PropertiesDlg: TPropertiesDlg;

implementation

{$R *.DFM}

procedure TPropertiesDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  PropertiesDlg := nil;
end;

procedure TPropertiesDlg.FormCreate ( Sender: TObject );
begin
   // permit trapping of escape key
   KeyPreview := True;
end;

procedure TPropertiesDlg.FormKeyDown ( Sender: TObject;var Key: Word;
   Shift: TShiftState );
begin
   if ( Key = vk_Escape ) then Close;
end;

procedure TPropertiesDlg.OKBtnClick(Sender: TObject);
begin
  Close;  
end;

end.

