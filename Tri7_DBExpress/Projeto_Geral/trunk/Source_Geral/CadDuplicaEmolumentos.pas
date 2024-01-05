unit CadDuplicaEmolumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, Menus, FMTBcd,
  cxControls, cxContainer, cxEdit, DB, SimpleDS, cxCurrencyEdit,
  cxTextEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, StdCtrls, cxGroupBox,
  AdvSmoothProgressBar, DBClient, Provider, SqlExpr, cxButtons, ExtCtrls,
  Data.DBXInterBase, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  DbxDevartInterBase;

type
  TfrmCadDuplicaEmolumento = class(TfrmCadAuxiliar)
    sqlG_Emolumento_Periodo: TSimpleDataSet;
    sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TFMTBCDField;
    sqlG_Emolumento_PeriodoDESCRICAO: TStringField;
    sqlG_Emolumento_PeriodoSITUACAO: TStringField;
    dtsG_Emolumento_Periodo: TDataSource;
    AdvSmoothProgressBar1: TAdvSmoothProgressBar;
    gbxPeriodos: TcxGroupBox;
    Label1: TLabel;
    Label14: TLabel;
    lblAviso: TcxLabel;
    gbxOpcoes: TcxGroupBox;
    chxAltTxJudTitulos: TcxCheckBox;
    chxAltTxJudCertidoes: TcxCheckBox;
    chxAumentEmolTitulos: TcxCheckBox;
    chxAumentEmolCertidoes: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    edtAltTxJudTitulos: TcxCurrencyEdit;
    edtAltTxJudCertidoes: TcxCurrencyEdit;
    edtAumentEmolTitulos: TcxCurrencyEdit;
    edtAumentCert: TcxCurrencyEdit;
    btnConfirmarItem: TcxButton;
    lcxPeriodoOrigem: TcxLookupComboBox;
    lcxPeriodoDestino: TcxLookupComboBox;
    btnAdicionarEmolumentoPeriodo: TcxButton;
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure lcxPeriodoOrigemExit(Sender: TObject);
    procedure lcxPeriodoDestinoPropertiesChange(Sender: TObject);
    procedure btnAdicionarEmolumentoPeriodoClick(Sender: TObject);
    procedure chxAltTxJudTitulosClick(Sender: TObject);
    procedure chxAltTxJudCertidoesClick(Sender: TObject);
    procedure chxAumentEmolTitulosClick(Sender: TObject);
    procedure chxAumentEmolCertidoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    QueryEmolItem : TSQLQuery;
    procedure CarregaEmolumentoItem(periodoId : integer; emolumentoId : string);
    procedure StatusOpcoesTela(AtivaDesativa : boolean); // desabilitar ou habilitar as opcoes existentes na tela em caso de estar processando a duplica��o
  public
    { Public declarations }
    procedure DuplicarPeriodo;
  end;

var
  frmCadDuplicaEmolumento: TfrmCadDuplicaEmolumento;

implementation

uses Lookup, Controles, Cadastro;

{$R *.dfm}

{ TfrmCadDuplicaEmolumento }

procedure TfrmCadDuplicaEmolumento.btnAdicionarEmolumentoPeriodoClick(
  Sender: TObject);
begin
  inherited;
  CadEmolumentoPeriodo(True);
  try
    dtmLookup.sqlG_Emolumento_Periodo.Refresh;
    sqlG_Emolumento_Periodo.Refresh;
  except
  end;
end;

procedure TfrmCadDuplicaEmolumento.btnConfirmarItemClick(Sender: TObject);
begin
  inherited;
  DuplicarPeriodo;
  //ATUALIZA
  try
    dtmLookup.sqlG_Emolumento_Periodo.Refresh;
    sqlG_Emolumento_Periodo.Refresh;
  except
  end;
end;

