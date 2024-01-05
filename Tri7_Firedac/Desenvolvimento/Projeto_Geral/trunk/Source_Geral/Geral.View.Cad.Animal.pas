unit Geral.View.Cad.Animal;

interface

uses
  Controles,
  cxButtons,
  cxCalendar,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxDBEdit,
  cxDBLookupComboBox,
  cxDBLookupEdit,
  cxDropDownEdit,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxGroupBox,
  cxImage,
  cxImageComboBox,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxLookupEdit,
  cxMaskEdit,
  cxMemo,
  cxNavigator,
  cxStyles,
  cxTextEdit,
  Data.DB,
  Datasnap.DBClient,
  DbxDevartInterBase,
  dxGDIPlusClasses,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  I9Query,
  SimpleDS,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ExtDlgs,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TfrmAnimal = class(TForm)
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    dtsANIMAL: TDataSource;
    imgTitulo: TImage;
    lblInformacao: TcxLabel;
    opdFoto: TOpenPictureDialog;
    Panel4: TPanel;
    Panel6: TPanel;
    PnlInformacao: TPanel;
    tblANIMAL: TFDMemTable;
    pnlPrincipal: TPanel;
    grbDadosPET: TcxGroupBox;
    lblDataNascimento: TcxLabel;
    lbNome: TcxLabel;
    lblSexo: TcxLabel;
    edtNomePET: TcxDBTextEdit;
    edtDataNascimentoPET: TcxDBDateEdit;
    icbSexoPET: TcxDBImageComboBox;
    lblRaca: TcxLabel;
    edtRacaPET: TcxDBTextEdit;
    lblCorPelo: TcxLabel;
    lblPele: TcxLabel;
    edtPelePET: TcxDBTextEdit;
    lblEspecie: TcxLabel;
    BtnCapturarFoto: TcxButton;
    BtnCarregarFoto: TcxButton;
    BtnExcluirFoto: TcxButton;
    lblFoto: TcxLabel;
    edtCorDoPelo: TcxDBTextEdit;
    ImgFoto: TcxImage;
    lcxEspecie: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    tblANIMALANIMAL_ID: TIntegerField;
    tblANIMALNOME: TStringField;
    tblANIMALSEXO: TStringField;
    tblANIMALRACA: TStringField;
    tblANIMALCOR: TStringField;
    tblANIMALSISTEMA_ID: TIntegerField;
    tblANIMALDATA_NASCIMENTO: TDateTimeField;
    tblANIMALOBSERVACAO: TStringField;
    tblANIMALPELE: TStringField;
    tblANIMALREGISTRO_ID: TIntegerField;
    tblANIMALESPECIE_ID: TIntegerField;
    tblANIMALDATA_REGISTRO: TDateTimeField;
    tblANIMALSERVICO_TIPO_ID: TIntegerField;
    tblESPECIE: TFDMemTable;
    DtsESPECIE: TDataSource;
    tblESPECIEESPECIE_ID: TIntegerField;
    tblESPECIEDESCRICAO: TStringField;
    tblESPECIECATEGORIA: TStringField;

    procedure btnCancelarClick(Sender: TObject);
    procedure BtnCapturarFotoClick(Sender: TObject);
    procedure BtnCarregarFotoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure BtnExcluirFotoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    
  private
    vlAnimalId: Integer;

    {$REGION ' Foto '}
    procedure PreencherFoto(
      const vpAnimalId: Integer);

    procedure ExcluirFoto(
      const vpAnimalId: Integer);

    function SalvarFoto(
      const vpAnimalId: Integer): Boolean;

    function NomeFoto(
      const vpAnimalId: Integer): string;
    {$ENDREGION}

    procedure PreencherFormulario(
      const vpAnimalId: Integer);

    procedure ConsultarEspecie;
  public
    class function AbrirCadastroAnimal(
      const vpAnimalId: Integer): Integer;
  end;

implementation

{$R *.dfm}

uses
  Lookup,
  Rotinas,
  Cadastro,
  CapturaFoto,
  CapturaFotoNovo,
  Geral.Model.Ged,
  Geral.Controller.Animal,
  Geral.Model.Animal,
  Geral.Controller.Especie,
  RTD.Model.Ged,
  MensagemUtils;

const
  vcPastaPai = 'Foto_PET';

procedure TfrmAnimal.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAnimal.btnConfirmarClick(Sender: TObject);

  procedure ValidarDados;
  begin
    VerificarPreenchimentoEDT_DB(edtNomePET.Text, 'Nome', edtNomePET);
    VerificarPreenchimentoICX_DB(icbSexoPET.Text, 'Sexo', icbSexoPET);
  end;

