
unit CarregarXml;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  cxFilter, cxEdit, DB, cxDBData, cxContainer,
  cxProgressBar, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  cxButtons, ExtCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, DBClient,
  cxLabel,
  cxGridExportLink, ComObj, OleCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, UrlMon,
  cxTextEdit, cxPC, frxClass, frxDBSet, dxPScxGridLnk,
  cxRadioGroup, dxPSCore, dxPScxCommon, cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxData, cxDataStorage, cxNavigator,
  cxImageComboBox, cxHyperLinkEdit, cxCurrencyEdit, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Buttons, cxGroupBox, SimpleDS;

type
  TfrmCarregarXml = class(TForm)
    pnlConvenio: TPanel;
    Panel4: TPanel;
    ProgressBar1: TcxProgressBar;
    OpenDialog1: TOpenDialog;
    dsXml: TDataSource;
    cdsXml: TClientDataSet;
    XMLDocument1: TXMLDocument;
    cdsXmlidentificacao_pedido: TIntegerField;
    cdsXmlCodigo_ato: TStringField;
    cdsXmlTipo_ato: TStringField;
    cdsXmlNome_Civil_Ato: TStringField;
    cdsXmlData_Solicitacao: TStringField;
    cxBtnFechar: TcxButton;
    btnCarregar: TcxButton;
    btnValidar: TcxButton;
    cdsXmlvalor_entrada: TCurrencyField;
    cdsXmltaxa_judiciario: TCurrencyField;
    cdsXmlemolumento: TCurrencyField;
    cdsXmlfundesp_ato: TCurrencyField;
    cdsXmlnome_serventuario: TStringField;
    cdsXmlcodigo_selo: TStringField;
    cdsXmlIp: TStringField;
    cdsXmlvalidado: TStringField;
    pm1: TPopupMenu;
    ExportarparaExcel1: TMenuItem;
    btnExportar: TcxButton;
    btnXML: TcxButton;
    SaveDialog1: TSaveDialog;
    pgcSelos: TcxPageControl;
    tbcSelosCarregados: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    gridImportar: TcxGrid;
    gridXml: TcxGridDBTableView;
    gridXmlvalidado: TcxGridDBColumn;
    gridXmlidentificacao_pedido: TcxGridDBColumn;
    gridXmlCod_Selo: TcxGridDBColumn;
    gridXmlCod_Ato: TcxGridDBColumn;
    gridXmlTipo_Ato: TcxGridDBColumn;
    gridXmlNome_Civil_Ato: TcxGridDBColumn;
    gridXmlNome_Serventuario: TcxGridDBColumn;
    gridXmlData_Solicitacao: TcxGridDBColumn;
    gridXmlIp: TcxGridDBColumn;
    gridXmlValor_Entrada: TcxGridDBColumn;
    gridXmlEmolumento: TcxGridDBColumn;
    gridXmlTaxa_Judiciario: TcxGridDBColumn;
    gridXmlFundesp_Ato: TcxGridDBColumn;
    gridImportarLevel1: TcxGridLevel;
    cxGridConfrontacao: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableViewTaxa: TcxGridDBColumn;
    cxGridDBTableFundesp: TcxGridDBColumn;
    Panel1: TPanel;
    btnImportar: TcxButton;
    edtNomeArquivoRestaura: TcxTextEdit;
    btnConfrontar: TcxButton;
    ClientSelosTJ: TClientDataSet;
    ClientSelosTJSELO_TJ: TStringField;
    ClientSelosTJSITUACAO: TStringField;
    ClientSelosTJVALIDADO: TStringField;
    ClientSelosTJVALOR_FUNDESP: TCurrencyField;
    ClientSelosTJVALOR_TAXA: TCurrencyField;
    dtsConfrontacao: TDataSource;
    OpenDialog2: TOpenDialog;
    ClientSelosTJDATA_UTILIZACAO: TDateField;
    ClientSelosTJDATA_EXPORTACAO: TDateField;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    btnImprimirProtocolo: TcxButton;
    frxDBProtocolo: TfrxDBDataset;
    frxProtocolo: TfrxReport;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinterDetalhado: TdxGridReportLink;
    rdbRelatorio: TcxRadioButton;
    rdbGrid: TcxRadioButton;
    ClientSelosTJDiferenca_Fundesp: TCurrencyField;
    ClientSelosTJDiferenca_Taxa: TCurrencyField;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableTaxaDiferente: TcxGridDBColumn;
    cxGridDBTablefundespDiferente: TcxGridDBColumn;
    ClientSelosTJDIFFundesp: TStringField;
    ClientSelosTJDIFTaxa: TStringField;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    ClientSelosTJCodigo: TIntegerField;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    ClientSelosTJPROTOCOLO: TStringField;
    chxGrupo: TcxCheckBox;
    cdsXmlordem: TIntegerField;
    cxGridDBTableView1Column9: TcxGridDBColumn;
    cxGridDBTableEmolTJ: TcxGridDBColumn;
    ClientSelosTJEMOLUMENTO_TJ: TCurrencyField;
    ClientSelosTJEMOLUMENTO_XML: TCurrencyField;
    cxGridDBTableEmolXML: TcxGridDBColumn;
    ClientSelosTJDIFEmolumento: TStringField;
    btnValidarAgrupador: TcxButton;
    tabSeloAgrupador: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ClientSeloAgrupador: TClientDataSet;
    ClientSeloAgrupadorselo_agrupador: TStringField;
    dtsSeloAgrupador: TDataSource;
    cdsXmlprotocolo: TIntegerField;
    gridXmlServentia: TcxGridDBColumn;
    cdsXmlServentia: TIntegerField;
    Panel2: TPanel;
    chxFiltroSistema: TCheckBox;
    icxTipoSistema: TcxImageComboBox;
    btnPesquisar: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lcxTipoSelo: TcxLookupComboBox;
    sqlTipoSelo: TI9Query;
    sqlTipoSeloSELO_GRUPO_ID: TBCDField;
    sqlTipoSeloDESCRICAO_COMPLETA: TStringField;
    sqlTipoSeloNUMERO: TBCDField;
    dtsTipoSelo: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCarregarClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure ExportarparaExcel1Click(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure gridXmlCod_AtoPropertiesStartClick(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure CarregarSelosTJ(vpNomeArquivo : string);
    procedure btnConfrontarClick(Sender: TObject);
    procedure btnImprimirProtocoloClick(Sender: TObject);
    procedure chxGrupoClick(Sender: TObject);
    procedure btnValidarAgrupadorClick(Sender: TObject);
    procedure chxFiltroSistemaClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure icxTipoSistemaPropertiesEditValueChanged(Sender: TObject);
  private
    vlSeloVerificado : TStringList;
    function ReformataDataSolicitacao(vfData: String): string;
    procedure CarregarXml;
    procedure AplicarFiltro;
    procedure SetarParametros;
    procedure SaveUFT8(vfValor: String);

    { Private declarations }
  public
    { Public declarations }
    vlSelo,
    vlCodigoCartorio,
    vlChaveCartorio : string;
    
    procedure GetSeloWeb(vpAgrupador : Boolean = False);

  end;

var
  frmCarregarXml: TfrmCarregarXml;

implementation

uses
  Rotinas, Atualizacao, Controles, ExportarSelo, VisualizaRelatorios, Lookup;

{$R *.dfm}

procedure TfrmCarregarXml.btnCarregarClick(Sender: TObject);
begin
  cdsXml.EnableControls;
  if OpenDialog1.Execute then
  begin
    cdsXml.EmptyDataSet;
    btnXML.Enabled := False;
    CarregarXml;
  end;
end;

procedure TfrmCarregarXml.btnConfrontarClick(Sender: TObject);

  procedure VerificarSelosTJ;
  var
    viSeloSigla, viSeloNumero, viSql : String;
  begin
    ClientSelosTJ.First;
    ProgressBar1.Position := 0;
    ProgressBar1.Properties.Max := ClientSelosTJ.RecordCount;
    while not ClientSelosTJ.Eof do
    begin
      if ClientSelosTJSITUACAO.AsString <> '3' then
        ClientSelosTJ.Next
      else
      begin
        viSeloSigla  := Copy(ClientSelosTJSELO_TJ.AsString,1, 17);
        viSeloNumero := Copy(ClientSelosTJSELO_TJ.AsString,18, 6);
        viSql :=  ' SELECT SL.VALOR_TAXA_JUDICIARIA, '+
                  '        SL.VALOR_FUNDESP, '+
                  '        SL.VALOR_EMOLUMENTO, '+
                  '        SL.DATA_EXPORTACAO, '+
                  '        SL.DATA '+
                  ' FROM G_SELO_LIVRO SL '+
                  ' WHERE SL.SIGLA = ' + QuotedStr(viSeloSigla)+
                  ' AND SL.NUMERO = ' + viSeloNumero;
        ExecutaSqlAuxiliar(viSql,0);
        ClientSelosTJ.Edit;
        ClientSelosTJVALOR_FUNDESP.AsCurrency  := dtmControles.sqlAuxiliar.FieldByName('VALOR_FUNDESP').AsCurrency;
        ClientSelosTJVALOR_TAXA.AsCurrency     := dtmControles.sqlAuxiliar.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency;
        ClientSelosTJEMOLUMENTO_TJ.AsCurrency  := dtmControles.sqlAuxiliar.FieldByName('VALOR_EMOLUMENTO').AsCurrency;
        ClientSelosTJDATA_EXPORTACAO.AsVariant := dtmControles.sqlAuxiliar.FieldByName('DATA_EXPORTACAO').AsVariant;
        ClientSelosTJDATA_UTILIZACAO.AsVariant := dtmControles.sqlAuxiliar.FieldByName('DATA').AsVariant;
        ClientSelosTJ.Post;
        ClientSelosTJ.Next;
      end;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      Application.ProcessMessages;
    end;
  end;


begin
  if cdsXml.IsEmpty then
  begin
    Showmessage('Favor Carregar o Arquivo XML de Confrontação!!!');
    exit;
  end;

  ClientSelosTJ.DisableControls;
  cdsXml.DisableControls;
  cdsXml.First;
  ProgressBar1.Position := 0;
  ProgressBar1.Properties.Max := cdsXml.RecordCount;

  while not cdsXml.eof do
  begin
    if ClientSelosTJ.Locate('SELO_TJ', cdsXmlCodigo_ato.AsString, [loCaseInsensitive]) then
    begin
      ClientSelosTJ.Edit;
      ClientSelosTJSITUACAO.AsString := '1';

      // Diferença Fundesp
      if (cdsXmlfundesp_ato.AsCurrency <> ClientSelosTJVALOR_FUNDESP.AsCurrency) then
      begin
        ClientSelosTJDiferenca_Fundesp.AsCurrency := cdsXmlfundesp_ato.AsCurrency;
        ClientSelosTJDIFFundesp.AsString          := 'S';
      end
      else
      begin
        ClientSelosTJDiferenca_Fundesp.AsCurrency := cdsXmlfundesp_ato.AsCurrency;
        ClientSelosTJDIFFundesp.AsString          := 'N';
      end;

      // Diferença Taxa
      if (cdsXmltaxa_judiciario.AsCurrency <> ClientSelosTJVALOR_TAXA.AsCurrency) then
      begin
        ClientSelosTJDiferenca_Taxa.AsCurrency    := cdsXmltaxa_judiciario.AsCurrency;
        ClientSelosTJDIFTaxa.AsString             := 'S';
      end
      else
      begin
        ClientSelosTJDiferenca_Taxa.AsCurrency    := cdsXmltaxa_judiciario.AsCurrency;
        ClientSelosTJDIFTaxa.AsString             := 'N';
      end;

      // Diferença Emolumentos
      if (cdsXmlemolumento.AsCurrency <> ClientSelosTJEMOLUMENTO_TJ.AsCurrency) then
      begin
        ClientSelosTJEMOLUMENTO_XML.AsCurrency   := cdsXmlemolumento.AsCurrency;
        ClientSelosTJDIFEmolumento.AsString      := 'S';
      end
      else
      begin
        ClientSelosTJEMOLUMENTO_XML.AsCurrency   := cdsXmlemolumento.AsCurrency;
        ClientSelosTJDIFEmolumento.AsString      := 'N';
      end;

    end
    else
    begin
      ClientSelosTJ.Append;
      ClientSelosTJSITUACAO.AsString           := '2';
      ClientSelosTJSELO_TJ.AsString            := cdsXmlCodigo_ato.AsString;
      ClientSelosTJDATA_UTILIZACAO.AsDateTime  := cdsXmlData_Solicitacao.AsDateTime;
      ClientSelosTJDiferenca_Fundesp.AsCurrency    := cdsXmlfundesp_ato.AsCurrency;
      ClientSelosTJDiferenca_Taxa.AsCurrency       := cdsXmltaxa_judiciario.AsCurrency;
      ClientSelosTJEMOLUMENTO_XML.AsCurrency   := cdsXmlemolumento.AsCurrency;
    end;

    ClientSelosTJ.Post;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    Application.ProcessMessages;
    cdsXml.Next;
  end;

  VerificarSelosTJ;

  ClientSelosTJ.EnableControls;
  cdsXml.EnableControls;
  ProgressBar1.Position := 0;
end;

function TfrmCarregarXml.ReformataDataSolicitacao(vfData : String) : string;
begin
  Result := RetornaNumerico(vfData);
  Result := Copy(Result,7,2) + '/' + Copy(Result,5,2) + '/' + Copy(Result,1,4)
end;

procedure TfrmCarregarXml.SetarParametros;
begin
  frxProtocolo.Variables.Variables['vgNomeCartorio'] := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));
  frxProtocolo.Variables.Variables['vgLogin']        := QuotedStr(vgLogin);
