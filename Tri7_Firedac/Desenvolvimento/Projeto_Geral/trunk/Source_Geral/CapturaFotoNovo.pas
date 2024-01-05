unit CapturaFotoNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ieview, imageenview, Buttons, ComCtrls, ExtCtrls, Menus, hyieutils, hyiedefs, imageenproc,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTrackBar, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxListBox, IniFiles;

type
  TfrmCapturaFotoNovo = class(TForm)
    ImageEnView1: TImageEnView;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    cxButton1: TcxButton;
    SpeedButton1: TSpeedButton;
    cbxManterConfiguracao: TcxCheckBox;
    TrackBar1: TcxTrackBar;
    ListBox1: TcxListBox;
    ComboBox1: TcxComboBox;
    btnCancelar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ImageEnView1MediaFoundationNotify(Sender, MediaFoundationObject: TObject; NotifyType: TIEMediaFountationNotifyType);
    procedure Timer1Timer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TrackBar1PropertiesChange(Sender: TObject);
    procedure ComboBox1PropertiesChange(Sender: TObject);
    procedure cbxManterConfiguracaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    vgGravarConfig: Boolean;
  public
    { Public declarations }
  end;

var
  frmCapturaFotoNovo: TfrmCapturaFotoNovo;
  vgImagemNewCapturada: Boolean;

implementation

uses
  iemmf, Controles;

{$R *.DFM}

procedure TfrmCapturaFotoNovo.FormActivate(Sender: TObject);
var
  viIni: TIniFile;
begin
  viIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    if Trim(viIni.ReadString('Geral','EntradaVideoNOTAS','')) <> '' then
      ComboBox1.ItemIndex := StrToInt(viIni.ReadString('Geral','EntradaVideoNOTAS',''));

    if Trim(viIni.ReadString('Geral','FormatoSuportadoNOTAS','')) <> '' then
      ListBox1.ItemIndex  := StrToInt(viIni.ReadString('Geral','FormatoSuportadoNOTAS',''));

    if Trim(viIni.ReadString('Geral','ZoomExibicaoNOTAS','')) <> '' then
      TrackBar1.Position  := StrToInt(viIni.ReadString('Geral','ZoomExibicaoNOTAS',''));

    if viIni.ReadString('Geral','EntradaVideoNOTAS','') <> '' then
    begin
      ComboBox1.Enabled := False;
      ListBox1.Enabled  := False;
      cbxManterConfiguracao.Checked := True;
    end;
    vgGravarConfig := not cbxManterConfiguracao.Checked;
  finally
    viIni.Free;
  end;
end;

procedure TfrmCapturaFotoNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCapturaFotoNovo := nil;
end;

procedure TfrmCapturaFotoNovo.FormCreate(Sender: TObject);
begin
  with ImageEnView1.IO.MediaFoundationSourceReader do
  begin
    ComboBox1.Properties.Items.Assign(VideoInputs);
    ComboBox1.ItemIndex := 0;
    ComboBox1.Properties.OnChange(Self);
    vgImagemNewCapturada := False;
  end;
end;

procedure TfrmCapturaFotoNovo.btnCancelarClick(Sender: TObject);
begin
  vgImagemNewCapturada := False;
  Close;
end;

procedure TfrmCapturaFotoNovo.cbxManterConfiguracaoClick(Sender: TObject);
var
  viIni: TIniFile;
begin
  if cbxManterConfiguracao.Checked and vgGravarConfig then
  begin
    viIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

    try
      viIni.WriteString('Geral', 'EntradaVideoNOTAS', IntToStr(ComboBox1.ItemIndex));
      viIni.WriteString('Geral', 'FormatoSuportadoNOTAS', IntToStr(ListBox1.ItemIndex));
      viIni.WriteString('Geral', 'ZoomExibicaoNOTAS', IntToStr(TrackBar1.Position));
    finally
      viIni.Free;
    end;
  end
  else if not cbxManterConfiguracao.Checked then
  begin
    ComboBox1.Enabled := True;
    ListBox1.Enabled  := True;
  end;

  vgGravarConfig := True;
end;

procedure TfrmCapturaFotoNovo.ComboBox1PropertiesChange(Sender: TObject);
var
  i: integer;
  mediaType: TIEDictionary;
