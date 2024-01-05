unit ControleSelos;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxTextEdit, cxMaskEdit, cxGridExportLink,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, cxControls, cxContainer, cxEdit, cxGroupBox, Menus,
  ClipBrd,
  cxLabel, ComObj, ComCtrls,

  DB, DBClient, SimpleDS, ImgList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCalendar, cxButtons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, DbxDevartInterBase, cxCheckBox,
  cxImageComboBox, cxCurrencyEdit, dxSkinsCore, dxSkinscxPCPainter, cxRadioGroup,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmControleSelos = class(TForm)
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    btnPesquisa: TcxButton;
    Panel3: TPanel;
    btnFechar: TcxButton;
    cxGroupBox2: TcxGroupBox;
    edtDtIni: TcxDateEdit;
    edtDtFim: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnExportar: TcxButton;
    cxGroupBox3: TcxGroupBox;
    edtDataSelo: TcxDateEdit;
    btnConfirmar: TcxButton;
    cbxDesfazer: TcxCheckBox;
    sqlSelos: TI9Query;
    sqlSelosCAMPO_ID: TBCDField;
    sqlSelosTABELA: TStringField;
    sqlSelosTIPO_SELO: TStringField;
    sqlSelosAPRESENTANTE: TStringField;
    sqlSelosDESCRICAO: TStringField;
    sqlSelosNUMERO_SELO: TStringField;
    sqlSelosLOTE_SELO: TStringField;
    sqlSelosVALOR_EMOLUMENTO: TBCDField;
    sqlSelosVALOR_TAXA_JUDICIARIA: TBCDField;
    sqlSelosCALC_SELECIONADO: TBooleanField;
    sqlSelosVALOR_FUNDESP: TBCDField;
    sqlSelosTIPO_CARTORIO: TStringField;
    sqlSelosCALC_PROTOCOLO: TStringField;
    sqlSelosDATA: TDateField;
    sqlSelosDATA_EXPORTACAO: TSQLTimeStampField;
    sqlSelosSELO_LIVRO_ID: TBCDField;
    dtsSelos: TDataSource;
    gridExportar: TcxGrid;
    gridExportarTable: TcxGridDBTableView;
    gridExportarTableColumn1: TcxGridDBColumn;
    cxGridDBServentia: TcxGridDBColumn;
    cxGridDBTableData: TcxGridDBColumn;
    cxGridDBProtocolo: TcxGridDBColumn;
    cxGridDBTipoSelo: TcxGridDBColumn;
    cxGridDBTableApresentante: TcxGridDBColumn;
    cxGridDBTableNumeroSelo: TcxGridDBColumn;
    cxGridDBEmolumento: TcxGridDBColumn;
    cxGridDBTaxa: TcxGridDBColumn;
    cxGridDBFundesp: TcxGridDBColumn;
    gridExportarTableColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    sqlSelosDATA_AUX: TSQLTimeStampField;
    gridExportarTableColumn3: TcxGridDBColumn;
    cxGroupBox4: TcxGroupBox;
    edtDataLimite: TcxDateEdit;
    rdgSistema: TcxRadioGroup;
    btnDesmarcar: TcxButton;
    btnMarcar: TcxButton;
    gridExportarTableColumn4: TcxGridDBColumn;
    sqlSelosDATA_MODIFICADA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure gridExportarTableCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure rdgSistemaPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    vlTipoCartorio : String;

    function ValidaCamposConsulta: Boolean;
    procedure MarcarDesmarcar(vpMarcar: Boolean);
    procedure FiltrarSomenteDataLimite(vpSelecionado : Boolean = False);
  public
    { Public declarations }
  end;

var
  frmControleSelos: TfrmControleSelos;

implementation

uses Controles, Rotinas, SeloSelecionado;

{$R *.dfm}

procedure TfrmControleSelos.MarcarDesmarcar(vpMarcar: Boolean);
begin
  sqlSelos.DisableControls;
  sqlSelos.First;
  while not sqlSelos.Eof do
  begin
    if (vpMarcar and (sqlSelosCALC_PROTOCOLO.AsString <> 'Não Ident.')) or (not vpMarcar) then
    begin
      sqlSelos.Edit;
      sqlSelosCALC_SELECIONADO.AsBoolean := vpMarcar;
      sqlSelos.Post;
    end;
    sqlSelos.Next;
  end;
  sqlSelos.First;
  sqlSelos.EnableControls;
  sqlSelos.Filtered := False;
  gridExportarTable.DataController.Groups.FullExpand;