end;

procedure TfrmCarregarXml.btnExportarClick(Sender: TObject);
begin
  ExportarparaExcel1Click(nil);
end;

procedure TfrmCarregarXml.btnImportarClick(Sender: TObject);
var
  viExtensao : string;
begin
  OpenDialog2.Execute;
  viExtensao := ExtractFileExt(OpenDialog2.FileName);
  if UpperCase(viExtensao) <> '.TXT' then
  begin
    Showmessage('Arquivo inválido!!!');
    exit;
  end;
  edtNomeArquivoRestaura.Text := OpenDialog2.FileName;
  btnConfrontar.Enabled := True;
  CarregarSelosTJ(edtNomeArquivoRestaura.Text);
  ShowMessage('Arquivo Carregado com Sucesso');
end;

procedure TfrmCarregarXml.btnImprimirProtocoloClick(Sender: TObject);
var
  viRelatorio : String;
begin
  if rdbRelatorio.Checked then
  begin
    viRelatorio := dtmControles.BuscarConfig('PRINCIPAL', 'RELATORIO', 'RELATORIO_SELO_CONFRONTACAO', 'S');
    ExibirRelatorio(frxProtocolo, viRelatorio, SetarParametros);
  end
  else dxComponentPrinterDetalhado.Preview(true);
