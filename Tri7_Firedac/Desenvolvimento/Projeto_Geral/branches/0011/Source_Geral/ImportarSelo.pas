unit ImportarSelo;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  cxEdit, DB, cxContainer, cxProgressBar, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  xmldom, XMLIntf, msxmldom, XMLDoc, DBClient, SimpleDS,
  cxLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxDBLookupComboBox, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmImportarSelo = class(TForm)
    pnlConvenio: TPanel;
    Panel4: TPanel;
    gridImportar: TcxGrid;
    gridSelos: TcxGridDBTableView;
    gridImportarLevel1: TcxGridLevel;
    ProgressBar1: TcxProgressBar;
    OpenDialog1: TOpenDialog;
    dtsSelos: TDataSource;
    sqlSelos: TClientDataSet;
    XMLDocument1: TXMLDocument;
    sqlSelosidentificacao_pedido: TIntegerField;
    sqlSelostipo_de_ato: TIntegerField;
    sqlSelosdata_da_solicitacao: TStringField;
    sqlSeloscodigo_inicial_do_selo: TStringField;
    sqlSeloscodigo_final_do_selo: TStringField;
    sqlSelosquantidade_de_selos: TIntegerField;
    sqlSelossilga: TStringField;
    sqlSelosselo_inicial: TIntegerField;
    sqlSelosselo_final: TIntegerField;
    gridSelosidentificacao_pedido: TcxGridDBColumn;
    gridSelostipo_de_ato: TcxGridDBColumn;
    gridSelosdata_da_solicitacao: TcxGridDBColumn;
    gridSeloscodigo_inicial_do_selo: TcxGridDBColumn;
    gridSeloscodigo_final_do_selo: TcxGridDBColumn;
    gridSelosquantidade_de_selos: TcxGridDBColumn;
    gridSelossilga: TcxGridDBColumn;
    gridSelosselo_inicial: TcxGridDBColumn;
    gridSelosselo_final: TcxGridDBColumn;
    gridSelosdescricao_tipo_ato: TcxGridDBColumn;
    sqlPesquisa: TI9Query;
    cxLabel1: TcxLabel;
    ProgressBar2: TcxProgressBar;
    cxLabel2: TcxLabel;
    cxBtnFechar: TcxButton;
    btnCarregar: TcxButton;
    btnImportar: TcxButton;
    chxTabelionato: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCarregarClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function ReformataDataSolicitacao(vfData: String): string;
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarSelos;
    procedure CriarSeloLote;
  end;

var
  frmImportarSelo: TfrmImportarSelo;

implementation

uses
  Rotinas, Lookup, Atualizacao, Controles, MensagemUtils;

{$R *.dfm}

procedure TfrmImportarSelo.btnCarregarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    sqlSelos.EmptyDataSet;
    CarregarSelos;
  end;
end;

function TfrmImportarSelo.ReformataDataSolicitacao(vfData : String) : string;
begin
  Result := RetornaNumerico(vfData);
  Result := Copy(Result,7,2) + '/' + Copy(Result,5,2) + '/' + Copy(Result,1,4)
end;

procedure TfrmImportarSelo.btnImportarClick(Sender: TObject);
{$REGION 'Constantes'}
const
  vcTabelionato = 2;
{$ENDREGION}

  function TipoAtoDoTabelionato: Boolean;
  begin
    Result := dtmControles.GetInt('SELECT SISTEMA_ID FROM G_SELO_GRUPO ' +
      ' WHERE NUMERO = ' + sqlSelostipo_de_ato.AsString) = vcTabelionato;
  end;

