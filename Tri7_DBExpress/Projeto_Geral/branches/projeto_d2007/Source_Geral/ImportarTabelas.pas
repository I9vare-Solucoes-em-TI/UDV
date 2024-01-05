unit ImportarTabelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, Menus, cxLookAndFeelPainters, FMTBcd, cxGraphics,
  DB, DBClient, Provider, SqlExpr, cxButtons, ExtCtrls, SimpleDS, ComCtrls,
  AdvSmoothProgressBar, cxLabel, Buttons, cxCheckBox, cxGroupBox, cxCurrencyEdit,
  cxRadioGroup, cxLookAndFeels, cxControls, cxContainer, cxEdit, StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinsCore, dxSkinBlack, dxSkinLondonLiquidSky,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TfrmImportarTabelas = class(TfrmCadAuxiliar)
    sqlG_Emolumento_Periodo: TSimpleDataSet;
    dtsG_Emolumento_Periodo: TDataSource;
    gbxTabelas: TcxGroupBox;
    lblAviso: TcxLabel;
    lcxTabelaDestino: TcxLookupComboBox;
    Label1: TLabel;
    lcxTabelaOrigem: TcxLookupComboBox;
    Label14: TLabel;
    AdvSmoothProgressBar1: TAdvSmoothProgressBar;
    sqlG_Emolumento_PeriodoEMOLUMENTO_ID: TFMTBCDField;
    sqlG_Emolumento_PeriodoDESCRICAO: TStringField;
    lblAvisoVazio: TcxLabel;
    gbxOpcoes: TcxGroupBox;
    rdbAlterar1_2: TcxRadioButton;
    rdbAlterar1_4: TcxRadioButton;
    rdbAlterar2x: TcxRadioButton;
    rdbNaoAlterar: TcxRadioButton;
    btnConfirmarItem: TcxButton;
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure lcxTabelaOrigemExit(Sender: TObject);
    procedure lcxPeriodoDestinoPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lcxTabelaOrigemPropertiesChange(Sender: TObject);
    procedure lcxTabelaDestinoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    vlAlterar : Boolean;
    QueryTabelaItem : TSQLQuery;
    procedure CarregaEmolumentoItem(periodoId : integer; emolumentoId : string);
    procedure StatusOpcoesTela(AtivaDesativa : boolean); // desabilitar ou habilitar as opcoes existentes na tela em caso de estar processando a duplicação
    procedure VerificaSeExisteDadosTabelaDestino;
    procedure VerificaSeExisteDadosTabelaOrigem;
  public
    { Public declarations }
    procedure ImportarTabela;
  end;

var
  frmImportarTabelas: TfrmImportarTabelas;

implementation

uses Lookup, Emolumento, Controles, Cadastro;

{$R *.dfm}

{ TfrmCadDuplicaEmolumento }

procedure TfrmImportarTabelas.btnCancelarClick(Sender: TObject);
begin
  vlAlterar := False;
  inherited;

end;

procedure TfrmImportarTabelas.btnConfirmarItemClick(Sender: TObject);
begin
  inherited;
  ImportarTabela;
  //ATUALIZA
  try
    dtmLookup.sqlG_Emolumento_Periodo.Refresh;
    sqlG_Emolumento_Periodo.Refresh;
  except
  end;
end;

procedure TfrmImportarTabelas.CarregaEmolumentoItem(periodoId: integer; emolumentoId : string);
begin
  //carregando query que lista os itens da tabela de Emolumentos
  with QueryTabelaItem do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT VALOR_EMOLUMENTO, ');
    SQL.Add('       EMOLUMENTO_ITEM_ID, ');
    SQL.Add('       EMOLUMENTO_ID, ');
    SQL.Add('       VALOR_INICIO,');
    SQL.Add('       VALOR_FIM, ');
    SQL.Add('       VALOR_TAXA_JUDICIARIA,');
    SQL.Add('       EMOLUMENTO_PERIODO_ID,');
    SQL.Add('       CODIGO,');
    SQL.Add('       PAGINA_EXTRA,');
    SQL.Add('       VALOR_PAGINA_EXTRA,');
    SQL.Add('       VALOR_OUTRA_TAXA1');
    SQL.Add('  FROM G_EMOLUMENTO_ITEM');
    SQL.Add(' WHERE EMOLUMENTO_PERIODO_ID = ' + IntToStr(periodoId));
    SQL.Add('   AND EMOLUMENTO_ID         = ' + emolumentoId);
    Open;
  end;