end;

procedure TfrmCarregarXml.btnPesquisarClick(Sender: TObject);
begin
  cdsXml.Filtered := False;
  if icxTipoSistema.ItemIndex <> - 1 then
    cdsXml.Filter   := 'Serventia = '+IntToStr(icxTipoSistema.EditValue);

  if lcxTipoSelo.Text <> '' then
    cdsXml.Filter   := cdsXml.Filter + ' AND TIPO_ATO = '+IntToStr(lcxTipoSelo.EditValue);

  cdsXml.Filtered := True;
end;

procedure TfrmCarregarXml.btnValidarAgrupadorClick(Sender: TObject);
begin
  AplicarFiltro;

  if not cdsXml.IsEmpty then
  begin
    ProgressBar1.Position := 0;
    ProgressBar1.Properties.Max := cdsXml.RecordCount - 1;
    GetSeloWeb(True);
    btnXML.Enabled := True;
  end
  else
    Application.MessageBox('Nenhum registro carregado!', 'Atenção', MB_OK + MB_ICONWARNING);

  if icxTipoSistema.ItemIndex = -1 then
       cdsXml.Filtered := False
  else btnPesquisarClick(Self);
end;

procedure TfrmCarregarXml.btnValidarClick(Sender: TObject);
begin
  AplicarFiltro;

  if not cdsXml.IsEmpty then
  begin
    ProgressBar1.Position := 0;
    ProgressBar1.Properties.Max := cdsXml.RecordCount - 1;
    GetSeloWeb;
    btnXML.Enabled := True;
  end
  else
    Application.MessageBox('Nenhum registro carregado!', 'Atenção', MB_OK + MB_ICONWARNING);

  if icxTipoSistema.ItemIndex = -1 then
    cdsXml.Filtered := False;
