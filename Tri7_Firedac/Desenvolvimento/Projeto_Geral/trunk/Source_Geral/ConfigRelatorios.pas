unit ConfigRelatorios;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, cxTextEdit, cxDBEdit,
  cxControls, cxContainer, cxEdit, cxLabel, DB, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, SimpleDS, frxClass,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSplitter, cxCheckBox, Menus, Buttons,
  Data.DBXInterBase, System.Actions,
  System.StrUtils, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  DbxDevartInterBase, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  GrupoRelatorios, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TConfiguracaoRelatorio = class
  private
    FConfiguracaoRelatorioID: Integer;
    FDescricao: string;
    FGrupoRelatorios: TGrupoRelatorios;
    FSituacao: Boolean;

    procedure SetConfiguracaoRelatorioID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetGrupoRelatorios(
      const Value: TGrupoRelatorios);

    procedure SetSituacao(
      const Value: Boolean);

  public
    constructor Create; overload;

    constructor Create(
      const vpConfiguracaoRelatorioID: Integer;
      const vpDescricao: string;
      const vpSituacao: Boolean); overload;

    constructor Create(
      const vpConfiguracaoRelatorioID: Integer;
      const vpDescricao: string;
      const vpGrupoRelatorios: TGrupoRelatorios;
      const vpSituacao: Boolean); overload;

    property ConfiguracaoRelatorioID: Integer read FConfiguracaoRelatorioID
      write SetConfiguracaoRelatorioID;

    property Descricao: string read FDescricao write SetDescricao;

    property GrupoRelatorios: TGrupoRelatorios read FGrupoRelatorios
      write SetGrupoRelatorios;

    property Situacao: Boolean read FSituacao write SetSituacao;
  end;

  TfrmConfigRelatorios = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    grdConfRel: TcxGrid;
    grdConfRelDBTableView1: TcxGridDBTableView;
    grdConfRelLevel1: TcxGridLevel;
    grdConfRelDBTableView1CONFIG_RELATORIO_ID: TcxGridDBColumn;
    grdConfRelDBTableView1DESCRICAO: TcxGridDBColumn;
    ClientAncestralCONFIG_RELATORIO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    cxSplitter1: TcxSplitter;
    cxLabel5: TcxLabel;
    sqlGrupoRelatorio: TI9Query;
    dsGrupoRelatorio: TDataSource;
    sqlGrupoRelatorioGRUPO_RELATORIO_ID: TBCDField;
    sqlGrupoRelatorioDESCRICAO: TStringField;
    ClientAncestralGRUPO_RELATORIO_ID: TBCDField;
    ClientAncestralSISTEMA_ID: TBCDField;
    grdConfRelDBTableView1GRUPO_RELATORIO_ID: TcxGridDBColumn;
    ClientAncestralSITUACAO: TStringField;
    pnlRelatorio: TPanel;
    ClientAncestralINTERNO: TStringField;
    frxRelatorio: TfrxReport;
    PopupMenu1: TPopupMenu;
    ExportarRelatrios1: TMenuItem;
    ImportarRelatrio1: TMenuItem;
    OpenDialog1: TOpenDialog;
    N1: TMenuItem;
    GerarRotina1: TMenuItem;
    edtCodigo: TcxDBTextEdit;
    chbUsointerno: TcxDBCheckBox;
    edtDescricao: TcxDBTextEdit;
    lcbGrupoRelatorio: TcxDBLookupComboBox;
    btnGrupoRelatorio: TcxButton;
    btnHistorico: TcxButton;
    btnRelatorio: TcxButton;
    chbEditar: TcxDBCheckBox;
    ClientAncestralEDITAR: TStringField;
    N2: TMenuItem;
    ConverterFireDac1: TMenuItem;
    sqlConvertRel: TI9Query;
    sqlConvertRelCONFIG_RELATORIO_ID: TBCDField;
    sqlConvertRelRELATORIO: TBlobField;
    mniConverterProtestoNovo: TMenuItem;
    N3: TMenuItem;
    ImagesHightQuality1: TMenuItem;
    btnExportar: TcxButton;
    btnImportar: TcxButton;
    sqlXmlAtualizador: TClientDataSet;
    dtsXmlAtualizador: TDataSource;
    sqlXmlAtualizadorCONFIG_RELATORIO_ID: TBCDField;
    sqlXmlAtualizadorDESCRICAO: TStringField;
    sqlXmlAtualizadorGRUPO_RELATORIO_ID: TBCDField;
    sqlXmlAtualizadorINTERNO: TStringField;
    sqlXmlAtualizadorSISTEMA_ID: TBCDField;
    sqlXmlAtualizadorSITUACAO: TStringField;
    sqlXmlAtualizadorEDITAR: TStringField;
    sqlXmlAtualizadorRELATORIO: TBlobField;
    chbAtivo: TcxDBCheckBox;
    grdConfRelDBTableView1SITUACAO: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    CorrigirProtesto1: TMenuItem;
    N4: TMenuItem;
    CorrigeBeletoCancelamento1: TMenuItem;
    CorrigirRelatrios1: TMenuItem;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
    function frxRelatorioUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure ExportarRelatrios1Click(Sender: TObject);
    procedure ImportarRelatrio1Click(Sender: TObject);
    procedure GerarRotina1Click(Sender: TObject);
    procedure btnGrupoRelatorioClick(Sender: TObject);
    procedure ConverterFireDac1Click(Sender: TObject);
    procedure mniConverterProtestoNovoClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ImagesHightQuality1Click(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure CorrigeBeletoCancelamento1Click(Sender: TObject);
    procedure CorrigirRelatrios1Click(Sender: TObject);
  private
    { Private declarations }
    WPath: String;
    vlId, vlId1 : Integer;
    function CarregaHistorico: Boolean;
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState(AState: TDataSetState); override;
    procedure GravarRelatorioImportacao;
  end;

var
  frmConfigRelatorios: TfrmConfigRelatorios;

implementation

uses
  Controles,
  Rotinas,
  VisualizaRelatorios,
  Pesquisa,
  Atualizacao,
  Lookup,
  MensagemUtils;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmConfigRelatorios.ExecuteGravarExecute(Sender: TObject);
begin
  ClientAncestralSISTEMA_ID.AsInteger := vlId;
  inherited;

end;

procedure TfrmConfigRelatorios.FormCreate(Sender: TObject);
begin
  WPath := IncludeTrailingPathDelimiter(vgDiretorioCorrente);
  sqlGrupoRelatorio.Connection := dtmControles.DB;
  CriarFuncoesRelatorio(frxRelatorio);
  inherited;

  vlId1 := vgId;
  vlId  := vgId;

  if vgId = 20 then
  begin
    vlId  := 5;
    vlId1 := 17;
  end;

  sqlGrupoRelatorio.Close;
  sqlGrupoRelatorio.Params[0].AsInteger := vlId;
  sqlGrupoRelatorio.Params[1].AsInteger := vlId1;
  sqlGrupoRelatorio.Open;

  DataSetAncestral.Close;
  DataSetAncestral.Params[0].AsInteger := vlId;
  DataSetAncestral.Params[1].AsInteger := vlId1;
  ClientAncestral.Close;
  ClientAncestral.Open;

  vgNomeTabela := 'G_CONFIG_RELATORIO';
  vgChavePrimaria := 'CONFIG_RELATORIO_ID';

  // 13 = Protesto
  mniConverterProtestoNovo.Visible := Controles.vgId = 13;

  CorrigirProtesto1.Visible := mniConverterProtestoNovo.Visible;
end;

procedure TfrmConfigRelatorios.LoadData;
begin
  if Trim(vgChave) <> '' then
    ClientAncestral.Locate('CONFIG_RELATORIO_ID', vgChave, [loCaseInsensitive]);
  inherited;
end;

procedure TfrmConfigRelatorios.mniConverterProtestoNovoClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  viBookmark: TBookmark;
  viFrmAtualizacao: TfrmAtualizacao;
  viRelatorioIntimacaoID: Integer;
  viConfigRelatorioID: Integer;
  viDicionarioRelatorio: TStrings;
  viConfigRelatorio: TI9Query;
  viTextoRelatorio: TStrings;
  viChave: string;
  viValor: string;
  viConversaoFinalizada: Boolean;
  viMensagemConversao: string;
  viInTransaction: Boolean;
  I: Integer;
{$ENDREGION}
begin
  if Application.MessageBox('Deseja executar está rotina de conversão?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;

  Screen.Cursor := crHourGlass;
  Enabled := False;

  Application.CreateForm(
    TfrmAtualizacao,
    viFrmAtualizacao);

  viFrmAtualizacao.HabilitarProgressBar;

  viFrmAtualizacao.SetValorMaximoProgressBar(
    ClientAncestral.RecordCount);

  viFrmAtualizacao.Show;
  viBookmark := ClientAncestral.Bookmark;
  ClientAncestral.DisableControls;
  Application.ProcessMessages;
  viDicionarioRelatorio := TStringList.Create;

  viConfigRelatorio := TI9Query.Create(
    nil);

  viConfigRelatorio.Connection := dtmControles.DB;

  viConfigRelatorio.SQL.Text := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'G_CR.CONFIG_RELATORIO_ID, ' +
    'G_CR.RELATORIO ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_CONFIG_RELATORIO G_CR ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_CR.CONFIG_RELATORIO_ID = :P_CONFIG_RELATORIO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viTextoRelatorio := TStringList.Create;

  viConversaoFinalizada := False;
  viMensagemConversao := string.Empty;

  try
    viRelatorioIntimacaoID := dtmControles.BuscarConfig(
      'PRINCIPAL',
      'TITULOS',
      'REL_INTIMACAO',
      'I');

    viInTransaction := dtmControles.DB.InTransaction;
    if not viInTransaction then
      dtmControles.DB.StartTransaction;

    try
      ClientAncestral.First;
      while not ClientAncestral.Eof do
        try
          viConfigRelatorioID := ClientAncestralCONFIG_RELATORIO_ID.AsInteger;

          if viConfigRelatorioID = viRelatorioIntimacaoID then
          begin
            viDicionarioRelatorio.Clear;

            viDicionarioRelatorio.Values['frxdtsTitulo."VALOR_EMOLUMENTO"'] :=
              'frxdtsDespesasInt."VL_EMOLUMENTO_INTIMACAO_PROTESTO"';

            viDicionarioRelatorio.Values['frxdtsTitulo."VALOR_TAXA_JUDICIARIA"'] :=
              'frxdtsDespesasInt."VL_TAXA_JUDICIARIA"';

            viDicionarioRelatorio.Values['frxdtsTitulo."VALOR_TAXA_INTIMACAO"'] :=
              'frxdtsDespesasInt."VL_EMOLUMENTO_INTIMACAO"';

            viDicionarioRelatorio.Values['frxdtsTitulo."VALOR_TAXA_FUNDESP"'] :=
              'frxdtsDespesasInt."VL_FUNDOS"';

            viDicionarioRelatorio.Values['frxdtsTitulo."VALOR_ISSQN"'] :=
              'frxdtsDespesasInt."VL_ISSQN"';

            viDicionarioRelatorio.Values['frxdtsTitulo."VALOR_TOTAL"'] :=
              '<frxdtsDespesasInt."VL_TOTAL_INTIMACAO"> + <frxdtsTituloInt."VALOR_TITULO">';

            viDicionarioRelatorio.Values['frxdtsTitulo'] := 'frxdtsTituloInt';
            viDicionarioRelatorio.Values['frxDBDevedor'] := 'frxdtsDevedorInt';

            viDicionarioRelatorio.Text := viDicionarioRelatorio.Text.Replace(
              '"',
              '&#34;',
              [rfReplaceAll]);

            viDicionarioRelatorio.Text := viDicionarioRelatorio.Text.Replace(
              '<',
              '&#60;',
              [rfReplaceAll]);

            viDicionarioRelatorio.Text := viDicionarioRelatorio.Text.Replace(
              '>',
              '&#62;',
              [rfReplaceAll]);

            viConfigRelatorio.ParamByName(
              'P_CONFIG_RELATORIO_ID').AsInteger := viConfigRelatorioID;

            viConfigRelatorio.Open;
            try
              viTextoRelatorio.Clear;

              viTextoRelatorio.Text := DeCompressString(
                viConfigRelatorio.FieldByName(
                  'RELATORIO').AsString);

              viTextoRelatorio.Text := viTextoRelatorio.Text.Replace(
                '</Datasets>',
                '  <item DataSetName="frxdtsDespesasInt"/>' + sLineBreak + '  </Datasets>');

              for I := 0 to viDicionarioRelatorio.Count - 1 do
              begin
                viChave := viDicionarioRelatorio.Names[I];

                if viTextoRelatorio.Text.Contains(
                  viChave) then
                begin
                  viValor := viDicionarioRelatorio.ValueFromIndex[I];

                  viTextoRelatorio.Text := viTextoRelatorio.Text.Replace(
                    viChave,
                    viValor,
                    [rfReplaceAll,
                    rfIgnoreCase]);
                end;
              end;

              viConfigRelatorio.Edit;

              viConfigRelatorio.FieldByName(
                'RELATORIO').AsString := CompressString(
                  viTextoRelatorio.Text);

              viConfigRelatorio.Post;
            finally
              viConfigRelatorio.Close;
            end;

            Continue;
          end;
        finally
          ClientAncestral.Next;
          viFrmAtualizacao.AddProgressBar;
          Application.ProcessMessages;
        end;

      if not viInTransaction then
        dtmControles.DB.Commit;

      viConversaoFinalizada := True;

      viMensagemConversao := 'Conversão dos Relatórios ' +
        'pro Protesto Novo executada com sucesso.';
    except
      on E: Exception do
      begin
        if not viInTransaction then
          dtmControles.DB.Rollback;

        viConversaoFinalizada := False;

        viMensagemConversao := string.Format(
          'Não foi possível converter os relatórios pro Protesto Novo ' +
          'devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          E.Message]);
      end;
    end;
  finally
    ClientAncestral.GotoBookmark(
      viBookmark);

    ClientAncestral.EnableControls;
    viDicionarioRelatorio.Free;
    viConfigRelatorio.Free;
    viTextoRelatorio.Free;
    Enabled := True;

    viFrmAtualizacao.Close;
    viFrmAtualizacao.Free;
    Screen.Cursor := crDefault;
    Application.ProcessMessages;

    if viConversaoFinalizada then
      TMensagemUtils.ExibirMensagemInformacao(
        viMensagemConversao)
    else
      TMensagemUtils.ExibirMensagemErro(
        viMensagemConversao);
  end;
end;

procedure TfrmConfigRelatorios.PopupMenu1Popup(Sender: TObject);
begin
  mniConverterProtestoNovo.Enabled := mniConverterProtestoNovo.Visible and
    not ClientAncestral.IsEmpty;
end;

procedure TfrmConfigRelatorios.SetState(AState: TDataSetState);
begin
  inherited;
  pnlRelatorio.Enabled := State = dsBrowse;
  grdConfRel.Enabled   := pnlRelatorio.Enabled;
  btnExportar.Enabled  := State = dsBrowse;
  btnImportar.Enabled  := State = dsBrowse;
end;

procedure TfrmConfigRelatorios.btnRelatorioClick(Sender: TObject);
begin
  inherited;
  vgVersao1 := 0;
  vgVersao2 := 0;

  try
    try
      CarregaRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString,
        dtmControles.GetRelatorio(trPrincipal, ClientAncestralCONFIG_RELATORIO_ID.AsInteger),
        frxRelatorio);

      frxRelatorio.Variables.Variables['vgNomeCartorio'] :=
        QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO',
        'NOME', 'S'));
      frxRelatorio.Variables.Variables['vgLogin'] := QuotedStr(vgLogin);

      frxRelatorio.DesignReport();
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
      end;
    end;
  finally
    GravarRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString);
  end;