procedure TfrmCadDuplicaEmolumento.CarregaEmolumentoItem(periodoId: integer; emolumentoId : string);
begin
  //carregando query que lista os itens do periodo
  with QueryEmolItem do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT VALOR_EMOLUMENTO, ');
    SQL.Add('       EMOLUMENTO_ITEM_ID, ');
    SQL.Add('       EMOLUMENTO_ID, ');
    SQL.Add('       VALOR_INICIO, ');
    SQL.Add('       VALOR_FIM, ');
    SQL.Add('       VALOR_TAXA_JUDICIARIA, ');
    SQL.Add('       EMOLUMENTO_PERIODO_ID, ');
    SQL.Add('       CODIGO, ');
    SQL.Add('       PAGINA_EXTRA, ');
    SQL.Add('       VALOR_PAGINA_EXTRA, ');
    SQL.Add('       VALOR_OUTRA_TAXA1 ');
    SQL.Add('FROM G_EMOLUMENTO_ITEM ');
    SQL.Add('WHERE EMOLUMENTO_PERIODO_ID = ' + IntToStr(periodoId));
    if emolumentoId <> '' then
      SQL.Add(' AND EMOLUMENTO_ID = ' + emolumentoId);
    Open;
  end;
end;

procedure TfrmCadDuplicaEmolumento.chxAumentEmolCertidoesClick(Sender: TObject);
begin
  inherited;
  if chxAumentEmolCertidoes.Checked then
    edtAumentCert.Enabled := True
  else
  begin
    edtAumentCert.Enabled := False;
    edtAumentCert.clear;
  end;
end;

procedure TfrmCadDuplicaEmolumento.chxAumentEmolTitulosClick(Sender: TObject);
begin
  inherited;
  if chxAumentEmolTitulos.Checked then
    edtAumentEmolTitulos.Enabled := True
  else
  begin
    edtAumentEmolTitulos.Enabled := False;
    edtAumentEmolTitulos.Clear;
  end;
end;

procedure TfrmCadDuplicaEmolumento.chxAltTxJudCertidoesClick(Sender: TObject);
begin
  inherited;
  if chxAltTxJudCertidoes.Checked then
    edtAltTxJudCertidoes.Enabled := True
  else
  begin
    edtAltTxJudCertidoes.Enabled := False;
    edtAltTxJudCertidoes.Clear;
  end;
end;

procedure TfrmCadDuplicaEmolumento.chxAltTxJudTitulosClick(Sender: TObject);
begin
  inherited;
  if chxAltTxJudTitulos.Checked then
    edtAltTxJudTitulos.Enabled := True
  else
  begin
    edtAltTxJudTitulos.Enabled := False;
    edtAltTxJudTitulos.Clear;
  end;
end;

procedure TfrmCadDuplicaEmolumento.DuplicarPeriodo;
var
  QueryInserir_Emol_Item, QueryEmol : TSQLQuery;
  vlMsg : String;