end;

Procedure TfrmCarregarXml.SaveUFT8(vfValor : String);
var
  Temp : UTF8String;
  Stream: TStringStream;
begin
  Temp := Utf8Encode(vfValor);
  Stream:= TStringStream. Create;
  try
    Stream.Write (Pointer (Temp) ^, Length (Temp));
    Stream.SaveToFile(SaveDialog1.FileName);
  finally
     Stream. Free;
  end;
end;

procedure TfrmCarregarXml.btnXMLClick(Sender: TObject);
var
  viXML : TStringList;
  viHash,
  viAto : String;
begin
  if icxTipoSistema.ItemIndex <> -1 then
  begin
    cdsXml.Filter := 'Serventia = '+IntToStr(icxTipoSistema.EditValue) + ' AND validado=''N''';
    if lcxTipoSelo.Text <> '' then
      cdsXml.Filter   := cdsXml.Filter + ' AND TIPO_ATO = '+IntToStr(lcxTipoSelo.EditValue);
  end
  else cdsXml.Filter   := 'validado=''N''';
  cdsXml.Filtered := True;

  if cdsXml.IsEmpty then
  begin
    Application.MessageBox('Não há selos não localizados para a geração do arquivo!', 'Atenção', MB_Ok + MB_ICONWARNING);
    if icxTipoSistema.ItemIndex = -1 then
      cdsXml.Filtered := False;
    Abort;
  end;

  SaveDialog1.FileName := 'retorno_selo_eletronico_' + RetornaNumerico(dtmControles.DataHoraBanco(1)) +
                          RetornaNumerico(dtmControles.DataHoraBanco(2))+'.xml';
  if SaveDialog1.Execute then
  begin
    try
      Application.CreateForm(TfrmAtualizacao,frmAtualizacao);

      frmAtualizacao.lblTexto.Caption := 'Gerando XML dos Selos, Aguarde!!!';
      frmAtualizacao.Show;
      Application.ProcessMessages;

      viHash := '';

      Screen.Cursor := crHourGlass;
      gridImportar.Enabled := False;

      cdsXml.DisableControls;

      viXML := TStringList.Create;
      viXML.Add('<selo_eletronico>');
      viXML.Add('<lote_dos_atos>');

      ProgressBar1.Position := 0;
      ProgressBar1.Properties.Max := cdsXml.RecordCount;

      cdsXml.First;
      while not cdsXml.Eof do
      begin
        ProgressBar1.Position := cdsXml.RecNo;
        Application.ProcessMessages;

        viAto := '';
        viAto := viAto + '<ato_utilizado>';
        viAto := viAto + '<identificacao_pedido_na_cgj>' + cdsXmlidentificacao_pedido.AsString + '</identificacao_pedido_na_cgj>';
        viAto := viAto + '<codigo_do_selo>' + cdsXmlcodigo_selo.AsString + '</codigo_do_selo>';
        viAto := viAto + '<codigo_do_ato>' + cdsXmlCodigo_ato.AsString + '</codigo_do_ato>';
        viAto := viAto + '<tipo_de_ato>' + cdsXmlTipo_ato.AsString + '</tipo_de_ato>';
        viAto := viAto + '<nome_do_civil_do_ato>' + UTF8Encode(cdsXmlNome_Civil_Ato.AsString) + '</nome_do_civil_do_ato>';
        viAto := viAto + '<nome_do_serventuario_que_praticou_ato>' + UTF8Encode(cdsXmlnome_serventuario.AsString) + '</nome_do_serventuario_que_praticou_ato>';
        viAto := viAto + '<data_hora_da_solicitacao>' + FormatDateTime('yyyy-mm-dd HH:MM:SS', cdsXmlData_Solicitacao.AsDateTime) + ' UTC</data_hora_da_solicitacao>';
        viAto := viAto + '<ip_da_maquina_que_praticou_ato>' + cdsXmlIp.AsString + '</ip_da_maquina_que_praticou_ato>';
        viAto := viAto + '<valor_de_entrada_do_ato>' + FormatFloat('#0.00',cdsXmlvalor_entrada.AsCurrency) + '</valor_de_entrada_do_ato>';
        viAto := viAto + '<emolumento_do_ato>' + FormatFloat('#0.00',cdsXmlemolumento.AsCurrency) + '</emolumento_do_ato>';
        viAto := viAto + '<taxa_judiciaria_do_ato>' + FormatFloat('#0.00',cdsXmltaxa_judiciario.AsCurrency) + '</taxa_judiciaria_do_ato>';

        if StrToDate(dtmControles.DataHoraBanco(4)) < StrToDate('29/03/2016') then
          viAto := viAto + '<fundesp_do_ato>' + FormatFloat('#0.00',cdsXmlfundesp_ato.AsCurrency) + '</fundesp_do_ato>'
        else
        begin
          viAto := viAto + '<fundos_estaduais_do_ato>' + FormatFloat('#0.00',cdsXmlfundesp_ato.AsCurrency) + '</fundos_estaduais_do_ato>';
          viAto := viAto + '<id_do_ato_isentado></id_do_ato_isentado>';
          viAto := viAto + '<protocolo_do_protesto>' + cdsXmlprotocolo.AsString + '</protocolo_do_protesto>';
        end;

        viAto := viAto + '<assinatura_digital>false</assinatura_digital>';
        viAto := viAto + '</ato_utilizado>';

        viXML.Add(viAto);

        viHash := viHash + viAto;

        cdsXml.Next;
      end;

      if viHash <> '' then
      begin
        viXML.Add('</lote_dos_atos>');

        viHash := viHash + vlCodigoCartorio + vlChaveCartorio;

        viXML.Add('<hash_conferencia_do_arquivo_xml>' + GetHash(viHash) + '</hash_conferencia_do_arquivo_xml>');
        viXML.Add('</selo_eletronico>');

        //viXML.SaveToFile(SaveDialog1.FileName);
        SaveUFT8(viXML.Text);

        ShowMessage('XML gerado com sucesso!!!');
        cdsXml.EmptyDataSet;
      end
      else Application.MessageBox('Nenhum selo selecionado para geração do arquivo!', 'Atenção', MB_Ok + MB_ICONWARNING);

      cdsXml.EnableControls;
      gridImportar.Enabled := True;
      FreeAndNil(viXML);
    except
      cdsXml.EnableControls;
      gridImportar.Enabled := True;
      FreeAndNil(viXML);
      ShowMessage('Erro ao tentar gerar XML. Tente novamente!!!');
    end;
  end
  else
  begin
    if icxTipoSistema.ItemIndex = -1 then
      cdsXml.Filtered := False;
    exit;
  end;

  if icxTipoSistema.ItemIndex = -1 then
    cdsXml.Filtered := False;

  ProgressBar1.Position := 0;
  Screen.Cursor := crDefault;
  frmAtualizacao.hide;
  frmAtualizacao.free;
