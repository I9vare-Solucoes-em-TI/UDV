unit ExportarSelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008, ComObj,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxContainer, cxProgressBar, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, DBClient,
  SimpleDS, cxLookupEdit, cxDBLookupEdit, cxPC, cxRadioGroup, cxCheckBox,
  cxImageComboBox, cxLookAndFeels, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  ComCtrls, dxCore, cxDateUtils, cxNavigator, cxMemo, cxGridExportLink,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinDevExpressDarkStyle;

type
  TfrmExportarSelo = class(TForm)
    pnlConvenio: TPanel;
    Panel4: TPanel;
    sqlSelos: TSimpleDataSet;
    dtsSelos: TDataSource;
    sqlSelosNOTA_FISCAL: TStringField;
    sqlSelosNUMERO_AGRUPADOR: TStringField;
    sqlSelosSIGLA: TStringField;
    sqlSelosNUMERO: TFMTBCDField;
    sqlSelosTIPO_ATO: TFMTBCDField;
    sqlSelosAPRESENTANTE: TStringField;
    sqlSelosNOME_COMPLETO: TStringField;
    sqlSelosDATA: TSQLTimeStampField;
    sqlSelosIP_MAQUINA: TStringField;
    sqlSelosVALOR_TOTAL: TFMTBCDField;
    sqlSelosVALOR_EMOLUMENTO: TFMTBCDField;
    sqlSelosVALOR_TAXA_JUDICIARIA: TFMTBCDField;
    sqlSelosVALOR_FUNDESP: TFMTBCDField;
    sqlSeloscal_numero_selo: TStringField;
    SaveDialog1: TSaveDialog;
    gbxPeriodo: TcxPageControl;
    tbcPeriodo: TcxTabSheet;
    cxGroupBox5: TcxGroupBox;
    edtDataInicio: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    cxLabel11: TcxLabel;
    tbcExportados: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    lcxExportacao: TcxLookupComboBox;
    SqlDataExportacao: TSimpleDataSet;
    dtsDataExportacao: TDataSource;
    cxGroupBox3: TcxGroupBox;
    rdbSelosNaoExp: TcxRadioButton;
    rdbSelosTodos: TcxRadioButton;
    rdbSelosExp: TcxRadioButton;
    gbxPesquisaFiltro: TcxGroupBox;
    rdbPeriodoSelecionado: TcxRadioButton;
    rdbPeriodoQualquer: TcxRadioButton;
    sqlSelosCALC_SELECIONADO: TBooleanField;
    sqlSelosSELO_LIVRO_ID: TFMTBCDField;
    SqlDataExportacaoDATA: TSQLTimeStampField;
    SqlDataExportacaoCODIGO_EXPORTACAO: TFMTBCDField;
    btnMarcar: TcxButton;
    btnDesmarcar: TcxButton;
    sqlSelosCALC_EXPORTADO: TBooleanField;
    sqlSelosCODIGO_EXPORTACAO: TFMTBCDField;
    Panel11: TPanel;
    cxLabel10: TcxLabel;
    cxLabel5: TcxLabel;
    Image1: TImage;
    Image2: TImage;
    sqlSelosVALIDADO: TBooleanField;
    pnlPesquisaSistema: TPanel;
    sqlSelosNOME_CORRIGIDO: TStringField;
    PopupMenu1: TPopupMenu;
    actCorrigirNome: TMenuItem;
    cxPageControl1: TcxPageControl;
    tabSelosPesquisados: TcxTabSheet;
    tabSelosEstoque: TcxTabSheet;
    gridExportar: TcxGrid;
    gridSelos: TcxGridDBTableView;
    gridSelosColumn1: TcxGridDBColumn;
    gridSelosEXPORTAR: TcxGridDBColumn;
    gridSelosExportado: TcxGridDBColumn;
    gridSelosNOTA_FISCAL: TcxGridDBColumn;
    gridSelosNUMERO_AGRUPADOR: TcxGridDBColumn;
    gridSelosNUMERO_SELO: TcxGridDBColumn;
    gridSelosTIPO_ATO: TcxGridDBColumn;
    gridSelosDATA: TcxGridDBColumn;
    gridSelosAPRESENTANTE: TcxGridDBColumn;
    gridSelosNOME_COMPLETO: TcxGridDBColumn;
    gridSelosIP_MAQUINA: TcxGridDBColumn;
    gridSelosVALOR_TOTAL: TcxGridDBColumn;
    gridSelosVALOR_EMOLUMENTO: TcxGridDBColumn;
    gridSelosVALOR_TAXA_JUDICIARIA: TcxGridDBColumn;
    gridSelosVALOR_FUNDESP: TcxGridDBColumn;
    gridExportarLevel1: TcxGridLevel;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDDGrupo: TcxGridDBColumn;
    grdBasicaDBTableView1SELO_GRUPO_ID: TcxGridDBColumn;
    grdBasicaDBTableView1TIPO_CARTORIO: TcxGridDBColumn;
    grdBasicaDBTableView1DATA_LOTE: TcxGridDBColumn;
    grdBasicaDBTableView1SIGLA: TcxGridDBColumn;
    grdBasicaDBTableView1CALC_NUMERO_INI: TcxGridDBColumn;
    grdBasicaDBTableView1CALC_NUMERO_FIM: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaDBTableView1NOTA_FISCAL: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    N1: TMenuItem;
    CorrigirTodosPesquisados1: TMenuItem;
    pnlImpressaoTexto: TPanel;
    cxLabel1: TcxLabel;
    icxTipoSistema: TcxImageComboBox;
    lcxTipoSelo: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    sqlTipoSelo: TSimpleDataSet;
    sqlTipoSeloSELO_GRUPO_ID: TFMTBCDField;
    sqlTipoSeloDESCRICAO_COMPLETA: TStringField;
    dtsTipoSelo: TDataSource;
    chxFiltroSistema: TCheckBox;
    sqlTipoSeloNUMERO: TFMTBCDField;
    cxLabel2: TcxLabel;
    lcxLote: TcxLookupComboBox;
    sqlSeloLote: TSimpleDataSet;
    dtsSeloLote: TDataSource;
    sqlSeloLoteSELO_LOTE_ID: TFMTBCDField;
    sqlSeloLoteNOTA_FISCAL: TStringField;
    sqlSeloLoteSELO_GRUPO_ID: TFMTBCDField;
    CorrigirServenturio1: TMenuItem;
    cxBtnFechar: TcxButton;
    btnPesquisar: TcxButton;
    btnXML: TcxButton;
    tbcListaSelos: TcxTabSheet;
    cdsSelos: TClientDataSet;
    cdsSelosNOTA_FISCAL: TStringField;
    cdsSelosNUMERO_AGRUPADOR: TStringField;
    cdsSelosSIGLA: TStringField;
    cdsSelosNUMERO: TFMTBCDField;
    cdsSelosTIPO_ATO: TFMTBCDField;
    cdsSelosAPRESENTANTE: TStringField;
    cdsSelosNOME_COMPLETO: TStringField;
    cdsSelosDATA: TSQLTimeStampField;
    cdsSelosIP_MAQUINA: TStringField;
    cdsSelosVALOR_TOTAL: TFMTBCDField;
    cdsSelosVALOR_EMOLUMENTO: TFMTBCDField;
    cdsSelosVALOR_TAXA_JUDICIARIA: TFMTBCDField;
    cdsSelosVALOR_FUNDESP: TFMTBCDField;
    cdsSeloscal_numero_selo: TStringField;
    cdsSelosCALC_SELECIONADO: TBooleanField;
    cdsSelosSELO_LIVRO_ID: TFMTBCDField;
    cdsSelosCALC_EXPORTADO: TBooleanField;
    cdsSelosCODIGO_EXPORTACAO: TFMTBCDField;
    cdsSelosVALIDADO: TBooleanField;
    cdsSelosNOME_CORRIGIDO: TStringField;
    chxListaSelos: TcxCheckBox;
    N2: TMenuItem;
    ExportarparaExcel1: TMenuItem;
    ProgressBar: TcxProgressBar;
    mmoLista: TcxMemo;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sqlSelosCalcFields(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure rdbSelosNaoExpClick(Sender: TObject);
    procedure rdbSelosTodosClick(Sender: TObject);
    procedure rdbSelosExpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdbPeriodoQualquerClick(Sender: TObject);
    procedure rdbPeriodoSelecionadoClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure actCorrigirNomeClick(Sender: TObject);
    procedure gridSelosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CorrigirTodosPesquisados1Click(Sender: TObject);
    procedure icxTipoSistemaPropertiesEditValueChanged(Sender: TObject);
    procedure chxFiltroSistemaClick(Sender: TObject);
    procedure lcxTipoSeloPropertiesEditValueChanged(Sender: TObject);
    procedure CorrigirServenturio1Click(Sender: TObject);
    procedure gbxPeriodoChange(Sender: TObject);
    procedure chxListaSelosClick(Sender: TObject);
    procedure ExportarparaExcel1Click(Sender: TObject);
  private
    { Private declarations }
    vlCodigoCartorio,
    vlChaveCartorio, vlPermissao_ControleMaster : string;
    procedure MarcarDesmarcar(vpMarcar : Boolean);
  public

  end;

var
  frmExportarSelo: TfrmExportarSelo;

  function GetHash(vfValor : String) : String;

implementation

uses
  Controles, Rotinas, Atualizacao, CHILKATCRYPT2Lib_TLB, Lookup, 
  ValidarPermissaoUsuario;

{$R *.dfm}

function GetHash(vfValor: String): String;
var
  crypt: TChilkatCrypt2;
  success: Integer;
begin
  crypt := TChilkatCrypt2.Create(Application);
  success := crypt.UnlockComponent('Crypt12345678_1060099AVHNG');
  if (success <> 1) then
  begin
    ShowMessage('Hash component failed');
  end;
  crypt.EncodingMode := 'hex';
  crypt.Charset := 'windows-1252';
  crypt.HashAlgorithm := 'sha-1';
  Result := AnsiLowerCase(crypt.HashStringENC(vfValor));
end;

function RitiraCaracterEspecial(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if Valor[i] = '&' then
      Result := Result + 'E'
    else
    if (Valor[i] in ['0'..'9', 'a'..'z', 'A'..'Z', '-', '/', '.', '_', ' ', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�' ,'�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�']) then
       Result := Result + Valor[i];
end;

procedure TfrmExportarSelo.btnXMLClick(Sender: TObject);
var
  viXML : TStringList;
  viHash,
  viAto, viSelos : String;
  viCont, viCodigoExportacao : Integer;

  procedure RegistrarSelosExportados;
  begin
    inc(viCont);
    if viCont = 1 then
         viSelos := cdsSelosSELO_LIVRO_ID.AsString
    else viSelos := viSelos +','+ cdsSelosSELO_LIVRO_ID.AsString;
    cdsSelos.Next;

    if (viCont = 30) or (cdsSelos.Eof) then
    begin
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET DATA_EXPORTACAO = :DATA_EXPORTACAO, '+
                         '                         CODIGO_EXPORTACAO = :CODIGO_EXPORTACAO'+
                         ' WHERE SELO_LIVRO_ID IN ('+ viSelos  +')',2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('DATA_EXPORTACAO').AsString    := dtmControles.DataHoraBanco(5);
        ParamByName('CODIGO_EXPORTACAO').AsInteger := viCodigoExportacao;
        ExecSQL(FALSE);
      end;
      viSelos := '';
      viCont  := 0;
    end;
  end;

  procedure ValidarRegistros;
  begin
    cdsSelos.Filtered := False;
    cdsSelos.DisableControls;
    cdsSelos.First;
    while not cdsSelos.Eof do
    begin
      cdsSelos.Edit;
      cdsSelosVALIDADO.AsBoolean := Rotinas.RetornatQdtPalavras(cdsSelosAPRESENTANTE.AsString) > 1;
      cdsSelos.Post;
      cdsSelos.Next;
    end;

    cdsSelos.Filtered := False;
    cdsSelos.Filter := 'VALIDADO = FALSE';
    cdsSelos.Filtered := True;

    cdsSelos.EnableControls;

    if not cdsSelos.IsEmpty then
    begin
      pnlImpressaoTexto.Visible := True;
      btnXML.enabled            := not cdsSelos.IsEmpty;
      Application.MessageBox('Exporta��o n�o realizada. Existem registros n�o validados!!!', 'Aten��o', MB_Ok + MB_ICONWARNING);
      Abort;
    end
    else
    begin
      cdsSelos.Filtered         := False;
      pnlImpressaoTexto.Visible := False;
    end;
  end;

begin
  ValidarRegistros;

  if cdsSelos.IsEmpty then
  begin
    Application.MessageBox('N�o h� selos carregados para importa��o!', 'Aten��o', MB_Ok + MB_ICONWARNING);
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
      gridExportar.Enabled := False;
      cdsSelos.DisableControls;

      viXML := TStringList.Create;
      viXML.Add('<selo_eletronico>');
      viXML.Add('<lote_dos_atos>');

      ProgressBar.Position := 0;
      ProgressBar.Properties.Max := cdsSelos.RecordCount;

      viCont := 0;
      viCodigoExportacao := dtmControles.GerarSequencia('SELO_CODIGO_EXPORTACAO');
      cdsSelos.First;
      while not cdsSelos.Eof do
      begin
        ProgressBar.Position := cdsSelos.RecNo;
        Application.ProcessMessages;

        if not cdsSelosCALC_SELECIONADO.AsBoolean then
        begin
          cdsSelos.Next;
          Continue;
        end;
        
        viAto := '';
        viAto := viAto + '<ato_utilizado>';
        viAto := viAto + '<identificacao_pedido_na_cgj>' + cdsSelosNOTA_FISCAL.AsString + '</identificacao_pedido_na_cgj>';
        viAto := viAto + '<codigo_do_selo>' + cdsSelosNUMERO_AGRUPADOR.AsString + '</codigo_do_selo>';
        viAto := viAto + '<codigo_do_ato>' + cdsSeloscal_numero_selo.AsString + '</codigo_do_ato>';
        viAto := viAto + '<tipo_de_ato>' + cdsSelosTIPO_ATO.AsString + '</tipo_de_ato>';
        viAto := viAto + '<nome_do_civil_do_ato>' + UTF8Encode(RitiraCaracterEspecial(cdsSelosAPRESENTANTE.AsString)) + '</nome_do_civil_do_ato>';
        viAto := viAto + '<nome_do_serventuario_que_praticou_ato>' + UTF8Encode(RitiraCaracterEspecial(cdsSelosNOME_COMPLETO.AsString)) + '</nome_do_serventuario_que_praticou_ato>';
        viAto := viAto + '<data_hora_da_solicitacao>' + FormatDateTime('yyyy-mm-dd HH:MM:SS', cdsSelosDATA.AsDateTime) + ' UTC</data_hora_da_solicitacao>';
        viAto := viAto + '<ip_da_maquina_que_praticou_ato>' + cdsSelosIP_MAQUINA.AsString + '</ip_da_maquina_que_praticou_ato>';
        viAto := viAto + '<valor_de_entrada_do_ato>' + FormatFloat('#0.00',cdsSelosVALOR_TOTAL.AsCurrency) + '</valor_de_entrada_do_ato>';
        viAto := viAto + '<emolumento_do_ato>' + FormatFloat('#0.00',cdsSelosVALOR_EMOLUMENTO.AsCurrency) + '</emolumento_do_ato>';
        viAto := viAto + '<taxa_judiciaria_do_ato>' + FormatFloat('#0.00',cdsSelosVALOR_TAXA_JUDICIARIA.AsCurrency) + '</taxa_judiciaria_do_ato>';
        viAto := viAto + '<fundesp_do_ato>' + FormatFloat('#0.00',cdsSelosVALOR_FUNDESP.AsCurrency) + '</fundesp_do_ato>';
        viAto := viAto + '<assinatura_digital>false</assinatura_digital>';
        viAto := viAto + '</ato_utilizado>';

        viXML.Add(viAto);

        viHash := viHash + viAto;
        RegistrarSelosExportados;
      end;

      if viHash <> '' then
      begin
        viXML.Add('</lote_dos_atos>');

        viHash := viHash + vlCodigoCartorio + vlChaveCartorio;

        viXML.Add('<hash_conferencia_do_arquivo_xml>' + GetHash(viHash) + '</hash_conferencia_do_arquivo_xml>');
        viXML.Add('</selo_eletronico>');

        viXML.SaveToFile(SaveDialog1.FileName);

        ShowMessage('XML gerado com sucesso!!!');
        cdsSelos.EmptyDataSet;
        SqlDataExportacao.Refresh;
        btnXML.Enabled := False;
        btnMarcar.enabled    := not cdsSelos.IsEmpty;
        btnDesmarcar.enabled := not cdsSelos.IsEmpty;            
      end
      else Application.MessageBox('Nenhum selo selecionado para exporta��o!', 'Aten��o', MB_Ok + MB_ICONWARNING);

      cdsSelos.EnableControls;
      gridExportar.Enabled := True;
      FreeAndNil(viXML);     
    except
      cdsSelos.EnableControls;
      gridExportar.Enabled := True;
      FreeAndNil(viXML);
      ShowMessage('Erro ao tentar gerar XML. Tente novamente!!!');
    end;
  end
  else exit;

  ProgressBar.Position := 0;
  Screen.Cursor := crDefault;
  frmAtualizacao.hide;
  frmAtualizacao.free;
end;

procedure TfrmExportarSelo.chxFiltroSistemaClick(Sender: TObject);
begin
  icxTipoSistema.Enabled := chxFiltroSistema.Checked;

  if not chxFiltroSistema.Checked then
  begin
    icxTipoSistema.ItemIndex := -1;
    lcxTipoSelo.Enabled      := False;
    lcxLote.Enabled          := False;
  end
  else btnPesquisarClick(self);
end;

procedure TfrmExportarSelo.chxListaSelosClick(Sender: TObject);
begin
  if chxListaSelos.Checked then
  begin
    cxGroupBox3.Enabled      := False;
    tbcPeriodo.TabVisible    := False;
    tbcExportados.TabVisible := False;
    tbcListaSelos.TabVisible := True;
    gbxPeriodo.ActivePage    := tbcListaSelos;
  end
  else
  begin
    cxGroupBox3.Enabled      := True;
    tbcPeriodo.TabVisible    := True;
    tbcExportados.TabVisible := True;
    tbcListaSelos.TabVisible := False;
    gbxPeriodo.ActivePage    := tbcPeriodo;
  end;
end;

procedure TfrmExportarSelo.CorrigirServenturio1Click(Sender: TObject);
var
  viUsuarioId, viServentuario : String;
begin
  viUsuarioId := '';
  viUsuarioId := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'SERVENTUARIO_PADRAO', 'S');
  if viUsuarioId = '' then
  begin
    ShowMessage('Verifique a Configura��o do Serventu�rio em "Configura��o/Principal/Cartorio"');
    exit;
  end;

  cdsSelos.First;
  while not cdsSelos.Eof do
  begin
   if cdsSelosNOME_COMPLETO.AsString = '' then
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET USUARIO_ID = '+viUsuarioId+
                         ' WHERE SELO_LIVRO_ID = '+cdsSelosSELO_LIVRO_ID.AsString,1);
    cdsSelos.Next;
  end;
  ShowMessage('Concluido');
  btnPesquisarClick(Self);
end;

procedure TfrmExportarSelo.CorrigirTodosPesquisados1Click(Sender: TObject);
var
  viNome : String;
  viQtdPalavras : Integer;
begin
  viNome := '';
  if not InputQuery('Corrigir Nome Serventu�rio em branco', 'Nome Serventu�rio', viNome) then
    exit;

  cdsSelos.First;
  while not cdsSelos.Eof do
  begin
    viQtdPalavras := Rotinas.RetornatQdtPalavras(cdsSelosAPRESENTANTE.AsString);
    if viQtdPalavras < 2 then
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET APRESENTANTE = '+QuotedStr(cdsSelosAPRESENTANTE.AsString +' '+viNome)+
                         ' WHERE SELO_LIVRO_ID = '+cdsSelosSELO_LIVRO_ID.AsString,1);
    cdsSelos.Next;
  end;
  ShowMessage('Concluido');
end;

procedure TfrmExportarSelo.btnMarcarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  MarcarDesmarcar(True);
  Screen.Cursor := crDefault;
end;

procedure TfrmExportarSelo.btnPesquisarClick(Sender: TObject);
var
  viSql,
  viSeloLista,
  viSeloSigla,
  viSeloNumero : String;
  i : Integer;
  j: Integer;
begin
  ProgressBar.Position := 0;
  cdsSelos.EmptyDataSet;
  cdsSelos.Filtered := False;
  sqlSelos.Close;
  pnlImpressaoTexto.Visible := False;

  cdsSelos.DisableControls;

  viSql := ' SELECT SO.NOTA_FISCAL, '+
           '       SL.SELO_LIVRO_ID, '+
           '       SL.NUMERO_AGRUPADOR, '+
           '       SL.CODIGO_EXPORTACAO, '+
           '       SL.SIGLA, SL.NUMERO, '+
           '       SG.NUMERO AS TIPO_ATO, '+
           '       SL.APRESENTANTE, '+
           '       U.NOME_COMPLETO, '+
           '       SL.DATA, '+
           '       SL.IP_MAQUINA, '+
           '       SL.VALOR_TOTAL, '+
           '       SL.VALOR_EMOLUMENTO, '+
           '       SL.VALOR_TAXA_JUDICIARIA, '+
           '       SL.VALOR_FUNDESP '+
           ' FROM G_SELO_LIVRO SL '+
           ' LEFT JOIN G_SELO_LOTE SO ON '+
           '  SL.SELO_LOTE_ID = SO.SELO_LOTE_ID '+
           ' LEFT JOIN G_SELO_GRUPO SG ON '+
           '  SO.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
           ' LEFT JOIN G_USUARIO U ON '+
           '   SL.USUARIO_ID = U.USUARIO_ID '+
           ' WHERE NOT SG.TIPO_CARTORIO IS NULL ';

  if chxFiltroSistema.Checked then
  begin
    // PESQUISA POR SISTEMA
    if icxTipoSistema.EditValue <> null then
      viSql := viSql + ' AND SG.TIPO_CARTORIO = '+QuotedStr(icxTipoSistema.EditValue);

    // PESQUISA POR TIPO DE SELO
    if lcxTipoSelo.EditValue <> null then
      viSql := viSql + ' AND SG.SELO_GRUPO_ID = '+ IntToStr(lcxTipoSelo.EditValue);

    // PESQUISA POR LOTE
    if lcxLote.EditValue <> null then
      viSql := viSql + ' AND SL.SELO_LOTE_ID = '+ IntToStr(lcxLote.EditValue);
  end;

  if not chxListaSelos.Checked then
  begin
    if (rdbPeriodoSelecionado.Checked) and (not rdbSelosExp.Checked) then
    begin
      VerificarPreenchimentoDTA_TX(edtDataInicio.Text, 'Data In�cio', edtDataInicio);
      VerificarPreenchimentoDTA_TX(edtDataFinal.Text, 'Data Final', edtDataFinal);
      viSql := viSql + ' AND SL.DATA ' + MontarSqlData(edtDataInicio.Date, edtDataFinal.Date)
    end
    else viSql := viSql + ' AND NOT SL.DATA IS NULL';

    if rdbSelosNaoExp.Checked then
      viSql := viSql + ' AND SL.DATA_EXPORTACAO IS NULL '
    else
      if rdbSelosExp.Checked then
      begin
        VerificarPreenchimentoLCX_TX(lcxExportacao.Text, 'Data Exporta��o', lcxExportacao);
        viSql := viSql + ' AND SL.CODIGO_EXPORTACAO = '+ IntToStr(lcxExportacao.EditValue);
      end;

    viSql := viSql + ' ORDER BY SL.NUMERO_AGRUPADOR, TIPO_ATO ';

    sqlSelos.DataSet.CommandText := viSql;
    sqlSelos.Open;

    ProgressBar.Properties.Max := sqlSelos.RecordCount;
    sqlSelos.First;
    while not sqlSelos.Eof do
    begin
      cdsSelos.Append;
      for i := 0 to sqlSelos.FieldCount - 1 do
         cdsSelos.Fields[i].Value := sqlSelos.Fields[i].Value;
      cdsSelos.Post;
      sqlSelos.Next;

      ProgressBar.Position := sqlSelos.RecNo;
      Application.ProcessMessages;
    end;
  end
  else
  begin
    if mmoLista.Text = '' then
    begin
      Application.MessageBox('Nenhum selo informado na lista para pesquisar!', 'Aten��o', MB_OK + MB_ICONWARNING);
      cdsSelos.EnableControls;
      Exit;
    end;

    ProgressBar.Properties.Max := mmoLista.Lines.Count - 1;

    for j := 0 to mmoLista.Lines.Count - 1 do
    begin
      viSeloLista  := Trim(mmoLista.Lines.Strings[j]);
      if viSeloLista <> '' then
      begin
        viSeloLista  := Copy(viSeloLista, Pos('-', viSeloLista) + 1, length(viSeloLista));
        viSeloLista  := RetornaNumerico(viSeloLista);

        viSeloSigla  := Copy(viSeloLista,1, 17);
        viSeloNumero := Copy(viSeloLista,18, 6);

        sqlSelos.Close;
        sqlSelos.DataSet.CommandText := viSql + ' AND SL.SIGLA = ' + QuotedStr(viSeloSigla) +
                                                ' AND SL.NUMERO = ' + viSeloNumero +
                                                ' ORDER BY SL.NUMERO_AGRUPADOR, TIPO_ATO ';;
        sqlSelos.Open;

        sqlSelos.First;
        while not sqlSelos.Eof do
        begin
          cdsSelos.Append;
          for i := 0 to sqlSelos.FieldCount - 1 do
             cdsSelos.Fields[i].Value := sqlSelos.Fields[i].Value;
          cdsSelos.Post;
          sqlSelos.Next;
        end;
      end;

      ProgressBar.Position := j;
      Application.ProcessMessages;
    end;
  end;

  if cdsSelos.IsEmpty then
    Application.MessageBox('Nenhum registro encontrado para o per�odo!', 'Aten��o', MB_OK + MB_ICONWARNING)
  else
    btnMarcarClick(Self);

  cdsSelos.EnableControls;
  ProgressBar.Position := 0;

  btnMarcar.enabled    := not cdsSelos.IsEmpty;
  btnDesmarcar.enabled := not cdsSelos.IsEmpty;
  btnXML.enabled       := not cdsSelos.IsEmpty;
end;

procedure TfrmExportarSelo.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExportarSelo.ExportarparaExcel1Click(Sender: TObject);
var
  HandleXLS : Variant;
begin
  if not cdsSelos.IsEmpty then
  begin
  try
    if not DirectoryExists('C:\Temp') then
      CreateDir('C:\Temp');

    ExportGridToExcel('C:\temp\RelTemp.xls', gridExportar);
    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open('C:\temp\RelTemp.xls');
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;

  end
  else Application.MessageBox('Nenhum registro encontrado para gerar excel!', 'Aten��o', MB_OK + MB_ICONWARNING);


end;

procedure TfrmExportarSelo.actCorrigirNomeClick(Sender: TObject);
var
  viNome : String;
  viQtdPalavras : Integer;
begin
  viNome := cdsSelosAPRESENTANTE.AsString;
  repeat
    if not InputQuery('Corrigir Nome Civil', 'Nome Civil', viNome) then
      exit;

    viQtdPalavras := Rotinas.RetornatQdtPalavras(viNome);
    if viQtdPalavras < 2 then
      Application.MessageBox('Nome Inv�lido!!!', 'Aten��o', MB_Ok + MB_ICONWARNING);

  until (viQtdPalavras >= 2);

  ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET APRESENTANTE = '+QuotedStr(viNome)+
                     ' WHERE SELO_LIVRO_ID = '+cdsSelosSELO_LIVRO_ID.AsString,1);

  cdsSelos.Edit;
  cdsSelosNOME_CORRIGIDO.AsString := viNome;
  cdsSelos.Post;
