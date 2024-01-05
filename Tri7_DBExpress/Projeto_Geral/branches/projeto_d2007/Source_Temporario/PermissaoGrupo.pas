unit PermissaoGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, ComCtrls, DB, DBClient, SimpleDS,
  ImgList, Buttons, Grids, DBGrids, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLookAndFeelPainters, cxButtons, cxCheckBox,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxImageComboBox, cxGroupBox, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, Menus;

type

  TfrmPermissaogrupo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    sqlRotina: TSimpleDataSet;
    sqlGrupo: TSimpleDataSet;
    dsGrupo: TDataSource;
    ImageList1: TImageList;
    sqlPermgrupo: TSimpleDataSet;
    grdRotinas: TcxGrid;
    grdRotinasDBTableView1: TcxGridDBTableView;
    grdRotinasLevel1: TcxGridLevel;
    dsRotina: TDataSource;
    sqlRotinaSISTEMA_ROTINA_ID: TFMTBCDField;
    sqlRotinaDESCROTINA: TStringField;
    sqlRotinaSISTEMA_MENU_ID: TFMTBCDField;
    sqlRotinaDESCMENU: TStringField;
    grdRotinasDBTableView1SISTEMA_ROTINA_ID: TcxGridDBColumn;
    grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn;
    grdRotinasDBTableView1SISTEMA_MENU_ID: TcxGridDBColumn;
    grdRotinasDBTableView1DESCMENU: TcxGridDBColumn;
    sqlGrupoUSUARIO_GRUPO_ID: TFMTBCDField;
    sqlGrupoDESCRICAO: TStringField;
    sqlGrupoSITUACAO: TStringField;
    sqlPermgrupoUSUARIO_GRUPO_ID: TFMTBCDField;
    sqlPermgrupoSISTEMA_ROTINA_ID: TFMTBCDField;
    sqlPermgrupoPERMISSAO: TStringField;
    grdRotinasDBTableView1DBColumn1: TcxGridDBColumn;
    GroupBox1: TcxGroupBox;
    CheckBox6: TcxCheckBox;
    CheckBox1: TcxCheckBox;
    CheckBox2: TcxCheckBox;
    CheckBox3: TcxCheckBox;
    CheckBox4: TcxCheckBox;
    CheckBox5: TcxCheckBox;
    CheckBox7: TcxCheckBox;
    CheckBox8: TcxCheckBox;
    lcbGrupos: TcxLookupComboBox;
    btnAtualiza: TcxButton;
    btnCancelar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure lcbGruposPropertiesEditValueChanged(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure grdRotinasDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grdRotinasDBTableView1CustomDrawGroupCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    vg_Verifica      : Boolean;
    vg_AtualizaQuery : Boolean;
    vg_sistema_rotina_id : String;
    procedure AtualizaCheck;
  public
    { Public declarations }
    procedure MostraPermissao(vpRotina: String);
    procedure BuscaPermissoes;
    function Permissao: String;
    procedure SetaPermissao;
  end;

var
  frmPermissaogrupo: TfrmPermissaogrupo;

implementation

uses Controles, Principal;

{$R *.dfm}

procedure TfrmPermissaogrupo.MostraPermissao(vpRotina: String);
var Permissao:String;
begin
   if vpRotina <> '' then
   begin
     if sqlPermgrupo.Locate('sistema_rotina_id', vpRotina, [loCaseInsensitive]) then
        Permissao := sqlPermgrupo.FieldByName('permissao').AsString
     else Permissao := '     ';

     if Trim(Permissao) = '' then
        Permissao := '     ';
     GroupBox1.Enabled := True;
     vg_AtualizaQuery  := False;
     if (Permissao = '000000') or (Trim(Permissao) = '') then
        checkBox1.Checked := True
     else checkBox1.Checked := False;

     checkBox2.Checked := Permissao[1] = '1';
     checkBox3.Checked := Permissao[2] = '1';
     checkBox4.Checked := Permissao[3] = '1';
     checkBox5.Checked := Permissao[4] = '1';
     checkBox7.Checked := Permissao[5] = '1';
     checkBox8.Checked := Permissao[6] = '1';
     vg_AtualizaQuery  := True;
  end
  else begin
     vg_AtualizaQuery  := False;
     checkBox1.Checked := False;
     checkBox2.Checked := False;
     checkBox3.Checked := False;
     checkBox4.Checked := False;
     checkBox5.Checked := False;
     checkBox6.Checked := False;
     checkBox7.Checked := False;
     checkBox8.Checked := False;
     vg_AtualizaQuery  := True;
     GroupBox1.Enabled := False;
  end;
end;

procedure TfrmPermissaogrupo.FormCreate(Sender: TObject);
begin
  vg_Verifica := True;
  Screen.OnActiveControlChange := nil;
  sqlRotina.Connection    := dtmControles.DB;
  sqlGrupo.Connection     := dtmControles.DB;
  sqlPermgrupo.Connection := dtmControles.DB;

  sqlRotina.Close;
  sqlRotina.DataSet.Params[0].AsInteger := vgId;
  sqlRotina.Open;

  sqlGrupo.Close;
  sqlGrupo.DataSet.Params[0].AsInteger := vgId;
  sqlGrupo.Open;

  lcbGrupos.EditValue := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;
end;

procedure TfrmPermissaogrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlRotina.Close;
  sqlGrupo.Close;
  sqlPermgrupo.Close;
  Action := caFree;
  frmPermissaogrupo := nil;
end;

procedure TfrmPermissaogrupo.BuscaPermissoes;
begin
   {permissões do grupo}
   with sqlPermgrupo do
   begin
      Close;
      DataSet.Params[0].Value := lcbGrupos.EditValue;
      Open;
   end;
end;

procedure TfrmPermissaogrupo.CheckBox1Click(Sender: TObject);
begin
  if vg_Verifica then
  begin
    if checkbox1.Checked then
    begin
       checkbox2.Checked  := False;
       checkbox3.Checked  := False;
       checkbox4.Checked  := False;
       checkbox5.Checked  := False;
       checkbox6.Checked  := False;
       checkBox7.Checked  := False;
       checkBox8.Checked  := False;
       SetaPermissao;
    end
    else begin
       checkbox2.Checked := True;
       checkbox3.Checked := True;
       checkbox4.Checked := True;
       checkbox5.Checked := True;
       checkbox6.Checked := True;
    end;
  end;
end;

function TfrmPermissaogrupo.Permissao: String;
var Aux:String;
begin
   Aux := '';

   if CheckBox2.Checked then
      Aux := concat(Aux,'1')
   else Aux := concat(Aux,'0');

   if CheckBox3.Checked then
      Aux := concat(Aux,'1')
   else Aux := concat(Aux,'0');

   if CheckBox4.Checked then
      Aux := concat(Aux,'1')
   else Aux := concat(Aux,'0');

   if CheckBox5.Checked then
      Aux := concat(Aux,'1')
   else Aux := concat(Aux,'0');

   if CheckBox7.Checked then
      Aux := concat(Aux,'1')
   else Aux := concat(Aux,'0');

   if CheckBox8.Checked then
      Aux := concat(Aux,'1')
   else Aux := concat(Aux,'0');

   Result := Aux;
end;

procedure TfrmPermissaogrupo.SetaPermissao;
var AuxPer, Sql, Aux:String;
begin
   if vg_AtualizaQuery then
   begin
     AuxPer := Permissao;
     Aux    := ' usuario_grupo_id = ' + IntToStr(lcbGrupos.EditValue) +
               ' and sistema_rotina_id = ' + vg_sistema_rotina_id;

     if Trim(vg_sistema_rotina_id) <> '' then
     begin
       if AuxPer = '000000' then
       begin
         Sql := ' Delete from g_permissao_grupo ' +
                ' Where ' + Aux;
         dtmControles.ExecSQL(Sql);
       end
       else if  sqlPermgrupo.Locate('sistema_rotina_id',vg_sistema_rotina_id, []) then
            begin
              if AuxPer <>  sqlPermgrupo.FieldByName('permissao').AsString then
              begin
                Sql := ' update g_permissao_grupo set permissao = ' + QuotedStr(AuxPer) +
                       ' where ' + Aux;
                dtmControles.ExecSQL (Sql);
              end;
            end
            else begin
                 Sql := ' insert into g_permissao_grupo (usuario_grupo_id, sistema_rotina_id, permissao) ' +
                        ' values ('+ IntToStr(lcbGrupos.EditValue) + ',' +
                                     vg_sistema_rotina_id + ',' +
                                     QuotedStr(AuxPer) + ')';
                 dtmControles.ExecSQL(Sql);
            end;
     end;
     BuscaPermissoes;
   end;
end;

procedure TfrmPermissaogrupo.CheckBox2Click(Sender: TObject);
begin
   if (Sender as TcxCheckBox).Checked then
   begin
     if CheckBox1.State = cbsChecked then
     begin
       vg_Verifica := False;
       CheckBox1.Checked := False;
       vg_Verifica := True;
     end
     else if checkbox6.State = cbsChecked then
          begin
            vg_Verifica := False;
            checkbox6.checked := False;
            vg_Verifica := True;
          end;
   end;
   AtualizaCheck;
   SetaPermissao;
end;

procedure TfrmPermissaogrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TfrmPermissaogrupo.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmPermissaogrupo.btnAtualizaClick(Sender: TObject);
begin
  sqlRotina.Close;
  sqlGrupo.Close;
  sqlRotina.Open;
  sqlGrupo.Open;
end;

procedure TfrmPermissaogrupo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPermissaogrupo.lcbGruposPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (lcbGrupos.EditValue <> null) then
  begin
    BuscaPermissoes;
  end;
end;

procedure TfrmPermissaogrupo.CheckBox6Click(Sender: TObject);
begin
  if vg_Verifica then
  begin
     if checkbox6.checked then
     begin
         CheckBox1.checked  := False;
         CheckBox2.checked  := True;
         CheckBox3.checked  := True;
         CheckBox4.checked  := True;
         CheckBox5.checked  := True;
      end
      else begin
         CheckBox2.checked := False;
         CheckBox3.checked := False;
         CheckBox4.checked := False;
         CheckBox5.checked := False;
         checkBox7.Checked := False;
         checkBox8.Checked := False;
      end;
  end;
end;

procedure TfrmPermissaogrupo.grdRotinasDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  vg_sistema_rotina_id := sqlRotinaSISTEMA_ROTINA_ID.AsString;
  MostraPermissao(vg_sistema_rotina_id);
end;

procedure TfrmPermissaogrupo.grdRotinasDBTableView1CustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  if vg_sistema_rotina_id <> '' then
  begin
    vg_sistema_rotina_id := '';
    MostraPermissao(vg_sistema_rotina_id);
  end;
end;

procedure TfrmPermissaogrupo.AtualizaCheck;
begin
   if (checkbox2.Checked) and (checkbox3.Checked) and
      (checkbox4.Checked) and (checkbox5.Checked) then
   begin
      vg_Verifica := False;
      CheckBox6.Checked := True;
      vg_Verifica := True;
   end
   else if (not checkbox2.Checked) and (not checkbox3.Checked) and
           (not checkbox4.Checked) and (not checkbox5.Checked) and
           (not checkbox7.Checked) and (not checkbox8.Checked) then
        begin
           vg_Verifica := False;
           CheckBox1.Checked := True;
           vg_Verifica := True;
        end
        else begin
             vg_Verifica := False;
             CheckBox6.Checked := False;
             vg_Verifica := True;
        end;
end;

end.