end;

procedure TfrmCarregarXml.CarregarSelosTJ(vpNomeArquivo: string);
var
  arq     : TextFile;
  vilinha, viTexto : String;
  viSequencia, i : Integer;
  viValorFundos: Currency;

  Function PegandoValorLinha:Variant;
  var
    viPos : Integer;
  begin
    viPos := pos(';', viLinha);
    if viPos > 0 then
         Result := copy(vilinha, 1, viPos-1)
    else Result := vilinha;
    vilinha := copy(vilinha, viPos+1,length(vilinha));
    Application.ProcessMessages;
  end;

  function FormatarData(vpData : string):string;
  var
    viData : String;
  begin
    viData := Copy(vpData, 1, 5) + '/'+ Copy(vpData, 6, 4);
    Result := viData;
  end;

  function FormatarData2(vpData : string):string;
  var
    viData : String;
  begin
    viData := Copy(vpData, 1, 10);
    Result := viData;
  end;

begin
  AssignFile(arq, vpNomeArquivo);
  ClientSelosTJ.EmptyDataSet;

  ClientSelosTJ.DisableControls;
  Reset ( arq );
  viSequencia := 0;
  Screen.Cursor := crHourGlass;
  Readln ( arq, vilinha );
  while not Eof ( arq ) do
  begin
    {inc(viSequencia);
    Readln ( arq, vilinha );
    ClientSelosTJ.Append;
    PegandoValorLinha;
    PegandoValorLinha;
    ClientSelosTJ.FieldByName('SELO_TJ').AsString := PegandoValorLinha;
    ClientSelosTJSITUACAO.AsString := '3';
    ClientSelosTJ.Post;}
    try
      inc(viSequencia);
      Readln ( arq, vilinha );
      viTexto := vilinha;
      ClientSelosTJ.Append;
      PegandoValorLinha;
      PegandoValorLinha;
      ClientSelosTJ.FieldByName('CODIGO').AsInteger         := StrToInt(Trim(copy(PegandoValorLinha,1,4)));
      ClientSelosTJ.FieldByName('SELO_TJ').AsString         := RetornaNumerico(PegandoValorLinha);
      PegandoValorLinha;
      try
        ClientSelosTJ.FieldByName('EMOLUMENTO_TJ').AsCurrency := StrToCurr(RetornaNumericoValor(PegandoValorLinha, True));
      except
        try
          ClientSelosTJ.FieldByName('EMOLUMENTO_TJ').AsCurrency := StrToCurr(RetornaNumericoValor(PegandoValorLinha, True));
        except
          ClientSelosTJ.FieldByName('EMOLUMENTO_TJ').AsCurrency := StrToCurr(RetornaNumericoValor(PegandoValorLinha, True));
        end;
      end;
      ClientSelosTJ.FieldByName('VALOR_TAXA').AsCurrency    := StrToCurr(RetornaNumericoValor(PegandoValorLinha));

