unit Geral.View.Cad.Animal;

interface

uses
  I9Query,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxLabel, cxGroupBox, DbxDevartInterBase, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxImage, cxDBEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxMemo,
  cxDropDownEdit, cxImageComboBox, cxMaskEdit, cxCalendar, Datasnap.DBClient,
  Controles, SimpleDS, Vcl.ExtDlgs, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxGDIPlusClasses, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAnimal = class(TForm)
    pnlPrincipal: TPanel;
    sqlG_ANIMAL: TI9Query;
    PnlInformacao: TPanel;
    lblInformacao: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
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
    grbProprietarioGuardiao: TcxGroupBox;
    pnlRight: TPanel;
    btnAdicionarGuardiao: TcxButton;
    btnExcluirGuardiao: TcxButton;
    gridGuarda: TcxGrid;
    tvGuarda: TcxGridDBTableView;
    lvGuarda: TcxGridLevel;
    btnCapturaFoto: TcxButton;
    btnCarregarArq: TcxButton;
    btnExcluirFoto: TcxButton;
    lblFoto: TcxLabel;
    dtsG_ANIMAL: TDataSource;
    sqlG_GUARDIAO: TI9Query;
    dtsG_GUARDIAO: TDataSource;
    edtCorDoPelo: TcxDBTextEdit;
    sqlG_GUARDIAOGUARDIAO_ID: TBCDField;
    sqlG_GUARDIAOSISTEMA_ID: TBCDField;
    sqlG_GUARDIAONOME: TStringField;
    sqlG_GUARDIAOCPF: TStringField;
    sqlG_GUARDIAOANIMAL_ID: TBCDField;
    sqlG_GUARDIAOTELEFONE: TStringField;
    sqlG_GUARDIAOREGISTRO_ID: TBCDField;
    tvGuardaNOME: TcxGridDBColumn;
    tvGuardaCPF: TcxGridDBColumn;
    tvGuardaTELEFONE: TcxGridDBColumn;
    opdFoto: TOpenPictureDialog;
    sqlG_ANIMALANIMAL_ID: TBCDField;
    sqlG_ANIMALNOME: TStringField;
    sqlG_ANIMALSEXO: TStringField;
    sqlG_ANIMALRACA: TStringField;
    sqlG_ANIMALSISTEMA_ID: TBCDField;
    sqlG_ANIMALDATA_NASCIMENTO: TSQLTimeStampField;
    sqlG_ANIMALOBSERVACAO: TStringField;
    sqlG_ANIMALPELE: TStringField;
    sqlG_ANIMALREGISTRO_ID: TBCDField;
    sqlG_ANIMALESPECIE_ID: TBCDField;
    sqlG_ANIMALCOR: TStringField;
    imgFoto: TcxImage;
    lcxEspecie: TcxDBLookupComboBox;
    sqlG_GUARDIAOCALC_TELEFONE: TStringField;
    cxLabel1: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnAdicionarGuardiaoClick(Sender: TObject);
    procedure btnExcluirGuardiaoClick(Sender: TObject);
    procedure btnCarregarArqClick(Sender: TObject);
    procedure btnExcluirFotoClick(Sender: TObject);
    procedure btnCapturaFotoClick(Sender: TObject);
    procedure sqlG_GUARDIAOCalcFields(DataSet: TDataSet);
  private
    vlAnimalId: Integer;

    procedure ExcluirFoto;
    procedure CarregarGuardiao;

    function SalvarFoto: Boolean;
    function NomeArquivo: string;

    // TODO: Aproveitar partes dele e remover este método
    procedure MontarTela(vpRegistroId: Currency; vpSistemaId: Integer; vpServicoTipoId: Integer);

  public
    { Public declarations }

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
  RTD.Model.Ged;

const
  vcPastaPai = 'Foto_PET';

