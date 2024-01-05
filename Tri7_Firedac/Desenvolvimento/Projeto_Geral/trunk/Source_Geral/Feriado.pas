unit Feriado;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,

  cxEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, DBCtrls, SimpleDS,

  ImgList, Menus, Buttons, Grids, DBGrids,
  System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGroupBox, cxGridBandedTableView, cxGridDBBandedTableView;

type
  TfrmFeriado = class(TfrmCadBasico)
    ClientAncestralFERIADO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralDIA: TBCDField;
    ClientAncestralMES: TBCDField;
    ClientAncestralANO: TBCDField;
    pnlDadosFeriado: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    edtTipo: TcxDBImageComboBox;
    grdFeriado: TcxGrid;
    grdFeriadoDBTableView1: TcxGridDBTableView;
    grdFeriadoDBTableView1FERIADO_ID: TcxGridDBColumn;
    grdFeriadoDBTableView1DESCRICAO: TcxGridDBColumn;
    grdFeriadoDBTableView1TIPO: TcxGridDBColumn;
    grdFeriadoDBTableView1DIA: TcxGridDBColumn;
    grdFeriadoDBTableView1MES: TcxGridDBColumn;
    grdFeriadoDBTableView1ANO: TcxGridDBColumn;
    grdFeriadoDBTableView1SITUACAO: TcxGridDBColumn;
    grdFeriadoLevel1: TcxGridLevel;
    gpxFim: TcxGroupBox;
    LblDiaFim: TcxLabel;
    LblMesFim: TcxLabel;
    LblAnoFim: TcxLabel;
    edtAnoFim: TcxDBTextEdit;
    edtDiaFim: TcxDBComboBox;
    edtMesFim: TcxDBComboBox;
    cxGroupBox2: TcxGroupBox;
    LblDia: TcxLabel;
    LblMes: TcxLabel;
    LblAno: TcxLabel;
    edtAno: TcxDBTextEdit;
    edtDia: TcxDBComboBox;
    edtMes: TcxDBComboBox;
    ClientAncestralDIA_FIM: TBCDField;
    ClientAncestralMES_FIM: TBCDField;
    ClientAncestralANO_FIM: TBCDField;
    grdFeriadoBandedTableView1: TcxGridBandedTableView;
    grdFeriadoLevel2: TcxGridLevel;
    grdFeriadoDBBandedTableView1: TcxGridDBBandedTableView;
    grdFeriadoDBBandedTableView1DESCRICAO: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1SITUACAO: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1TIPO: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1DIA: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1MES: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1ANO: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1DIA_FIM: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1MES_FIM: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1ANO_FIM: TcxGridDBBandedColumn;
    grdFeriadoDBBandedTableView1FERIADO_ID: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure edtTipoPropertiesEditValueChanged(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vgQuery : TI9Query;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmFeriado: TfrmFeriado;

implementation

uses
  Controles,
  MensagemUtils;

{$R *.dfm}

procedure TfrmFeriado.FormCreate(Sender: TObject);
begin
  inherited;
  ClientAncestral.Open;

  vgChavePrimaria := 'FERIADO_ID';
  vgNomeTabela := 'G_FERIADO';
end;

procedure TfrmFeriado.SetState(AState: TDataSetState);
begin
  inherited;
  grdFeriado.Enabled := State = dsBrowse;
  pnlDadosFeriado.Enabled := not grdFeriado.Enabled;
end;

procedure TfrmFeriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientAncestral.Close;
  inherited;
  Action     := caFree;
  frmFeriado := nil;
end;

procedure TfrmFeriado.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtTipo.SetFocus;
end;

procedure TfrmFeriado.edtTipoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edtAno.Enabled := edtTipo.EditValue = 'V';

  edtDiaFim.Enabled := edtTipo.EditValue = 'V';
  edtMesFim.Enabled := edtTipo.EditValue = 'V';
  edtAnoFim.Enabled := edtTipo.EditValue = 'V';

  if edtTipo.EditValue = 'F' then
  begin
    edtDiaFim.Clear;
    edtMesFim.Clear;
    edtAnoFim.Clear;
  end;
end;

procedure TfrmFeriado.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtTipo.SetFocus;
end;

procedure TfrmFeriado.ExecuteGravarExecute(Sender: TObject);
var
  viDataInicio: TDateTime;
  viDataFim: TDateTime;
begin
  if Trim(edtTipo.Text) = '' then
  begin
    edtTipo.SetFocus;
    TMensagemUtils.ExibirMensagemAtencao('Tipo inválido!');
    Abort;
  end;

  if edtTipo.EditValue = 'F' then
  begin
    ClientAncestralANO.AsVariant := Null;
    ClientAncestralDIA_FIM.AsVariant := Null;
    ClientAncestralMES_FIM.AsVariant := Null;
    ClientAncestralANO_FIM.AsVariant := Null;
  end;

  if Trim(edtDia.Text) = '' then
  begin
    edtDia.SetFocus;
    TMensagemUtils.ExibirMensagemAtencao('Dia de início inválido!');
    Abort;
  end;

  if not (StrToIntDef(Trim(edtMes.Text), 0) in [1 .. 12]) then
  begin
    edtMes.SetFocus;
    TMensagemUtils.ExibirMensagemAtencao('Mês de início inválido!');
    Abort;
  end;

  if edtTipo.EditValue = 'V' then
  begin
    if Length(edtAno.EditValue) < 4 then
    begin
      edtAno.SetFocus;
      TMensagemUtils.ExibirMensagemAtencao('Ano de início inválido!');
      Abort;
    end;
  end;

  try
    viDataInicio := StrToDate(edtDia.EditValue + '/' + edtMes.EditValue + '/' + edtAno.EditValue);
  except
    edtDia.SetFocus;
    TMensagemUtils.ExibirMensagemAtencao('Data início inválida!');
    Abort;
  end;

  if edtTipo.EditValue = 'V' then
  begin
    if (edtDiaFim.Text <> '')
    or (edtMesFim.Text <> '')
    or (edtAnoFim.Text <> '') then
    begin
      if Trim(edtDiaFim.Text) = '' then
      begin
        edtDiaFim.SetFocus;
        TMensagemUtils.ExibirMensagemAtencao('Dia de fim inválido!');
        Abort;
      end;

      if not (StrToIntDef(Trim(edtMesFim.Text), 0) in [1 .. 12]) then
      begin
        edtMesFim.SetFocus;
        TMensagemUtils.ExibirMensagemAtencao('Mês de fim inválido!');
        Abort;
      end;

      if Length(edtAnoFim.EditValue) < 4 then
      begin
        edtAnoFim.SetFocus;
        TMensagemUtils.ExibirMensagemAtencao('Ano de fim inválido!');
        Abort;
      end;

      try
        viDataFim := StrToDate(edtDiaFim.EditValue + '/' + edtMesFim.EditValue + '/' + edtAnoFim.EditValue);
      except
        edtDiaFim.SetFocus;
        TMensagemUtils.ExibirMensagemAtencao('Data final inválida!');
        Abort;
      end;

      if viDataInicio >= viDataFim then
      begin
        edtDiaFim.SetFocus;
        TMensagemUtils.ExibirMensagemAtencao('Data final deve ser maior a data inicial!');
        Abort;
      end;
    end;
  end;

  inherited;
end;

end.