end;

procedure TfrmImportarTabelas.ImportarTabela;
var
  QueryInserir_Emol_Item : TSQLQuery;
  vlMsg : String;
begin
  try
    {$REGION 'VALIDANDO CAMPOS'}
    //verifica se foi escolhido uma tabela de origem
    if lcxTabelaOrigem.Text = '' then
    begin
      Application.MessageBox('Escolha uma Tabela de Origem.', 'Informação', MB_ICONINFORMATION + MB_OK);
      lcxTabelaOrigem.SetFocus;
      Exit;
    end;
    //verifica se foi escolhido uma tabela de destino
    if lcxTabelaDestino.Text = '' then
    begin
      Application.MessageBox('Escolha uma Tabela de Destino.', 'Informação', MB_ICONINFORMATION + MB_OK);
      lcxTabelaDestino.SetFocus;
      Exit;
    end;
    //se tabela de origem não tem informação será abortado
    if lblAvisoVazio.Visible then
      Exit;
    {$ENDREGION}
    //instanciando componente
    QueryInserir_Emol_Item               := TSQLQuery.Create(nil);
    //conectando componente
    QueryInserir_Emol_Item.SQLConnection := dtmControles.DB;
    //
    with QueryTabelaItem do
    begin
      {$REGION 'ROTINA QUE VERIFICA SE JÁ EXISTEM REGISTROS PARA A TABELA A SER IMPORTADO
                E PERGUNTA SE É ISSO MESMO QUE USUARIO QUER, PORQUE SE FOR, SERÃO EXCLUÍDOS
                OS REGISTROS EXISTENTES'}

      {carregando query que lista os itens da tabela de Emolumentos
       para vefificar se a tabela a ser preenchida não possui dados
      }
      CarregaEmolumentoItem(frmEmolumento.lcxEmolumentoPeriodo.EditValue, lcxTabelaDestino.EditValue);//carrega emolumentos filtrando pelo periodo de destino
      //verifica se não é vazio
      if not IsEmpty then
      begin
        if lblAviso.Visible then
        begin
          vlMsg := 'Isso fará com que a Tabela a receber Importação seja limpada, para receber os novos dados.' + #13 + #13 +
                   'Você Confirma isto ?';
          if Application.MessageBox(pchar(vlMsg), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
          begin
            AdvSmoothProgressBar1.Position := 0;
            Exit;
          end
          else
          begin
            //apagando dados da tabela selecionada para receber a importação
            dtmControles.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM G_EMOLUMENTO_ITEM ');
            SQL.Add('WHERE EMOLUMENTO_PERIODO_ID = ' + FloatToStr(frmEmolumento.lcxEmolumentoPeriodo.EditValue));
            SQL.Add('  AND EMOLUMENTO_ID         = ' + FloatToStr(lcxTabelaDestino.EditValue));
            ExecSQL(False);
            dtmControles.Commit;
          end;
        end
        else
        begin
          AdvSmoothProgressBar1.Position := 0;
        end;
      end;
      {$ENDREGION}

      {$REGION 'ROTINA RESPONSAVEL PELA IMPORTAÇÃO'}
      {carregando query que lista os itens da tabela para vefificar se a tabela
       de origem não possui dados }
      //carrega tabela filtrando pelo periodo de origem
      CarregaEmolumentoItem(frmEmolumento.lcxEmolumentoPeriodo.EditValue, lcxTabelaOrigem.EditValue);
      //Pergunta se o usuário quer mesmo importar
      vlMsg := 'Tem certeza que deseja Importar os itens da Tabela abaixo?' + #13 + #13 +
               'Importar da Tabela : ' + lcxTabelaOrigem.EditText + #13 +
               'Para a Tabela           : ' + lcxTabelaDestino.EditText;
      if Application.MessageBox(pchar(vlMsg), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Exit;
      StatusOpcoesTela(False);
      {enquanto g_emolumentos não tiver no fim, será selecionado
       somente os dados referentes ao codigo do emolumento e periodo a ser gravado }
      Application.ProcessMessages;
      //carrega emolumentos filtrando pelo periodo de origem e EMOLUMENTO_id
      CarregaEmolumentoItem(frmEmolumento.lcxEmolumentoPeriodo.EditValue, lcxTabelaOrigem.EditValue);
      First;
      //laço para lançar itens na nova tabela
      Application.ProcessMessages;
      repeat
        with QueryInserir_Emol_Item do
        begin
          dtmControles.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO G_EMOLUMENTO_ITEM');
          SQL.Add(' ( ');
          SQL.Add('   VALOR_EMOLUMENTO, ');
          SQL.Add('   EMOLUMENTO_ITEM_ID, ');
          SQL.Add('   EMOLUMENTO_ID, ');
          SQL.Add('   VALOR_INICIO,');
          SQL.Add('   VALOR_FIM, ');
          SQL.Add('   VALOR_TAXA_JUDICIARIA,');
          SQL.Add('   EMOLUMENTO_PERIODO_ID,');
          SQL.Add('   CODIGO,');
          SQL.Add('   PAGINA_EXTRA,');
          SQL.Add('   VALOR_PAGINA_EXTRA,');
          SQL.Add('   VALOR_OUTRA_TAXA1');
          SQL.Add('  )');
          SQL.Add('VALUES ' );
          SQL.Add('  (');
          SQL.Add('   :VALOR_EMOLUMENTO, ');
          SQL.Add('   :EMOLUMENTO_ITEM_ID, ');
          SQL.Add('   :EMOLUMENTO_ID, ');
          SQL.Add('   :VALOR_INICIO,');
          SQL.Add('   :VALOR_FIM, ');
          SQL.Add('   :VALOR_TAXA_JUDICIARIA,');
          SQL.Add('   :EMOLUMENTO_PERIODO_ID,');
          SQL.Add('   :CODIGO,');
          SQL.Add('   :PAGINA_EXTRA,');
          SQL.Add('   :VALOR_PAGINA_EXTRA,');
          SQL.Add('   :VALOR_OUTRA_TAXA1');
          SQL.Add('  )');
          // não alterar valor de emolumento
          if rdbNaoAlterar.Checked then
            ParamByName('VALOR_EMOLUMENTO').AsFloat       := QueryTabelaItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency;
          //divide por 2
          if rdbAlterar1_2.Checked then
            ParamByName('VALOR_EMOLUMENTO').AsFloat       := QueryTabelaItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency / 2;
          //divide por 4
          if rdbAlterar1_4.Checked then
            ParamByName('VALOR_EMOLUMENTO').AsFloat       := QueryTabelaItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency / 4;
          //multiplica por 2
          if rdbAlterar2x.Checked then
            ParamByName('VALOR_EMOLUMENTO').AsFloat       := QueryTabelaItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency * 2;
          ParamByName('EMOLUMENTO_ITEM_ID').AsFloat       := dtmControles.GerarSequencia('G_EMOLUMENTO_ITEM');
          ParamByName('EMOLUMENTO_ID').AsFloat            := lcxTabelaDestino.EditValue;
          ParamByName('VALOR_INICIO').AsCurrency          := QueryTabelaItem.FieldByName('VALOR_INICIO').AsCurrency;
          ParamByName('VALOR_FIM').AsCurrency             := QueryTabelaItem.FieldByName('VALOR_FIM').AsCurrency;
          ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency := QueryTabelaItem.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency;
          ParamByName('EMOLUMENTO_PERIODO_ID').AsFloat    := frmEmolumento.lcxEmolumentoPeriodo.EditValue;
          ParamByName('CODIGO').AsFloat                   := QueryTabelaItem.FieldByName('CODIGO').AsFloat;
          ParamByName('PAGINA_EXTRA').AsFloat             := QueryTabelaItem.FieldByName('PAGINA_EXTRA').AsFloat;
          ParamByName('VALOR_PAGINA_EXTRA').AsCurrency    := QueryTabelaItem.FieldByName('VALOR_PAGINA_EXTRA').AsCurrency;
          ParamByName('VALOR_OUTRA_TAXA1').AsCurrency     := QueryTabelaItem.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency;
          ExecSQL();
          dtmControles.Commit;
        end;
        Next;
        AdvSmoothProgressBar1.Next;
        Application.ProcessMessages;
      until Eof;
      AdvSmoothProgressBar1.Position := 100;
      Application.MessageBox('Duplicado com Sucesso!', 'Concluído', MB_ICONINFORMATION + MB_OK);
      StatusOpcoesTela(True);
      FreeAndNil(QueryInserir_Emol_Item);
      AdvSmoothProgressBar1.Position := 0;
      {$ENDREGION}
    end;
  except on E: Exception do
  begin
    AdvSmoothProgressBar1.Position := 0;
    if QueryInserir_Emol_Item <> nil then
      FreeAndNil(QueryInserir_Emol_Item);
    vlMsg := 'Não houve sucesso na tentativa de Duplicar a Tabela de Emolumentos.' + #13 +
             'Descrição do Erro: ' + #13 + '[ ' + E.Message + ']';
    Application.MessageBox(pchar(vlMsg), 'Atenção!', MB_ICONEXCLAMATION + MB_OK);
    StatusOpcoesTela(True);
  end;
  end;
end;
procedure TfrmImportarTabelas.FormActivate(Sender: TObject);
begin
  inherited;
  lcxTabelaOrigem.SetFocus;
end;

procedure TfrmImportarTabelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action              := caFree;
  frmImportarTabelas  := nil;
end;

procedure TfrmImportarTabelas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not btnConfirmarItem.Enabled then
    Abort;
end;

procedure TfrmImportarTabelas.FormCreate(Sender: TObject);
begin
  inherited;
  vlAlterar := True;
  QueryTabelaItem               := TSQLQuery.Create(nil);
  QueryTabelaItem.SQLConnection := dtmControles.DB;

  caption   := 'Importar do Período: " ' + frmEmolumento.lcxEmolumentoPeriodo.Text + ' "';
end;

procedure TfrmImportarTabelas.lcxPeriodoDestinoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  VerificaSeExisteDadosTabelaDestino;
end;

procedure TfrmImportarTabelas.lcxTabelaDestinoExit(Sender: TObject);
begin
  inherited;
  if (not vlAlterar) or (lcxTabelaDestino.EditValue = null) then
    exit;

  VerificaSeExisteDadosTabelaDestino;
end;

procedure TfrmImportarTabelas.lcxTabelaOrigemExit(Sender: TObject);
begin
  inherited;
  if (not vlAlterar) or (lcxTabelaOrigem.EditValue = null) then
    exit;

  //carregando query que lista os Periodos Exceto o periodo que foi escolhido para duplicação
  try
    with sqlG_Emolumento_Periodo do
    begin
      Close;
      Filtered := False;
      Filter   := 'EMOLUMENTO_ID <> ' + FloatToStr(lcxTabelaOrigem.EditValue);
      Filtered := True;
      Open;
    end;
  except
  end;
  VerificaSeExisteDadosTabelaOrigem;
end;

procedure TfrmImportarTabelas.lcxTabelaOrigemPropertiesChange(Sender: TObject);
begin
  inherited;
  VerificaSeExisteDadosTabelaOrigem;
end;

procedure TfrmImportarTabelas.StatusOpcoesTela(AtivaDesativa: boolean);
begin
  if AtivaDesativa then
  begin
    gbxTabelas.Enabled       := True;
    btnConfirmarItem.Enabled := True;
    btnCancelar.Enabled      := True;
  end
  else
  begin
    gbxTabelas.Enabled       := False;
    btnConfirmarItem.Enabled := False;
    btnCancelar.Enabled      := False;
  end;
end;

procedure TfrmImportarTabelas.VerificaSeExisteDadosTabelaDestino;
begin
  try
    {carregando query que lista os itens da tabela de Emolumentos
    para vefificar se a tabela a ser preenchida não possui dados
    }
  with QueryTabelaItem do
    begin
      CarregaEmolumentoItem(frmEmolumento.lcxEmolumentoPeriodo.EditValue, lcxTabelaDestino.EditValue);
      //verifica se não é vazio
      if not IsEmpty then
      begin
        //pergunta se tem certeza.
        lblAviso.Caption := 'Você está tentando duplicar para uma tabela'+#13+'que possui informações.';
        lblAviso.Visible := True;
      end
      else
      begin
        lblAviso.Visible := False;
      end;
    end;
  except
  end;
end;

procedure TfrmImportarTabelas.VerificaSeExisteDadosTabelaOrigem;
begin
  {$REGION 'ROTINA QUE VERIFICA SE TABELA ESTÁ VAZIA'}
  try
    CarregaEmolumentoItem(frmEmolumento.lcxEmolumentoPeriodo.EditValue, lcxTabelaOrigem.EditValue);
    //verificando se a Tabela a receber a importação não está vazia;
    if QueryTabelaItem.IsEmpty then
    begin
      lblAvisoVazio.Caption := 'Tabela vazia';
      lblAvisoVazio.Visible := True;
    end
    else
      lblAvisoVazio.Visible := False;
  except
  end;
  {$ENDREGION}
end;

end.
