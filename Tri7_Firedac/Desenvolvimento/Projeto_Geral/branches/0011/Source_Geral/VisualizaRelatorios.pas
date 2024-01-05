unit VisualizaRelatorios;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Menus, Mask, DB, frxClass, frxPreview,
  frxExportPDF, frxExportRTF, frxExportXLS, ComCtrls, Controles,
  DBClient, SimpleDS, cxButtons, Printers, frxDesgnCtrls,
  frxRichEditor, frxRich,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxControls,
  cxContainer, cxEdit, cxCheckBox, frxExportBaseDialog;

type
  TRelFast =  record
    Acumular, Finalizar, Inicio : Boolean; 
  end;

  TExecProcValores = procedure(Valor: String) of object;

  TfrmVisualizaRelatorios = class(TForm)
    pnlTop: TPanel;
    Panel3: TPanel;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnZoomMais: TBitBtn;
    btnZoomMenos: TBitBtn;
    pnlZoom: TPanel;
    edtZoom: TMaskEdit;
    spbPreviewWhole: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    btnExportarRTF: TBitBtn;
    btnExportarXLS: TBitBtn;
    btnExportarPDF: TBitBtn;
    StatusBar: TStatusBar;
    btnFind: TBitBtn;
    Panel1: TPanel;
    btnFechar: TcxButton;
    btnImprimir: TcxButton;
    frxPreview: TfrxPreview;
    btnMiniaturas: TBitBtn;
    btnEditar: TBitBtn;
    btnExportarDocx: TBitBtn;
    cbxAssinarPDF: TcxCheckBox;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnZoomMaisClick(Sender: TObject);
    procedure btnZoomMenosClick(Sender: TObject);
    procedure edtZoomExit(Sender: TObject);
    procedure edtZoomKeyPress(Sender: TObject; var Key: Char);
    procedure ppVisualizaRelatoriosPageChange(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarRTFClick(Sender: TObject);
    procedure btnExportarXLSClick(Sender: TObject);
    procedure btnExportarPDFClick(Sender: TObject);
    procedure frxPreviewPageChanged(Sender: TfrxPreview; PageNo: Integer);
    procedure btnFindClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure frxReportDblClickObject(Sender: TfrxView; Button: TMouseButton;
      Shift: TShiftState; var Modified: Boolean);
    procedure btnMiniaturasClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExportarDocxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure UpdateZoom;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizaRelatorios: TfrmVisualizaRelatorios;
  ExecRetornaValores: TExecProcValores;
  vgNomeRel, vgHistoricoRel: String;
  vgCancelado,
  vgFechar,
  vgEditar : Boolean;
  vgRelFast : TRelFast;
  vgbmp : TBitmap;

procedure ShowPreview(Nome: String; Report: TfrxReport;
  WindowState: TWindowState = wsNormal; vpZoom : TfrxZoomMode = TfrxZoomMode.zmPageWidth);
procedure ExibirRelatorio(frxReport: TfrxReport; ID: String; ExecProcedure: TExecuteProcedure = nil;
      VisualizarImpressao: Boolean = True; vpImpressora: String = '';
      vpSolicitarImpressora: Boolean = False; vpFechar : Boolean = True; ArquivoPDF: string = '';
      vpExport: TfrxCustomExportFilter = nil; vpZoom : TfrxZoomMode = TfrxZoomMode.zmPageWidth;
      vpExportAfterView: Boolean = False);
function GetPaginasRelatorio(
         frxReport: TfrxReport;
         ID: String;
         ExecProcedure: TExecuteProcedure = nil): Integer;
procedure CarregaRelatorio(ID, Relatorio: String; frxReport: TfrxReport);
procedure GravarRelatorio(ID: String);
procedure CriarFuncoesRelatorio(frRelatorio: TfrxReport);
function ExecutarFuncoesRelatorio(NameFuncao: String;
  var Parametros: Variant): Variant;

implementation

uses Rotinas,
     QrCode,
     Geral.Model.Entity.Impl.Assinar.PDF,
     Winapi.ShellAPI,
     System.IOUtils;

{$R *.dfm}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure ShowPreview(Nome: String; Report: TfrxReport;
  WindowState: TWindowState = wsNormal; vpZoom : TfrxZoomMode = TfrxZoomMode.zmPageWidth);
begin
  if frmVisualizaRelatorios = nil then
    frmVisualizaRelatorios := TfrmVisualizaRelatorios.Create(Application);
  Report.ShowProgress := True;
  Report.PrintOptions.ShowDialog := True;
  Report.Preview := frmVisualizaRelatorios.frxPreview;
  frmVisualizaRelatorios.btnEditar.Enabled := vgEditar;

  if Report.PrepareReport then
  begin
    Report.ShowPreparedReport;
    frmVisualizaRelatorios.frxPreview.ZoomMode := vpZoom;
    frmVisualizaRelatorios.Caption := Nome;
    frmVisualizaRelatorios.WindowState := WindowState;
    frmVisualizaRelatorios.UpdateZoom;
    frmVisualizaRelatorios.ShowModal;
  end
end;

procedure ExibirRelatorio(
            frxReport: TfrxReport;
            ID: String;
            ExecProcedure: TExecuteProcedure = nil;
            VisualizarImpressao: Boolean = True;
            vpImpressora: String = '';
            vpSolicitarImpressora: Boolean = False;
            vpFechar : Boolean = True;
            ArquivoPDF: string = '';
            vpExport: TfrxCustomExportFilter = nil;
            vpZoom : TfrxZoomMode = TfrxZoomMode.zmPageWidth;
            vpExportAfterView: Boolean = False);
var
  Sql: String;
  Designer: Boolean;
begin
  if ID.IsEmpty then
  begin
    Application.MessageBox(PWideChar('Nenhum modelo de relat�rio foi configurado para est� op��o.' + #13#10 +
                                     'Favor entrar em contato com o suporte.'), 'Aten��o', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  vgEditar  := False;
  vgFechar  := vpFechar;
  vgVersao1 := 0;
  vgVersao2 := 0;

  with dtmControles do
  begin
    Sql := 'SELECT RELATORIO, INTERNO, EDITAR FROM G_CONFIG_RELATORIO ' +
           'WHERE CONFIG_RELATORIO_ID = ' + ID;
    ExecutaSqlAuxiliar(Sql, 0);

    try
      Designer := sqlAuxiliar.FieldByName('INTERNO').AsString <> 'S';
      vgEditar := sqlAuxiliar.FieldByName('EDITAR').AsString = 'S';

      CarregaRelatorio(ID, sqlAuxiliar.FieldByName('RELATORIO').AsString, frxReport);
      sqlAuxiliar.Active := False;

      if @ExecProcedure <> nil then
        ExecProcedure;

      //Editar Relatorio
      frxReport.OnDblClickObject := frmVisualizaRelatorios.frxReportDblClickObject;

      frxReport.ShowProgress := True;
      frxReport.PrintOptions.ShowDialog := True;
      if vpImpressora <> '' then
        frxReport.PrintOptions.Printer := vpImpressora
      else
        frxReport.PrintOptions.Printer := Printer.Printers[Printer.PrinterIndex];
      frxReport.PrintOptions.PrintOnSheet := 2;

      if Designer then
      begin
        try
          frxReport.DesignReport;
        finally
           GravarRelatorio(ID);
        end;
      end
      else
      begin
        DeleteFile(vgNomeRel);
        DeleteFile(vgHistoricoRel);

        if (vpExport <> nil) and (not vpExportAfterView) then
        begin
          if vgRelFast.Acumular then
          begin
            frxReport.PrepareReport(vgRelFast.Inicio);
            if vgRelFast.Finalizar then
              frxReport.Export(vpExport);
          end
          else
          begin
            frxReport.PrepareReport(True);
            frxReport.Export(vpExport);
          end;
        end
        else if Trim(ArquivoPDF) <> '' then
        begin
          frxReport.PrepareReport(True);
          frxTIFFExport1.FileName := Trim(ArquivoPDF+'.TIF');
          frxTIFFExport1.Resolution := 200;
          frxReport.Export(frxTIFFExport1);

          frxPDFExport1.FileName := Trim(ArquivoPDF);
          frxPDFExport1.ShowDialog := False;
          frxPDFExport1.ShowProgress := False;
          frxPDFExport1.Compressed := True;
          frxPDFExport1.OpenAfterExport := True;
          frxPDFExport1.PrintOptimized := True;
          frxReport.Export(frxPDFExport1);
        end
        else
        begin
          if VisualizarImpressao then
            ShowPreview('Preview', frxReport, wsMaximized, vpZoom)
          else
          begin
            PrintDialog1.Options := PrintDialog1.Options + [poPrintToFile];
            frxReport.PrintOptions.ShowDialog := vpSolicitarImpressora;
            frxReport.PrepareReport(True);
            frxReport.Print;
          end;

          if vpExportAfterView and (not vgCancelado) then
            frxReport.Export(vpExport);
        end;
      end;
    finally
      sqlAuxiliar.Active := False;
      frxReport.Clear;
    end;
  end;
end;

function GetPaginasRelatorio(
            frxReport: TfrxReport;
            ID: String;
            ExecProcedure: TExecuteProcedure = nil): Integer;
var
  Sql: String;
begin

  with dtmControles do
  begin
    Sql := 'SELECT RELATORIO FROM G_CONFIG_RELATORIO ' +
           'WHERE CONFIG_RELATORIO_ID = ' + ID;
    try
      ExecutaSqlAuxiliar(Sql, 0);

      CarregaRelatorio(ID, sqlAuxiliar.FieldByName('RELATORIO').AsString, frxReport);
      sqlAuxiliar.Active := False;

      if @ExecProcedure <> nil then
        ExecProcedure;

      frxReport.PrepareReport;

      Result := frxReport.PreviewPages.Count;
    finally
      sqlAuxiliar.Active := False;
    end;
  end;
end;

procedure TfrmVisualizaRelatorios.btnPrimeiroClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  frxPreview.First;
  Screen.Cursor := crDefault;
end;

procedure TfrmVisualizaRelatorios.btnEditarClick(Sender: TObject);
begin
  frxPreview.Edit;
end;

procedure TfrmVisualizaRelatorios.btnAnteriorClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  frxPreview.Prior;
  Screen.Cursor := crDefault;
end;

procedure TfrmVisualizaRelatorios.btnProximoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  frxPreview.Next;
  Screen.Cursor := crDefault;
end;

procedure TfrmVisualizaRelatorios.btnUltimoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  frxPreview.Last;
  Screen.Cursor := crDefault;
end;

procedure TfrmVisualizaRelatorios.btnZoomMaisClick(Sender: TObject);
begin
  frxPreview.Zoom := frxPreview.Zoom + 0.05;
  spbPreviewWhole.Down := False;
  spbPreviewWidth.Down := False;
  spbPreview100Percent.Down := False;
  UpdateZoom;
end;

procedure TfrmVisualizaRelatorios.btnZoomMenosClick(Sender: TObject);
begin
  frxPreview.Zoom := frxPreview.Zoom - 0.05;
  spbPreviewWhole.Down := False;
  spbPreviewWidth.Down := False;
  spbPreview100Percent.Down := False;
  UpdateZoom;
end;

procedure TfrmVisualizaRelatorios.edtZoomExit(Sender: TObject);
begin
  if Trim(edtZoom.Text) <> '' then
  begin
    frxPreview.Zoom := StrToFloat(edtZoom.Text) / 100;
  end;
end;

procedure TfrmVisualizaRelatorios.edtZoomKeyPress(Sender: TObject;
  var Key: Char);
var
  liPercentage: Double;
begin
  if (Key = #13) then
  begin
    liPercentage := (StrToFloat(edtZoom.Text) / 100);

    frxPreview.Zoom := liPercentage;

    spbPreviewWhole.Down := False;
    spbPreviewWidth.Down := False;
    spbPreview100Percent.Down := False;

    UpdateZoom;
  end;
end;

procedure TfrmVisualizaRelatorios.ppVisualizaRelatoriosPageChange
  (Sender: TObject);
begin
  UpdateZoom;
end;

procedure TfrmVisualizaRelatorios.spbPreviewWholeClick(Sender: TObject);
begin
  frxPreview.ZoomMode := zmWholePage;
  UpdateZoom;
end;

procedure TfrmVisualizaRelatorios.spbPreviewWidthClick(Sender: TObject);
begin
  frxPreview.ZoomMode := zmPageWidth;
  UpdateZoom;
end;

procedure TfrmVisualizaRelatorios.spbPreview100PercentClick(Sender: TObject);
begin
  frxPreview.Zoom := 1;
  UpdateZoom;
end;

procedure TfrmVisualizaRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(vgbmp) then
    FreeAndNil(vgbmp);

  Action := caFree;
  frmVisualizaRelatorios := nil;
end;

procedure TfrmVisualizaRelatorios.FormCreate(Sender: TObject);
begin
  vgCancelado := True;
end;

procedure TfrmVisualizaRelatorios.UpdateZoom;
begin
  edtZoom.Text := IntToStr(Round(frxPreview.Zoom * 100));
end;

procedure TfrmVisualizaRelatorios.btnExportarRTFClick(Sender: TObject);
begin
  frxPreview.Export(dtmControles.frxRTFExport1);
end;

procedure TfrmVisualizaRelatorios.btnExportarXLSClick(Sender: TObject);
begin
  frxPreview.Export(dtmControles.frxXLSXExport1);
end;

procedure TfrmVisualizaRelatorios.btnExportarDocxClick(Sender: TObject);
begin
  frxPreview.Export(dtmControles.frxDOCXExport1);
end;

procedure TfrmVisualizaRelatorios.btnExportarPDFClick(Sender: TObject);
var
  viFileName : string;
  viAssinatura: TAssinarPDF;
  viPDFExport: TfrxPDFExport;
  viSaveDialog: TSaveDialog;
begin
  viFileName   := EmptyStr;
  viSaveDialog := nil;
  viPDFExport  := nil;

  try
    viSaveDialog := TSaveDialog.Create(nil);
    viSaveDialog.Filter := 'PDF files (*.pdf)|*.pdf';
    viSaveDialog.DefaultExt := 'pdf';

    if not viSaveDialog.Execute then
      Exit;

    viFileName := viSaveDialog.FileName;

    viPDFExport := dtmControles.GetFrPDFFExport(viFileName);

    frxPreview.Report.PrintOptions.ShowDialog := False;

    if cbxAssinarPDF.Checked then
    begin
      //Assinar PDF - Criar Assinador
      viAssinatura := TAssinarPDF.Create(taPADES);
      try
        if not viAssinatura.SelecionarCertificadoDigital then
          Exit;

        frxPreview.Export(viPDFExport);

        if viAssinatura.ConveterPDFA(viFileName, viFileName) then
          viAssinatura.AssinarPDF(viFileName);
      finally
        FreeAndNil(viAssinatura);
      end;
    end
    else
    begin
      frxPreview.Export(viPDFExport);
    end;
  finally
    FreeAndNil(viSaveDialog);
    FreeAndNil(viPDFExport);
  end;

  if not FileExists(viFileName) then
    Exit;

  Rotinas.OpenFileInExplorer(viFileName);
end;

procedure TfrmVisualizaRelatorios.frxPreviewPageChanged(Sender: TfrxPreview;
  PageNo: Integer);
begin
  StatusBar.Panels[0].Text := 'P�ginas : ' + IntToStr(frxPreview.PageNo) +
    ' de ' + IntToStr(frxPreview.PageCount);
end;

procedure TfrmVisualizaRelatorios.btnFindClick(Sender: TObject);
begin
  frxPreview.Find;
end;

procedure CarregaRelatorio(ID, Relatorio: String; frxReport: TfrxReport);
var
  Rel: TStringList;
  WPath: string;
begin
  with dtmControles do
  begin
    WPath := IncludeTrailingPathDelimiter(vgDiretorioCorrente);
    if Trim(Relatorio) <> '' then
    begin
      vgNomeRel := WPath + ID + '.fr3';
      vgHistoricoRel := WPath + 'H' + ID + '.fr3';
      Rel := TStringList.Create;
      try
        Rel.Text := DeCompressString(Relatorio);
        Rel.SaveToFile(vgNomeRel);
        Rel.SaveToFile(vgHistoricoRel);
        Application.ProcessMessages;
      finally
        FreeAndNil(Rel);
      end;

      vgVersao1 := DataHoraModificacao(vgNomeRel);
      frxReport.Clear;
      frxReport.LoadFromFile(WPath + ID + '.fr3');
    end
    else
    begin
      vgNomeRel := WPath + ID + '.fr3';
      CopyFiles(WPath + 'New.fr3', vgNomeRel);
      Application.ProcessMessages;
      frxReport.Clear;
      frxReport.LoadFromFile(vgNomeRel);
    end;
  end;
end;

procedure GravarRelatorio(ID: String);
var
  Caminho, Historico, WPath: string;
  sqlRelatorio: TI9Query;
  vGravarHistorico: boolean;
begin
  Application.ProcessMessages;
  sqlRelatorio := TI9Query.Create(nil);
  sqlRelatorio.Connection := dtmControles.DB;

  WPath := IncludeTrailingPathDelimiter(vgDiretorioCorrente);

  Caminho := WPath + ID + '.fr3';
  Historico := WPath + 'H' + ID + '.fr3';
  vgVersao2 := DataHoraModificacao(Caminho);
  try
    if vgVersao2 <> 0 then
    begin
      if vgVersao2 > vgVersao1 then
      begin
        if FileExists(Caminho) then
        begin
          if Application.MessageBox('Deseja gravar essa altera��o?', 'Aten��o',
            MB_YESNO + MB_ICONQUESTION) = IDYES then
          begin
            vGravarHistorico := False;
            if FileExists(Historico) then
            begin
              if Application.MessageBox
                ('Deseja gravar o hist�rico dessa altera��o?', 'Aten��o',
                MB_YESNO + MB_ICONQUESTION) = IDYES then
              begin
                vGravarHistorico := True;
              end;
            end;

            with sqlRelatorio do
            begin
              Active := False;

              if vGravarHistorico then
              begin
                SQL.Text := 'UPDATE G_CONFIG_RELATORIO '+
                  ' SET RELATORIO = :RELATORIO, '+
                  '     HISTORICO = :HISTORICO '+
                  ' WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID ';
                ParamByName('RELATORIO').ParamType := ptInput;
                ParamByName('RELATORIO').DataType  := ftBlob;
                ParamByName('RELATORIO').LoadFromFile(Caminho, ftBlob);
                ParamByName('RELATORIO').AsString  := CompressString(ParamByName('RELATORIO').AsString);
                ParamByName('HISTORICO').ParamType := ptInput;
                ParamByName('HISTORICO').DataType  := ftBlob;
                ParamByName('HISTORICO').LoadFromFile(Historico, ftBlob);
                ParamByName('HISTORICO').AsString  := CompressString(ParamByName('HISTORICO').AsString);
              end
              else
              begin
                SQL.Text := 'UPDATE G_CONFIG_RELATORIO '+
                  ' SET RELATORIO = :RELATORIO '+
                  ' WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID ';
                ParamByName('RELATORIO').ParamType := ptInput;
                ParamByName('RELATORIO').DataType  := ftBlob;
                ParamByName('RELATORIO').LoadFromFile(Caminho, ftBlob);
                ParamByName('RELATORIO').AsString  := CompressString(ParamByName('RELATORIO').AsString);
              end;
              ParamByName('CONFIG_RELATORIO_ID').ParamType := ptInput;
              ParamByName('CONFIG_RELATORIO_ID').DataType  := ftInteger;
              ParamByName('CONFIG_RELATORIO_ID').AsString  := ID;
              ExecSQL;
            end;
          end
        end;
        Application.ProcessMessages;
      end;
    end;
  finally
    FreeAndNil(sqlRelatorio);
    DeleteFile(Caminho);
    DeleteFile(Historico);
  end;
end;

procedure CriarFuncoesRelatorio(frRelatorio: TfrxReport);
begin
  frRelatorio.AddFunction('function BuscarConfig(vpGrupo, vpSecao, vpNome : string; vpTipoValor: char): Variant', 'TRI7', 'Retorna o valor dos par�metros de configura��o do sistema');
  frRelatorio.AddFunction('function ExecSQL(Qry: string):Boolean', 'TRI7', 'Executa o SQL passado como par�metro');
  frRelatorio.AddFunction('function GetStr(Qry: string): string', 'TRI7', 'Retorna o valor do SELECT passado no formato de STRING');
  frRelatorio.AddFunction('function RetornaNumerico(Valor : String) : String', 'TRI7', 'Retorna apenas os valores numericos no formato STRING');
  frRelatorio.AddFunction('function QuotedStr(Valor : String) : String', 'TRI7', 'Retorna uma STRING com delimitadores');
  frRelatorio.AddFunction('function TrocaVirgPPto(Valor: string): String', 'TRI7', 'Troca as "," por "."');
  frRelatorio.AddFunction('function NumeroExtenso(vpValor: Integer) : String', 'TRI7', 'Retorna o n�mero por extenso');
  frRelatorio.AddFunction('function ValorExtenso(Valor: Double; TipoExtenso : Integer = 3): String', 'TRI7', 'Retorna o valor por extenso');
  frRelatorio.AddFunction('procedure RetornaValores(Valor: String)', 'TRI7', 'Retorna valores internos para a aplica��o');
  frRelatorio.AddFunction('procedure MaiusculoMinusculo(Valor: String)', 'TRI7', 'Retorna Nome em Maiusculo/Minusculo');
  frRelatorio.AddFunction('function DeCompressString(Source:String):String', 'TRI7', 'Descompacta texto');
  frRelatorio.AddFunction('function DeCompressText(Source:String):String', 'TRI7', 'Descompacta texto');
  frRelatorio.AddFunction('function MinutosParaHora(vpMinutos: Integer): string;', 'TRI7', 'Converte Minutos para Hora');
  frRelatorio.AddFunction('function DataExtenso(vpData : TDate):String;', 'TRI7', 'Retorna a data por extenso');
  frRelatorio.AddFunction('function QrCode(vfValor: string): Integer;', 'TRI7', 'Retorna QR Code');
  frRelatorio.AddFunction('function BuscarMesExtenso(Valor: Integer): String;', 'TRI7', 'Retorna o m�s por extenso');
  frRelatorio.AddFunction('function RetornaCPFCNPJFormatado(Valor : String) : String;', 'TRI7', 'Retorna CPF/CNPJ formatados');

end;

function ExecutarFuncoesRelatorio(NameFuncao: String;
  var Parametros: Variant): Variant;
var
  TipoExtenco: Integer;
begin
  if Assigned(vgbmp) then
    FreeAndNil(vgbmp);

  Result := Null;
  if AnsiSameText(NameFuncao, 'BuscarConfig') then
    Result := dtmControles.BuscarConfig(Parametros[0], Parametros[1], Parametros[2], String(Parametros[3])[1])
  else if AnsiSameText(NameFuncao, 'DeCompressString') then
    Result := DeCompressString(AnsiString(Parametros[0]))
  else if AnsiSameText(NameFuncao, 'DeCompressText') then
    Result := dtmControles.RetornaTexto(DeCompressString(AnsiString(Parametros[0])))
  else if AnsiSameText(NameFuncao, 'ExecSQL') then
    Result := dtmControles.ExecSQL(Parametros[0])
  else if AnsiSameText(NameFuncao, 'GetStr') then
    Result := dtmControles.GetStr(Parametros[0])
  else if AnsiSameText(NameFuncao, 'RetornaNumerico') then
    Result := RetornaNumerico(Parametros[0])
  else if AnsiSameText(NameFuncao, 'QuotedStr') then
    Result := QuotedStr(Parametros[0])
  else if AnsiSameText(NameFuncao, 'TrocaVirgPPto') then
    Result := TrocaVirgPPto(Parametros[0])
  else if AnsiSameText(NameFuncao, 'MaiusculoMinusculo') then
    Result := MaiusculoMinusculo(Parametros[0])
  else if AnsiSameText(NameFuncao, 'MinutosParaHora') then
    Result := MinutosParaHora(Parametros[0])
  else if AnsiSameText(NameFuncao, 'ValorExtenso') then
  begin
    TipoExtenco := Parametros[1];
    Result := MaiusculoMinusculo(Trim(ValorExtenso(Parametros[0], '', '',
      TipoExtenco)));
  end
  else if AnsiSameText(NameFuncao, 'NumeroExtenso') then
    Result := NumeroExtenso(Parametros[0])
  else if AnsiSameText(NameFuncao, 'RetornaValores') then
  begin
    if @ExecRetornaValores <> nil then
      ExecRetornaValores(Parametros[0]);
  end
  else
  if AnsiSameText(NameFuncao, 'DataExtenso') then
    Result := DataExtenso(Parametros[0])
  else
  if AnsiSameText(NameFuncao, 'QrCode') then
  begin
    vgbmp := GerarQrCode(Parametros[0]);
    Result := integer(vgbmp);
  end
  else if AnsiSameText(NameFuncao, 'BuscarMesExtenso') then
    Result := BuscarMesExtenso(Parametros[0])
  else if AnsiSameText(NameFuncao, 'RetornaCPFCNPJFormatado') then
    Result := RetornaCPFCNPJFormatado(Parametros[0])
end;

procedure TfrmVisualizaRelatorios.btnFecharClick(Sender: TObject);
begin
  vgCancelado := True;
  Close;
end;

procedure TfrmVisualizaRelatorios.btnImprimirClick(Sender: TObject);
begin
  frxPreview.Print;
  vgCancelado := False;

  if vgFechar then
    Close;
end;

procedure TfrmVisualizaRelatorios.btnMiniaturasClick(Sender: TObject);
begin
   frxPreview.ThumbnailVisible := not frxPreview.ThumbnailVisible;
end;

procedure TfrmVisualizaRelatorios.frxReportDblClickObject(Sender: TfrxView;
  Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
var
  viTexto : string;
  viRich : TfrxRichEditorForm;
begin
  try
    if Sender is TfrxRichView then
    begin
      if  AnsiUpperCase(TfrxRichView(Sender).TagStr) = 'EDITAR' then
      begin
        viRich := TfrxRichEditorForm.Create(Self);
        try
          with viRich do
          begin
            RichView := TfrxRichView(Sender);
            Modified := ShowModal = mrOk;
          end;
        finally
          viRich.Free;
        end;
      end;
    end
    else
    if Sender is TfrxMemoView then
      if  AnsiUpperCase(TfrxMemoView(Sender).TagStr) = 'EDITAR' then
      begin
        viTexto := TfrxMemoView(Sender).Text;
        SetLength(viTexto, Length(viTexto) - 2); // cut off #13#10
        if InputQueryA('Alterar', 'Valor:', viTexto) then
        begin
          TfrxMemoView(Sender).Text := viTexto;
          Modified := True;
        end;
      end;
  except

  end;
end;

end.