end;

procedure TfrmControleSelos.rdgSistemaPropertiesChange(Sender: TObject);
begin
  sqlSelos.Close;

//  btnMarcar.Visible    := not edtDataLimite.Enabled;
//  btnDesmarcar.Visible := not edtDataLimite.Enabled;
end;

procedure TfrmControleSelos.btnConfirmarClick(Sender: TObject);
var
  viSql: string;
begin

  viSql := '';

  FiltrarSomenteDataLimite(True);
  if Application.MessageBox('Confirma alterar data dos selos selecionados!', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then
  begin
    FiltrarSomenteDataLimite;
    Exit;
  end;

  try
    sqlSelos.First;
    while not sqlSelos.Eof do
    begin
      if (not cbxDesfazer.Checked) then
      begin
        if (sqlSelosDATA_AUX.AsVariant = null) then
        begin
          viSql := ' UPDATE G_SELO_LIVRO SET DATA_AUX = DATA '+
                   '                        ,DATA_MODIFICADA = ''1'''+
                   '                        ,DATA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy hh:mm:ss', edtDataSelo.Date)) +
                   ' WHERE SELO_LIVRO_ID = ' + sqlSelosSELO_LIVRO_ID.AsString;
          dtmControles.ExecSQL(viSql);
        end;
      end
      else
      begin
        if (sqlSelosDATA_AUX.AsVariant <> null) then
        begin
          viSql := ' UPDATE G_SELO_LIVRO SET DATA = DATA_AUX '+
                   '                        ,DATA_MODIFICADA = ''2'''+
                   '                        ,DATA_AUX = null '+
                   ' WHERE SELO_LIVRO_ID = ' + sqlSelosSELO_LIVRO_ID.AsString;
          dtmControles.ExecSQL(viSql);
        end;
      end;
      sqlSelos.Next;
    end;   

    btnPesquisaClick(nil);

  finally
  end;
end;

procedure TfrmControleSelos.btnDesmarcarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  MarcarDesmarcar(False);
  FiltrarSomenteDataLimite;
  Screen.Cursor := crDefault;
end;

procedure TfrmControleSelos.btnExportarClick(Sender: TObject);
var
  HandleXLS : Variant;
begin
  try
    if DirectoryExists('C:\temp') then
      CreateDir('C:\temp');

    ExportGridToExcel('C:\temp\RelTemp.xls', gridExportar);

    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open('C:\temp\RelTemp.xls');
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;

end;

procedure TfrmControleSelos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmControleSelos.btnMarcarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  MarcarDesmarcar(True);
  FiltrarSomenteDataLimite;
  Screen.Cursor := crDefault;
end;

