unit AdminDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ComCtrls, cxProgressBar, DB, DBClient,
  SimpleDS, ExtCtrls, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, FMTBcd,
  SqlExpr, Buttons, Grids, DBGrids, Menus, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, cxSplitter, SynHighlighterMulti,
  SynCompletionProposal, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

  
type
  TfrmAdminDB = class(TForm)
    Panel3: TPanel;
    pagSql: TPageControl;
    tabTexto: TTabSheet;
    tabResultado: TTabSheet;
    BtnExecutarSql: TcxButton;
    dtsExecute: TDataSource;
    sqlExecute: TSimpleDataSet;
    btnLimpar: TcxButton;
    btnFechar: TcxButton;
    SynSQLSyn1: TSynSQLSyn;
    grdRotinas: TcxGrid;
    grdResultView: TcxGridDBTableView;
    grdResult: TcxGridLevel;
    sqlAtualiza: TSQLQuery;
    btnGravar: TcxButton;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    gridTabela: TcxGrid;
    gridTabelaView: TcxGridDBTableView;
    gridTabelaLevel1: TcxGridLevel;
    gridCamposTabela: TcxGrid;
    gridCamposTabelaView: TcxGridDBTableView;
    grdRotinasLevel1: TcxGridLevel;
    sqlTabela: TSimpleDataSet;
    dtsTabela: TDataSource;
    sqlCampo: TSimpleDataSet;
    dtsCampo: TDataSource;
    sqlTabelaTABELA: TStringField;
    gridTabelaViewTABELA: TcxGridDBColumn;
    sqlCampoCAMPO: TStringField;
    gridCamposTabelaViewCAMPO: TcxGridDBColumn;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    memoSQL: TSynEdit;
    SynCompletionProposal1: TSynCompletionProposal;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnExecutarSqlClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memoSQLKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure sqlTabelaAfterScroll(DataSet: TDataSet);
    procedure gridTabelaViewDblClick(Sender: TObject);
    procedure gridCamposTabelaViewDblClick(Sender: TObject);
    procedure memoSQLChange(Sender: TObject);
    procedure memoSQLStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure FormShow(Sender: TObject);
    procedure sqlExecuteAfterPost(DataSet: TDataSet);
    procedure sqlExecuteAfterDelete(DataSet: TDataSet);
  private
   
  public
    { Public declarations }
  end;

var
  frmAdminDB: TfrmAdminDB;

implementation

uses Rotinas, Math, Controles;

{$R *.dfm}

procedure TfrmAdminDB.FormCreate(Sender: TObject);
var SqlT, SqlF : String;
begin
  pagSql.ActivePageIndex := 0;
  sqlExecute.Connection  := dtmControles.DB;
  sqlTabela.Connection   := dtmControles.DB;
  sqlCampo.Connection    := dtmControles.DB;
  sqlAtualiza.SQLConnection := dtmControles.DB;

  Label1.Caption := UpperCase(dtmControles.Cripto.CriptoHexToText(vgTipoBanco));

  if Label1.Caption = 'ORACLE' then
  begin
     SqlT := 'SELECT TABLE_NAME TABELA FROM USER_TABLES '+
             'ORDER BY TABLE_NAME';

     SqlF := 'SELECT COLUMN_NAME ' +
        'FROM   USER_TAB_COLS ' +
        'WHERE  TABLE_NAME = :RELATION_NAME ' +
        'ORDER  BY COLUMN_NAME ';

     SynSQLSyn1.SQLDialect := sqlOracle;
  end
  else
  begin
    SqlT := 'SELECT RDB$RELATION_NAME TABELA FROM RDB$RELATIONS '+
            'WHERE RDB$SYSTEM_FLAG = 0 ' +
            'ORDER  BY RDB$RELATION_NAME';

    SqlF := 'SELECT RDB$FIELD_NAME AS CAMPO FROM RDB$RELATION_FIELDS '+
            'WHERE RDB$RELATION_NAME = :RELATION_NAME '+
            'ORDER BY RDB$FIELD_NAME ';
    SynSQLSyn1.SQLDialect := sqlInterbase6;
  end;

  sqlCampo.DataSet.CommandText := SqlF;
  sqlCampo.DataSet.Prepared := True;

  sqlTabela.DataSet.CommandText := SqlT;
  sqlTabela.Open;
  SynSQLSyn1.TableNames.Clear;
  SynCompletionProposal1.ItemList.Clear;

  while not sqlTabela.Eof do
  begin
    SynSQLSyn1.TableNames.Add(Trim(sqlTabela.FieldByName('TABELA').AsString));
    sqlTabela.Next;
  end;
  SynCompletionProposal1.ItemList.Text := SynSQLSyn1.TableNames.Text;
  SynCompletionProposal1.ItemList.Add('SELECT * FROM ');
  SynCompletionProposal1.ItemList.Add('DELETE FROM  WHERE ');
  SynCompletionProposal1.ItemList.Add('INSERT INTO  () VALUES () ');
  SynCompletionProposal1.ItemList.Add('UPDATE  SET WHERE ');
  sqlTabela.AfterScroll := sqlTabelaAfterScroll;
  sqlTabela.First;