end;

procedure TfrmConfigRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlGrupoRelatorio.Close;
  Action := caFree;
  frmConfigRelatorios := nil;

end;

procedure TfrmConfigRelatorios.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  ClientAncestralINTERNO.AsString := 'N';
  edtDescricao.SetFocus;
end;

procedure TfrmConfigRelatorios.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfrmConfigRelatorios.CarregaHistorico: Boolean;
var
  Rel: TStringList;
  viCampoHistorico, Caminho, Historico, ID: string;
begin
  Result := False;

  viCampoHistorico := dtmControles.GetRelatorio(trHistorico, ClientAncestralCONFIG_RELATORIO_ID.AsInteger);
  if Trim(viCampoHistorico) <> '' then
  begin
    ID := ClientAncestralCONFIG_RELATORIO_ID.AsString;
    Caminho   := WPath + ID + '.fr3';
    Historico := WPath + 'H' + ID + '.fr3';
    Rel := TStringList.Create;
    try
      Rel.Text := DeCompressString(AnsiString(viCampoHistorico));
      Rel.SaveToFile(Caminho);
      Rel.SaveToFile(Historico);
      Application.ProcessMessages;
      Rel.Free;
      vgVersao1 := DataHoraModificacao(Caminho);
      frxRelatorio.Clear;
      frxRelatorio.LoadFromFile(WPath + IntToStr(ClientAncestralCONFIG_RELATORIO_ID.AsInteger) + '.fr3');
    finally
      Result := True;
    end;
  end;