procedure TfrmControleSelos.btnPesquisaClick(Sender: TObject);
var
  viSql,
  viCondicao : String;

    procedure VerificarProtocoloSelo;
    var
      viTabela, viCampoId, viProtocolo : String;
    begin
      sqlSelos.DisableControls;
      Screen.Cursor := crHourGlass;
      sqlSelos.First;
      try
        while not sqlSelos.Eof do
        begin
          viTabela    := sqlSelosTABELA.AsString;
          viCampoId   := sqlSelosCAMPO_ID.AsString;
          viProtocolo := '';
          case sqlSelosTIPO_CARTORIO.AsString[1] of
            '2' : begin
                    if viTabela = 'R_PEDIDO_ITEM' then
                      viProtocolo :=  dtmControles.GetStr(' SELECT DISTINCT(NUMERO_ORDEM) '+
                                        ' FROM R_PEDIDO_ITEM PI LEFT JOIN R_PROTOCOLO R ON PI.PEDIDO_ID = R.PEDIDO_ID WHERE PI.PEDIDO_ITEM_ID ='+viCampoId+
                                        '   AND R.DATA < ' + QuotedStr(dtmControles.DataParaString(edtDataLimite.Date+1))+
                                        '   AND TIPO_PROTOCOLO IN(''1'', ''5'')')
                    else
                      if viTabela = 'R_PEDIDO_ITEM_NUMERO' then
                         viProtocolo := dtmControles.GetStr(' SELECT DISTINCT(NUMERO_ORDEM) FROM R_PEDIDO_ITEM_NUMERO PIN   '+
                                        ' LEFT JOIN R_PEDIDO_ITEM PI ON PIN.PEDIDO_ITEM_ID = PI.PEDIDO_ITEM_ID LEFT JOIN '+
                                        ' R_PROTOCOLO R ON PI.PEDIDO_ID = R.PEDIDO_ID WHERE PIN.PEDIDO_ITEM_NUMERO_ID='+viCampoId+
                                        '   AND R.DATA < ' + QuotedStr(dtmControles.DataParaString(edtDataLimite.Date+1)))
                    else viProtocolo := 'Não Ident.';


                  end;
            '5' : begin
                    if viTabela = 'P_TITULO' then
                      viProtocolo :=  dtmControles.GetStr(' SELECT DISTINCT(NUMERO_APONTAMENTO) '+
                                      ' FROM P_TITULO WHERE TITULO_ID ='+viCampoId+
                                      '  AND DATA_APONTAMENTO <= ' + QuotedStr(dtmControles.DataParaString(edtDataLimite.Date+1)))
                    else viProtocolo := 'Não Ident.';
                  end;
          end;

          if viProtocolo = '' then
            viProtocolo := 'Não Ident.'
          else
            if viProtocolo <> 'Não Ident.' then
              viProtocolo := FormatFloat('###,###', StrToInt((viProtocolo)));

          sqlSelos.Edit;
          sqlSelosCALC_PROTOCOLO.AsString := viProtocolo;
          if rdgSistema.EditValue = 5 then
            sqlSelosCALC_SELECIONADO.AsBoolean := viProtocolo <> 'Não Ident.';
          sqlSelos.Post;

          Application.ProcessMessages;
          sqlSelos.Next;
        end;
      except
        viProtocolo := 'Não Ident.';
        Application.ProcessMessages;
        sqlSelos.Next;
      end;
      Screen.Cursor := crDefault;

      if (rdgSistema.EditValue = 5) and (not sqlSelos.IsEmpty) then
        sqlSelos.Filtered := True;

      sqlSelos.EnableControls;
    end;