procedure TfrmAnimal.btnCancelarClick(Sender: TObject);
begin
  try
    ExcluirFoto;

    ExecutaSqlAuxiliar('DELETE FROM G_GUARDIAO ' +
      ' WHERE ANIMAL_ID =' + sqlG_ANIMALANIMAL_ID.AsString +
      ' AND SISTEMA_ID = ' + sqlG_ANIMALSISTEMA_ID.AsString, 1);

    ExecutaSqlAuxiliar('DELETE FROM G_ANIMAL ' +
      ' WHERE ANIMAL_ID =' + sqlG_ANIMALANIMAL_ID.AsString, 1);
  except on E: Exception do
    begin
      Application.MessageBox(
        PChar('Falha ao excluir [' + E.Message + ']'),
        'Aviso', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  end;

  ModalResult := mrCancel;
  Close;
end;

procedure TfrmAnimal.btnConfirmarClick(Sender: TObject);

  procedure ValidarDados;
  begin
    // Dados do Pet
    VerificarPreenchimentoEDT_DB(edtNomePET.Text, 'Nome', edtNomePET);

    if Trim(icbSexoPET.Text) = '' then
    begin
      Application.MessageBox('Sexo deve ser infomado!', 'Atenção', MB_OK + MB_ICONWARNING);
      icbSexoPET.SetFocus;
      Abort;
    end;

    // Dados dos Guardiões
    if sqlG_GUARDIAO.IsEmpty then
    begin
      Application.MessageBox('Informe um proprietário/guardião para continuar!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
  end;

begin
  ValidarDados;

  dtmControles.StartTransaction;
  try
    vgPessoa.PessoaSelecionada := 0;
    sqlG_ANIMAL.Post;

    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(
        PChar('Falha ao salvar [' + E.Message + ']'),
        'Aviso', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmAnimal.btnCarregarArqClick(Sender: TObject);
begin
  try
    if not opdFoto.Execute then
      Exit;

    imgFoto.Picture.LoadFromFile(opdFoto.FileName);
    ExcluirFoto;

    if not SalvarFoto then
      Application.MessageBox('Não foi possivel salvar a foto!', 'Aviso', MB_OK + MB_ICONINFORMATION);
  except on E: Exception do
    begin
      Application.MessageBox(Pchar('Falha ao ' + SlineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

procedure TfrmAnimal.btnExcluirFotoClick(Sender: TObject);
begin
  if
    Application.MessageBox('Confirma exclusão da Imagem?',
    'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDNO
  then
    Exit;

  imgFoto.Picture.Assign(Nil);
  ExcluirFoto;
end;

procedure TfrmAnimal.CarregarGuardiao;
begin
  sqlG_GUARDIAO.Active := False;
  sqlG_GUARDIAO.ParamByName('ANIMAL_ID').AsCurrency := sqlG_ANIMALANIMAL_ID.AsCurrency;
  sqlG_GUARDIAO.ParamByName('SISTEMA_ID').AsInteger := sqlG_ANIMALSISTEMA_ID.AsInteger;
  sqlG_GUARDIAO.Active := True;
end;

procedure TfrmAnimal.btnCapturaFotoClick(Sender: TObject);
begin
  if dtmControles.BuscarConfig('SERVICO_GERAL','GERAL','HABILITA_TELA_CAPTURA_FOTO','S') = 'S' then
  begin
    if frmCapturaFotoNovo = nil then
      Application.CreateForm(TfrmCapturaFotoNovo, frmCapturaFotoNovo);

    frmCapturaFotoNovo.ShowModal;

    if not vgImagemNewCapturada then
      Exit;
  end
  else
  begin
    if frmCapturaFoto = nil then
      Application.CreateForm(TfrmCapturaFoto, frmCapturaFoto);

    if vgClose then
      frmCapturaFoto.Close
    else
      frmCapturaFoto.ShowModal;

    if not vgImagemCapturada then
      Exit;
  end;

  ExcluirFoto;
  imgFoto.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ImgFoto.jpg');

  if not SalvarFoto then
    Application.MessageBox('Não foi possivel salvar a foto!', 'Aviso', MB_OK + MB_ICONINFORMATION);
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
      Result := viFrmAnimal.sqlG_ANIMALANIMAL_ID.AsInteger;
      Exit;
    end;

  finally
    FreeAndNil(viFrmAnimal);
  end;
end;

procedure TfrmAnimal.btnAdicionarGuardiaoClick(Sender: TObject);
  function IsPessoaCadastrada(vpPessoaId: Integer): Boolean;
  begin
    Result := dtmControles.GetInt('SELECT COUNT(REGISTRO_ID) FROM G_GUARDIAO' +
      ' WHERE REGISTRO_ID = ' + IntToStr(vpPessoaId) +
      ' AND ANIMAL_ID = ' + sqlG_ANIMALANIMAL_ID.AsString  +
      ' AND SISTEMA_ID = ' + sqlG_ANIMALSISTEMA_ID.AsString) > 0;
  end;
begin
  vgPessoa.Selecionar        := True;
  vgPessoa.PessoaSelecionada := 0;
  CadPessoa;

  if vgPessoa.PessoaSelecionada > 0 then
  begin
    if IsPessoaCadastrada(vgPessoa.PessoaSelecionada) then
    begin
      Application.MessageBox('Pessoa já foi adicionada!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      edtNomePET.SetFocus;
      Abort;
    end;

    ExecutaSqlAuxiliar(
      'SELECT NOME, CPF_CNPJ, TELEFONE FROM T_PESSOA ' +
      ' WHERE PESSOA_ID = ' + IntToStr(vgPessoa.PessoaSelecionada), 0);

    dtmControles.StartTransaction;
    try
      CarregarGuardiao;

      sqlG_GUARDIAO.Insert;
      sqlG_GUARDIAOGUARDIAO_ID.AsCurrency := dtmControles.GerarSequencia('G_GUARDIAO');
      sqlG_GUARDIAOSISTEMA_ID.AsInteger   := sqlG_ANIMALSISTEMA_ID.AsInteger;
      sqlG_GUARDIAONOME.AsString          := dtmControles.sqlAuxiliar.FieldByName('NOME').AsString;
      sqlG_GUARDIAOCPF.AsString           := dtmControles.sqlAuxiliar.FieldByName('CPF_CNPJ').AsString;
      sqlG_GUARDIAOANIMAL_ID.AsCurrency   := sqlG_ANIMALANIMAL_ID.AsCurrency;
      sqlG_GUARDIAOTELEFONE.AsString      := RetornaNumerico(dtmControles.sqlAuxiliar.FieldByName('TELEFONE').AsString);
      sqlG_GUARDIAOREGISTRO_ID.AsInteger  := vgPessoa.PessoaSelecionada;
      sqlG_GUARDIAO.Post;

      dtmControles.Commit;

      sqlG_GUARDIAO.Edit;
    except on E: Exception do
      begin
        dtmControles.Rollback;
        Application.MessageBox(
          PChar('Falha ao salvar [' + E.Message + ']'),
          'Aviso', MB_OK + MB_ICONWARNING);
        Abort;
      end;
    end;
    dtmControles.sqlAuxiliar.Active := False;
  end
  else
  begin
    edtNomePET.SetFocus;
    Abort;
  end;
end;

procedure TfrmAnimal.btnExcluirGuardiaoClick(Sender: TObject);
begin
  if sqlG_GUARDIAO.IsEmpty then
    Exit;

  sqlG_GUARDIAO.Delete;
  CarregarGuardiao;
end;

procedure TfrmAnimal.ExcluirFoto;
var
  viCaminhoArquivo: string;
  viGedRTD: TGedRTD;
begin
  viGedRTD := TGedRTD.Create(
    tiRegistroPet);
  try
    viCaminhoArquivo := viGedRTD.CaminhoArquivo(
      sqlG_ANIMALANIMAL_ID.AsInteger);

    if FileExists(viCaminhoArquivo) then
      DeleteFile(viCaminhoArquivo);

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
  sqlG_ANIMAL.Close;
  sqlG_GUARDIAO.Close;
end;

procedure TfrmAnimal.FormCreate(Sender: TObject);
begin
  sqlG_ANIMAL.Connection   := dtmControles.DB;
  sqlG_GUARDIAO.Connection := dtmControles.DB;
end;

procedure TfrmAnimal.MontarTela(
  vpRegistroId: Currency;
  vpSistemaId: Integer;
  vpServicoTipoId: Integer);
{$REGION 'Variáveis'}
var
  viAnimalId: Integer;
{$ENDREGION}

  procedure InserirNovoRegistro;
  {$REGION 'Variáveis'}
  var
    viSql: string;
  {$ENDREGION}
  begin
    viSql :=
      'INSERT INTO G_ANIMAL( ' +
      '  ANIMAL_ID, ' +
      '  SISTEMA_ID, ' +
      '  REGISTRO_ID, ' +
      '  DATA_REGISTRO, ' +
      '  SERVICO_TIPO_ID ' +
      ' ) VALUES ( ' +
      '  :P_ANIMAL_ID, ' +
      '  :P_SISTEMA_ID, ' +
      '  :P_REGISTRO_ID, ' +
      '  :P_DATA_REGISTRO, ' +
      '  :P_SERVICO_TIPO_ID ' +
      ' )';
    ExecutaSqlAuxiliar(viSql, 2);
    try
      viAnimalId := dtmControles.GerarSequencia('G_ANIMAL');
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('P_ANIMAL_ID').AsInteger       := viAnimalId;
        ParamByName('P_SISTEMA_ID').AsInteger      := vpSistemaId;
        ParamByName('P_REGISTRO_ID').AsCurrency    := vpRegistroId;
        ParamByName('P_DATA_REGISTRO').AsString    := dtmControles.DataHoraBanco(5);
        ParamByName('P_SERVICO_TIPO_ID').AsInteger := vpServicoTipoId;

        ExecSQL;
      end;
    finally
      dtmControles.sqlAuxiliar.Active := False;
    end;
  end;
begin
  InserirNovoRegistro;

  sqlG_ANIMAL.Active := False;
  sqlG_ANIMAL.ParamByName('ANIMAL_ID').AsInteger := viAnimalId;
  sqlG_ANIMAL.Active := True;
  sqlG_ANIMAL.Edit;

  vlAnimalId := viAnimalId;
end;

function TfrmAnimal.NomeArquivo: string;
begin
  Result := 'P_' + FormatFloat('000000', sqlG_ANIMALANIMAL_ID.AsInteger) + '#' + vgImgExt;
end;

function TfrmAnimal.SalvarFoto: Boolean;
{$REGION 'Variáveis'}
var
  viPasta,
  viArquivo: string;
{$ENDREGION}
begin
  Result := False;
  viPasta := dtmLookupTab.VerificarPastaImagem(vcPastaPai, sqlG_ANIMALANIMAL_ID.AsInteger);

  if viPasta.IsEmpty then
    Exit;

  viArquivo := viPasta + NomeArquivo;
  imgFoto.Picture.SaveToFile(viArquivo);

  Result := FileExists(viArquivo);
end;

procedure TfrmAnimal.sqlG_GUARDIAOCalcFields(DataSet: TDataSet);
  function MascaraTelefone(vpFone: string): string;
  begin
    case Length(vpFone) of
      8:  Result := Copy(vpFone, 1, 4) + '-' + Copy(vpFone, 5, 4);
      9:  Result := Copy(vpFone, 1, 1) + ' ' + Copy(vpFone, 2, 4) + '-' + Copy(vpFone, 6, 4);
      10: Result := '(' + Copy(vpFone, 1, 2) + ') ' + Copy(vpFone, 3, 4) + '-' + Copy(vpFone, 7, 4);
      11: Result := '(' + Copy(vpFone, 1, 3) + ') ' + Copy(vpFone, 4, 4) + '-' + Copy(vpFone, 8, 4);
      12:
        begin
          if Copy(vpFone, 3, 1) = '9' then
            Result := '(' + Copy(vpFone, 1, 2) + ') ' + Copy(vpFone, 3, 1) + ' ' +
            Copy(vpFone, 4, 4) + '-' + Copy(vpFone, 8, 4)
          else
            Result := '(' + Copy(vpFone, 1, 3) + ') ' + Copy(vpFone, 4, 1) + ' ' +
            Copy(vpFone, 5, 4) + '-' + Copy(vpFone, 9, 4);
        end
    else
      Result := vpFone;
    end;
  end;
begin
  sqlG_GUARDIAOCALC_TELEFONE.AsString := MascaraTelefone(sqlG_GUARDIAOTELEFONE.AsString);
end;

end.
