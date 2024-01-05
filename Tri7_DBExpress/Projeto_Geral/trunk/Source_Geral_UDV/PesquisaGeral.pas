unit PesquisaGeral;

interface

uses windows, messages,
  I9Query,
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Variants, SimpleDS, DB, DBClient, ActnList, cxEdit,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxGrid, cxSplitter,
  cxGridDBCardView, cxButtons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinCaramel,
  dxSkinCoffee, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinOffice2007Black, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, Menus, cxGridCustomLayoutView,
  cxGridCardView, StdCtrls, cxClasses, cxGridCustomView, cxGridTableView,
  dxSkinBlue, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinMoneyTwins, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TPesquisaThread = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

type
  TfrmPesquisa = class(TForm)
    StatusBar1: TStatusBar;
    ds_pesquisa: TDataSource;
    q_qtd: TI9Query;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel3: TBevel;
    Panel3: TPanel;
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    grdPesquisa: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cdsPesquisar: TClientDataSet;
    dtsPesquisar: TDataSource;
    grdPesquisaDBCardView1: TcxGridDBCardView;
    Panel4: TPanel;
    sdsPesquisa: TI9Query;
    ActionList1: TActionList;
    Pesquisar: TAction;
    Selecionar: TAction;
    Fechar: TAction;
    Limpar: TAction;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    btnOK: TcxButton;
    btnFechar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdPesquisaExit(Sender: TObject);
    procedure grdPesquisaDBCardView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure cxGridBasicaDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure PesquisarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SelecionarExecute(Sender: TObject);
    procedure LimparExecute(Sender: TObject);
  private
    { Private declarations }
    Th: TPesquisaThread;
    CondAux, vgOrderBy : String;
    NumeroCamposPesquisa : Integer;
    procedure MontarQuery(var Qry : TClientDataSet);
    procedure MontarGridPesquisa(Grid: TcxGridDBCardView);
    procedure MontarGridRetorno(Grid: TcxGridDBTableView; CamposGrid, DescCamposGrid:string);
  public
    { Public declarations }
    procedure MontaSql(Tabela, Campos:String);
    procedure ThreadPesquisa;
  end;

  CamposTabela = record
      Campo : String;
      Descricao: String;
      Tipo  : TFieldType;
  end;

var
  frmPesquisa: TfrmPesquisa;
  IdxProcura : String;
  procedure MontaPesquisa(NomePesquisa, Tabela, CamposPesquisa, DescCamposPesquisa, CamposGrid, DescCamposGrid:String; ChavePesquisa:String; Var VetRetorno:TStringList; StoredParametros:String = ''; CondicaoAux:String = ''; OrderBy:String = '');

implementation

uses Controles;

{$R *.dfm}

var
  TabelaPesquisa : array of CamposTabela;
  DescCpGrid, CpGrid, ChavePrimaria: TStringList;
  CamposPesquisar, TabelaPesquisar, Parametros: String;

procedure MontaCamposPesquisa(Campos, Descricoes:String);
Var Ctrl  : Boolean;
    I     : Integer;
begin
   with frmPesquisa do
   begin
      SetLength(TabelaPesquisa,NumeroCamposPesquisa);
      // Preenche cb_campos com os campos disponíveis para pesquisa
      sdsPesquisa.FieldDefs.Update;
      // Preenche o vetor de referencia com os campos disponíveis para pesquisa
      Ctrl := true;
      I := 0;
      while Ctrl do
      begin
         if Pos(';',Campos) = 0 then
         begin
            TabelaPesquisa[I].Campo     := Campos;
            TabelaPesquisa[I].Descricao := Descricoes;
            TabelaPesquisa[I].Tipo      := sdsPesquisa.FieldDefs.Items[sdsPesquisa.FieldDefs.IndexOf(TabelaPesquisa[I].Campo)].DataType;
            Ctrl                        := False;
         end
         else begin
            TabelaPesquisa[I].Campo := copy(Campos,1,Pos(';',Campos)-1);
            TabelaPesquisa[I].Descricao := copy(Descricoes,1,Pos(';',Descricoes)-1);
            TabelaPesquisa[I].Tipo  := sdsPesquisa.FieldDefs.Items[sdsPesquisa.FieldDefs.IndexOf(TabelaPesquisa[I].Campo)].DataType;
            Delete(Campos,1,Pos(';',Campos));
            Delete(Descricoes,1,Pos(';',Descricoes));
         end;
         Inc(I);
      end;
   end;
