unit ExportarSelo;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxContainer, cxProgressBar, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, DBClient,
  SimpleDS, cxLookupEdit, cxDBLookupEdit, cxPC, cxRadioGroup, cxCheckBox,
  cxImageComboBox;

type
  TfrmExportarSelo = class(TForm)
    pnlConvenio: TPanel;
    Panel4: TPanel;
    sqlSelos: TI9Query;
    dtsSelos: TDataSource;
    sqlSelosNOTA_FISCAL: TStringField;
    sqlSelosNUMERO_AGRUPADOR: TStringField;
    sqlSelosSIGLA: TStringField;
    sqlSelosNUMERO: TBCDField;
    sqlSelosTIPO_ATO: TBCDField;
    sqlSelosAPRESENTANTE: TStringField;
    sqlSelosNOME_COMPLETO: TStringField;
    sqlSelosDATA: TSQLTimeStampField;
    sqlSelosIP_MAQUINA: TStringField;
    sqlSelosVALOR_TOTAL: TBCDField;
    sqlSelosVALOR_EMOLUMENTO: TBCDField;
    sqlSelosVALOR_TAXA_JUDICIARIA: TBCDField;
    sqlSelosVALOR_FUNDESP: TBCDField;
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
    SqlDataExportacao: TI9Query;
    dtsDataExportacao: TDataSource;
    cxGroupBox3: TcxGroupBox;
    rdbSelosNaoExp: TcxRadioButton;
    rdbSelosTodos: TcxRadioButton;
    rdbSelosExp: TcxRadioButton;
    gbxPesquisaFiltro: TcxGroupBox;
    rdbPeriodoSelecionado: TcxRadioButton;
    rdbPeriodoQualquer: TcxRadioButton;
    sqlSelosCALC_SELECIONADO: TBooleanField;
    sqlSelosSELO_LIVRO_ID: TBCDField;
    SqlDataExportacaoDATA: TSQLTimeStampField;
    SqlDataExportacaoCODIGO_EXPORTACAO: TBCDField;
    btnMarcar: TcxButton;
    btnDesmarcar: TcxButton;
    sqlSelosCALC_EXPORTADO: TBooleanField;
    sqlSelosCODIGO_EXPORTACAO: TBCDField;
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
    sqlTipoSelo: TI9Query;
    sqlTipoSeloSELO_GRUPO_ID: TBCDField;
    sqlTipoSeloDESCRICAO_COMPLETA: TStringField;
    dtsTipoSelo: TDataSource;
    chxFiltroSistema: TCheckBox;
    sqlTipoSeloNUMERO: TBCDField;
    cxLabel2: TcxLabel;
    lcxLote: TcxLookupComboBox;
    sqlSeloLote: TI9Query;
    dtsSeloLote: TDataSource;
    sqlSeloLoteSELO_LOTE_ID: TBCDField;
    sqlSeloLoteNOTA_FISCAL: TStringField;
    sqlSeloLoteSELO_GRUPO_ID: TBCDField;
    CorrigirServenturio1: TMenuItem;
    cxBtnFechar: TcxButton;
    btnPesquisar: TcxButton;
    btnXML: TcxButton;
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
  private
    { Private declarations }
    vlCodigoCartorio,
    vlChaveCartorio, vlPermissao_ControleMaster : string;

    function GetHash(vfValor : String) : String;
    procedure MarcarDesmarcar(vpMarcar : Boolean);
  public

  end;

var
  frmExportarSelo: TfrmExportarSelo;

implementation

uses
  Controles, Rotinas, Atualizacao, CHILKATCRYPT2Lib_TLB, Lookup, 
  ValidarPermissaoUsuario;