end;

procedure TfrmExportarSelo.btnDesmarcarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  MarcarDesmarcar(False);
  Screen.Cursor := crDefault;
end;

procedure TfrmExportarSelo.FormActivate(Sender: TObject);
begin
  chxFiltroSistemaClick(Self);
end;

procedure TfrmExportarSelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsSelos.EmptyDataSet;
  SqlDataExportacao.Active := False;
  sqlTipoSelo.Active       := False;

  Action := caFree;
  frmExportarSelo := Nil;
end;

procedure TfrmExportarSelo.FormCreate(Sender: TObject);
begin
  Tag := 1;
  edtDataInicio.Date := StrToDate(dtmControles.DataHoraBanco(4));
  edtDataFinal.Date  := StrToDate(dtmControles.DataHoraBanco(4));

  sqlSelos.Connection          := dtmControles.DB;
  SqlDataExportacao.Connection := dtmControles.DB;
  sqlTipoSelo.Connection       := dtmControles.DB;
  sqlSeloLote.Connection       := dtmControles.DB;
  SqlDataExportacao.Active     := True;
  sqlSeloLote.Active           := True;

  vlCodigoCartorio      := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CODIGO_CARTORIO', 'S');
  vlChaveCartorio       := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CHAVE_SEGURANCA', 'S');

  {Parametros de Permiss�o}
  vlPermissao_ControleMaster := dtmControles.CodPermissao('ESP_ATOCONTROLEMASTER');

  rdbSelosTodos.Enabled := dtmControles.BuscarConfig('SELO', 'EXPORTACAO', 'PERMISSAO_PESQUISA_TODOS', 'S') =  'S';
  rdbSelosExp.Enabled   := dtmControles.BuscarConfig('SELO', 'EXPORTACAO', 'PERMISSAO_PESQUISA_TODOS', 'S') =  'S';

  dtmLookup.CarregarListaSistemas(icxTipoSistema);
  icxTipoSistema.ItemIndex := -1;
  Tag := 0;