end;

procedure TfrmAdminDB.BtnExecutarSqlClick(Sender: TObject);
var I, Len : Integer;
begin
  sqlExecute.Active := False;
  try
    Screen.Cursor := crSQLWait;
    if (pos('INSERT', AnsiUpperCase(memoSQL.Text)) > 0) or (pos('UPDATE', AnsiUpperCase(memoSQL.Text)) > 0) or
       (pos('DELETE', AnsiUpperCase(memoSQL.Text)) > 0) or (pos('CREATE TABLE', AnsiUpperCase(memoSQL.Text)) > 0) or
       (pos('DROP TABLE', AnsiUpperCase(memoSQL.Text)) > 0) or (pos('ALTER TABLE', AnsiUpperCase(memoSQL.Text)) > 0) then
    begin
      dtmControles.StartTransaction;
      with sqlAtualiza do
      begin
        Active := False;
        SQL.Clear;
        sql.Add(memoSQL.Text);
        ExecSQL(FALSE);
        ShowMessage('SQL executado com sucesso!!!');
      end;
      dtmControles.Commit;
      sqlTabela.Refresh;
    end
    else
    begin
      with sqlExecute do
      begin
        Active := False;
        DataSet.CommandText := '';
        DataSet.CommandText := memoSQL.Text;
        Active := True;
        grdResultView.ClearItems;
        grdResultView.DataController.CreateAllItems;

        for I := 0 to grdResultView.ColumnCount - 1 do
        begin
          Len := Length(Trim(grdResultView.Items[I].DataBinding.DefaultCaption));
          if grdResultView.Items[I].DataBinding.ValueType <> 'String' then
             grdResultView.Columns[I].Width := Len + 100;

          if grdResultView.Columns[I].Width < 50 then
             grdResultView.Columns[I].Width := Len + 100
          else
          if grdResultView.Columns[I].Width > 350 then
             grdResultView.Columns[I].Width := 350;
        end;
      end;
      pagSql.ActivePageIndex := 1;
    end;
    Screen.Cursor := crDefault;
  except
    on e:exception do
    begin
      Screen.Cursor := crDefault;
      if dtmControles.DB.InTransaction then
        dtmControles.Roolback;
      MessageDlg(' Verifique o SQL!!' + #13 + #13+
                 ' Erro = '+E.Message, mtError, [mbOK],0);
    end;
  end;
end;

procedure TfrmAdminDB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlTabela.Close;
  sqlCampo.Close;
  sqlExecute.Active := False;
  Action := caFree;
  frmAdminDB := nil;
end;

procedure TfrmAdminDB.memoSQLKeyPress(Sender: TObject;
  var Key: Char);
begin
  if trim(memoSQL.Text) = '' then
       BtnExecutarSql.Enabled := False
  else BtnExecutarSql.Enabled := True;
end;

procedure TfrmAdminDB.btnLimparClick(Sender: TObject);
begin
  memoSQL.Clear;
  sqlExecute.Close;
  grdResultView.ClearItems;
end;

procedure TfrmAdminDB.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdminDB.btnGravarClick(Sender: TObject);
begin
  dtmControles.StartTransaction;
  Try
    sqlExecute.ApplyUpdates(-1);
    dtmControles.Commit;
  Except
    on e:exception do
    begin
      dtmControles.Roolback;
      MessageDlg(' Erro = '+E.Message, mtError, [mbOK],0);
    end;
  end;
  btnGravar.Enabled := False;
end;

procedure TfrmAdminDB.sqlTabelaAfterScroll(DataSet: TDataSet);
begin
  sqlCampo.Close;
  sqlCampo.DataSet.Params[0].AsString := sqlTabelaTABELA.AsString;
  sqlCampo.Open;
end;

procedure TfrmAdminDB.gridTabelaViewDblClick(Sender: TObject);
begin
  memoSQL.SelText := Trim(sqlTabelaTABELA.AsString);
  memoSQL.SetFocus;
end;

procedure TfrmAdminDB.gridCamposTabelaViewDblClick(Sender: TObject);
begin
  memoSQL.SelText := Trim(sqlCampoCAMPO.AsString);
  memoSQL.SetFocus;
end;

procedure TfrmAdminDB.memoSQLChange(Sender: TObject);
var ptCaret: TPoint;
begin
  ptCaret := TPoint(memoSQL.CaretXY);
  if (ptCaret.X > 0) and (ptCaret.Y > 0) then
     StatusBar.Panels[0].Text := Format(' %6d:%3d ', [ptCaret.Y, ptCaret.X])
  else
      StatusBar.Panels[0].Text := '';

end;

procedure TfrmAdminDB.memoSQLStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
  memoSQLChange(Sender);
end;

procedure TfrmAdminDB.FormShow(Sender: TObject);
begin
  memoSQL.SetFocus;
end;

procedure TfrmAdminDB.sqlExecuteAfterPost(DataSet: TDataSet);
begin
  btnGravar.Enabled := True;
end;

procedure TfrmAdminDB.sqlExecuteAfterDelete(DataSet: TDataSet);
begin
  sqlExecute.ApplyUpdates(-1);
end;

end.