{$R *.dfm}

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
         viSelos := sqlSelosSELO_LIVRO_ID.AsString
    else viSelos := viSelos +','+ sqlSelosSELO_LIVRO_ID.AsString;
    sqlSelos.Next;    

    if (viCont = 30) or (sqlSelos.Eof) then
    begin
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET DATA_EXPORTACAO = :DATA_EXPORTACAO, '+
                         '                         CODIGO_EXPORTACAO = :CODIGO_EXPORTACAO'+
                         ' WHERE SELO_LIVRO_ID IN ('+ viSelos  +')',2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('DATA_EXPORTACAO').AsString    := dtmControles.DataHoraBanco(5);
        ParamByName('CODIGO_EXPORTACAO').AsInteger := viCodigoExportacao;
        ExecSQL;
      end;
      viSelos := '';
      viCont  := 0;
    end;
  end;

  procedure ValidarRegistros;
  begin
    sqlSelos.Filtered := False;
    sqlSelos.DisableControls;
    sqlSelos.First;
    while not sqlSelos.Eof do
    begin
      sqlSelos.Edit;
      sqlSelosVALIDADO.AsBoolean := Rotinas.RetornatQdtPalavras(sqlSelosAPRESENTANTE.AsString) > 1;
      sqlSelos.Post;
      sqlSelos.Next;
    end;

    sqlSelos.Filtered := False;
    sqlSelos.Filter := 'VALIDADO = FALSE';
    sqlSelos.Filtered := True;

    sqlSelos.EnableControls;

    if not sqlSelos.IsEmpty then
    begin
      pnlImpressaoTexto.Visible := True;
      btnXML.enabled            := not sqlSelos.IsEmpty;
      Application.MessageBox('Importação não realizada. Existem registros não validados!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
      Abort;
    end
    else
    begin
      sqlSelos.Filtered         := False;
      pnlImpressaoTexto.Visible := False;
    end;
  end;

begin

  ValidarRegistros;

  if sqlSelos.IsEmpty then
  begin
    Application.MessageBox('Não há selos carregados para importação!', 'Atenção', MB_Ok + MB_ICONWARNING);
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
      sqlSelos.DisableControls;

      viXML := TStringList.Create;
      viXML.Add('<selo_eletronico>');
      viXML.Add('<lote_dos_atos>');

      viCont := 0;
      viCodigoExportacao := dtmControles.GerarSequencia('SELO_CODIGO_EXPORTACAO');
      sqlSelos.First;
      while not sqlSelos.Eof do
      begin
        if not sqlSelosCALC_SELECIONADO.AsBoolean then
        begin
          sqlSelos.Next;
          Continue;
        end;
        
        viAto := '';
        viAto := viAto + '<ato_utilizado>';
        viAto := viAto + '<identificacao_pedido_na_cgj>' + sqlSelosNOTA_FISCAL.AsString + '</identificacao_pedido_na_cgj>';
        viAto := viAto + '<codigo_do_selo>' + sqlSelosNUMERO_AGRUPADOR.AsString + '</codigo_do_selo>';
        viAto := viAto + '<codigo_do_ato>' + sqlSeloscal_numero_selo.AsString + '</codigo_do_ato>';
        viAto := viAto + '<tipo_de_ato>' + sqlSelosTIPO_ATO.AsString + '</tipo_de_ato>';
        viAto := viAto + '<nome_do_civil_do_ato>' + UTF8Encode(sqlSelosAPRESENTANTE.AsString) + '</nome_do_civil_do_ato>';
        viAto := viAto + '<nome_do_serventuario_que_praticou_ato>' + UTF8Encode(sqlSelosNOME_COMPLETO.AsString) + '</nome_do_serventuario_que_praticou_ato>';
        viAto := viAto + '<data_hora_da_solicitacao>' + FormatDateTime('yyyy-mm-dd HH:MM:SS', sqlSelosDATA.AsDateTime) + ' UTC</data_hora_da_solicitacao>';
        viAto := viAto + '<ip_da_maquina_que_praticou_ato>' + sqlSelosIP_MAQUINA.AsString + '</ip_da_maquina_que_praticou_ato>';
        viAto := viAto + '<valor_de_entrada_do_ato>' + TrocaVirgPPto(sqlSelosVALOR_TOTAL.AsString) + '</valor_de_entrada_do_ato>';
        viAto := viAto + '<emolumento_do_ato>' + TrocaVirgPPto(sqlSelosVALOR_EMOLUMENTO.AsString) + '</emolumento_do_ato>';
        viAto := viAto + '<taxa_judiciaria_do_ato>' + TrocaVirgPPto(sqlSelosVALOR_TAXA_JUDICIARIA.AsString) + '</taxa_judiciaria_do_ato>';
        viAto := viAto + '<fundesp_do_ato>' + TrocaVirgPPto(sqlSelosVALOR_FUNDESP.AsString) + '</fundesp_do_ato>';
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
        sqlSelos.Active := False;        
        btnXML.Enabled := False;
        btnMarcar.enabled    := not sqlSelos.IsEmpty;
        btnDesmarcar.enabled := not sqlSelos.IsEmpty;            
      end
      else Application.MessageBox('Nenhum selo selecionado para importação!', 'Atenção', MB_Ok + MB_ICONWARNING);

      sqlSelos.EnableControls;
      gridExportar.Enabled := True;
      FreeAndNil(viXML);     
    except
      sqlSelos.EnableControls;
      gridExportar.Enabled := True;
      FreeAndNil(viXML);
      ShowMessage('Erro ao tentar gerar XML. Tente novamente!!!');
    end;
  end
  else exit;

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

procedure TfrmExportarSelo.CorrigirServenturio1Click(Sender: TObject);
var
  viUsuarioId, viServentuario : String;
begin
  viUsuarioId := '';
  viUsuarioId := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'SERVENTUARIO_PADRAO', 'S');
  if viUsuarioId = '' then
  begin
    ShowMessage('Verifique a Configuração do Serventuário em "Configuração/Principal/Cartorio"');
    exit;
  end;

  sqlSelos.First;
  while not sqlSelos.Eof do
  begin
   if sqlSelosNOME_COMPLETO.AsString = '' then
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET USUARIO_ID = '+viUsuarioId+
                         ' WHERE SELO_LIVRO_ID = '+sqlSelosSELO_LIVRO_ID.AsString,1);
    sqlSelos.Next;
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
  if not InputQuery('Corrigir Nome Serventuário em branco', 'Nome Serventuário', viNome) then
    exit;

  sqlSelos.First;
  while not sqlSelos.Eof do
  begin
    viQtdPalavras := Rotinas.RetornatQdtPalavras(sqlSelosAPRESENTANTE.AsString);
    if viQtdPalavras < 2 then
      ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET APRESENTANTE = '+QuotedStr(sqlSelosAPRESENTANTE.AsString +' '+viNome)+
                         ' WHERE SELO_LIVRO_ID = '+sqlSelosSELO_LIVRO_ID.AsString,1);
    sqlSelos.Next;
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
  viSql : String;