end;

procedure TfrmExportarSelo.gbxPeriodoChange(Sender: TObject);
begin
  if gbxPeriodo.ActivePage = tbcExportados then
    if not SqlDataExportacao.Active then
         SqlDataExportacao.Active := True
    else SqlDataExportacao.Refresh;
end;

procedure TfrmExportarSelo.gridSelosCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[0]) <> Null then
  begin
    ACanvas.Brush.Color := clSilver;
    ACanvas.Font.Color  := clOlive;
  end;
end;

procedure TfrmExportarSelo.icxTipoSistemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Tag = 0 then
  begin
    sqlTipoSelo.Active := False;
    if icxTipoSistema.EditValue <> null then
    begin
      sqlTipoSelo.DataSet.ParamByName('TIPO_CARTORIO').AsString := icxTipoSistema.EditValue;
      sqlTipoSelo.Active  := True;
      lcxTipoSelo.enabled := True;
      lcxLote.enabled := True;
    end;

    lcxTipoSelo.Clear;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmExportarSelo.lcxTipoSeloPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (icxTipoSistema.editValue = null) then
    exit;

  if lcxTipoSelo.editValue <> null then
    btnPesquisarClick(self);
end;

procedure TfrmExportarSelo.MarcarDesmarcar(vpMarcar: Boolean);
begin
  cdsSelos.DisableControls;
  cdsSelos.First;
  while not cdsSelos.Eof do
  begin
    cdsSelos.Edit;
    cdsSelosCALC_SELECIONADO.AsBoolean := vpMarcar;
    cdsSelos.Post;
    cdsSelos.Next;
  end;
  cdsSelos.First;
  cdsSelos.EnableControls;