begin
  ValidarDados;

  try
    vlAnimalId := TAnimalController.Cadastrar(
      tblANIMAL.FieldByName('ANIMAL_ID').AsInteger,
      tblANIMAL.FieldByName('NOME').AsString,
      TAnimalUtil.EnumeradoSexo(tblANIMAL.FieldByName('SEXO').AsString),
      tblANIMAL.FieldByName('RACA').AsString,
      tblANIMAL.FieldByName('COR').AsString,
      tblANIMAL.FieldByName('SISTEMA_ID').AsInteger,
      tblANIMAL.FieldByName('DATA_NASCIMENTO').AsDateTime,
      tblANIMAL.FieldByName('OBSERVACAO').AsString,
      tblANIMAL.FieldByName('PELE').AsString,
      tblANIMAL.FieldByName('REGISTRO_ID').AsInteger,
      tblANIMAL.FieldByName('ESPECIE_ID').AsInteger,
      tblANIMAL.FieldByName('DATA_REGISTRO').AsDateTime,
      tblANIMAL.FieldByName('SERVICO_TIPO_ID').AsInteger);

  except
  on e: Exception do
    begin
      TMensagemUtils.ExibirMensagemErro(
        'Erro ao cadastrar o animal' + sLineBreak +
        e.Message) ;
      Exit;
    end;
  end;

  try
    SalvarFoto(vlAnimalId);
  except
  on e: Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        'Não foi possível salvar a foto do animal' + sLineBreak +
        'Motivo: ' + e.Message);
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmAnimal.BtnCarregarFotoClick(Sender: TObject);
begin
  if not opdFoto.Execute then
    Exit;

  imgFoto.Picture.LoadFromFile(opdFoto.FileName);
end;

procedure TfrmAnimal.BtnExcluirFotoClick(Sender: TObject);
begin
  if not TMensagemUtils.ExibirMensagemPergunta('Confirma exclusão da Imagem?', False) then
    Exit;

  ExcluirFoto(tblANIMALANIMAL_ID.AsInteger);
end;

procedure TfrmAnimal.PreencherFoto(
  const vpAnimalId: Integer);
const
  CI_IMG_PET = 'ImgPET.jpg';
var
  viGedRtd: TGedRtd;
  viArqTemp: String;
  viArquivo: string;
begin
  if vpAnimalId <= 0 then
    Exit;

  viGedRtd := TGedRtd.Create(TTipoArquivo.tiRegistroPet);
  try
    viArquivo := viGedRtd.CaminhoArquivo(vpAnimalId);

    if not FileExists(viArquivo) then
      Exit;

    viArqTemp := ExtractFilePath(Application.ExeName) + CI_IMG_PET;

    if FileExists(viArqTemp) then
      DeleteFile(PChar(viArqTemp));

    try
      CopyFiles(viArquivo, viArqTemp);
      ImgFoto.Picture.LoadFromFile(viArqTemp);
    finally
      DeleteFile(PChar(viArqTemp));
    end;

  finally
    FreeAndNil(viGedRtd);
  end;
end;

procedure TfrmAnimal.ConsultarEspecie;
var
  viDataSetEspecie: TDataSet;
begin
  tblESPECIE.Open;
  tblESPECIE.EmptyDataSet;

  viDataSetEspecie := nil;
  try
    viDataSetEspecie := TEspecieController.Consultar;

    if viDataSetEspecie.IsEmpty then
      Exit;

    tblESPECIE.BeginBatch;

    viDataSetEspecie.First;
    while not viDataSetEspecie.Eof do
    begin
      tblESPECIE.AppendRecord([
        viDataSetEspecie.FieldByName('ESPECIE_ID').AsInteger,
        viDataSetEspecie.FieldByName('DESCRICAO').AsString,
        viDataSetEspecie.FieldByName('CATEGORIA').AsString]);

      viDataSetEspecie.Next;
    end;

    tblESPECIE.EndBatch;

  finally
    FreeAndNil(viDataSetEspecie);
  end;
end;

procedure TfrmAnimal.BtnCapturarFotoClick(Sender: TObject);
begin
  if frmCapturaFotoNovo = nil then
    Application.CreateForm(TfrmCapturaFotoNovo, frmCapturaFotoNovo);
  try
    frmCapturaFotoNovo.ShowModal;
  finally
    FreeAndNil(frmCapturaFotoNovo);
  end;

  ExcluirFoto(tblANIMALANIMAL_ID.AsInteger);

  if not vgImagemNewCapturada then
    Exit;

  imgFoto.Picture.LoadFromFile(extractFilePath(Application.ExeName)+'ImgFoto.jpg');
