unit SeloRegistroConferencia;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,

  DB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, StdCtrls, cxButtons, ExtCtrls, DBClient, FMTBcd, SqlExpr, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxTextEdit;

type
  TfrmSeloRegistroConferencia = class(TForm)
    Panel1: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    grdPesquisa: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ClientRegistro: TClientDataSet;
    ClientRegistroQTD: TIntegerField;
    ClientRegistroCODIGO: TIntegerField;
    ClientRegistroSELO_INICIAL: TStringField;
    ClientRegistroSELO_FINAL: TStringField;
    ClientRegistroSELO_GRUPO_ID: TIntegerField;
    dtsRegistro: TDataSource;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    sqlPesquisa: TI9Query;
    ClientRegistroQTD_TOTAL: TIntegerField;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    ClientRegistroUsuario_id: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

    procedure VerificarRegistros;
  public
    { Public declarations }
  end;

var
  frmSeloRegistroConferencia: TfrmSeloRegistroConferencia;
  vgSeloRegistroConfirmado : Boolean;
  vgSeloDataRegistroAutomatico : TDate;

implementation

uses Lookup, Controles;

{$R *.dfm}

procedure TfrmSeloRegistroConferencia.VerificarRegistros;
var
  viLiberado, viFlag : Boolean;
  viOrdem, viContador, viRegistro : Integer;
  viValorISS : Currency;

  procedure VerificarRegistroSelos;
  var
    viQtdTotal, viQtdGeral, viNumeroInicial, viNumeroFinal, viProximoNumero, viUsuario : Integer;
    viSigla : String;
    viValor : TStringList;

    procedure VerificarNumeracaoSelo;
    var
      viBreak : Boolean;
    begin
      viNumeroInicial := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger;
      viNumeroFinal   := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger;
      viSigla         := dtmControles.SimpleAuxiliar.FieldByName('SIGLA').AsString;
      viUsuario       := dtmControles.SimpleAuxiliar.FieldByName('USUARIO_ID').AsInteger;
      viBreak         := False;
      repeat
        dtmControles.SimpleAuxiliar.Next;
        if (viNumeroFinal+1) = dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger then
             viNumeroFinal := dtmControles.SimpleAuxiliar.FieldByName('NUMERO').AsInteger
        else viBreak := True;
      until viBreak;
      viQtdTotal := (viNumeroFinal - viNumeroInicial)+1;
    end;

  begin
    ExecutaSqlAuxiliar(' SELECT SELO_GRUPO_ID, NUMERO '+
                       ' FROM G_SELO_GRUPO '+
                       ' WHERE CONTROLE_AUTOMATICO = '+QuotedStr('S'),0);
    while not dtmControles.sqlAuxiliar.eof do
    begin
      ExecutaSimpleDSAux(' SELECT SL.NUMERO, SL.SIGLA, SL.DATA, SL.USUARIO_ID '+
                         ' FROM G_SELO_LIVRO SL '+
                         '    LEFT OUTER JOIN G_SELO_LOTE ST ON '+
                         '    SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
//                         ' WHERE (SL.DATA '+MontarSqlData(vgSeloDataRegistroAutomatico, vgSeloDataRegistroAutomatico)+ ')'+
                         '   WHERE SL.SELO_SITUACAO_ID = 6 '+
                         '   AND ST.SELO_GRUPO_ID ='+ dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString+
                         ' ORDER BY SL.USUARIO_ID, SL.SIGLA, SL.NUMERO',0);
      dtmControles.SimpleAuxiliar.First;
      viQtdGeral := dtmControles.SimpleAuxiliar.RecordCount;
      repeat
        VerificarNumeracaoSelo;

        ClientRegistro.Append;
        ClientRegistroQTD.AsInteger           := viQtdTotal;
        ClientRegistroCODIGO.AsString         := dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsString;
        ClientRegistroSELO_INICIAL.AsString   := viSigla+IntToStr(viNumeroInicial);
        ClientRegistroSELO_FINAL.AsString     := viSigla+IntToStr(viNumeroFinal);
        ClientRegistroSELO_GRUPO_ID.AsInteger := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsInteger;
        ClientRegistroUsuario_id.AsInteger    := viUsuario;
        ClientRegistro.Post;
      until dtmControles.SimpleAuxiliar.RecNo = viQtdGeral;
      dtmControles.sqlAuxiliar.Next;
    end;
  end;
begin
  Screen.Cursor := crHourGlass;
  ClientRegistro.EmptyDataSet;
  VerificarRegistroSelos;
  Screen.Cursor := crDefault;
  ClientRegistro.First;
end;

procedure TfrmSeloRegistroConferencia.btnCancelarClick(Sender: TObject);
begin
  vgSeloRegistroConfirmado := False;
  Close;
end;

procedure TfrmSeloRegistroConferencia.btnConfirmarClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Fechamento do Caixa?', 'Pergunta', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
    Exit;

  vgSeloRegistroConfirmado := True;
  Close;
end;

procedure TfrmSeloRegistroConferencia.FormActivate(Sender: TObject);
begin
  VerificarRegistros;
end;

procedure TfrmSeloRegistroConferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmSeloRegistroConferencia := nil;
end;

end.