begin
  if ComboBox1.ItemIndex > -1 then
  begin
    ListBox1.Clear();
    with ImageEnView1.IO.MediaFoundationSourceReader do
    begin
      SetVideoInput(ComboBox1.ItemIndex);
      for i := 0 to GetMediaTypesCount(mmf_VIDEO_STREAM) - 1 do
      begin
        mediaType := GetMediaType(mmf_VIDEO_STREAM, i);
        ListBox1.Items.Add(Format('%d x %d   %.1f fps (min fps: %.1f max fps: %.1f)   %s', [
              mediaType.GetInteger(IEFRAMEWIDTH_DICT_KEY),    // width
              mediaType.GetInteger(IEFRAMEHEIGHT_DICT_KEY),   // height
              mediaType.GetDouble(IEFRAMERATE_DICT_KEY),      // default frame rate
              mediaType.GetDouble(IEFRAMERATEMIN_DICT_KEY),   // minimum frame rate
              mediaType.GetDouble(IEFRAMERATEMAX_DICT_KEY),   // maximum frame rate
              mediaType.GetString(IESUBTYPE_DICT_KEY)         // subtype = color space
              ]));
      end;
    end;
    ListBox1.ItemIndex := 0;
    SpeedButton1.Enabled := true;
  end
  else
    SpeedButton1.Enabled := false;
end;

procedure TfrmCapturaFotoNovo.cxButton1Click(Sender: TObject);
begin
  ImageEnView1.IO.SaveToFile(extractFilePath(Application.ExeName)+'ImgFoto.jpg');
  vgImagemNewCapturada := SpeedButton1.Down;
  Close;
end;

procedure TfrmCapturaFotoNovo.TrackBar1PropertiesChange(Sender: TObject);
begin
  ImageEnView1.Zoom := TrackBar1.Position;
end;

var
  FPS: integer = 0;

procedure TfrmCapturaFotoNovo.ImageEnView1MediaFoundationNotify(Sender, MediaFoundationObject: TObject; NotifyType: TIEMediaFountationNotifyType);
var
  sample: TIEMFReceivedSample;
begin
  sample := ImageEnView1.IO.MediaFoundationSourceReader.GetNextSample();
  try
    if sample.StreamType = mmf_VIDEO_STREAM then
    begin
      sample.DecodeSample(ImageEnView1.IEBitmap);
      ImageEnView1.Update();
    end;
  finally
    sample.Free();
  end;

  inc(FPS);
end;


procedure TfrmCapturaFotoNovo.SpeedButton1Click(Sender: TObject);
begin
  if SpeedButton1.Down then
  begin
    // start capture
    ComboBox1.Enabled := false;
    ListBox1.Enabled  := false;

    ImageEnView1.IO.MediaFoundationSourceReader.SelectMediaType(mmf_VIDEO_STREAM, ListBox1.ItemIndex);

    // auto-rotation (win8 only!)
    ImageEnView1.IO.MediaFoundationSourceReader.VideoProcessor.SetMirror(mfpmHorizontal);
    ImageEnView1.IO.MediaFoundationSourceReader.VideoProcessor.SetRotation(mfprNormal);

    ImageEnView1.IO.MediaFoundationSourceReader.StartCapture();

    // get actual video format (ie MJPEG may be converted to YUY2)
    with ImageEnView1.IO.MediaFoundationSourceReader.GetCurrentMediaType(mmf_VIDEO_STREAM) do
    begin
      Label4.Caption := Format('Actual video format: %d x %d   %.1f fps   %s', [
                GetInteger(IEFRAMEWIDTH_DICT_KEY),    // width
                GetInteger(IEFRAMEHEIGHT_DICT_KEY),   // height
                GetDouble(IEFRAMERATE_DICT_KEY),      // frame rate
                GetString(IESUBTYPE_DICT_KEY)         // subtype = color space
                ]);
    end;
  end
  else
  begin
    // stop capture
    ImageEnView1.IO.MediaFoundationSourceReader.StopCapture();
    Label4.Caption    := '';

    if not cbxManterConfiguracao.Checked then
    begin
      ComboBox1.Enabled := true;
      ListBox1.Enabled  := true;
    end;
  end;
end;

procedure TfrmCapturaFotoNovo.Timer1Timer(Sender: TObject);
begin
  Label3.Caption := Format('%d FPS', [FPS]);
  FPS := 0;
end;

end.