{      viValorFundos := 0;
      for i := 1 to 9 do
        viValorFundos := viValorFundos + StrToCurr(RetornaNumericoValor(PegandoValorLinha));
      ClientSelosTJ.FieldByName('VALOR_FUNDESP').AsCurrency := viValorFundos;}

      ClientSelosTJ.FieldByName('VALOR_FUNDESP').AsCurrency := StrToCurr(RetornaNumericoValor(PegandoValorLinha));

//      ClientSelosTJ.FieldByName('DATA_UTILIZACAO').AsString := FormatarData(PegandoValorLinha);
//      ClientSelosTJ.FieldByName('DATA_EXPORTACAO').AsString := FormatarData(PegandoValorLinha);
      ClientSelosTJ.FieldByName('DATA_UTILIZACAO').AsString := PegandoValorLinha;
      ClientSelosTJ.FieldByName('DATA_EXPORTACAO').AsString := FormatarData2(PegandoValorLinha);
      ClientSelosTJSITUACAO.AsString := '3';
      ClientSelosTJ.Post;
    except
      ShowMessage(viTexto);
    end;
  end;
  CloseFile(arq);
  ClientSelosTJ.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmCarregarXml.CarregarXml;
var
  vNodeLoteAtos: IXMLNode;
  vNodeAtoUtilizado: IXMLNode;

  vIdentificacaoPedido: string;
  vCodigoSelo: string;
  vCodigoAto: string;
  vTipoAto: string;
  vNomeCivilAto: string;
  vNomeServentuario: string;
  vIp: string;
  vValorEntrada: string;
  vDataSolicitacao: string;
  vEmolumentoAto: string;
  vTaxaJudiciariaAto: string;
  vFundespAto: string;
  vProtocolo : String;

  viFundespCalculado : Currency;
  viEmolumentoCalculado : Currency;
begin
  XMLDocument1.FileName := OpenDialog1.FileName;
  XMLDocument1.Active   := True;

  vNodeLoteAtos      := XMLDocument1.DocumentElement.ChildNodes.FindNode('lote_dos_atos');

  ProgressBar1.Position := 0;
  ProgressBar1.Properties.Max := vNodeLoteAtos.ChildNodes.Count;

  vNodeLoteAtos.ChildNodes.First;
  vNodeAtoUtilizado := vNodeLoteAtos.ChildNodes['ato_utilizado'];
  vNodeAtoUtilizado.ChildNodes.First;

  cdsXml.DisableControls;

  repeat
    vIdentificacaoPedido := vNodeAtoUtilizado.ChildNodes['identificacao_pedido_na_cgj'].text;
    vCodigoSelo          := vNodeAtoUtilizado.ChildNodes['codigo_do_selo'].text;
    vCodigoAto           := vNodeAtoUtilizado.ChildNodes['codigo_do_ato'].text;

    if vCodigoSelo = '0' then
      vCodigoSelo        := vCodigoAto;

    vTipoAto             := vNodeAtoUtilizado.ChildNodes['tipo_de_ato'].text;
    vNomeCivilAto        := vNodeAtoUtilizado.ChildNodes['nome_do_civil_do_ato'].text;
    vNomeServentuario    := vNodeAtoUtilizado.ChildNodes['nome_do_serventuario_que_praticou_ato'].text;
    vDataSolicitacao     := vNodeAtoUtilizado.ChildNodes['data_hora_da_solicitacao'].text;
    vIp                  := vNodeAtoUtilizado.ChildNodes['ip_da_maquina_que_praticou_ato'].text;
    vValorEntrada        := vNodeAtoUtilizado.ChildNodes['valor_de_entrada_do_ato'].text;
    vEmolumentoAto       := vNodeAtoUtilizado.ChildNodes['emolumento_do_ato'].text;
    vTaxaJudiciariaAto   := vNodeAtoUtilizado.ChildNodes['taxa_judiciaria_do_ato'].text;
    vProtocolo           := vNodeAtoUtilizado.ChildNodes['protocolo_do_protesto'].text;