end;

class function TfrmAnimal.AbrirCadastroAnimal(
  const vpAnimalId: Integer): Integer;
var
  viFrmAnimal: TFrmAnimal;
begin
  Result := 0;

  viFrmAnimal := nil;
  try
    viFrmAnimal := TFrmAnimal.Create(nil);
    viFrmAnimal.vlAnimalId := vpAnimalId;

    if viFrmAnimal.ShowModal = mrOk then
    begin
      Result := viFrmAnimal.vlAnimalId;
      Exit;
    end;

  finally
    FreeAndNil(viFrmAnimal);
  end;
end;

procedure TfrmAnimal.ExcluirFoto(
  const vpAnimalId: Integer);
var
  viCaminhoArquivo: string;
  viGedRTD: TGedRTD;
begin
  if vpAnimalId <= 0 then
    Exit;

  viGedRTD := TGedRTD.Create(tiRegistroPet);
  try
    viCaminhoArquivo := viGedRTD.CaminhoArquivo(vpAnimalId);

    if FileExists(viCaminhoArquivo) then
      DeleteFile(PChar(viCaminhoArquivo));

    imgFoto.Picture.Assign(nil);

  finally
    FreeAndNil(viGedRTD);
  end;
end;

procedure TfrmAnimal.FormActivate(Sender: TObject);
begin
  edtNomePET.SetFocus;
end;

procedure TfrmAnimal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblANIMAL.Close;
end;

procedure TfrmAnimal.FormShow(Sender: TObject);
begin
  ConsultarEspecie;
  PreencherFormulario(vlAnimalId);
end;

function TfrmAnimal.NomeFoto(
  const vpAnimalId: Integer): string;
begin
  if vpAnimalId <= 0 then
  begin
    Result := '';
    Exit;
  end;

  Result := 'P_' + FormatFloat('000000', vpAnimalId) + '#' + vgImgExt;
end;

procedure TfrmAnimal.PreencherFormulario(
  const vpAnimalId: Integer);
var
  viAnimal: TAnimal;
begin
  tblANIMAL.Open;
  tblANIMAL.EmptyDataSet;

  if vpAnimalId <= 0 then
    Exit;

  viAnimal := nil;
  try
    viAnimal := TAnimalController.Buscar(vlAnimalId);

    if viAnimal = nil then
      Exit;

    tblANIMAL.Edit;
    tblANIMALANIMAL_ID.AsInteger := viAnimal.AnimalId;
    tblANIMALNOME.AsString := viAnimal.Nome;
    tblANIMALSEXO.AsString := TAnimalUtil.ValorSexo(viAnimal.Sexo);
    tblANIMALRACA.AsString := viAnimal.Raca;
    tblANIMALCOR.AsString := viAnimal.Cor;
    tblANIMALSISTEMA_ID.AsInteger := viAnimal.SistemaId;
    tblANIMALDATA_NASCIMENTO.AsDateTime := viAnimal.DataNascimento;
    tblANIMALOBSERVACAO.AsString := viAnimal.Observacao;
    tblANIMALPELE.AsString := viAnimal.Pele;
    tblANIMALREGISTRO_ID.AsInteger := viAnimal.RegistroId;
    tblANIMALESPECIE_ID.AsInteger := viAnimal.EspecieId;
    tblANIMALDATA_REGISTRO.AsDateTime := viAnimal.DataRegistro;
    tblANIMALSERVICO_TIPO_ID.AsInteger := viAnimal.ServicoTipoId;
    tblANIMAL.Post;

  finally
    FreeAndNil(viAnimal);
  end;

  PreencherFoto(tblANIMALANIMAL_ID.AsInteger);
end;

function TfrmAnimal.SalvarFoto(
  const vpAnimalId: Integer): Boolean;
var
  viArquivo: string;
  viGedRtd: TGedRtd;
begin
  Result := False;

  if vpAnimalId <= 0 then
    Exit;

  if imgFoto.Picture = nil then
    Exit;

  viGedRtd := TGedRTD.Create(TTipoArquivo.tiRegistroPET);
  try
    viArquivo := viGedRtd.CaminhoArquivo(vpAnimalId);

    if not DirectoryExists(ExtractFilePath(viArquivo)) then
      ForceDirectories(ExtractFilePath(viArquivo));

    imgFoto.Picture.SaveToFile(viArquivo);
    Result := FileExists(viArquivo);
  finally
    FreeAndNil(viGedRtd);
  end;
end;

end.