end;

procedure TfrmConfigRelatorios.ConverterFireDac1Click(Sender: TObject);
var
  slTextoArquivo : TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja executar está rotina de conversão?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;

  slTextoArquivo := TStringList.Create;

  ClientAncestral.DisableControls;
  ClientAncestral.First;
  try
    while not ClientAncestral.Eof do
    begin
      sqlConvertRel.Close;
      sqlConvertRel.Params[0].AsInteger := ClientAncestralCONFIG_RELATORIO_ID.AsInteger;
      sqlConvertRel.Open;

      if not sqlConvertRel.IsEmpty then
      begin
        slTextoArquivo.Clear;
        slTextoArquivo.Text := DeCompressString(sqlConvertRelRELATORIO.AsString);
        if Pos('TfrxDBXQuery', slTextoArquivo.Text) > 0 then
        begin
        slTextoArquivo.Text := StringReplace(slTextoArquivo.Text, 'TfrxDBXQuery',    'TfrxFDQuery',   [rfReplaceAll, rfIgnoreCase]);
        sqlConvertRel.Edit;
        sqlConvertRelRELATORIO.AsString := CompressString(slTextoArquivo.Text);
        sqlConvertRel.Post;
        end;

        ClientAncestral.Next;
      end;
    end;
  finally
    ClientAncestral.EnableControls;
    FreeAndNil(slTextoArquivo);
    sqlConvertRel.Close;
    ShowMessage('Conversão Finalizada!');
  end;