{    if StrToDate(dtmControles.DataHoraBanco(4)) < StrToDate('29/03/2016') then
         vFundespAto     := vNodeAtoUtilizado.ChildNodes['fundesp_do_ato'].text
    else vFundespAto     := vNodeAtoUtilizado.ChildNodes['fundos_estaduais_do_ato'].text;}

    vFundespAto     := vNodeAtoUtilizado.ChildNodes['fundos_estaduais_do_ato'].text;
    if (vFundespAto <> '') then
    begin
      viFundespCalculado := StrToCurr(vFundespAto);
      if viFundespCalculado > 0 then
      begin
        viEmolumentoCalculado := (viFundespCalculado*100)/39;
        viFundespCalculado    := (viEmolumentoCalculado*0.1);
        vFundespAto           := FormatFloat(',#0.00', viFundespCalculado);
      end;
    end;

    cdsXml.Append;
    cdsXmlidentificacao_pedido.AsString := vIdentificacaoPedido;
    cdsXmlCodigo_selo.AsString          := vCodigoSelo;
    cdsXmlCodigo_ato.AsString           := vCodigoAto;
    cdsXmlTipo_ato.AsString             := vTipoAto;
    cdsXmlServentia.AsInteger           := dtmControles.GetInt(' SELECT TIPO_CARTORIO FROM G_SELO_GRUPO WHERE NUMERO = '+vTipoAto);
    cdsXmlNome_Civil_Ato.AsString       := vNomeCivilAto;
    cdsXmlNome_Serventuario.AsString    := vNomeServentuario;
    cdsXmlData_Solicitacao.AsString     := ReformataDataSolicitacao(vDataSolicitacao);
    cdsXmlIp.AsString                   := vIp;
    cdsXmlValor_entrada.AsString        := TrocaPtoPVirg(vValorEntrada);
    cdsXmlemolumento.AsString           := TrocaPtoPVirg(vEmolumentoAto);
    cdsXmltaxa_judiciario.AsString      := TrocaPtoPVirg(vTaxaJudiciariaAto);
    cdsXmlfundesp_ato.AsString          := TrocaPtoPVirg(vFundespAto);
    cdsXmlprotocolo.AsString            := vProtocolo;
    cdsXmlvalidado.AsString             := 'N';
    if vCodigoSelo = vCodigoAto then
         cdsXmlordem.AsInteger := 0
    else cdsXmlordem.AsInteger := 1;
    cdsXml.Post;

    ProgressBar1.Position := ProgressBar1.Position + 1;
    Application.ProcessMessages;

    vNodeAtoUtilizado := vNodeAtoUtilizado.NextSibling;
  until vNodeAtoUtilizado = nil;

  cdsXml.EnableControls;
  ProgressBar1.Position := 0;
end;


procedure TfrmCarregarXml.chxFiltroSistemaClick(Sender: TObject);
begin
  icxTipoSistema.Enabled   := chxFiltroSistema.Checked;
  lcxTipoSelo.Enabled      := chxFiltroSistema.Checked;
  icxTipoSistema.ItemIndex := -1;
  btnPesquisar.Enabled     := chxFiltroSistema.Checked;

  if not chxFiltroSistema.Checked then
  begin
    icxTipoSistema.ItemIndex := -1;
    cdsXml.Filtered := False;
  end;
end;

procedure TfrmCarregarXml.chxGrupoClick(Sender: TObject);
begin
  cxGridDBTableView1.OptionsView.GroupByBox := chxGrupo.Checked;
end;

procedure TfrmCarregarXml.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCarregarXml.ExportarparaExcel1Click(Sender: TObject);
var
  HandleXLS : Variant;
begin
  AplicarFiltro;
  if not cdsXml.IsEmpty then
  begin
  try
    if not DirectoryExists('C:\Temp') then
      CreateDir('C:\Temp');

    ExportGridToExcel('C:\temp\RelTemp.xls', gridImportar);
    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open('C:\temp\RelTemp.xls');
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;

  end
  else Application.MessageBox('Nenhum registro carregado!', 'Atenção', MB_OK + MB_ICONWARNING);

  if icxTipoSistema.ItemIndex = -1 then
       cdsXml.Filtered := False
  else btnPesquisarClick(Self);
end;

procedure TfrmCarregarXml.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  frmCarregarXml := Nil;
end;

