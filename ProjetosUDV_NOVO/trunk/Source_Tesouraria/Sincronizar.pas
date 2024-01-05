unit Sincronizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxContainer, cxLabel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, SimpleDS, cxCheckBox, cxPC,
  cxImageComboBox, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, Data.DBXInterBase, frxClass, DbxDevartInterBase, Grids, System.Win.ComObj,
  cxProgressBar, dxGDIPlusClasses;

type
  TAssociado = Record
    Selecao : String;
    Flag : Boolean;
  End;

  TfrmSincronizar = class(TForm)
    Panel2: TPanel;
    pgcSincronizar: TcxPageControl;
    tabSincronizacao: TcxTabSheet;
    pnlSincronizar: TPanel;
    btnSincronizar: TcxButton;
    PanelBotaoFechar: TPanel;
    cxGridSincroniza: TcxGrid;
    cxGridDBSincronizar: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dtsXmlAtualizador: TDataSource;
    OpenDialog1: TOpenDialog;
    sqlVerificar: TSimpleDataSet;
    sqlVerificarNOME: TStringField;
    sqlVerificarPESSOA_ID: TFMTBCDField;
    sqlVerificarGRAU: TStringField;
    sqlVerificarSITUACAO: TStringField;
    sqlVerificarCPF: TStringField;
    sqlVerificarRG: TStringField;
    sqlVerificarEMAIL: TStringField;
    cxGridDBSincronizarColumn1: TcxGridDBColumn;
    sqlVerificarSINCRONIZADO_SITUACAO_OLD: TStringField;
    sqlVerificarSINCRONIZADO_DATA: TSQLTimeStampField;
    sqlVerificarSINCRONIZA_REUNI_ID: TFMTBCDField;
    sqlVerificarSINCRONIZADO_SITUACAO_NEW: TStringField;
    sqlVerificarSINCRONIZADO_NOVO: TStringField;
    dtsVerificar: TDataSource;
    cxGridDBSincronizarColumn2: TcxGridDBColumn;
    lblSincronizar: TcxLabel;
    sqlVerificarCEDENTE_ID: TFMTBCDField;
    sqlVerificarSINCRONIZADO_OBSERVACAO: TStringField;
    sqlVerificarSINCRONIZADO_ANOMES_SITUACAO: TStringField;
    tabSincronizacaoAnterior: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBSincronizacaoAnterior: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    sqlSincronizacaoAnterior: TSimpleDataSet;
    dtsSincronizacaoAnterior: TDataSource;
    sqlSincronizacaoAnteriorNOME: TStringField;
    sqlSincronizacaoAnteriorPESSOA_ID: TFMTBCDField;
    sqlSincronizacaoAnteriorGRAU: TStringField;
    sqlSincronizacaoAnteriorSITUACAO: TStringField;
    sqlSincronizacaoAnteriorCPF: TStringField;
    sqlSincronizacaoAnteriorRG: TStringField;
    sqlSincronizacaoAnteriorEMAIL: TStringField;
    sqlSincronizacaoAnteriorSINCRONIZADO_SITUACAO_OLD: TStringField;
    sqlSincronizacaoAnteriorSINCRONIZADO_DATA: TSQLTimeStampField;
    sqlSincronizacaoAnteriorSINCRONIZA_REUNI_ID: TFMTBCDField;
    sqlSincronizacaoAnteriorSINCRONIZADO_SITUACAO_NEW: TStringField;
    sqlSincronizacaoAnteriorSINCRONIZADO_NOVO: TStringField;
    sqlSincronizacaoAnteriorCEDENTE_ID: TFMTBCDField;
    sqlSincronizacaoAnteriorSINCRONIZADO_OBSERVACAO: TStringField;
    sqlSincronizacaoAnteriorSINCRONIZADO_ANOMES_SITUACAO: TStringField;
    cxGridDBSincronizarObservacao: TcxGridDBColumn;
    cxGridDBSincronizacaoAnteriorObservacao: TcxGridDBColumn;
    Panel1: TPanel;
    lblSincronizaData: TcxLabel;
    lblSincronizaNomeArquivo: TcxLabel;
    sqlVerificarDATA_CADASTRO: TSQLTimeStampField;
    sqlVerificarBOLETO_EMAIL: TStringField;
    sqlVerificarEMAIL_TERCEIRO: TStringField;
    sqlXmlAtualizador: TClientDataSet;
    sqlXmlAtualizadorNOME: TStringField;
    sqlXmlAtualizadorCPF: TStringField;
    sqlXmlAtualizadorDOCUMENTO: TStringField;
    sqlXmlAtualizadorSITUACAO: TStringField;
    sqlXmlAtualizadorEMAIL: TStringField;
    sqlXmlAtualizadorCHAVE_GRAU_ATUAL: TFMTBCDField;
    btnConfirma: TcxButton;
    btnCancelar: TcxButton;
    cxBtnFechar: TcxButton;
    sqlVerificarPESSOA_GRUPO_ID: TFMTBCDField;
    Panel4: TPanel;
    lblInformacaoLancamento: TcxLabel;
    imgReceber: TImage;
    cxProgress: TcxProgressBar;
    sqlVerificarPRINCIPAL: TStringField;
    sqlVerificarEMAIL_GRUPO_PADRAO: TStringField;
    sqlVerificarPESSOA_TERCEIRO_ID: TFMTBCDField;
    tabExportar: TcxButton;
    sqlVerificarFATURA_TIPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure pgcSincronizarChange(Sender: TObject);
    procedure tabExportarClick(Sender: TObject);
  private
    vlNumeroLinhasXLS,
    vlNumeroColunasXLS : Integer;
    viLiberadoSincronizacao : Boolean;

    procedure HabilitarBotoes(vpHabilitado : Boolean);
    procedure VerificaSincronizacaoAnterior;
    Procedure ImportarDadosPlanilhaReuni;
    function XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmSincronizar: TfrmSincronizar;
  vgAssociado : TAssociado;