end;

procedure TfrmConfigRelatorios.CorrigeBeletoCancelamento1Click(Sender: TObject);
var
  slTextoArquivo : TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja executar está rotina de Correção?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;

  slTextoArquivo := TStringList.Create;

  ClientAncestral.DisableControls;
  ClientAncestral.First;
  try
    sqlConvertRel.Close;
    sqlConvertRel.Params[0].AsInteger := ClientAncestralCONFIG_RELATORIO_ID.AsInteger;
    sqlConvertRel.Open;

    if not sqlConvertRel.IsEmpty then
    begin
      slTextoArquivo.Clear;
      slTextoArquivo.Text := DeCompressString(sqlConvertRelRELATORIO.AsString);

      if (Pos('frxdtsListaTituloCan', slTextoArquivo.Text) > 0) then
      begin
      slTextoArquivo.Text := StringReplace(slTextoArquivo.Text, 'frxdtsListaTituloCan',    'frxdtsTituloBoletoCan',   [rfReplaceAll, rfIgnoreCase]);

      sqlConvertRel.Edit;
      sqlConvertRelRELATORIO.AsString := CompressString(slTextoArquivo.Text);
      sqlConvertRel.Post;
      end;
    end;
  finally
    ClientAncestral.EnableControls;
    FreeAndNil(slTextoArquivo);
    sqlConvertRel.Close;
    ShowMessage('Conversão Finalizada!');
  end;