procedure TfrmCarregarXml.FormCreate(Sender: TObject);
begin
  sqlTipoSelo.Connection := dtmControles.DB;

  vlCodigoCartorio         := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CODIGO_CARTORIO', 'S');
  vlChaveCartorio          := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CHAVE_SEGURANCA', 'S');
  pgcSelos.ActivePageIndex := 0;
  dtmLookup.CarregarListaSistemas(icxTipoSistema);
  icxTipoSistema.ItemIndex := -1;
end;

procedure TfrmCarregarXml.GetSeloWeb(vpAgrupador : Boolean = False);
var lURL : String;
    lResponse : String;
    vlValidado : String;
begin
    cdsXml.First;
    cdsXml.DisableControls;

    vlSeloVerificado := TStringList.Create;
    ClientSeloAgrupador.EmptyDataSet;

    while not cdsXml.Eof do
    begin
      if vpAgrupador then
      begin
        if vlSeloVerificado.Values[cdsXmlcodigo_selo.AsString] = '1' then 
        begin
          cdsXml.Edit;
          cdsXmlvalidado.AsString := 'I';
          cdsXml.Post;

          ProgressBar1.Position := cdsXml.RecNo;
          Application.ProcessMessages;        
          cdsXml.Next;
          Continue
        end;
        vlSelo  := Trim(cdsXmlcodigo_selo.AsString);
        vlSeloVerificado.Add(cdsXmlcodigo_selo.AsString+'='+'1');
      end
      else vlSelo  := Trim(cdsXmlCodigo_ato.AsString);


{      lURL := 'http://extrajudicial.tjgo.jus.br/controle_de_atos_utilizados/verificacao?codigo_selo='+vlSelo;
      IdHTTP1.Request.ContentType := 'text/xml';
      IdHTTP1.Request.ContentEncoding := 'utf-8';

      IdHTTP1.Request.Accept := 'text/html, */*';
      IdHTTP1.Request.UserAgent := 'Mozilla/3.0 (compatible; IndyLibrary)';
      IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
      IdHTTP1.HandleRedirects := True;

      try
        lResponse := idHttp1.Get(lURL);

        if pos('class="resultado_consulta_selo"', lResponse) > 0 then
        begin
          cdsXml.Edit;
          cdsXmlvalidado.AsString := 'S';
          cdsXml.Post;
        end
        else
        begin
          if vpAgrupador then
          begin
            ClientSeloAgrupador.Append;
            ClientSeloAgrupadorselo_agrupador.AsString := cdsXmlcodigo_selo.AsString;
            ClientSeloAgrupador.Post;
          end;
        end;

      Except
        cdsXml.Edit;
        cdsXmlvalidado.AsString := 'I';
        cdsXml.Post;
      end;}

      vlValidado := dtmControles.VerificarSeloTJ(vlSelo);
      if (vlValidado = 'S') or (vlValidado = 'I') then
      begin
        cdsXml.Edit;
        cdsXmlvalidado.AsString := vlValidado;
        cdsXml.Post;
      end
      else
      begin
        if vpAgrupador then
        begin
          ClientSeloAgrupador.Append;
          ClientSeloAgrupadorselo_agrupador.AsString := cdsXmlcodigo_selo.AsString;
          ClientSeloAgrupador.Post;
        end;
      end;

      ProgressBar1.Position := cdsXml.RecNo;
      Application.ProcessMessages;
      cdsXml.Next;
    end;

    FreeAndNil(vlSeloVerificado);

    cdsXml.EnableControls;
    Application.MessageBox('Validação concluida!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
end;

procedure TfrmCarregarXml.gridXmlCod_AtoPropertiesStartClick(Sender: TObject);
var viLink: array[0..500] of WideChar;
    viSelo : string;
begin
  try
    viSelo := 'http://extrajudicial.tjgo.jus.br/controle_de_atos_utilizados/verificacao?codigo_selo='+Trim(gridXmlCod_Ato.EditValue);
    StringToWideChar(viSelo, viLink, 500);
    HlinkNavigateString(nil, viLink);
  Except

  end;
end;

procedure TfrmCarregarXml.icxTipoSistemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Tag = 0 then
  begin
    sqlTipoSelo.Active := False;
    if icxTipoSistema.ItemIndex <> -1 then
    begin
      sqlTipoSelo.ParamByName('TIPO_CARTORIO').AsString   := icxTipoSistema.EditValue;
      sqlTipoSelo.Active    := True;
      lcxTipoSelo.enabled   := True;
    end
    else lcxTipoSelo.enabled := False;
    lcxTipoSelo.Clear;
  end;
end;

procedure TfrmCarregarXml.AplicarFiltro;
var
  viFiltro : String;
begin
  viFiltro := Trim(gridXml.DataController.Filter.FilterText);

  if viFiltro <> '' then
  begin
    cdsXml.Filtered := False;
    if icxTipoSistema.ItemIndex <> -1 then
         cdsXml.Filter   := 'Serventia = '+IntToStr(icxTipoSistema.EditValue) + ' and '+ viFiltro
    else cdsXml.Filter   := viFiltro;
    cdsXml.Filtered := True;;
  end
  else
    if icxTipoSistema.ItemIndex = -1 then
      cdsXml.Filtered := False;
end;

end.
