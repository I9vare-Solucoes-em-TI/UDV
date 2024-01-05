unit MarcacaoTipoAtualizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxImageComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, Provider, SqlExpr, StdCtrls,
  cxButtons, ExtCtrls, cxRadioGroup, cxContainer, cxLabel, ActnMan,
  ActnColorMaps, Menus, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmMarcacaoTipoAtualizar = class(TfrmCadAuxiliar)
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBcodigo: TcxGridDBColumn;
    cxGridBasicaDBNome: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    cxGridBasicaDBGrupo: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    cxGridBasicaDBExiste: TcxGridDBColumn;
    cxGridBasicaDBOperacaoExportacao: TcxGridDBColumn;
    cxGridBasicaDBOperacaoImportacao: TcxGridDBColumn;
    ClientAncestralMARCACAO_TIPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralNOME: TStringField;
    ClientAncestralGRUPO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralSISTEMA_ID: TBCDField;
    ClientAncestralGRUPO_TIPO: TStringField;
    ClientAncestralTIPO_QUALIFICACAO: TStringField;
    ClientAncestralCONDICAO_SQL: TStringField;
    ClientAncestralSEPARADOR_1: TStringField;
    ClientAncestralSEPARADOR_2: TStringField;
    ClientAncestralSEPARADOR_3: TStringField;
    ClientAncestralTIPO_VALOR: TStringField;
    ClientAncestralATUALIZAR: TStringField;
    rdbExportar: TcxRadioButton;
    rdbImportar: TcxRadioButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    XPColorMap1: TXPColorMap;
    ClientAncestralcalc_Existe: TStringField;
    ClientAncestralcalc_Importar: TStringField;
    sqlXmlAtualizador: TClientDataSet;
    FMTBCDField1: TBCDField;
    StringField1: TStringField;
    BlobField1: TBlobField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FMTBCDField2: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    dtsXmlAtualizador: TDataSource;
    sqlXmlAtualizadorcalc_Importar: TStringField;
    sqlXmlAtualizadorcalc_existe: TStringField;
    btnImportar: TcxButton;
    btnExportar: TcxButton;
    btnCarregar: TcxButton;
    procedure rdbExportarClick(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdbImportarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure cxGridBasicaDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarcacaoTipoAtualizar: TfrmMarcacaoTipoAtualizar;

implementation

uses Controles, Rotinas, Lookup;

{$R *.dfm}

procedure TfrmMarcacaoTipoAtualizar.rdbExportarClick(Sender: TObject);
begin
  inherited;
  cxGridBasicaDBTableView1.DataController.DataSource := SourceAncestral;

  ClientAncestral.Active := False;
  DataSetAncestral.ParamByName('SISTEMA_ID').AsBCD := vgId;
  ClientAncestral.Active := True;

  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);
  dtmControles.StartTransaction;
  While not ClientAncestral.Eof do
  begin
    ClientAncestral.Edit;
    ClientAncestralATUALIZAR.AsString := 'N';
    ClientAncestral.Post;
    ClientAncestral.Next;
  end;
  dtmControles.Commit;
  LockWindowUpdate(0);
  ClientAncestral.First;  
  Screen.Cursor := crDefault;

  cxGridBasicaDBOperacaoExportacao.Visible := True;
  cxGridBasicaDBOperacaoImportacao.Visible := False;
  cxGridBasicaDBExiste.Visible             := False;

  btnCarregar.Visible := False;
  btnImportar.Visible := False;
  btnExportar.Visible := True;
end;

procedure TfrmMarcacaoTipoAtualizar.cxLabel1Click(Sender: TObject);
begin
  inherited;
  cxGridBasicaDBTableView1.DataController.Groups.FullExpand;
end;

procedure TfrmMarcacaoTipoAtualizar.cxLabel2Click(Sender: TObject);
begin
  inherited;
  cxGridBasicaDBTableView1.DataController.Groups.FullCollapse;
end;

procedure TfrmMarcacaoTipoAtualizar.FormCreate(Sender: TObject);
begin
  inherited;
  rdbExportarClick(self);
end;

procedure TfrmMarcacaoTipoAtualizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmMarcacaoTipoAtualizar := nil;
end;

procedure TfrmMarcacaoTipoAtualizar.rdbImportarClick(Sender: TObject);
begin
  inherited;
  cxGridBasicaDBTableView1.DataController.DataSource := dtsXmlAtualizador;
  sqlXmlAtualizador.Active := False;
  ClientAncestral.Active   := False;

  cxGridBasicaDBOperacaoExportacao.Visible := False;
  cxGridBasicaDBOperacaoImportacao.Visible := True;
  cxGridBasicaDBExiste.Visible             := True;

  btnCarregar.Visible := True;
  btnImportar.Visible := True;
  btnExportar.Visible := False;
  btnImportar.Enabled := False;
end;

