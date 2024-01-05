unit Geral.Model.FastReport;

interface

uses
  System.Generics.Collections,
  System.Classes,
  Vcl.Forms,
  frxClass,
  frxDBSet,
  frxExportPDF,
  Controles;

type
  TFastReportPDF = class
  private

  public
    class function GerarPDF(const vpFastReport: TfrxReport;
      const vpID: Integer;
      const vpExecProcedure: TExecuteProcedure;
      const vpCaminhoDestino: string): Boolean;

    class function GerarPDFAssinado(const vpFastReport: TfrxReport;
      const vpID: Integer;
      const vpExecProcedure: TExecuteProcedure): Boolean;overload;

    class function GerarPDFAssinado(const vpFastReport: TfrxReport;
      const vpID: Integer;
      const vpExecProcedure: TExecuteProcedure;
      const vpCaminhoDestino: string): Boolean;overload;

    class function GerarPDFAssinado(const vpFastReport: TfrxReport;
      const vpID: Integer;
      const vpExecProcedure: TExecuteProcedure;
      const vpCaminhoDestino: string;
      const vpSenha: string): Boolean;overload;

    class procedure GerarPDFAssinadoEmLote(const vpFastReport: TfrxReport;
      const vpFrxDBDataset: TfrxDBDataset;
      const vpID: Integer;
      const vpFieldName: string;
      const vpExecProcedure: TExecuteProcedure;
      const vpCaminhoArquivo: TFunctionCaminhoArquivoPDF);

  end;

implementation

uses
  Geral.Model.Entity.Impl.Assinar.PDF,
  System.SysUtils,
  VisualizaRelatorios,
  RotinasImagem,
  Rotinas,
  Vcl.Dialogs;

class function TFastReportPDF.GerarPDF(const vpFastReport: TfrxReport;
  const vpID: Integer;
  const vpExecProcedure: TExecuteProcedure;
  const vpCaminhoDestino: string): Boolean;
var
  viPDFExport: TfrxPDFExport;
begin
  Result := False;

  viPDFExport := dtmControles.GetFrPDFFExport(vpCaminhoDestino);
  try
    ExibirRelatorio(vpFastReport,
      vpID.ToString,
      vpExecProcedure,
      False,
      EmptyStr,
      False,
      True,
      EmptyStr,
      viPDFExport);

     Result := FileExists(vpCaminhoDestino);
  finally
    FreeAndNil(viPDFExport);
  end;

end;

class function TFastReportPDF.GerarPDFAssinado(const vpFastReport: TfrxReport;
  const vpID: Integer;
  const vpExecProcedure: TExecuteProcedure;
  const vpCaminhoDestino: string;
  const vpSenha: string): Boolean;
var
  viAssinarPdf: TAssinarPDF;
begin
  Result := False;
  viAssinarPdf := nil;

  try
    viAssinarPdf := TAssinarPDF.Create(TTipoAssinatura.taPADES);
    if not viAssinarPdf.SelecionarCertificadoDigital then
      Exit;

    if GerarPDF(vpFastReport, vpID, vpExecProcedure, vpCaminhoDestino) then
      if viAssinarPdf.ConveterPDFA(vpCaminhoDestino, vpCaminhoDestino) then
        Result := viAssinarPdf.AssinarPDF(vpCaminhoDestino, vpSenha);

  finally
    FreeAndNil(viAssinarPdf);
  end;

end;

class function TFastReportPDF.GerarPDFAssinado(const vpFastReport: TfrxReport;
  const vpID: Integer; const vpExecProcedure: TExecuteProcedure;
  const vpCaminhoDestino: string): Boolean;
begin
  Result := GerarPDFAssinado(
              vpFastReport,
              vpID,
              vpExecProcedure,
              vpCaminhoDestino,
              EmptyStr);
end;

class function TFastReportPDF.GerarPDFAssinado(const vpFastReport: TfrxReport;
  const vpID: Integer;
  const vpExecProcedure: TExecuteProcedure): Boolean;
var
  viSaveDialog: TSaveDialog;
  viCaminhoDestino: string;
begin
  Result := False;
  viSaveDialog := nil;

  try
    viSaveDialog := TSaveDialog.Create(nil);
    viSaveDialog.Filter := 'PDF files (*.pdf)|*.pdf';
    viSaveDialog.DefaultExt := 'pdf';

    if not viSaveDialog.Execute then
      Exit;

    viCaminhoDestino := viSaveDialog.FileName;

    Result := GerarPdfAssinado(
      vpFastReport,
      vpID,
      vpExecProcedure,
      viCaminhoDestino);

    if not Result then
      Exit;

    Rotinas.OpenFileInExplorer(
      viCaminhoDestino);
  finally
    FreeAndNil(viSaveDialog);
  end;
end;

class procedure TFastReportPDF.GerarPDFAssinadoEmLote(const vpFastReport: TfrxReport;
  const vpFrxDBDataset: TfrxDBDataset;
  const vpID: Integer;
  const vpFieldName: string;
  const vpExecProcedure: TExecuteProcedure;
  const vpCaminhoArquivo: TFunctionCaminhoArquivoPDF);
var
  viAssinatura: TAssinarPDF;
  viDiretorio: string;
begin
  viAssinatura := TAssinarPDF.Create(taPADES);

  try
    if not viAssinatura.SelecionarCertificadoDigital then
      Exit;

    viDiretorio := dtmControles.SaveReportPDF(
                     vpFastReport,
                     vpID.ToString,
                     vpFrxDBDataset,
                     vpFieldName,
                     vpExecProcedure,
                     vpCaminhoArquivo,
                     viAssinatura);

    if viDiretorio.IsEmpty then
      Exit;

    Rotinas.OpenFileInExplorer(viDiretorio);

  finally
    FreeAndNil(viAssinatura);
  end;
end;

end.