end;

procedure TfrmExportarSelo.rdbPeriodoQualquerClick(Sender: TObject);
begin
  edtDataInicio.Enabled := False;
  edtDataFinal.Enabled  := False;

  edtDataInicio.Clear;
  edtDataFinal.Clear;
end;

procedure TfrmExportarSelo.rdbPeriodoSelecionadoClick(Sender: TObject);
begin
  edtDataInicio.Date := StrToDate(dtmControles.DataHoraBanco(4));
  edtDataFinal.Date  := StrToDate(dtmControles.DataHoraBanco(4));

  edtDataInicio.Enabled := True;
  edtDataFinal.Enabled  := True;
end;

procedure TfrmExportarSelo.rdbSelosExpClick(Sender: TObject);
begin
  if (vgLogin <> 'I937') then
  begin
    if (vlPermissao_ControleMaster[5] = '0') then
      if LiberarPermissaoUsuario('PESQ_TODOS_SELOS')[6] = '0' then
      begin
        rdbSelosNaoExp.Checked := True;
        abort;
      end;
  end;

  gbxPeriodo.ActivePageIndex := 1;
  tbcExportados.TabVisible   := True;
  tbcPeriodo.TabVisible      := False;
  gbxPesquisaFiltro.Enabled      := False;
  rdbPeriodoSelecionado.Enabled  := False;
  rdbPeriodoQualquer.Enabled     := False;
  lcxExportacao.SetFocus;