implementation

uses Controles, Lookup, GerenciadorCompromisso, Lookup_Contabil, Rotinas;

{$R *.dfm}

procedure TfrmSincronizar.btnConfirmaClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Confirma dados sincronizados?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
  begin
    btnCancelarClick(Self);
    exit;
  end;

  dtmControles.Commit;
  HabilitarBotoes(True);
  lblSincronizar.Enabled := False;
  lblSincronizar.Caption := 'Sincroniza��o Realizada!!!';
  lblSincronizar.Refresh;
  dtmLookup.AtualizarTabelas;
  sqlVerificar.Active := False;
  VerificaSincronizacaoAnterior;
  ShowMessage('Sincroniza��o Realizada!!!');
end;

procedure TfrmSincronizar.btnSincronizarClick(Sender: TObject);
var
  viSicronizaReuniId : Currency;
  viSituacaoNova, viPessoas, viPessoasSemCPF, viInfo : string;
  vgCadastrar, viAbriuForm : Boolean;

  procedure GravarHistoricoSincronizacao;
  Begin
    ExecutaSqlAuxiliar(' INSERT INTO T_SINCRONIZA_REUNI( '+
                       '              SINCRONIZA_REUNI_ID, '+
                       '              DATA, '+
                       '              CEDENTE_ID, '+
                       '              NOME_ARQUIVO) '+
                       ' VALUES(      :SINCRONIZA_REUNI_ID, '+
                       '              :DATA, '+
                       '              :CEDENTE_ID, '+
                       '              :NOME_ARQUIVO)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('SINCRONIZA_REUNI_ID').AsBCD := viSicronizaReuniId;
      ParamByName('DATA').AsString             := dtmControles.DataHoraBanco(5);
      ParamByName('CEDENTE_ID').AsCurrency     := vgCedenteAtivo;
      ParamByName('NOME_ARQUIVO').AsString     := ExtractFileName(OpenDialog1.FileName);
      ExecSQL(FALSE);
    end;
  end;

  procedure RegistrarCompromissoMensal;
    Function VerificaAtualizaCompromisso(vpCompromisso : string):Boolean;
    var
      viCompromissoAgendado : Integer;
    begin
      viCompromissoAgendado := dtmControles.GetInt(' SELECT COMPROMISSO_AGENDADO_ID '+
                                                   ' FROM T_COMPROMISSO_AGENDADO '+
                                                   '  WHERE LANCAMENTO_COMPROMISSO_ID = '+vpCompromisso+
                                                   '   AND PESSOA_ID = '+sqlVerificarPESSOA_ID.AsString);
      if viCompromissoAgendado = 0 then
        Result := False
      else
      begin
        ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET VALOR_ATUAL = :VALOR_ATUAL,'+
                           '                                   SITUACAO_LOCAL = '+ QuotedStr('1')+
                           ' WHERE LANCAMENTO_COMPROMISSO_ID = '+vpCompromisso,2);
        with dtmControles.sqlAuxiliar do
        begin
          ParamByName('VALOR_ATUAL').AsCurrency := dtmControles.SimpleAuxiliar.FieldByName('VALOR_ATUAL').AsCurrency;
          ExecSQL(FALSE);
        end;
        Result := True;
      end;
    end;
  begin
    ExecutaSimpleDSAux(' SELECT * '+
                       ' FROM T_LANCAMENTO_COMPROMISSO '+
                       ' WHERE SITUACAO = '+QuotedStr('1')+
                       '   AND BALANCETE_GRUPO_ID = 1'+
                       '   AND TODOS_SOCIOS = ''S''',0);
    with dtmControles.SimpleAuxiliar do
    begin
      while not eof do
      begin

        // Seta todos os compromissos da pessoa com n�o atualizado.
        ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET ATUALIZADO = '+QuotedStr('N')+
                           ' WHERE PESSOA_ID = '+ sqlVerificarPESSOA_ID.AsString,1);

        with dtmLookupContabil do
        begin
          if not VerificaAtualizaCompromisso(FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString) then
          begin
            vgCompromissoVencido.PessoaId          := sqlVerificarPESSOA_ID.AsInteger;
            vgCompromissoVencido.ContabilContaId   := FieldByName('CONTABIL_CONTA_ID').AsInteger;
            vgCompromissoVencido.Valor             := FieldByName('VALOR_ATUAL').AsCurrency;
            if FieldByName('ANO_MES_LANCAMENTO').AsString = '' then
                 vgCompromissoVencido.PeriodoInicial  := FieldByName('ANO_MES_INICIAL').AsString
            else vgCompromissoVencido.PeriodoInicial  := FieldByName('ANO_MES_LANCAMENTO').AsString;
            vgCompromissoVencido.PeriodoTipo       := FieldByName('PERIODO').AsInteger;
            vgCompromissoVencido.AnoMesLancamento  := '';
            vgCompromissoVencido.CentroCustoId     := FieldByName('CENTRO_CUSTO_ID').AsInteger;
            vgCompromissoVencido.BalanceteGrupoId  := FieldByName('BALANCETE_GRUPO_ID').AsInteger;
            vgCompromissoVencido.BoletoId          := '';
            vgCompromissoVencido.ReciboId          := '';
            vgCompromissoVencido.SituacaoLocal     := '1';
            vgCompromissoVencido.ReservaId         := 0;
            vgCompromissoVencido.SituacaoGeral           := '1';
            vgCompromissoVencido.LancamentoCompromissoId := FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString;
            vgCompromissoVencido.Obrigatorio             := 'S';
            vgCompromissoVencido.PeriodoFinal      := InttoStr(vgPeriodoAtual);
            vgCompromissoVencido.AtualizarAgendado := False;
            vgCompromissoVencido.MostrarMensagem   := False;
            dtmLookup.AdicionarCompromisso(True, True, False, 'C');
          end;
        end;
        Next;
      end;
      Close;
    end;
  end;

  Function PegarSituacao(vpSituacao : string) : String;
  begin
     if vpSituacao = 'FREQUENTE' then
       Result := '1'
     else
       if POS('AFASTADO', vpSituacao) > 0 then
         Result := '2'
     else
       if vpSituacao = 'LICENCIADO' then
         Result := '3'
     else
       if vpSituacao = 'SUSPENSO' then
         Result := '4'
     else
       if vpSituacao = 'TRANSFERIDO' then
         Result := '5'
     else
       if vpSituacao = 'FALECIDO' then
         Result := '6';
  end;

  procedure CarregarDados;
    function BuscarPessoa:Boolean;
    begin
      if (sqlXmlAtualizador.FieldByName('CPF').AsString <> '') and (sqlVerificar.Locate('CPF', sqlXmlAtualizador.FieldByName('CPF').AsString, [loCaseInsensitive])) then
        Result := True
      else
      begin
        if sqlVerificar.Locate('NOME', sqlXmlAtualizador.FieldByName('NOME').AsString, [loCaseInsensitive]) then
        begin
          if ((sqlXmlAtualizador.FieldByName('EMAIL').AsString) = (trim(sqlVerificarEMAIL.AsString))) or
             (sqlXmlAtualizador.FieldByName('CHAVE_GRAU_ATUAL').AsString = sqlVerificarGRAU.AsString) or
             (sqlXmlAtualizador.FieldByName('NOME').AsString = sqlVerificarNOME.AsString) then
               Result := True
          else Result := False;
        end
        else Result := False;
      end;
    end;

    function VerificarEmail(vpEmail : String):String;
    begin
      if vpEmail = '' then
        Result := ''
      else
      begin
        if (pos(sqlVerificarEMAIL.AsString, vpEmail) = 0) or (trim(sqlVerificarEMAIL.AsString) = '') then
        begin
          if pos(',', vpEmail) > 0 then
               Result := copy(vpEmail,1, pos(',', vpEmail)-1)
          else Result := vpEmail;
        end
        else result := sqlVerificarEMAIL.AsString;
      end;
    end;

  begin
    sqlVerificar.Active := False;
    sqlVerificar.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
    sqlVerificar.Active := True;

    viPessoas := '';
    viPessoasSemCPF := '';
    cxProgress.Properties.Max := sqlXmlAtualizador.RecordCount;
    cxProgress.Properties.Min := 0;
    cxProgress.Position       := 0;

    while not sqlXmlAtualizador.Eof do
    begin
      if Trim(sqlXmlAtualizador.FieldByName('CPF').AsString) = '' then
      begin
        if PegarSituacao(sqlXmlAtualizador.FieldByName('SITUACAO').AsString) = '1' then
          viPessoasSemCPF := sqlXmlAtualizador.FieldByName('NOME').AsString
      end;

      vgCadastrar := False;
      // Situa��o do Associado na Planilha
      viSituacaoNova := PegarSituacao(sqlXmlAtualizador.FieldByName('SITUACAO').AsString);

      if BuscarPessoa then
      begin
        // Se existir na Base da tesouraria
        sqlVerificar.Edit;
        if (sqlVerificarSITUACAO.AsString <> viSituacaoNova) and
           ((sqlVerificarSITUACAO.AsString = '1') or (viSituacaoNova = '1')) then
        begin
          // Caso a Situacao seja diferente
          sqlVerificarSINCRONIZADO_OBSERVACAO.AsString    := '';
          sqlVerificarSINCRONIZADO_SITUACAO_OLD.AsString  := sqlVerificarSITUACAO.AsString;
          sqlVerificarSINCRONIZADO_DATA.AsString          := dtmControles.DataHoraBanco(4);
          sqlVerificarSINCRONIZA_REUNI_ID.AsCurrency      := viSicronizaReuniId;
          sqlVerificarSINCRONIZADO_SITUACAO_NEW.AsString  := viSituacaoNova;
          sqlVerificarPESSOA_GRUPO_ID.AsVariant           := NULL;
          sqlVerificarEMAIL_GRUPO_PADRAO.AsString         := 'N';
          sqlVerificarPESSOA_TERCEIRO_ID.AsVariant        := NULL;
          sqlVerificarEMAIL_TERCEIRO.AsVariant            := NULL;
          sqlVerificarPRINCIPAL.AsString                  := 'N';
          sqlVerificarSINCRONIZADO_NOVO.AsString          := 'N';
          if (viSituacaoNova = '1') then
            sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := 'S�cio existente e Atualizado. VERIFIQUE SEUS COMPROMISSOS!!!';
          vgCadastrar := True;
        end
        else
        begin
          if (sqlVerificarSITUACAO.AsString = '1') or (viSituacaoNova = '1') then
          begin
            sqlVerificarSINCRONIZADO_NOVO.AsString := 'A';
            sqlVerificarSINCRONIZADO_OBSERVACAO.AsString    := '';
            vgCadastrar := True;
          end
        end;
      end
      else
      begin
        // Novo Cadastro
        if (viSituacaoNova[1] in ['1','3']) then
        begin
          sqlVerificar.Insert;
          sqlVerificarSINCRONIZADO_OBSERVACAO.AsString    := '';
          sqlVerificarPESSOA_ID.AsCurrency                := dtmControles.GerarSequencia('T_PESSOA');
          sqlVerificarPESSOA_GRUPO_ID.AsVariant           := NULL;
          sqlVerificarSINCRONIZADO_SITUACAO_OLD.AsString  := '';
          sqlVerificarDATA_CADASTRO.AsString              := dtmControles.DataHoraBanco(4);
          sqlVerificarBOLETO_EMAIL.AsString               := 'S';
          sqlVerificarSINCRONIZADO_DATA.AsString          := dtmControles.DataHoraBanco(4);
          sqlVerificarSINCRONIZADO_SITUACAO_NEW.AsString  := viSituacaoNova;
          sqlVerificarSINCRONIZA_REUNI_ID.AsCurrency      := viSicronizaReuniId;
          sqlVerificarSINCRONIZADO_NOVO.AsString          := 'S';
          sqlVerificarEMAIL_TERCEIRO.AsString             := 'N';
          sqlVerificarEMAIL_GRUPO_PADRAO.AsString         := 'N';
          sqlVerificarPRINCIPAL.AsString                  := 'N';
          vgCadastrar := True;
        end;
      end;

      if vgCadastrar then
      begin
        sqlVerificarCPF.AsString := Trim(sqlXmlAtualizador.FieldByName('CPF').AsString);
        try
          if not ValidarCPFCNPJ(sqlVerificarCPF.AsString) then
          begin
            if sqlVerificarCPF.AsString = '' then
            begin
              sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := '** ASSOCIADO SEM CPF/CNPJ ** INV�LIDO **. Favor Verificar com a Secretaria ANTES DE GERAR BOLETO!!! **';
              sqlVerificarNOME.AsString                    := viPessoasSemCPF;
            end
            else
              if Length(RetornaNumerico(sqlVerificarCPF.AsString)) > 11 then
                   sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := '** CNPJ '+FormataCNPJ(sqlVerificarCPF.AsString)+'  ** INV�LIDO **. Favor Verificar com a Secretaria ANTES DE GERAR BOLETO!!! **'
              else sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := '** CPF '+FormataCPF(sqlVerificarCPF.AsString)+'  ** INV�LIDO **. Favor Verificar com a Secretaria ANTES DE GERAR BOLETO!!! **';

            sqlVerificarSINCRONIZADO_NOVO.AsString := 'P';
            viLiberadoSincronizacao := False;
          end
          else
            if (sqlVerificarCPF.OldValue <> sqlXmlAtualizador.FieldByName('CPF').AsVariant) AND
               (sqlVerificarSINCRONIZADO_NOVO.AsString <> 'S') then
            begin
              sqlVerificarSINCRONIZADO_NOVO.AsString       := 'N';
              sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := '--> CPF Atualizado!!!';
              sqlVerificarSINCRONIZA_REUNI_ID.AsCurrency   := viSicronizaReuniId;

            end;
        except
          sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := '** CPF '+FormataCPF(sqlVerificarCPF.AsString)+'  ** INV�LIDO **. Favor Verificar com a Secretaria ANTES DE GERAR BOLETO!!! **';
          sqlVerificarSINCRONIZADO_NOVO.AsString       := 'P';
        end;

        sqlVerificarGRAU.AsString  := sqlXmlAtualizador.FieldByName('CHAVE_GRAU_ATUAL').AsString;
        sqlVerificarNOME.AsString  := sqlXmlAtualizador.FieldByName('NOME').AsString;