begin
  try
    {$REGION 'VALIDANDO CAMPOS'}
    //verifica se foi escolhido uma periodo de origem
    if lcxPeriodoOrigem.Text = '' then
    begin
      Application.MessageBox('Escolha um Per�odo de Origem.', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      lcxPeriodoOrigem.SetFocus;
      Exit;
    end;
    //verifica se foi escolhido uma tabela de destino
    if lcxPeriodoDestino.Text = '' then
    begin
      Application.MessageBox('Escolha um Per�odo de Destino.', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      lcxPeriodoDestino.SetFocus;
      Exit;
    end;

    //tx judici�ria de titulos sem valor
    if (chxAltTxJudTitulos.Checked)and(Trim(edtAltTxJudTitulos.Text) = '') then
    begin
      Application.MessageBox('Digite um valor para Tx. Judici�ria de Titulos ou desative esta Op��o.', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      edtAltTxJudTitulos.SetFocus;
      Exit;
    end;

    //tx judici�ria de Certid�es sem valor
    if (chxAltTxJudCertidoes.Checked)and(Trim(edtAltTxJudCertidoes.Text) = '') then
    begin
      Application.MessageBox('Digite um valor para Tx. Judici�ria de Certid�es ou desative esta Op��o.', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      edtAltTxJudCertidoes.SetFocus;
      Exit;
    end;

    //tx Aumento de Emolumento de Titulos sem valor
    if (chxAumentEmolTitulos.Checked)and(Trim(edtAumentEmolTitulos.Text) = '') then
    begin
      Application.MessageBox('Digite um valor % para Aumento de Emolumentos de Titulos ou desative esta Op��o.', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      edtAumentEmolTitulos.SetFocus;
      Exit;
    end;

    //tx Aumento de Emolumento de Certid�es sem valor
    if (chxAumentEmolCertidoes.Checked)and(Trim(edtAumentCert.Text) = '') then
    begin
      Application.MessageBox('Digite um valor % para Aumento de Emolumentos de Certid�es ou desative esta Op��o.', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      edtAumentCert.SetFocus;
      Exit;
    end;
    {$ENDREGION}

    //instanciando componente
    QueryInserir_Emol_Item := TSQLQuery.Create(nil);
    QueryEmol              := TSQLQuery.Create(nil);
    //conectando componente
    QueryInserir_Emol_Item.SQLConnection := dtmControles.DB;
    QueryEmol.SQLConnection              := dtmControles.DB;
    //
    with QueryEmolItem do
    begin
      {$REGION 'ROTINA QUE VERIFICA SE TABELA EST� VAZIA'}
      CarregaEmolumentoItem(lcxPeriodoOrigem.EditValue, '');//carrega emolumentos filtrando pelo periodo de origem

      //verificando se per�odo a ser duplicado n�o est� vazio;
      if IsEmpty then
      begin
        Application.MessageBox('Voc� n�o pode Duplicar de um Per�odo sem Informa��es.', 'Aten��o', MB_ICONWARNING + MB_OK);
        AdvSmoothProgressBar1.Position := 0;
        Exit;
      end;
      {$ENDREGION}

      {$REGION 'ROTINA QUE VERIFICA SE J� EXISTEM REGISTROS PARA O PERIODO A SER DUPLICADO
        E PERGUNTA SE � ISSO MESMO QUE USUARIO QUER, PORQUE SE FOR, SER�O EXCLU�DOS
        OS REGISTROS EXISTENTES'}

      {carregando query que lista os itens da tabela de Emolumentos
       para vefificar se a tabela a ser preenchida n�o possui dados
      }
      CarregaEmolumentoItem(lcxPeriodoDestino.EditValue,'');//carrega emolumentos filtrando pelo periodo de destino
      //verifica se n�o � vazio
      if not IsEmpty then
      begin
        if lblAviso.Visible then
        begin
          vlMsg := 'Isso far� com que o Per�odo a ser Duplicado seja limpado para receber os novos dados.' + #13 + #13 +
                   'Voc� Confirma isto ?';
          if Application.MessageBox(pchar(vlMsg), 'Confirma��o', MB_ICONQUESTION + MB_YESNO) = IDNO then
          begin
            AdvSmoothProgressBar1.Position := 0;
            Exit;
          end
          else
          begin
            //apagando dados do Periodo selecionado para receber a duplica��o
            dtmControles.StartTransaction;
            try
              Close;
              SQL.Clear;
              SQL.Add('DELETE FROM G_EMOLUMENTO_ITEM ');
              SQL.Add('WHERE EMOLUMENTO_PERIODO_ID = ' + FloatToStr(lcxPeriodoDestino.EditValue));
              ExecSQL();
              dtmControles.Commit;
            except
              dtmControles.Roolback;
            end;
          end;
        end
        else
        begin
          AdvSmoothProgressBar1.Position := 0;
          Exit;
        end;
      end;
      {$ENDREGION}

      {$REGION 'ROTINA RESPONSAVEL PELA DUPLICA��O'}
      {carregando query que lista os itens da tabela de Emolumentos
       para vefificar se a tabela de origem n�o possui dados
      }
      CarregaEmolumentoItem(lcxPeriodoOrigem.EditValue, '');//carrega emolumentos filtrando pelo periodo de origem

      //Pergunta se o usu�rio quer mesmo Duplicar
      vlMsg := 'Tem certeza que deseja duplicar os itens do Per�odo de Emolumentos abaixo?' + #13 + #13 +
               'Duplicar do Per�odo : ' + lcxPeriodoOrigem.EditText + #13 +
               'Para o Per�odo          : ' + lcxPeriodoDestino.EditText;
      if Application.MessageBox(pchar(vlMsg), 'Confirma��o', MB_ICONQUESTION + MB_YESNO) = IDNO then
        Exit;

      StatusOpcoesTela(False);
      //abrindo table G_EMOLUMENTO
      with QueryEmol do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT EMOLUMENTO_ID, TIPO FROM G_EMOLUMENTO ');
        Sql.Add('WHERE (SITUACAO IS NULL OR SITUACAO = '+QuotedStr('A')+')');
        Open;
        First;
      end;
      //

      {enquanto g_emolumentos n�o tiver no fim, ser� selecionado
       somente os dados referentes ao codigo do emolumento e periodo a ser gravado}
      Application.ProcessMessages;
      repeat
      begin
        //carrega emolumentos filtrando pelo periodo de origem e EMOLUMENTO_id
        CarregaEmolumentoItem(lcxPeriodoOrigem.EditValue, QueryEmol.FieldByName('EMOLUMENTO_ID').AsString);
        First;

        if not QueryEmolItem.IsEmpty then
        begin
          //la�o para lan�ar itens na nova tabela
          Application.ProcessMessages;
          repeat
            with QueryInserir_Emol_Item do
            begin
              dtmControles.StartTransaction;
              try
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

                {SE OP��O AUMENTO EMOL % TITULOS TIVER MARCADA.
                 SER� VERIFICADO SE O TIPO � TITULOS PARA ENT�O GRAVAR O AUMENTO. MAS SE O TIPO FOR OUTRO SER�
                 VERIFICADO SE A OP�AO DE AUMENTO EMOL % CERTIDOES N�O ESTA MARCADA. PORQUE SE N�O TIVER MARCADA SER�
                 APENAS COPIADO DA TABELA DE ORIGEM }
                if (chxAumentEmolTitulos.Checked) then
                begin
                  if (QueryEmol.FieldByName('TIPO').AsString = 'T') then
                    ParamByName('VALOR_EMOLUMENTO').AsCurrency := QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency +
                                                                  ((edtAumentEmolTitulos.Value * QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency)/100)
                  else
                  if not chxAumentEmolCertidoes.Checked then
                    ParamByName('VALOR_EMOLUMENTO').AsCurrency   := QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency;
                end;

                {SE OP��O AUMENTO EMOL % CERTIDOES TIVER MARCADA.
                 SER� VERIFICADO SE O TIPO � CERTIDOES PARA ENT�O GRAVAR O AUMENTO. MAS SE O TIPO FOR OUTRO SER�
                 VERIFICADO SE A OP�AO DE AUMENTO EMOL % TITULOS N�O ESTA MARCADA. PORQUE SE N�O TIVER MARCADA SER�
                 APENAS COPIADO DA TABELA DE ORIGEM }
                if (chxAumentEmolCertidoes.Checked) then
                begin
                  if (QueryEmol.FieldByName('TIPO').AsString = 'C') then
                    ParamByName('VALOR_EMOLUMENTO').AsCurrency := QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency +
                                                                 ((edtAumentCert.Value * QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency)/100)
                  else
                  if not chxAumentEmolTitulos.Checked then
                    ParamByName('VALOR_EMOLUMENTO').AsCurrency   := QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency;
                end;

                {se as op��es para AUMENTO EMOL % TITULOS e AUMENTO EMOL % CERTIDOES estiverem desmarcadas ou caso tipo seja P}
                if ((chxAumentEmolTitulos.Checked = False)and(chxAumentEmolCertidoes.Checked = False))or(QueryEmol.FieldByName('TIPO').AsString = 'P') then
                  ParamByName('VALOR_EMOLUMENTO').AsCurrency          := QueryEmolItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency;

                ParamByName('EMOLUMENTO_ITEM_ID').AsFloat           := dtmControles.GerarSequencia('G_EMOLUMENTO_ITEM');
                ParamByName('EMOLUMENTO_ID').AsFloat                := QueryEmolItem.FieldByName('EMOLUMENTO_ID').AsFloat;
                ParamByName('VALOR_INICIO').AsCurrency              := QueryEmolItem.FieldByName('VALOR_INICIO').AsCurrency;
                ParamByName('VALOR_FIM').AsCurrency                 := QueryEmolItem.FieldByName('VALOR_FIM').AsCurrency;
                {SE OP��O TX JUD. TITULOS TIVER MARCADA.
                 SER� VERIFICADO SE O TIPO � TITULOS PARA ENT�O GRAVAR A TX JUD DE TITULOS. MAS SE O TIPO FOR OUTRO SER�
                 VERIFICADO SE A OP�AO DE ALT. TX JUD. DE CERTIDOES N�O ESTA MARCADA. PORQUE SE N�O TIVER MARCADA SER�
                 APENAS COPIADO DA TABELA DE ORIGEM }
                if (chxAltTxJudTitulos.Checked) then
                begin
                  if (QueryEmol.FieldByName('TIPO').AsString = 'T') then
                    ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency := StrToCurr(StringReplace(edtAltTxJudTitulos.Text, '.', '', [rfReplaceAll]))
                  else
                  if not chxAltTxJudCertidoes.Checked then
                    ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency   := QueryEmolItem.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency;
                end;

                {SE OP��O TX JUD. CERTIDOES TIVER MARCADA.
                 SER� VERIFICADO SE O TIPO � CERTIDOES PARA ENT�O GRAVAR A TX JUD DE CERTIDOES. MAS SE O TIPO FOR OUTRO SER�
                 VERIFICADO SE A OP�AO DE ALT. TX JUD. DE TITULOS N�O ESTA MARCADA. PORQUE SE N�O TIVER MARCADA SER�
                 APENAS COPIADO DA TABELA DE ORIGEM }
                if (chxAltTxJudCertidoes.Checked) then
                begin
                  if (QueryEmol.FieldByName('TIPO').AsString = 'C') then
                    ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency := StrToCurr(StringReplace(edtAltTxJudCertidoes.Text, '.', '', [rfReplaceAll]))
                  else
                  if not chxAltTxJudTitulos.Checked then
                    ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency   := QueryEmolItem.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency;
                end;

                {se as op��es para tx jud. titulos e tx jud. de certidoes estiverem desmarcadas ou caso tipo seja P}
                if ((chxAltTxJudTitulos.Checked = False)and(chxAltTxJudCertidoes.Checked = False))or(QueryEmol.FieldByName('TIPO').AsString = 'P') then
                  ParamByName('VALOR_TAXA_JUDICIARIA').AsCurrency   := QueryEmolItem.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency;
                ParamByName('EMOLUMENTO_PERIODO_ID').AsFloat        := lcxPeriodoDestino.EditValue;
                ParamByName('CODIGO').AsFloat                       := QueryEmolItem.FieldByName('CODIGO').AsFloat;
                ParamByName('PAGINA_EXTRA').AsFloat                 := QueryEmolItem.FieldByName('PAGINA_EXTRA').AsFloat;
                ParamByName('VALOR_PAGINA_EXTRA').AsCurrency        := QueryEmolItem.FieldByName('VALOR_PAGINA_EXTRA').AsCurrency;
                ParamByName('VALOR_OUTRA_TAXA1').AsCurrency         := QueryEmolItem.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency;

                ExecSQL();
                dtmControles.Commit;
              except
                dtmControles.Roolback;
              end;
            end;
            Next;
            Application.ProcessMessages;
          until Eof;
        end;

        QueryEmol.Next;//
        AdvSmoothProgressBar1.Next;
      end;
      until QueryEmol.Eof;
      AdvSmoothProgressBar1.Position := 100;
      Application.MessageBox('Duplicado com Sucesso!', 'Conclu�do', MB_ICONINFORMATION + MB_OK);
      StatusOpcoesTela(True);
      //
      FreeAndNil(QueryInserir_Emol_Item);
      AdvSmoothProgressBar1.Position := 0;
      {$ENDREGION}
    end;
  except on E: Exception do
  begin
    AdvSmoothProgressBar1.Position := 0;

    if QueryInserir_Emol_Item <> nil then
      FreeAndNil(QueryInserir_Emol_Item);
    vlMsg := 'N�o houve sucesso na tentativa de Duplicar os Per�odos.' + #13 +
             'Descri��o do Erro: ' + #13 + '[ ' + E.Message + ' ]';
    Application.MessageBox(pchar(vlMsg), 'Aten��o!', MB_ICONEXCLAMATION + MB_OK);
    StatusOpcoesTela(True);
  end;
  end;
end;
procedure TfrmCadDuplicaEmolumento.FormActivate(Sender: TObject);
begin
  inherited;
  lcxPeriodoOrigem.SetFocus;
end;

procedure TfrmCadDuplicaEmolumento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action                  := caFree;
  frmCadDuplicaEmolumento := nil;
end;

procedure TfrmCadDuplicaEmolumento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not btnConfirmarItem.Enabled then
    Abort;
end;

procedure TfrmCadDuplicaEmolumento.FormCreate(Sender: TObject);
begin
  inherited;
  QueryEmolItem               := TSQLQuery.Create(nil);
  QueryEmolItem.SQLConnection := dtmControles.DB;
end;

procedure TfrmCadDuplicaEmolumento.lcxPeriodoDestinoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  try
    {carregando query que lista os itens da tabela de Emolumentos
    para vefificar se a tabela a ser preenchida n�o possui dados
    }
    with QueryEmolItem do
    begin
      CarregaEmolumentoItem(lcxPeriodoDestino.EditValue, '');
      //verifica se n�o � vazio
      if not IsEmpty then
      begin
        //pergunta se tem certeza. Caso n�o tenha ser� abortado
        lblAviso.Caption := 'Voc� est� tentando duplicar para um per�odo'+#13+'que j� possui informa��es.';
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

procedure TfrmCadDuplicaEmolumento.lcxPeriodoOrigemExit(Sender: TObject);
begin
  inherited;
  if lcxPeriodoOrigem.EditValue = null then
    exit;

  //carregando query que lista os Periodos Exceto o periodo que foi escolhido para duplica��o
  try
    with sqlG_Emolumento_Periodo do
    begin
      Close;
      Filtered := False;
      Filter   := 'EMOLUMENTO_PERIODO_ID <> ' + FloatToStr(lcxPeriodoOrigem.EditValue);
      Filtered := True;
      Open;
    end;
  except
  end;
end;

procedure TfrmCadDuplicaEmolumento.StatusOpcoesTela(AtivaDesativa: boolean);
begin
  if AtivaDesativa then
  begin
    gbxPeriodos.Enabled      := True;
    gbxOpcoes.Enabled        := True;
    btnConfirmarItem.Enabled := True;
    btnCancelar.Enabled      := True;
  end
  else
  begin
    gbxPeriodos.Enabled      := False;
    gbxOpcoes.Enabled        := False;
    btnConfirmarItem.Enabled := False;
    btnCancelar.Enabled      := False;
  end;
end;

end.