begin
  if edtDtIni.Date <= 0 then
  begin
    Application.MessageBox('Data inicio deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtIni.SetFocus;
    Exit;
  end;

  if edtDtFim.Date <= 0 then
  begin
    Application.MessageBox('Data final deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtFim.SetFocus;
    Exit;
  end;

  if edtDtIni.Date > edtDtFim.Date then
  begin
    Application.MessageBox('Data Inicial não pode ser maior que a Data Final!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtIni.SetFocus;
    Exit;
  end;

  if edtDataLimite.Date <= 0 then
  begin
    Application.MessageBox('Data Limite deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDataLimite.SetFocus;
    Exit;
  end;

  viCondicao := '';

  if rdgSistema.EditValue = 5 then
  begin
    viCondicao := ' AND SL.TABELA = ''P_TITULO'' '+
                  ' AND SG.NUMERO BETWEEN 1360 AND 1371 ';
  end;

  try
    viSql := 'SELECT RDB$RELATION_NAME FROM RDB$RELATION_FIELDS '+
             'WHERE RDB$RELATION_NAME = ''G_SELO_LIVRO'' '+
             '  AND RDB$FIELD_NAME = ''DATA_AUX''';

    if Trim(dtmControles.GetStr(viSql)) = '' then
      dtmControles.ExecSQL('ALTER TABLE G_SELO_LIVRO ADD DATA_AUX DATAHORA');
  except

  end;

  LockWindowUpdate(Handle);
  viSql := ' SELECT CAST(SL.DATA AS DATE) AS DATA, '+
           '          SL.CAMPO_ID, '+
           '          SL.TABELA, '+
           '          SG.DESCRICAO_COMPLETA AS TIPO_SELO, '+
           '          SL.APRESENTANTE, '+
           '          SL.DESCRICAO, '+
           '          (SL.SIGLA || (LPAD(CAST(SL.NUMERO AS INT), 6, ''0''))) AS NUMERO_SELO, '+
           '          SO.SIGLA AS LOTE_SELO, '+
           '          SL.VALOR_EMOLUMENTO, '+
           '          SL.VALOR_TAXA_JUDICIARIA, '+
           '          SL.VALOR_FUNDESP, '+
           '          SG.TIPO_CARTORIO, '+
           '          SL.DATA_EXPORTACAO, '  +
           '          SL.SELO_LIVRO_ID, '  +
           '          SL.DATA_AUX, '+
           '          SL.DATA_MODIFICADA '+
           '   FROM G_SELO_LIVRO SL '+
           '     LEFT JOIN G_SELO_LOTE SO ON '+
           '     SL.SELO_LOTE_ID = SO.SELO_LOTE_ID '+
           '     LEFT JOIN G_SELO_GRUPO SG ON '+
           '     SO.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
           '   WHERE NOT SG.TIPO_CARTORIO IS NULL '+
           '   AND SL.DATA '+ Controles.MontarSqlData(edtDtIni.Date,edtDtFim.Date)+
           '   AND SL.SELO_SITUACAO_ID = 2 '+
           '   AND SG.TIPO_CARTORIO = ' +QuotedStr(IntToStr(rdgSistema.EditValue))+
           viCondicao +
           ' ORDER BY DATA, SG.TIPO_CARTORIO, SG.DESCRICAO_COMPLETA, SO.SIGLA, SL.NUMERO ';
  sqlSelos.Active := False;
  sqlSelos.Filtered := False;
  sqlSelos.Filter := '';
  sqlSelos.SQL.Text := viSql;
  sqlSelos.Active := True;

  VerificarProtocoloSelo;
  MarcarDesmarcar(False);
  FiltrarSomenteDataLimite;
  LockWindowUpdate(0);

  gridExportarTable.DataController.Groups.FullExpand;
  btnMarcar.Enabled    := not sqlSelos.IsEmpty;
  btnDesmarcar.Enabled := not sqlSelos.IsEmpty;
end;

procedure TfrmControleSelos.FiltrarSomenteDataLimite(vpSelecionado : Boolean = False);
begin
  sqlSelos.Filtered := False;
  sqlSelos.Filter   := '(CALC_PROTOCOLO <> '+QuotedStr('Não Ident.')+')';
  if vpSelecionado then
    sqlSelos.Filter := 'CALC_SELECIONADO = TRUE';
  sqlSelos.Filtered := True;
end;

procedure TfrmControleSelos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if sqlSelos.Active then
    sqlSelos.EmptyDataSet;

  Action := caFree;
  frmControleSelos := nil;
end;

procedure TfrmControleSelos.FormCreate(Sender: TObject);
begin
  sqlSelos.Connection := dtmControles.DB;
  vlTipoCartorio      := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S');
  edtDtIni.Date       := dtmControles.DataHoraBanco(3);
  edtDtFim.Date       := dtmControles.DataHoraBanco(3);
end;

procedure TfrmControleSelos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : begin
            Key := #0;
          end;
    #13 : begin
            if (not (ActiveControl is TMemo)) and
               (not (ActiveControl is TcxGridSite)) then
            begin
              Key := #0;
              PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
            end;
          end;
  end; {case}
end;


procedure TfrmControleSelos.gridExportarTableCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[0]) <> null then
  begin
    ACanvas.Brush.Color := clWhite;
    ACanvas.Font.Color := clRed;
  end;

  if (AViewInfo.RecordViewInfo.GridRecord.Values[1]) = '2' then
  begin
    ACanvas.Brush.Color := clWhite;
    ACanvas.Font.Color := clGreen;
  end;
end;

function TfrmControleSelos.ValidaCamposConsulta: Boolean;
begin
  Result := False;
  try
    Result := True;
    if (edtDtIni.Date <= 0)and
       (edtDtFim.Date <= 0) then
    begin
      Result := False;
    end
    else
    if (Trim(edtDtIni.Text) <> '') or
       (Trim(edtDtFim.Text) <> '') then
    begin
      if edtDtIni.Date <= 0 then
      begin
        Application.MessageBox('Data inicio deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
        edtDtIni.SetFocus;
        Result := False;
      end
      else
      if edtDtFim.Date <= 0 then
      begin
        Application.MessageBox('Data final deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
        edtDtFim.SetFocus;
        Result := False;
      end
      else
      if edtDtIni.Date > edtDtFim.Date then
      begin
        Application.MessageBox('Data Inicial não pode ser maior que a Data Final!', 'Atenção', MB_OK + MB_ICONWARNING);
        edtDtIni.SetFocus;
        Result := False;
      end;
    end;
  except

  end;
end;

end.