end;

procedure TfrmPesquisa.MontaSql(Tabela, Campos:String);
var Sql, CampoWhere:String;
    i : Integer;
begin
   CampoWhere := '';
   for i := 0 to cdsPesquisar.FieldCount - 1 do
   begin
     if Trim(cdsPesquisar.Fields[i].AsString) <> '' then
     begin
       if CampoWhere = '' then
          CampoWhere := 'WHERE  ' + cdsPesquisar.Fields[i].FieldName +  RetornaCampo(cdsPesquisar.Fields[i].AsString, cdsPesquisar.Fields[i].DataType)
       else CampoWhere := CampoWhere + ' AND ' + cdsPesquisar.Fields[i].FieldName + RetornaCampo(cdsPesquisar.Fields[i].AsString, cdsPesquisar.Fields[i].DataType);
     end;
   end;

   if Trim(Parametros) = '' then
   begin
      Sql := 'SELECT '+Campos+' '+
             'FROM   '+Tabela+' ';
   end
   else begin
      Sql := 'SELECT '+Campos+' '+
             'FROM   '+Tabela+' '+'('+Parametros+') ';
   end;

   Sql := Sql + CampoWhere;

   sdsPesquisa.Close;
   if CondAux <> '' then
   begin
      if CampoWhere <> '' then
         sdsPesquisa.SQL.Text := Sql + ' AND ' + CondAux
      else sdsPesquisa.SQL.Text := Sql + ' WHERE ' + CondAux;
   end
   else sdsPesquisa.SQL.Text := Sql;

   sdsPesquisa.SQL.Text := sdsPesquisa.SQL.Text + vgOrderBy;

   application.ProcessMessages;
   DBApplication.ProcessMessages;
   sdsPesquisa.Open;

end;

procedure MontaPesquisa;
Var I, NumCampos : Integer;
    Ctrl : Boolean;
    SqlText, Campo :String;