//        sqlVerificarEMAIL.AsString := sqlXmlAtualizador.FieldByName('EMAIL').AsString;
        sqlVerificarEMAIL.AsString := VerificarEmail(sqlXmlAtualizador.FieldByName('EMAIL').AsString);

        if sqlVerificarSINCRONIZADO_NOVO.AsString <> 'P' then
        begin
          if (sqlVerificarEMAIL.OldValue <> sqlVerificarEMAIL.AsString) AND
             (sqlVerificarSINCRONIZADO_NOVO.AsString <> 'S') then
          begin
            sqlVerificarSINCRONIZADO_NOVO.AsString       := 'N';
            sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := sqlVerificarSINCRONIZADO_OBSERVACAO.AsString + ' --> EMAIL Atualizado!!!';
            sqlVerificarSINCRONIZA_REUNI_ID.AsCurrency   := viSicronizaReuniId;
          end
          else
            if (sqlVerificarNOME.OldValue <> sqlXmlAtualizador.FieldByName('NOME').AsVariant) AND
               (sqlVerificarSINCRONIZADO_NOVO.AsString <> 'S') then
            begin
              sqlVerificarSINCRONIZADO_NOVO.AsString       := 'N';
              sqlVerificarSINCRONIZADO_OBSERVACAO.AsString := sqlVerificarSINCRONIZADO_OBSERVACAO.AsString + ' --> Nome Atualizado!!!';
              sqlVerificarSINCRONIZA_REUNI_ID.AsCurrency   := viSicronizaReuniId;
            end
          else
            if sqlVerificarEMAIL.AsString <> '' then
                 sqlVerificarBOLETO_EMAIL.AsString := 'S'
            else sqlVerificarBOLETO_EMAIL.AsString := 'N';

          sqlVerificarSITUACAO.AsString     := viSituacaoNova;
          sqlVerificarCEDENTE_ID.AsCurrency := vgCedenteAtivo;
        end;

        if sqlVerificarFATURA_TIPO.IsNull then
          sqlVerificarFATURA_TIPO.AsString := 'B';

        sqlVerificar.ApplyUpdates(-1);

        if (sqlVerificarSINCRONIZADO_NOVO.AsString = 'S') then
        begin
          RegistrarCompromissoMensal;
          if viPessoas = '' then
               viPessoas := sqlVerificarPESSOA_ID.AsString
          else viPessoas := viPessoas + ','+ sqlVerificarPESSOA_ID.AsString;
        end;
      end;
      sqlXmlAtualizador.Next;
      cxProgress.Position := cxProgress.Position + 1;
      cxProgress.Refresh;
    end;

  end;

  procedure VerificarTransferidos;
  begin
    // Verifica os transferidos (Somente de Pessoas Frequentes
    sqlVerificar.Filter   := '(SINCRONIZADO_NOVO = '+QuotedStr('')+') '+
                             '   AND ((SITUACAO = '+QuotedStr('1')+') or (SITUACAO ='+QuotedStr('3')+'))';
    sqlVerificar.Filtered := True;
    sqlVerificar.First;

    while not sqlVerificar.Eof do
    begin
      // Seta os cadastros n�o atualizados como transferidos
      sqlVerificar.Edit;
      sqlVerificarSINCRONIZADO_SITUACAO_OLD.AsString  := sqlVerificarSITUACAO.AsString;
      sqlVerificarPESSOA_GRUPO_ID.AsVariant           := NULL;
      sqlVerificarSINCRONIZADO_DATA.AsString          := dtmControles.DataHoraBanco(4);
      sqlVerificarSINCRONIZADO_SITUACAO_NEW.AsString  := '5';
      sqlVerificarSINCRONIZADO_NOVO.AsString          := 'N';
      sqlVerificarSINCRONIZADO_OBSERVACAO.AsString    := '';
      sqlVerificarSITUACAO.AsString                   := '5';
      sqlVerificar.ApplyUpdates(-1);
    end;
    sqlVerificar.Filtered := False;
  end;

  procedure Validar;
  begin
    if (AnsiUpperCase(ExtractFileExt(OpenDialog1.FileName)) <> '.XLS') and
       (AnsiUpperCase(ExtractFileExt(OpenDialog1.FileName)) <> '.XLSX') then
    begin
      lblSincronizar.Visible := False;
      Screen.Cursor := crDefault;
      Application.MessageBox('Arquivo Inv�lido e/ou arquivo n�o � do reuni!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    // Verifica se o Arquivo ja foi importado
    ExecutaSqlAuxiliar(' SELECT DATA FROM T_SINCRONIZA_REUNI '+
                       ' WHERE UPPER(NOME_ARQUIVO) = '+ QuotedStr(AnsiUpperCase(ExtractFileName(OpenDialog1.FileName))),0);
    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
      lblSincronizar.Visible := False;
      Application.MessageBox(Pchar('Este arquivo ja foi sincronizado em '+
                                   dtmControles.sqlAuxiliar.FieldByName('DATA').AsString), 'Aten��o', MB_OK + MB_ICONWARNING);
      Screen.Cursor := crDefault;
      Abort;
    end;
  end;

begin
  Screen.Cursor := crHourGlass;
  OpenDialog1.FileName;

  lblSincronizar.Visible := True;
  lblSincronizar.Caption := 'Abrindo Arquivo...';
  lblSincronizar.Refresh;
  if not OpenDialog1.Execute then
  begin
    lblSincronizar.Visible := False;
    Screen.Cursor := crDefault;
    exit;
  end;

  Validar;

  try
    lblSincronizar.Caption := 'Carregando Dados...';
    lblSincronizar.Refresh;
    ImportarDadosPlanilhaReuni;
  except
    Application.MessageBox(Pchar('Erro de importa��o de arquivo. Verifique se o arquivo esta correto!!!'+#13+#13+
                                 'Caso o erro persiste entrar em contato com o Administrador do Sistema'), 'Error', MB_OK + MB_ICONERROR);
    exit;
  end;

  viLiberadoSincronizacao := True;
  Screen.Cursor := crHourGlass;
  sqlVerificar.DisableControls;

  pnlSincronizar.Enabled := False;
  viSicronizaReuniId := dtmControles.GerarSequencia('T_SINCRONIZA_REUNI');
  sqlXmlAtualizador.First;
  sqlVerificar.Filtered := False;

  dtmControles.StartTransaction;

  ExecutaSqlAuxiliar(' UPDATE T_PESSOA SET SINCRONIZADO_NOVO = NULL,'+
                     '                     SINCRONIZADO_DATA = NULL,' +
                     '                     SINCRONIZA_REUNI_ID = NULL,' +
                     '                     SINCRONIZADO_SITUACAO_NEW = NULL,' +
                     '                     SINCRONIZADO_SITUACAO_OLD = NULL' +
                     ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

  GravarHistoricoSincronizacao;
  CarregarDados;
  VerificarTransferidos;

  Screen.Cursor := crHourGlass;
  if viPessoas <> '' then
  begin
    viAbriuForm := False;
    if frmGerenciadorCompromisso = nil then
    begin
      frmGerenciadorCompromisso := TfrmGerenciadorCompromisso.Create(self);
      viAbriuForm := True;
    end;
    frmGerenciadorCompromisso.AtivarLancamentosMensais(0, viPessoas, False, False, '1');
    if viAbriuForm then
      frmGerenciadorCompromisso := nil;
  end;

  // Mostra Apenas os Novos e/ou atualizados que a Situa�ao mudou.
  sqlVerificar.Filtered := False;
  sqlVerificar.Filter   := '((SINCRONIZADO_NOVO = ''S'') OR (SINCRONIZADO_NOVO = ''N'') OR (SINCRONIZADO_NOVO = ''P''))';
  sqlVerificar.Filtered := True;

  if sqlVerificar.RecordCount = 0 then
  begin
    Screen.Cursor := crDefault;
    dtmControles.Roolback;
    lblSincronizar.Visible := False;
    Application.MessageBox('Nenhum Associado Atualizado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    HabilitarBotoes(True);
    exit;
  end
  else HabilitarBotoes(False);

  sqlVerificar.EnableControls;
  Screen.Cursor := crDefault;
  pnlSincronizar.Enabled := True;
  cxGridDBSincronizar.DataController.Groups.FullExpand;

  btnConfirma.Enabled := (viPessoasSemCPF = '') and viLiberadoSincronizacao;
  tabExportar.Enabled := not viLiberadoSincronizacao;
  cxGridSincroniza.SetFocus;
  lblSincronizar.Refresh;
  if viLiberadoSincronizacao then
  begin
    lblSincronizar.Caption := 'Dados Carregados. VERIFIQUE e CONFIRME a SINCRONIZA��O!!!';
    Application.MessageBox(Pchar(lblSincronizar.Caption), 'Aten��o', MB_OK + MB_ICONWARNING);
  end
  else
  begin
    lblSincronizar.Style.TextColor := clRed;
    lblSincronizar.Caption := 'SINCRONIZA��O CANCELADA!!!';
    Application.MessageBox(Pchar('ATEN��O: Sincroniza��o n�o permitida!!!'+#13+#13+
                                 'Existem Cadastro(s) com CPF inv�lido e/ou sem CPF. Verifique e Sincronize Novamente.'), 'Aten��o', MB_OK + MB_ICONWARNING);
  end;
end;

procedure TfrmSincronizar.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSincronizar.btnCancelarClick(Sender: TObject);
begin
  dtmControles.Roolback;
  sqlVerificar.Refresh;
  sqlVerificar.Active    := False;
  lblSincronizar.Visible := False;
  tabExportar.Enabled    := False;
  lblSincronizar.Style.TextColor := $00404000;
  HabilitarBotoes(True);
  ShowMessage('Sincroniza��o Cancelada!!!');
end;

procedure TfrmSincronizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlVerificar.Active             := False;
  sqlSincronizacaoAnterior.Active := False;

  Action                      := caFree;
  frmSincronizar := nil
end;

procedure TfrmSincronizar.FormCreate(Sender: TObject);
begin
  sqlVerificar.Connection             := dtmControles.DB;
  sqlSincronizacaoAnterior.Connection := dtmControles.DB;
  pgcSincronizar.ActivePageIndex := 0;

  VerificaSincronizacaoAnterior;
end;

procedure TfrmSincronizar.HabilitarBotoes(vpHabilitado: Boolean);
begin
  btnCancelar.Enabled     := not vpHabilitado;
  btnConfirma.Enabled     := not vpHabilitado;
  cxBtnFechar.Enabled     := vpHabilitado;
  btnSincronizar.Enabled  := vpHabilitado;
end;


procedure TfrmSincronizar.ImportarDadosPlanilhaReuni;
var
  viStringGrid,
  viDadosAssociados : TStringGrid;
  viLinha, viDados, viEmail: String;
  i, viLin : Integer;

  function BuscarGrau(vpGrau : String):Integer;
  begin
    if vpGrau = 'QS' then
      Result := 1
    else
      if vpGrau = 'CI' then
        Result := 2
    else
      if vpGrau = 'CDC' then
        Result := 3
    else
      if vpGrau = 'QM' then
         Result := 4
    else Result := 0;
  end;

begin
  //Abrir Planilha Excel
  viStringGrid      := TStringGrid.Create(Self);

  if XlsToStringGrid(viStringGrid,OpenDialog1.FileName) then
  begin
    viDados := '';
    viLinha := '';
    sqlXmlAtualizador.EmptyDataSet;

    if (pos('Grau',viStringGrid.Cells[0, 0]) = 0) then
    begin
      Screen.Cursor := crDefault;
      Application.MessageBox('Arquivo Inv�lido e/ou arquivo n�o � do reuni!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    Screen.Cursor := crHourGlass;
    for viLin := 1 to vlNumeroLinhasXLS do
    begin
      if Trim(viStringGrid.Cells[1, viLin]) <> '' then
      begin
        sqlXmlAtualizador.Append;
        sqlXmlAtualizadorNOME.AsString              := Trim(viStringGrid.Cells[1, viLin]);
        sqlXmlAtualizadorCPF.AsString               := RetornaNumerico(viStringGrid.Cells[5, viLin]);
        sqlXmlAtualizadorDOCUMENTO.AsString         := '';
        sqlXmlAtualizadorSITUACAO.AsString          := Trim(viStringGrid.Cells[6, viLin]);
        sqlXmlAtualizadorEMAIL.AsString             := Trim(viStringGrid.Cells[9, viLin]);
        sqlXmlAtualizadorCHAVE_GRAU_ATUAL.AsInteger := BuscarGrau(Trim(viStringGrid.Cells[0, viLin]));
        sqlXmlAtualizador.Post;
      end;
    end;
  end;
  viStringGrid.Free;
end;

procedure TfrmSincronizar.pgcSincronizarChange(Sender: TObject);
begin
  if pgcSincronizar.ActivePage = tabSincronizacaoAnterior then
    cxGrid3.SetFocus;
end;

procedure TfrmSincronizar.tabExportarClick(Sender: TObject);
begin
  dtmLookup.ExportarExcel(cxGridSincroniza);
end;

procedure TfrmSincronizar.VerificaSincronizacaoAnterior;
begin
  ExecutaSimpleDSAux(' SELECT MAX(SINCRONIZA_REUNI_ID) AS SINCRONIZA, DATA, NOME_ARQUIVO'+
                     ' FROM T_SINCRONIZA_REUNI '+
                     ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                     ' GROUP BY DATA, NOME_ARQUIVO',0);
  if not dtmControles.SimpleAuxiliar.FieldByName('SINCRONIZA').IsNull then
  begin
    dtmControles.SimpleAuxiliar.Last;
    sqlSincronizacaoAnterior.Active := False;
    sqlSincronizacaoAnterior.DataSet.ParamByName('CEDENTE_ID').AsCurrency          := vgCedenteAtivo;
    sqlSincronizacaoAnterior.DataSet.ParamByName('SINCRONIZA_REUNI_ID').AsCurrency := dtmControles.SimpleAuxiliar.FieldByName('SINCRONIZA').AsInteger;
    sqlSincronizacaoAnterior.Active := True;
    tabSincronizacaoAnterior.TabVisible := True;
    cxGridDBSincronizacaoAnterior.DataController.Groups.FullExpand;
    lblSincronizaData.Caption        := 'Data Sincroniza��o: '+ dtmControles.SimpleAuxiliar.FieldByName('DATA').AsString;
    lblSincronizaNomeArquivo.Caption := 'Nome Arquivo: '+ dtmControles.SimpleAuxiliar.FieldByName('NOME_ARQUIVO').AsString;
  end
  else
  begin
    sqlSincronizacaoAnterior.Active     := False;
    tabSincronizacaoAnterior.TabVisible := False;
  end;
end;

function TfrmSincronizar.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
const
    xlCellTypeLastCell = $0000000B;
var
    XLApp, Sheet: OLEVariant;
    RangeMatrix: Variant;
    x, y, k, r, NumBrancos: Integer;
begin
  Result:=False;
  //Cria Excel- OLE Object
  XLApp:=CreateOleObject('Excel.Application');
  try
    //Esconde Excel
    XLApp.Visible:=False;
    //Abre o Workbook
    XLApp.Workbooks.Open(AXLSFile);
    Sheet:=XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    //Pegar o n�mero da �ltima linha
    x:=XLApp.ActiveCell.Row;
    vlNumeroLinhasXLS := x - 1;
    //Pegar o n�mero da �ltima coluna
    y:=XLApp.ActiveCell.Column;
    vlNumeroColunasXLS := y;
    //Seta Stringgrid linha e coluna
    AGrid.RowCount:=x;
    AGrid.ColCount:=y;
    //Associaca a variant WorkSheet com a variant do Delphi
    RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

    //Cria o loop para listar os registros no TStringGrid
    k:=1;
    repeat
      NumBrancos := 0;
      for r:=1 to y do
      begin
        AGrid.Cells[(r - 1),(k - 1)]:=RangeMatrix[K, R];
        if Trim(RangeMatrix[K, R]) = '' then
        begin
          Inc(NumBrancos,1);
          if NumBrancos = 10 then
            Break;
        end
        else NumBrancos := 0;
      end;
      Inc(k,1);
    until k > x;
    RangeMatrix:=Unassigned;
  finally
    //Fecha o Excel
    if not VarIsEmpty(XLApp) then
      begin
        XLApp.Quit;
        XLAPP:=Unassigned;
        Sheet:=Unassigned;
        Result:=True;
      end;
  end;
end;

end.
procedure TfrmSincronizar.pgcSincronizarChange(Sender: TObject);
begin

end;

procedure TfrmSincronizar.VerificaSincronizacaoAnterior;
begin

end;

function TfrmSincronizar.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
begin

end;


procedure TfrmSincronizar.pgcSincronizarChange(Sender: TObject);
begin

end;

procedure TfrmSincronizar.VerificaSincronizacaoAnterior;
begin

end;

function TfrmSincronizar.XlsToStringGrid(AGrid: TStringGrid;
  AXLSFile: string): Boolean;
begin

end;