end;

procedure TfrmConfigRelatorios.CorrigirRelatrios1Click(Sender: TObject);
var
  slTextoArquivo : TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja executar está rotina de Correção?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;

  slTextoArquivo := TStringList.Create;

  ClientAncestral.DisableControls;
  ClientAncestral.First;
  try
    while not ClientAncestral.Eof do
    begin
      sqlConvertRel.Close;
      sqlConvertRel.Params[0].AsInteger := ClientAncestralCONFIG_RELATORIO_ID.AsInteger;
      sqlConvertRel.Open;

      if not sqlConvertRel.IsEmpty then
      begin
        slTextoArquivo.Clear;
        slTextoArquivo.Text := DeCompressString(sqlConvertRelRELATORIO.AsString);

        if (Pos('frxdtsPessoaCad', slTextoArquivo.Text) > 0) or
           (Pos('frxdtsPessoaCan', slTextoArquivo.Text) > 0) then
        begin
        slTextoArquivo.Text := StringReplace(slTextoArquivo.Text, 'frxdtsPessoaCad',    'frxdtsOutrasPartesCad',   [rfReplaceAll, rfIgnoreCase]);
        slTextoArquivo.Text := StringReplace(slTextoArquivo.Text, 'frxdtsPessoaCan',    'frxdtsDevedorCan',   [rfReplaceAll, rfIgnoreCase]);

        sqlConvertRel.Edit;
        sqlConvertRelRELATORIO.AsString := CompressString(slTextoArquivo.Text);
        sqlConvertRel.Post;
        end;

        ClientAncestral.Next;
      end;
    end;
  finally
    ClientAncestral.EnableControls;
    FreeAndNil(slTextoArquivo);
    sqlConvertRel.Close;
    ShowMessage('Conversão Finalizada!');
  end;