begin
   frmPesquisa := tfrmPesquisa.Create(Application);
   frmPesquisa.Caption := NomePesquisa;
   ChavePrimaria := TStringList.Create;
   //Preenche a lista ChavePrimaria com os campos que pertencem a chave primaria da tabela referenciada
   if ChavePesquisa <> '' then
   begin
      Ctrl := true;
      while Ctrl do
      begin
         if Pos(';',ChavePesquisa) = 0 then
         begin
            ChavePrimaria.Add(ChavePesquisa);
            Ctrl := false;
         end
         else begin
            ChavePrimaria.Add(copy(ChavePesquisa,1,Pos(';',ChavePesquisa)-1));
            Delete(ChavePesquisa,1,Pos(';',ChavePesquisa));
         end;
      end;
   end
   else begin
      Application.MessageBox('A tabela referenciada não possui chave primaria, não será possível retornar valores','Atenção');
      Abort;
   end;

   Parametros := StoredParametros;
   while Pos(';',Parametros) <> 0 do
   begin
      Insert(',',Parametros,Pos(';',Parametros));
      Delete(Parametros,Pos(';',Parametros),1);
   end;

   with frmPesquisa.sdsPesquisa do
   begin
      Close;
      if Trim(Parametros) <> '' then
      begin
         SqlText := 'Select * '+
                     'From     '+Tabela+'('+Parametros+')';
      end else
      begin
         if Trim(Tabela) <> '' then
            SqlText := 'Select * '+
                       'From     '+Tabela;
      end;

      if CondicaoAux <> '' then
         SQL.Text := SqlText + ' Where ' + CondicaoAux
      else SQL.Text := SqlText;

      SQL.Text := SQL.Text + OrderBy;
      frmPesquisa.vgOrderBy := OrderBy;
      Open;

      frmPesquisa.CondAux := CondicaoAux;
   end;

   // Substitui o ";" por "," na lista de campos a serem pesquisados
   CamposPesquisar := CamposPesquisa;
   NumCampos := 0;
   while Pos(';',CamposPesquisar) <> 0 do
   begin
      Inc(NumCampos);
      Insert(',',CamposPesquisar,Pos(';',CamposPesquisar));
      Delete(CamposPesquisar,Pos(';',CamposPesquisar),1);
   end;
   Inc(NumCampos);
   frmPesquisa.NumeroCamposPesquisa := NumCampos;

   TabelaPesquisar := Tabela;

   MontaCamposPesquisa(CamposPesquisa,DescCamposPesquisa);
   frmPesquisa.MontarQuery(frmPesquisa.cdsPesquisar);
   frmPesquisa.MontarGridPesquisa(frmPesquisa.grdPesquisaDBCardView1);
   frmPesquisa.MontarGridRetorno(frmPesquisa.cxGridBasicaDBTableView1, CamposGrid, DescCamposGrid);

   // monta a string usada na cláusula select - merge da pk,campos do grid e campos do combo
   for i:= 0 to ChavePrimaria.Count -1 do
   begin
      if Pos(ChavePrimaria.Strings[i],CamposPesquisar) = 0 then
         Insert(','+ChavePrimaria.Strings[i],CamposPesquisar,Length(CamposPesquisar)+1);
   end;
   while Pos(';',CamposPesquisa) <> 0 do
   begin
      if Pos(Copy(CamposPesquisa,1,Pos(';',CamposPesquisa)-1),CamposPesquisar) = 0 then
         Insert(','+CamposPesquisa,CamposPesquisar,Length(CamposPesquisar));
      Delete(CamposPesquisa,1,Pos(';',CamposPesquisa));
   end;
   if Pos(Copy(CamposPesquisa,1,Length(CamposPesquisa)),CamposPesquisar) = 0 then
      Insert(','+CamposPesquisa,CamposPesquisar,Length(CamposPesquisar));

   frmPesquisa.ShowModal;

   // retorno da pesquisa
   VetRetorno:= TStringList.Create;
   if (frmPesquisa.ModalResult = mrOk) and  (not frmPesquisa.sdsPesquisa.IsEmpty)then
   begin
      for i:= 0 to ChavePrimaria.Count - 1 do
      begin
        Campo := Trim(frmPesquisa.sdsPesquisa.fieldbyname(ChavePrimaria.Strings[i]).AsString);
        if Campo <> '' then
           VetRetorno.Add(Campo);
      end;
   end;
   ChavePrimaria.Free;
end;

{  - Tipos de Field's

    TFieldType = (ftUnknown, ftString, ftSmallint, ftInteger, ftWord,
                  ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime,
                  ftDateTime, ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo,
                  ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary,
                  ftCursor, ftFixedChar, ftWideString, ftLargeint, ftADT, ftArray,
                  ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant, ftInterface,
                  ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd);
  }

procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Application.ProcessMessages;
   IdxProcura := '';
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  sdsPesquisa.Connection := dtmControles.DB;
  CondAux := '';
end;

procedure TfrmPesquisa.ThreadPesquisa;
begin
  MontaSql(TabelaPesquisar, CamposPesquisar)
end;

{ TPesquisaThread }

procedure TPesquisaThread.Execute;
begin
   Synchronize(frmPesquisa.ThreadPesquisa);
end;

procedure TfrmPesquisa.MontarGridPesquisa(Grid: TcxGridDBCardView);
var i : Integer;
begin
  Grid.DataController.CreateAllItems;
  Application.ProcessMessages;
  for i := 0 to NumeroCamposPesquisa - 1 do
  begin
    Grid.Rows[i].Caption := TabelaPesquisa[I].Descricao;

    if TabelaPesquisa[I].Tipo in [ftTimeStamp, ftDate, ftDateTime] then
       Grid.Rows[i].RepositoryItem := dtmControles.cxEditRepository1DateItem1;
  end;

  cdsPesquisar.Insert;
  for i := 0 to cdsPesquisar.FieldCount - 1 do
      cdsPesquisar.Fields[i].Value := Null;
  cdsPesquisar.Post;