procedure TfrmMarcacaoTipoAtualizar.btnCarregarClick(Sender: TObject);
begin
  inherited;
  sqlXmlAtualizador.LoadFromFile(ExtractFilePath(Application.ExeName)+'XML_MARCACOES.XML');
  sqlXmlAtualizador.Active := True;

  // Carregando Dados Atuais
  ClientAncestral.Active := False;
  DataSetAncestral.ParamByName('SISTEMA_ID').AsBCD := vgId;
  ClientAncestral.Active := True;

  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);
  While not sqlXmlAtualizador.Eof do
  begin
    sqlXmlAtualizador.Edit;
    if ClientAncestral.Locate('NOME', sqlXmlAtualizador.FieldByName('NOME').AsString, [loCaseInsensitive, loPartialKey]) then
    begin
      sqlXmlAtualizador.FieldByName('calc_Existe').AsString := 'S';
      if sqlXmlAtualizador.FieldByName('ATUALIZAR').AsString = 'S' then
           sqlXmlAtualizador.FieldByName('calc_Importar').AsString := 'A'
      else sqlXmlAtualizador.FieldByName('calc_Importar').AsString := 'M';
    end
    else
    begin
      sqlXmlAtualizador.FieldByName('calc_Importar').AsString := 'C';
      sqlXmlAtualizador.FieldByName('calc_Existe').AsString   := 'N';
    end;
    sqlXmlAtualizador.Post;
    sqlXmlAtualizador.Next;
  end;
  LockWindowUpdate(0);
  sqlXmlAtualizador.First;
  Screen.Cursor := crDefault;
  btnImportar.Enabled := True;
end;

procedure TfrmMarcacaoTipoAtualizar.btnExportarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Exportando Dados para Arquivo XML. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ClientAncestral.ApplyUpdates(-1);
  ClientAncestral.SaveToFile(ExtractFilePath(Application.ExeName) + 'XML_MARCACOES.XML', dfXMLUTF8);
  ShowMessage('Arquivo exportado com Sucesso.'+ (ExtractFilePath(Application.ExeName) + 'XML_MARCACOES.XML'));
end;

procedure TfrmMarcacaoTipoAtualizar.cxGridBasicaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if rdbImportar.Checked then
    if AViewInfo.RecordViewInfo.GridRecord.Values[7] = 'A' then //Parâmetro Não Atualizado
      ACanvas.Brush.Color := clGreen
    else
      if AViewInfo.RecordViewInfo.GridRecord.Values[7] = 'C' then //Parâmetro Não Atualizado
        ACanvas.Brush.Color := clRed;
end;

procedure TfrmMarcacaoTipoAtualizar.btnImportarClick(Sender: TObject);
  procedure AtualizarDados;
  begin
    ClientAncestralDESCRICAO.AsString           := sqlXmlAtualizador.FieldByName('DESCRICAO').AsString;
    ClientAncestralTEXTO.AsString               := sqlXmlAtualizador.FieldByName('TEXTO').AsString;
    ClientAncestralNOME.AsString                := sqlXmlAtualizador.FieldByName('NOME').AsString;
    ClientAncestralSITUACAO.AsString            := sqlXmlAtualizador.FieldByName('SITUACAO').AsString;
    ClientAncestralCONDICAO_SQL.AsString        := sqlXmlAtualizador.FieldByName('CONDICAO_SQL').AsString;
    ClientAncestralTIPO_VALOR.AsString          := sqlXmlAtualizador.FieldByName('TIPO_VALOR').AsString;
    ClientAncestralGRUPO.AsString               := sqlXmlAtualizador.FieldByName('GRUPO').AsString;
    ClientAncestralSISTEMA_ID.AsString          := sqlXmlAtualizador.FieldByName('SISTEMA_ID').AsString;
    ClientAncestralSITUACAO.AsString            := sqlXmlAtualizador.FieldByName('SITUACAO').AsString;
    ClientAncestralGRUPO_TIPO.AsString          := sqlXmlAtualizador.FieldByName('GRUPO_TIPO').AsString;
    ClientAncestralTIPO_QUALIFICACAO.AsString   := sqlXmlAtualizador.FieldByName('TIPO_QUALIFICACAO').AsString;
    ClientAncestralSEPARADOR_1.AsString         := sqlXmlAtualizador.FieldByName('SEPARADOR_1').AsString;
    ClientAncestralSEPARADOR_2.AsString         := sqlXmlAtualizador.FieldByName('SEPARADOR_2').AsString;
    ClientAncestralSEPARADOR_3.AsString         := sqlXmlAtualizador.FieldByName('SEPARADOR_3').AsString;
  end;

begin
  inherited;
  if Application.MessageBox('Importar/Atualizar Dados. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlXmlAtualizador.First;
  While not sqlXmlAtualizador.Eof do
  begin
    if sqlXmlAtualizadorcalc_Importar.AsString <> 'M' then
    begin
      if sqlXmlAtualizadorcalc_Importar.AsString = 'A' then
      begin
        // Atualizar
        if ClientAncestral.Locate('MARCACAO_TIPO_ID', sqlXmlAtualizador.FieldByName('MARCACAO_TIPO_ID').AsInteger, [loCaseInsensitive, loPartialKey]) then
        begin
          ClientAncestral.Edit;
          AtualizarDados;
          ClientAncestral.ApplyUpdates(-1);
        end;
      end
      else
      begin
        // Copia, mas primeiro Verifica se a Chave ID ja existe com outra marcação
        ExecutaSqlAuxiliar(' SELECT MARCACAO_TIPO_ID FROM G_MARCACAO_TIPO '+
                           ' WHERE MARCACAO_TIPO_ID = '+ sqlXmlAtualizador.FieldByName('MARCACAO_TIPO_ID').AsString, 0);
        ClientAncestral.Insert;
        if dtmControles.sqlAuxiliar.IsEmpty then
             ClientAncestralMARCACAO_TIPO_ID.AsString   := sqlXmlAtualizador.FieldByName('MARCACAO_TIPO_ID').AsString
        else ClientAncestralMARCACAO_TIPO_ID.AsCurrency := dtmControles.GerarSequencia('G_MARCACAO_TIPO');
        AtualizarDados;
        ClientAncestral.ApplyUpdates(-1);
      end;
    end;
    sqlXmlAtualizador.Next;
  end;
  ShowMessage('Importação efetuada com sucesso!!!');
  btnCancelarClick(self);
end;

end.