end;

procedure TfrmExportarSelo.rdbSelosNaoExpClick(Sender: TObject);
begin
  gbxPeriodo.ActivePageIndex     := 0;
  tbcExportados.TabVisible       := False;
  tbcPeriodo.TabVisible          := True;
  gbxPesquisaFiltro.Enabled      := True;
  rdbPeriodoSelecionado.Enabled  := True;
  rdbPeriodoQualquer.Enabled     := True;

  if rdbPeriodoSelecionado.Checked then
    edtDataInicio.SetFocus;
end;

procedure TfrmExportarSelo.rdbSelosTodosClick(Sender: TObject);
begin

  if (vgLogin <> 'I937') then
  begin
    if (vlPermissao_ControleMaster[5] = '0') then
      if LiberarPermissaoUsuario('ESP_PESQ_TODOS_SELOS')[6] = '0' then
      begin
        rdbSelosNaoExp.Checked := True;
        abort;
      end;
  end;

  gbxPeriodo.ActivePageIndex     := 0;
  tbcExportados.TabVisible       := False;
  tbcPeriodo.TabVisible          := True;
  gbxPesquisaFiltro.Enabled      := True;
  rdbPeriodoSelecionado.Enabled  := True;

  if rdbSelosTodos.Checked then
  begin
    rdbPeriodoQualquer.Enabled    := False;
    rdbPeriodoSelecionado.Checked := True;
  end
  else
  begin
    rdbPeriodoQualquer.Enabled    := True;
  end;

  if rdbPeriodoSelecionado.Checked then
    edtDataInicio.SetFocus;
end;

procedure TfrmExportarSelo.sqlSelosCalcFields(DataSet: TDataSet);
begin
  sqlSeloscal_numero_selo.AsString := sqlSelosSIGLA.AsString + RetZeros(sqlSelosNUMERO.AsString,6);
  sqlSelosCALC_EXPORTADO.AsBoolean := NOT sqlSelosCODIGO_EXPORTACAO.IsNull;
end;

end.