end;

procedure TfrmPesquisa.MontarQuery(var Qry: TClientDataSet);
var Campo: String;
    Dt : TFieldType;
    Size : Integer;
    i : Integer;
begin
  Qry.Close;
  Qry.FieldDefs.Clear;

  for i := 0 to NumeroCamposPesquisa - 1 do
  begin
    Dt    := TabelaPesquisa[I].Tipo;
    Campo := TabelaPesquisa[I].Campo;
    if Dt = ftString then
       Size := 100
    else Size := 0;
    Qry.FieldDefs.Add(Campo,Dt, Size, False);
  end;
  Qry.CreateDataSet;
end;

procedure TfrmPesquisa.MontarGridRetorno(Grid: TcxGridDBTableView;
  CamposGrid, DescCamposGrid: string);
var Ctrl : Boolean;
    I : Word;
begin
   CpGrid := TStringList.Create;
   DescCpGrid := TStringList.Create;
   // Preenche CpGrid com os campos que serao inseridos no grid
   Ctrl := true;
   while Ctrl do
   begin
      if Pos(';',CamposGrid) = 0 then
      begin
         CpGrid.Add(CamposGrid);
         Ctrl := false;
      end
      else begin
         CpGrid.Add(copy(CamposGrid,1,Pos(';',CamposGrid)-1));
         Delete(CamposGrid,1,Pos(';',CamposGrid));
      end;
   end;
   // Preenche DescCpGrid com as label's dos campos que serao inseridos no grid
   Ctrl := true;
   while Ctrl do
   begin
      if Pos(';',DescCamposGrid) = 0 then
      begin
         DescCpGrid.Add(DescCamposGrid);
         Ctrl := false;
      end
      else begin
         DescCpGrid.Add(copy(DescCamposGrid,1,Pos(';',DescCamposGrid)-1));
         Delete(DescCamposGrid,1,Pos(';',DescCamposGrid));
      end;
   end;
   // Monta o Grid
   with frmPesquisa do
   begin
      for I := 0 to CpGrid.Count - 1 do
      begin
         Grid.CreateColumn;
         Grid.Columns[I].DataBinding.FieldName := CpGrid.Strings[I];
         Grid.Columns[I].Caption               := DescCpGrid.Strings[I];
         if TabelaPesquisa[I].Tipo in [ftTimeStamp,ftFMTBcd] then
             Grid.Columns[I].Width := Length(Grid.Columns[I].DataBinding.FieldName) + 60
         else Grid.Columns[I].Width := frmPesquisa.sdsPesquisa.FieldByName(Grid.Columns[I].DataBinding.FieldName).Size + 100;
         if Grid.Columns[I].Width > 350 then
            Grid.Columns[I].Width := 350;
      end;
   end;
   
   CpGrid.Free;
   DescCpGrid.Free;
end;


procedure TfrmPesquisa.grdPesquisaExit(Sender: TObject);
begin
  if cdsPesquisar.State =  dsEdit then
     cdsPesquisar.Post;
end;

procedure TfrmPesquisa.grdPesquisaDBCardView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
     Pesquisar.Execute;
end;

procedure TfrmPesquisa.cxGridBasicaDBTableView1DblClick(Sender: TObject);
begin
  frmPesquisa.ModalResult := mrOk;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  grdPesquisa.SetFocus;
end;

procedure TfrmPesquisa.FecharExecute(Sender: TObject);
begin
  close;
  Screen.Cursor := crDefault;
end;

procedure TfrmPesquisa.PesquisarExecute(Sender: TObject);
begin
  DBApplication.ProcessMessages;
  Th := TPesquisaThread.Create (true);  // start
  th.FreeOnTerminate:= true;
  application.ProcessMessages;
  th.Resume;
end;

procedure TfrmPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Fechar.Execute;
end;

procedure TfrmPesquisa.SelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesquisa.LimparExecute(Sender: TObject);
var i : integer;
begin
  cdsPesquisar.Edit;
  for i := 0 to cdsPesquisar.FieldCount - 1 do
    cdsPesquisar.Fields[i].Value := Null;
  cdsPesquisar.Post;
end;

end.