begin
  if sqlSelos.IsEmpty then
  begin
    Application.MessageBox('N�o h� selos carregados para importa��o!', 'Aten��o', MB_Ok + MB_ICONWARNING);
    Abort;
  end;

  if Application.MessageBox('Confirma Importa��o de Lote de Selos?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    try
      Application.CreateForm(TfrmAtualizacao,frmAtualizacao);

      frmAtualizacao.lblTexto.Caption := 'Criando Lote de Selos, Aguarde!!!';
      frmAtualizacao.Show;
      Application.ProcessMessages;

      Screen.Cursor := crHourGlass;
      gridImportar.Enabled := False;
      sqlSelos.DisableControls;

      ProgressBar1.Properties.Max := sqlSelos.RecordCount;
      ProgressBar1.Position := 0;

      sqlSelos.First;
      while not sqlSelos.Eof do
      begin
        ProgressBar1.Position := sqlSelos.RecNo;
        Application.ProcessMessages;

        if (chxTabelionato.Checked) and (not TipoAtoDoTabelionato) then
        begin
          sqlSelos.Next;
          Continue;
        end;

        CriarSeloLote;
        sqlSelos.Next;
      end;

      sqlSelos.EnableControls;
      gridImportar.Enabled := True;
      ShowMessage('Lote importado com sucesso!!!');
    except
//      dtmControles.Rollback;
      sqlSelos.EnableControls;
      gridImportar.Enabled := True;
      ShowMessage('Erro ao tentar importar lote. Tente novamente!!!');
    end;
  end;

  ProgressBar1.Position := 0;
  Screen.Cursor := crDefault;
  frmAtualizacao.hide;
  frmAtualizacao.free;
end;

procedure TfrmImportarSelo.CarregarSelos;
var
  vNodeLotePedidos: IXMLNode;
  vNodePedidoSeloEletronico: IXMLNode;

  vIdentificacaoPedido: string;
  vTipoAto: string;
  vDataSolicitacao: string;
  vCodigoInicialSelo: string;
  vCodigoFinalSelo: string;
  vQuantidadeSelos: string;
  vAssinaturaDigital: string;
begin
  XMLDocument1.FileName := OpenDialog1.FileName;
  XMLDocument1.Active   := True;

  vNodeLotePedidos      := XMLDocument1.DocumentElement.ChildNodes.FindNode('lote_dos_pedidos');
  vNodeLotePedidos.ChildNodes.First;
  vNodePedidoSeloEletronico := vNodeLotePedidos.ChildNodes['pedido_do_selo_eletronico'];
  vNodePedidoSeloEletronico.ChildNodes.First;

  repeat
    vIdentificacaoPedido := vNodePedidoSeloEletronico.ChildNodes['identificacao_pedido'].text;
    vTipoAto             := vNodePedidoSeloEletronico.ChildNodes['tipo_de_ato'].text;
    vDataSolicitacao     := vNodePedidoSeloEletronico.ChildNodes['data_da_solicitacao'].text;
    vCodigoInicialSelo   := vNodePedidoSeloEletronico.ChildNodes['codigo_inicial_do_selo'].text;
    vCodigoFinalSelo     := vNodePedidoSeloEletronico.ChildNodes['codigo_final_do_selo'].text;
    vQuantidadeSelos     := vNodePedidoSeloEletronico.ChildNodes['quantidade_de_selos'].text;
    vAssinaturaDigital   := vNodePedidoSeloEletronico.ChildNodes['assinatura_digital'].text;

    sqlSelos.Append;
    sqlSelosidentificacao_pedido.AsString   := vIdentificacaoPedido;
    sqlSelostipo_de_ato.AsString            := vTipoAto;
    sqlSelosdata_da_solicitacao.AsString    := ReformataDataSolicitacao(vDataSolicitacao);
    sqlSeloscodigo_inicial_do_selo.AsString := vCodigoInicialSelo;
    sqlSeloscodigo_final_do_selo.AsString   := vCodigoFinalSelo;
    sqlSelosquantidade_de_selos.AsString    := vQuantidadeSelos;

    sqlSelossilga.AsString                  := Copy(vCodigoInicialSelo, 1, Length(vCodigoInicialSelo) - 6);
    sqlSelosselo_inicial.AsString           := Copy(vCodigoInicialSelo, Length(vCodigoInicialSelo) - 5, 6);
    sqlSelosselo_final.AsString             := Copy(vCodigoFinalSelo, Length(vCodigoFinalSelo) - 5, 6);

    sqlSelos.Post;

    vNodePedidoSeloEletronico := vNodePedidoSeloEletronico.NextSibling;
  until vNodePedidoSeloEletronico = nil;

end;

procedure TfrmImportarSelo.CriarSeloLote;
{$REGION 'Vari�veis'}
var
  viSql,
  viIdSeloLote,
  viSeloGrupoId: string;
  i, j : Integer;
{$ENDREGION}
begin
  viSql := 'SELECT SELO_LOTE_ID FROM G_SELO_LOTE WHERE NOTA_FISCAL = ' + QuotedStr(sqlSelosidentificacao_pedido.AsString);

  //sqlPesquisa.Close;
  sqlPesquisa.SQL.Text := viSql;
  sqlPesquisa.Open;
  try
    if not sqlPesquisa.IsEmpty then
    begin
      Application.MessageBox(PWideChar('Lote de selo j� importado! N� Pedido: ' + sqlSelosidentificacao_pedido.AsString),
        'Aten��o', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  finally
    sqlPesquisa.Close;
  end;

  dtmControles.StartTransaction;
  try
    viIdSeloLote := dtmControles.GerarSequencia('G_SELO_LOTE');
    viSeloGrupoId := dtmControles.GetStr('SELECT SELO_GRUPO_ID FROM G_SELO_GRUPO WHERE NUMERO = ' + sqlSelostipo_de_ato.AsString);
    // Lote
    viSql := 'INSERT INTO G_SELO_LOTE ( '+
                         'SELO_LOTE_ID, '+
                         'SITUACAO, '+
                         'NUMERO_INICIAL, '+
                         'NUMERO_FINAL, '+
                         'SELO_GRUPO_ID, '+
                         'SIGLA, '+
                         'DATA_LOTE, '+
                         'NOTA_FISCAL, '+
                         'QUANTIDADE) '+
                'VALUES ( '+ viIdSeloLote + ', ''I'', ' +
                          sqlSelosselo_inicial.AsString + ', ' +
                          sqlSelosselo_final.AsString + ', ' +
                          viSeloGrupoId + ', ' +
                          QuotedStr(sqlSelossilga.AsString) + ', '+
                          QuotedStr(dtmControles.DataParaString(StrToDate(sqlSelosdata_da_solicitacao.AsString))) + ', ' +
                          QuotedStr(sqlSelosidentificacao_pedido.AsString) + ', ' +
                          sqlSelosquantidade_de_selos.AsString + ')';
    dtmControles.ExecSQL(viSql);

    ProgressBar2.Properties.Max := sqlSelosselo_final.AsInteger - sqlSelosselo_inicial.AsInteger;
    ProgressBar2.Position := 0;

    j := 0;
    // Livro
    for i := sqlSelosselo_inicial.AsInteger to sqlSelosselo_final.AsInteger do
    begin
      viSql := 'INSERT INTO G_SELO_LIVRO ( '+
                           'SELO_LIVRO_ID, '+
                           'SELO_SITUACAO_ID, '+
                           'NUMERO, '+
                           'SELO_LOTE_ID, '+
                           'SIGLA) '+
               'VALUES ( '+ dtmControles.GerarSequencia('G_SELO_LIVRO') +
                            ', 1, ' +
                            IntToStr(i) + ', ' +
                            viIdSeloLote + ', ' +
                            QuotedStr(sqlSelossilga.AsString) + ')';
      dtmControles.ExecSQL(viSql);

      j := j + 1;
      if j = 500 then
      begin
        dtmControles.Commit;
        dtmControles.StartTransaction;
        j := 0;
      end;

     ProgressBar2.Position := ProgressBar2.Position + 1;
     Application.ProcessMessages;
    end;

    viSql :=
      ' SELECT LI.SELO_LOTE_ID ' +
      ' FROM G_SELO_LOTE LO ' +

      ' LEFT JOIN G_SELO_LIVRO LI ' +
      ' ON LI.SELO_LOTE_ID = LO.SELO_LOTE_ID ' +

      ' WHERE LO.SITUACAO = ''I'' ' +
      ' AND LO.SELO_GRUPO_ID = ' + viSeloGrupoId +

      ' GROUP BY LI.SELO_LOTE_ID ';

    dtmControles.SimpleAuxiliar.Active := False;
    dtmControles.SimpleAuxiliar.SQL.Text := viSql;
    dtmControles.SimpleAuxiliar.Active := True;
    dtmControles.SimpleAuxiliar.First;

    while not dtmControles.SimpleAuxiliar.Eof do
    begin
      viSql :=
        'SELECT COUNT(*) FROM G_SELO_LIVRO ' +
        ' WHERE SELO_SITUACAO_ID = 1 ' +
        ' AND SELO_LOTE_ID = :SELO_LOTE_ID';

      dtmControles.sqlAuxiliar.Active := False;
      dtmControles.sqlAuxiliar.SQL.Clear;
      dtmControles.sqlAuxiliar.SQL.Add(viSql);
      dtmControles.sqlAuxiliar.Params[0].AsCurrency := dtmControles.SimpleAuxiliar.FieldByName('SELO_LOTE_ID').AsCurrency;
      dtmControles.sqlAuxiliar.Active := True;

      if dtmControles.sqlAuxiliar.Fields[0].AsInteger = 0 then
      begin
        viSql :=
          ' UPDATE G_SELO_LOTE ' +
          ' SET SITUACAO = ''F'' '+
          ' WHERE SELO_LOTE_ID = ' + dtmControles.SimpleAuxiliar.FieldByName('SELO_LOTE_ID').AsString;

        dtmControles.ExecSQL(viSql);
      end;

      dtmControles.sqlAuxiliar.Active := False;
      dtmControles.SimpleAuxiliar.Next;
    end;

    dtmControles.Commit;
  except on e: Exception do
    begin
      dtmControles.Rollback;
      TMensagemUtils.ExibirMensagemErro(
        string.Format(
          'Falha ao criar selo lote!%s[%s]',
          [sLineBreak,
          E.Message]));
    end;
  end;
end;

procedure TfrmImportarSelo.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarSelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  frmImportarSelo := Nil;
end;

procedure TfrmImportarSelo.FormCreate(Sender: TObject);
begin
  sqlPesquisa.Connection := dtmControles.DB;
end;

end.