begin
  sqlSelos.Close;
  sqlSelos.Filtered := False;
  pnlImpressaoTexto.Visible := False;

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
           ' INNER JOIN G_SELO_LOTE SO ON '+
           '  SL.SELO_LOTE_ID = SO.SELO_LOTE_ID '+
           ' INNER JOIN G_SELO_GRUPO SG ON '+
           '  SO.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
           ' LEFT JOIN G_USUARIO U ON '+
           '   SL.USUARIO_ID = U.USUARIO_ID '+
           ' WHERE NOT SG.TIPO_CARTORIO IS NULL ';

  if (rdbPeriodoSelecionado.Checked) and (not rdbSelosExp.Checked) then
  begin 
    VerificarPreenchimentoDTA_TX(edtDataInicio.Text, 'Data Início', edtDataInicio); 
    VerificarPreenchimentoDTA_TX(edtDataFinal.Text, 'Data Final', edtDataFinal);
    viSql := viSql + ' AND SL.DATA ' + MontarSqlData(edtDataInicio.Date, edtDataFinal.Date)
  end
  else viSql := viSql + ' AND NOT SL.DATA IS NULL';

  if rdbSelosNaoExp.Checked then
    viSql := viSql + ' AND SL.DATA_EXPORTACAO IS NULL '
  else
    if rdbSelosExp.Checked then
    begin
      VerificarPreenchimentoLCX_TX(lcxExportacao.Text, 'Data Exportação', lcxExportacao);
      viSql := viSql + ' AND SL.CODIGO_EXPORTACAO = '+ IntToStr(lcxExportacao.EditValue);
    end;

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

  viSql := viSql + ' ORDER BY SL.NUMERO_AGRUPADOR, TIPO_ATO ';

  sqlSelos.SQL.Text := viSql;
  sqlSelos.Open;

  if sqlSelos.IsEmpty then
       Application.MessageBox('Nenhum registro encontrado para o período!', 'Atenção', MB_OK + MB_ICONWARNING)
  else btnMarcarClick(Self);

  btnMarcar.enabled    := not sqlSelos.IsEmpty;
  btnDesmarcar.enabled := not sqlSelos.IsEmpty;
  btnXML.enabled       := not sqlSelos.IsEmpty;
end;