end;

procedure TfrmConfigRelatorios.btnHistoricoClick(Sender: TObject);
begin
  inherited;
  vgVersao1 := 0;
  vgVersao2 := 0;

  if CarregaHistorico then
    frxRelatorio.DesignReport;

end;

procedure TfrmConfigRelatorios.btnImportarClick(Sender: TObject);

  procedure CarregarDadosAtualizacao;
  begin
    sqlXmlAtualizador.Active := False;
    try
      sqlXmlAtualizador.LoadFromFile(ExtractFilePath(Application.ExeName) + 'XML_CONFIG_RELATORIO.XML');
    except
      abort;
    end;
    sqlXmlAtualizador.Active := True;
  end;

begin
  inherited;
  if Application.MessageBox('Atualizar Modelos do FastReport nos Itens de Configuração de Relatório. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    Exit;

  CarregarDadosAtualizacao;
  sqlXmlAtualizador.First;
  while not sqlXmlAtualizador.Eof do
  begin
    // Atualizar
    if ClientAncestral.Locate(
      'CONFIG_RELATORIO_ID',
      VarArrayOf([sqlXmlAtualizador.FieldByName('CONFIG_RELATORIO_ID').AsString]),
      [loCaseInsensitive, loPartialKey]) then
    begin
      GravarRelatorioImportacao;
    end;
    sqlXmlAtualizador.Next;
  end;

  ShowMessage('Atualização efetuada com sucesso!!!');

  ClientAncestral.Close;
  ClientAncestral.Open;
end;

procedure TfrmConfigRelatorios.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqConfigRelatorio;
  LoadData;

end;

function TfrmConfigRelatorios.frxRelatorioUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  inherited;
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TfrmConfigRelatorios.ExportarRelatrios1Click(Sender: TObject);
var
  ExpRel: TStringList;
  Caminho: String;
begin
  inherited;
  if not ClientAncestral.IsEmpty then
  begin
    Caminho := vgDiretorioCorrente + '\Rel\';
    if not DirectoryExists(Caminho) then
      MkDir(Caminho);

    ClientAncestral.DisableControls;

    ExpRel := TStringList.Create;
    try
      with CreateMessageDialog('Deseja Exportar?', mtConfirmation,
        [mbYes, MbNo, mbCancel]) do
      begin
        Caption := 'Exportar';
        (FindComponent('YES') as TButton).Caption := 'Todos';
        (FindComponent('NO') as TButton).Caption := 'Atual';
        (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
        ShowModal;

        if (ModalResult = mrYes) then
        begin
          ClientAncestral.First;
          while not ClientAncestral.Eof do
          begin
            ExpRel.Clear;
            ExpRel.Text := DeCompressString(dtmControles.GetRelatorio(trPrincipal, ClientAncestralCONFIG_RELATORIO_ID.AsInteger));
            ExpRel.SaveToFile(Caminho + ClientAncestralDESCRICAO.AsString + '.rtl');
            Application.ProcessMessages;
            ClientAncestral.Next;

          end;
        end
        else
        begin
          ExpRel.Clear;
          ExpRel.Text := DeCompressString(dtmControles.GetRelatorio(trPrincipal, ClientAncestralCONFIG_RELATORIO_ID.AsInteger));
          ExpRel.SaveToFile(Caminho + ClientAncestralDESCRICAO.AsString + '.rtl');
          Application.ProcessMessages;

        end;
      end;
    finally
      ClientAncestral.EnableControls;
      FreeAndNil(ExpRel);
    end;
  end;
end;

procedure TfrmConfigRelatorios.ImagesHightQuality1Click(Sender: TObject);
var
  slTextoArquivo : TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja executar está rotina de conversão?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = ID_NO then
    Exit;

  slTextoArquivo := TStringList.Create;

  ClientAncestral.DisableControls;
  ClientAncestral.First;
  try
    while not ClientAncestral.Eof do
    begin
      sqlConvertRel.Close;
      sqlConvertRel.Params[0].AsInteger := ClientAncestralCONFIG_RELATORIO_ID.AsInteger;
      sqlConvertRel.Open;

      if not sqlConvertRel.IsEmpty then
      begin
        slTextoArquivo.Clear;
        slTextoArquivo.Text := DeCompressString(sqlConvertRelRELATORIO.AsString);
        if Pos('TfrxPictureView', slTextoArquivo.Text) > 0 then
        begin
        slTextoArquivo.Text := StringReplace(slTextoArquivo.Text, 'HightQuality="False"',    'HightQuality="True"',   [rfReplaceAll, rfIgnoreCase]);
        sqlConvertRel.Edit;
        sqlConvertRelRELATORIO.AsString := CompressString(slTextoArquivo.Text);
        sqlConvertRel.Post;
        end;

        ClientAncestral.Next;
      end;
    end;
  finally
    ClientAncestral.EnableControls;
    FreeAndNil(slTextoArquivo);
    sqlConvertRel.Close;
    ShowMessage('Conversão Finalizada!');
  end;

end;

procedure TfrmConfigRelatorios.ImportarRelatrio1Click(Sender: TObject);
var
  vSqlRelatorio : TI9Query;
begin
  inherited;

  if not ClientAncestral.IsEmpty then
  begin
    if OpenDialog1.Execute then
    begin
      if FileExists(OpenDialog1.FileName) then
      begin

        vSqlRelatorio := TI9Query.Create(Application);
        vSqlRelatorio.Connection := dtmControles.DB;

        with vSqlRelatorio do
        begin
          Active := False;

          SQL.Text :=
            'UPDATE G_CONFIG_RELATORIO '+
            ' SET RELATORIO = :RELATORIO '+
            ' WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID ';


          ParamByName('RELATORIO').ParamType := ptInput;
          ParamByName('RELATORIO').DataType  := ftBlob;
          ParamByName('RELATORIO').LoadFromFile(OpenDialog1.FileName, ftBlob);
          ParamByName('CONFIG_RELATORIO_ID').ParamType := ptInput;
          ParamByName('CONFIG_RELATORIO_ID').DataType  := ftInteger;
          ParamByName('CONFIG_RELATORIO_ID').AsString  := ClientAncestralCONFIG_RELATORIO_ID.AsString;
          Execute;
        end;

        vSqlRelatorio.Free;
      end;
    end;
  end;
end;

procedure TfrmConfigRelatorios.GerarRotina1Click(Sender: TObject);
var
  Sql, ID, MenuID, ChaveRotina: String;
begin
  inherited;
  MenuID := dtmControles.GetStr('SELECT SISTEMA_MENU_ID FROM G_SISTEMA_MENU ' +
    'WHERE SISTEMA_ID = ' + IntToStr(vlId) + '   AND DESCRICAO = ' +
    QuotedStr(IfThen(vlId = 1, 'Relatório', 'Impressões')));
  if MenuID <> '' then
  begin
    ChaveRotina := 'REL_' + ClientAncestralCONFIG_RELATORIO_ID.AsString;
    Sql := 'SELECT SISTEMA_ROTINA_ID FROM G_SISTEMA_ROTINA ' +
      'WHERE SISTEMA_MENU_ID = ' + MenuID + '  AND CHAVE_ROTINA = ' +
      QuotedStr(ChaveRotina);

    if dtmControles.GetInt(Sql) = 0 then
    begin
      dtmControles.StartTransaction;
      try
        ID := dtmControles.GerarSequencia('G_SISTEMA_ROTINA');
        Sql := ' INSERT INTO G_SISTEMA_ROTINA (SISTEMA_ROTINA_ID, CHAVE_ROTINA, '
          + ' DESCRICAO, SISTEMA_MENU_ID) ' + ' VALUES ( ' + ID + ', ' +
          QuotedStr(ChaveRotina) + ', ' +
          QuotedStr(ClientAncestralDESCRICAO.AsString) + ', ' + MenuID + ')';
        dtmControles.ExecSQL(Sql);
        dtmControles.Commit;
      except
        dtmControles.Rollback;
      end;
    end
    else
      Application.MessageBox('Já foi criada uma rotina para este relatório!',
        'Atenção', MB_OK + MB_ICONWARNING);
  end
  else
    Application.MessageBox('Grupo relatório não encontrado!', 'Atenção',
      MB_OK + MB_ICONWARNING);

  inherited;

end;

procedure TfrmConfigRelatorios.GravarRelatorioImportacao;
var
  viQuery: TI9Query;
begin
  viQuery := nil;

  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := 'UPDATE G_CONFIG_RELATORIO '+
                        ' SET RELATORIO = :RELATORIO '+
                        ' WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID ';
    viQuery.ParamByName('RELATORIO').ParamType := ptInput;
    viQuery.ParamByName('RELATORIO').DataType  := ftBlob;
    viQuery.ParamByName('RELATORIO').AsString  := CompressString(sqlXmlAtualizador.FieldByName('RELATORIO').AsString);

    viQuery.ParamByName('CONFIG_RELATORIO_ID').ParamType := ptInput;
    viQuery.ParamByName('CONFIG_RELATORIO_ID').DataType  := ftInteger;
    viQuery.ParamByName('CONFIG_RELATORIO_ID').AsInteger  := sqlXmlAtualizador.FieldByName('CONFIG_RELATORIO_ID').AsInteger;
    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TfrmConfigRelatorios.btnExportarClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.SaveToFile(ExtractFilePath(Application.ExeName) + 'XML_CONFIG_RELATORIO.XML', dfXMLUTF8);
  ShowMessage('Arquivo exportado com Sucesso.'+ (ExtractFilePath(Application.ExeName) + 'XML_CONFIG_RELATORIO.XML'));
end;

procedure TfrmConfigRelatorios.btnGrupoRelatorioClick(Sender: TObject);
var
  Aux: String;
begin
  inherited;
  Aux := vgPermissaoRotina;
  vgPermissaoRotina := dtmControles.CodPermissao('CAD_GRUPOREL');
  if vgPermissaoRotina = '000000' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!',
      'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  ExibirFormulario(TfrmGrupoRelatorio, frmGrupoRelatorio, True);
  vgPermissaoRotina := Aux;
  sqlGrupoRelatorio.Refresh;
end;

{ TConfiguracaoRelatorio }


constructor TConfiguracaoRelatorio.Create(
  const vpConfiguracaoRelatorioID: Integer;
  const vpDescricao: string;
  const vpGrupoRelatorios: TGrupoRelatorios;
  const vpSituacao: Boolean);
begin
  Create(vpConfiguracaoRelatorioID, vpDescricao, vpSituacao);
  GrupoRelatorios := vpGrupoRelatorios;
end;

constructor TConfiguracaoRelatorio.Create;
begin
  inherited;
end;

constructor TConfiguracaoRelatorio.Create(
  const vpConfiguracaoRelatorioID: Integer;
  const vpDescricao: string;
  const vpSituacao: Boolean);
begin
  Create;

  ConfiguracaoRelatorioID := vpConfiguracaoRelatorioID;
  Descricao := vpDescricao;
  Situacao := vpSituacao;
end;

procedure TConfiguracaoRelatorio.SetConfiguracaoRelatorioID(
  const Value: Integer);
begin
  FConfiguracaoRelatorioID := Value;
end;

procedure TConfiguracaoRelatorio.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TConfiguracaoRelatorio.SetGrupoRelatorios(
  const Value: TGrupoRelatorios);
begin
  FGrupoRelatorios := Value;
end;

procedure TConfiguracaoRelatorio.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

end.
