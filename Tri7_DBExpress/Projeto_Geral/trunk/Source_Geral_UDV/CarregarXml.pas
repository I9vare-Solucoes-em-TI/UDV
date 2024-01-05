unit CarregarXml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxContainer, cxProgressBar, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  xmldom, XMLIntf, msxmldom, XMLDoc, DBClient, SimpleDS, cxDBLookupComboBox,
  cxLabel, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  cxImageComboBox, cxGridExportLink, ComObj, OleCtrls, SHDocVw,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  cxHyperLinkEdit, UrlMon;

type
  TfrmCarregarXml = class(TForm)
    pnlConvenio: TPanel;
    Panel4: TPanel;
    gridImportar: TcxGrid;
    gridXml: TcxGridDBTableView;
    gridImportarLevel1: TcxGridLevel;
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
    gridXmlidentificacao_pedido: TcxGridDBColumn;
    gridXmlCod_Ato: TcxGridDBColumn;
    gridXmlCod_Selo: TcxGridDBColumn;
    gridXmlTipo_Ato: TcxGridDBColumn;
    gridXmlNome_Civil_Ato: TcxGridDBColumn;
    gridXmlNome_Serventuario: TcxGridDBColumn;
    gridXmlData_Solicitacao: TcxGridDBColumn;
    gridXmlIp: TcxGridDBColumn;
    gridXmlValor_Entrada: TcxGridDBColumn;
    gridXmlEmolumento: TcxGridDBColumn;
    gridXmlTaxa_Judiciario: TcxGridDBColumn;
    gridXmlFundesp_Ato: TcxGridDBColumn;
    cdsXmlvalor_entrada: TCurrencyField;
    cdsXmltaxa_judiciario: TCurrencyField;
    cdsXmlemolumento: TCurrencyField;
    cdsXmlfundesp_ato: TCurrencyField;
    cdsXmlnome_serventuario: TStringField;
    cdsXmlcodigo_selo: TStringField;
    cdsXmlIp: TStringField;
    cdsXmlvalidado: TStringField;
    gridXmlvalidado: TcxGridDBColumn;
    pm1: TPopupMenu;
    ExportarparaExcel1: TMenuItem;
    IdHTTP1: TIdHTTP;
    btnExportar: TcxButton;
    btnXML: TcxButton;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCarregarClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure ExportarparaExcel1Click(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure gridXmlCod_AtoPropertiesStartClick(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function ReformataDataSolicitacao(vfData: String): string;
    procedure CarregarXml;
    procedure AplicarFiltro;

    { Private declarations }
  public
    { Public declarations }
    vlSelo,
    vlCodigoCartorio,
    vlChaveCartorio : string;
    
    procedure GetSeloWeb;

  end;

var
  frmCarregarXml: TfrmCarregarXml;

implementation

uses
  Rotinas, Lookup, Atualizacao, Controles, ExportarSelo;

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

function TfrmCarregarXml.ReformataDataSolicitacao(vfData : String) : string;
begin
  Result := RetornaNumerico(vfData);
  Result := Copy(Result,7,2) + '/' + Copy(Result,5,2) + '/' + Copy(Result,1,4)
end;

procedure TfrmCarregarXml.btnExportarClick(Sender: TObject);
begin
  ExportarparaExcel1Click(nil);
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

  cdsXml.Filtered := False;
end;

procedure TfrmCarregarXml.btnXMLClick(Sender: TObject);
var
  viXML : TStringList;
  viHash,
  viAto : String;
begin
  cdsXml.Filter   := 'validado=''N''';
  cdsXml.Filtered := True;

  if cdsXml.IsEmpty then
  begin
    Application.MessageBox('Não há selos não localizados para a geração do arquivo!', 'Atenção', MB_Ok + MB_ICONWARNING);
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
        viAto := viAto + '<fundesp_do_ato>' + FormatFloat('#0.00',cdsXmlfundesp_ato.AsCurrency) + '</fundesp_do_ato>';
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

        viXML.SaveToFile(SaveDialog1.FileName);

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
     cdsXml.Filtered := False;
     exit;
  end;
  
  cdsXml.Filtered := False;

  ProgressBar1.Position := 0;
  Screen.Cursor := crDefault;
  frmAtualizacao.hide;
  frmAtualizacao.free;
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
    vTipoAto             := vNodeAtoUtilizado.ChildNodes['tipo_de_ato'].text;
    vNomeCivilAto        := vNodeAtoUtilizado.ChildNodes['nome_do_civil_do_ato'].text;
    vNomeServentuario    := vNodeAtoUtilizado.ChildNodes['nome_do_serventuario_que_praticou_ato'].text;
    vDataSolicitacao     := vNodeAtoUtilizado.ChildNodes['data_hora_da_solicitacao'].text;
    vIp                  := vNodeAtoUtilizado.ChildNodes['ip_da_maquina_que_praticou_ato'].text;
    vValorEntrada        := vNodeAtoUtilizado.ChildNodes['valor_de_entrada_do_ato'].text;
    vEmolumentoAto       := vNodeAtoUtilizado.ChildNodes['emolumento_do_ato'].text;
    vTaxaJudiciariaAto   := vNodeAtoUtilizado.ChildNodes['taxa_judiciaria_do_ato'].text;
    vFundespAto          := vNodeAtoUtilizado.ChildNodes['fundesp_do_ato'].text;

    cdsXml.Append;
    cdsXmlidentificacao_pedido.AsString := vIdentificacaoPedido;
    cdsXmlCodigo_selo.AsString          := vCodigoSelo;
    cdsXmlCodigo_ato.AsString           := vCodigoAto;
    cdsXmlTipo_ato.AsString             := vTipoAto;
    cdsXmlNome_Civil_Ato.AsString       := vNomeCivilAto;
    cdsXmlNome_Serventuario.AsString    := vNomeServentuario;
    cdsXmlData_Solicitacao.AsString     := ReformataDataSolicitacao(vDataSolicitacao);
    cdsXmlIp.AsString                   := vIp;
    cdsXmlValor_entrada.AsString        := TrocaPtoPVirg(vValorEntrada);
    cdsXmlemolumento.AsString           := TrocaPtoPVirg(vEmolumentoAto);
    cdsXmltaxa_judiciario.AsString      := TrocaPtoPVirg(vTaxaJudiciariaAto);
    cdsXmlfundesp_ato.AsString          := TrocaPtoPVirg(vFundespAto);
    cdsXmlvalidado.AsString             := 'N';
    cdsXml.Post;

    ProgressBar1.Position := ProgressBar1.Position + 1;
    Application.ProcessMessages; 

    vNodeAtoUtilizado := vNodeAtoUtilizado.NextSibling;
  until vNodeAtoUtilizado = nil;

  cdsXml.EnableControls;
  ProgressBar1.Position := 0;
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
  cdsXml.Filtered := False;
end;

procedure TfrmCarregarXml.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  frmCarregarXml := Nil;
end;

procedure TfrmCarregarXml.FormCreate(Sender: TObject);
begin
  vlCodigoCartorio      := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CODIGO_CARTORIO', 'S');
  vlChaveCartorio       := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CHAVE_SEGURANCA', 'S');
end;

procedure TfrmCarregarXml.GetSeloWeb;
var lURL : String;
lResponse : String;
begin
    cdsXml.First;
    cdsXml.DisableControls;
    while not cdsXml.Eof do
    begin
      vlSelo  := Trim(cdsXmlCodigo_ato.AsString);
      lURL := 'http://extrajudicial.tjgo.jus.br/controle_de_atos_utilizados/verificacao?codigo_selo='+vlSelo;
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
        end;
        
      Except
        cdsXml.Edit;
        cdsXmlvalidado.AsString := 'I';
        cdsXml.Post;
      end;      

      ProgressBar1.Position := cdsXml.RecNo;
      Application.ProcessMessages;
      cdsXml.Next;
    end;
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

procedure TfrmCarregarXml.AplicarFiltro;
var
  viFiltro : String;
begin
  viFiltro := Trim(gridXml.DataController.Filter.FilterText);

  if viFiltro <> '' then
  begin
    cdsXml.Filtered := False;
    cdsXml.Filter   := viFiltro;
    cdsXml.Filtered := True;;
  end
  else
    cdsXml.Filtered := False;
end;

end.