procedure TfrmExportarSelo.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExportarSelo.actCorrigirNomeClick(Sender: TObject);
var
  viNome : String;
  viQtdPalavras : Integer;
begin
  viNome := sqlSelosAPRESENTANTE.AsString;
  repeat
    if not InputQuery('Corrigir Nome Civil', 'Nome Civil', viNome) then
      exit;

    viQtdPalavras := Rotinas.RetornatQdtPalavras(viNome);
    if viQtdPalavras < 2 then
      Application.MessageBox('Nome Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);

  until (viQtdPalavras >= 2);

  ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET APRESENTANTE = '+QuotedStr(viNome)+
                     ' WHERE SELO_LIVRO_ID = '+sqlSelosSELO_LIVRO_ID.AsString,1);

  sqlSelos.Edit;
  sqlSelosNOME_CORRIGIDO.AsString := viNome;
  sqlSelos.Post;
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
  sqlSelos.Active          := False;
  SqlDataExportacao.Active := False;
  sqlTipoSelo.Active       := False;

  Action := caFree;
  frmExportarSelo := Nil;
end;

procedure TfrmExportarSelo.FormCreate(Sender: TObject);
begin
  edtDataInicio.Date := StrToDate(dtmControles.DataHoraBanco(4));
  edtDataFinal.Date  := StrToDate(dtmControles.DataHoraBanco(4));

  sqlSelos.Connection          := dtmControles.DB;
  SqlDataExportacao.Connection := dtmControles.DB;
  sqlTipoSelo.Connection       := dtmControles.DB;
  sqlSeloLote.Connection       := dtmControles.DB;
  sqlSeloLote.Active           := True;

  vlCodigoCartorio      := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CODIGO_CARTORIO', 'S');
  vlChaveCartorio       := dtmControles.BuscarConfig('SELO', 'GOIAS', 'CHAVE_SEGURANCA', 'S');

  {Parametros de Permissão}
  vlPermissao_ControleMaster := dtmControles.CodPermissao('ESP_ATOCONTROLEMASTER');

  rdbSelosTodos.Enabled := dtmControles.BuscarConfig('SELO', 'EXPORTACAO', 'PERMISSAO_PESQUISA_TODOS', 'S') =  'S';
  rdbSelosExp.Enabled   := dtmControles.BuscarConfig('SELO', 'EXPORTACAO', 'PERMISSAO_PESQUISA_TODOS', 'S') =  'S';

  dtmLookup.CarregarListaSistemas(icxTipoSistema);
  icxTipoSistema.ItemIndex := -1;
end;

procedure TfrmExportarSelo.gbxPeriodoChange(Sender: TObject);
begin
  if gbxPeriodo.ActivePage = tbcExportados then
    if not SqlDataExportacao.Active then
         SqlDataExportacao.Active := True
    else SqlDataExportacao.Refresh;
end;

function TfrmExportarSelo.GetHash(vfValor: String): String;
var
  crypt: TChilkatCrypt2;
  success: Integer;
begin
  crypt := TChilkatCrypt2.Create(Self);
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
  sqlTipoSelo.Active := False;
  if icxTipoSistema.EditValue <> null then
  begin
    sqlTipoSelo.ParamByName('TIPO_CARTORIO').AsString := icxTipoSistema.EditValue;
    sqlTipoSelo.Active  := True;
    lcxTipoSelo.enabled := True;
    lcxLote.enabled := True;
  end;

  lcxTipoSelo.Clear;
  btnPesquisarClick(self);
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
  sqlSelos.DisableControls;
  sqlSelos.First;
  while not sqlSelos.Eof do
  begin
    sqlSelos.Edit;
    sqlSelosCALC_SELECIONADO.AsBoolean := vpMarcar;
    sqlSelos.Post;
    sqlSelos.Next;
  end;
  sqlSelos.First;
  sqlSelos.EnableControls;
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
  rdbPeriodoQualquer.Enabled     := True;

  if rdbPeriodoSelecionado.Checked then
    edtDataInicio.SetFocus;
end;

procedure TfrmExportarSelo.sqlSelosCalcFields(DataSet: TDataSet);
begin
  sqlSeloscal_numero_selo.AsString := sqlSelosSIGLA.AsString + RetZeros(sqlSelosNUMERO.AsString,6);
  sqlSelosCALC_EXPORTADO.AsBoolean := NOT sqlSelosCODIGO_EXPORTACAO.IsNull;
end;

end.
