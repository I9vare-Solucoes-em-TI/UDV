unit Geral.Model.WPTools;

interface

uses
  Geral.Model.Entity.Impl.Assinar.PDF,
  Geral.Model.WPTools.Watermark,
  WPCTRRich,
  WPRTEPlatform,
  WPRTEPaint,
  WPRTEDefsConsts,
  WPRTEDefs;

type
  TWPToolsPDF = class
  private
    class function RetirarCabecalho(const vpTexto: TWPRichText): TWPRichText;

    class function ConfigWatermark(const vpTexto: TWPRichText;
      const vpOnPaintWatermarkEvent: TWPOnPaintWatermarkEvent): TWPToolsWatermark;

    class function GerarPdfComRelatorio(const vpTexto: TWPRichText;
      const vpCaminhoDestino: string;
      const vpAssinarPdf: TAssinarPDF): Boolean;

    class function GerarPdfDireto(const vpTexto: TWPRichText;
      const vpCaminhoDestino: string;
      const vpAssinarPdf: TAssinarPDF): Boolean;

    class function GerarPdfAssinado(const vpTexto: TWPRichText;
      const vpCaminhoDestino: string): Boolean; overload;

  public
    class function GerarPdfAssinado(
      const vpTexto: TWPRichText): Boolean; overload;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  Controles,
  RotinasImagem,
  Rotinas,
  Vcl.Dialogs;

class function TWPToolsPDF.RetirarCabecalho(
  const vpTexto: TWPRichText): TWPRichText;
begin
  if dtmControles.BuscarParametroOutroSistema(
        'WATERMARK_RETIRAR_CABECALHO',
        'PDF',
        'PRINCIPAL',
        '5') = 'S' then
    Result := Rotinas.RetirarCabecalhoRodapeTexto(vpTexto)
  else
  begin
    Result := TWPRichText.Create(nil);
    Result.AsString := vpTexto.AsString;
  end;

  Result.BookmarkTextAttr.UseTextColor := False;
  Result.ReformatAll;
end;

class function TWPToolsPDF.ConfigWatermark(const vpTexto: TWPRichText;
  const vpOnPaintWatermarkEvent: TWPOnPaintWatermarkEvent): TWPToolsWatermark;
var
  viCaminhoWatermark: string;
begin
  Result := nil;

  viCaminhoWatermark := dtmControles.BuscarParametroOutroSistema(
      'WATERMARK_CAMINHO_IMAGEM',
      'PDF',
      'PRINCIPAL',
      '5');

    if FileExists(viCaminhoWatermark) then
    begin
      if Assigned(vpOnPaintWatermarkEvent) then
      begin
        Result := TWPToolsWatermark.Create(viCaminhoWatermark, vpOnPaintWatermarkEvent)
      end
      else
        Result := TWPToolsWatermark.Create(viCaminhoWatermark, nil);

      vpTexto.OnPaintWatermark := Result.WPRichTextPaintWatermark;
    end
    else
    if Assigned(vpOnPaintWatermarkEvent) then
      vpTexto.OnPaintWatermark := vpOnPaintWatermarkEvent;
end;

class function TWPToolsPDF.GerarPdfComRelatorio(const vpTexto: TWPRichText;
  const vpCaminhoDestino: string;
  const vpAssinarPdf: TAssinarPDF): Boolean;
var
  viRelatorioID: Integer;
  I: Integer;
  viPaginas: Integer;
  viJpeg: TMemoryStream;
  viPagina: Integer;
  viTexto: TWPRichText;
  viWPToolsWatermark : TWPToolsWatermark;
begin
  Result := False;
  dtmControles.cdsGerarPDF.EmptyDataSet;
  viTexto := nil;
  viWPToolsWatermark:= nil;

  try
    viTexto := RetirarCabecalho(vpTexto);

    viWPToolsWatermark := ConfigWatermark(viTexto, vpTexto.OnPaintWatermark);

    viPaginas := viTexto.PageCount;

    for I := 0 to viPaginas - 1 do
    begin
      viJpeg := nil;
      try
        viJpeg := RotinasImagem.GetTextToJpeg(
          viTexto,
          I);

        viPagina := I + 1;

        if viJpeg.Size <= 0 then
          raise Exception.CreateFmt(
            'Não foi possível converter a pág. %d para o formato JPEG.',
            [viPagina]);

        dtmControles.cdsGerarPDF.Append;
        dtmControles.cdsGerarPDFPAGINA.AsInteger := viPagina;
        dtmControles.cdsGerarPDFIMAGEM.LoadFromStream(viJpeg);
        dtmControles.cdsGerarPDF.Post;
      finally
        FreeAndNil(viJpeg);
      end;
    end;

    viRelatorioID := dtmControles.BuscarParametroOutroSistema(
      'RELATORIO_PDF_WPTOOLS',
      'RELATORIO',
      'PRINCIPAL',
      '5');

    dtmControles.SaveReportPDF(
      dtmControles.frxRelatorio,
      viRelatorioID.ToString,
      dtmControles.frxDBGerarPDF,
      'PAGINA',
      dtmControles.ParametrosRelatorio,
      function (const vpValor: string): string
      begin
       Result := vpCaminhoDestino;
      end,
      vpAssinarPdf,
      False);

    Result := True;
  finally
    dtmControles.cdsGerarPDF.EmptyDataSet;
    FreeAndNil(viTexto);
    FreeAndNil(viWPToolsWatermark);
  end;
end;

class function TWPToolsPDF.GerarPdfDireto(const vpTexto: TWPRichText;
  const vpCaminhoDestino: string; const vpAssinarPdf: TAssinarPDF): Boolean;
var
  viTexto: TWPRichText;
  viWPToolsWatermark : TWPToolsWatermark;
begin
  Result := False;
  viTexto := nil;
  viWPToolsWatermark:= nil;

  try
    viTexto := RetirarCabecalho(vpTexto);

    viWPToolsWatermark := ConfigWatermark(viTexto, vpTexto.OnPaintWatermark);

    if RotinasImagem.ConvertTextToPDF(viTexto, vpCaminhoDestino) then
      if vpAssinarPdf.ConveterPDFA(vpCaminhoDestino, vpCaminhoDestino) then
        Result := vpAssinarPdf.AssinarPDF(vpCaminhoDestino);
  finally
    FreeAndNil(viTexto);
    FreeAndNil(viWPToolsWatermark);
  end;

end;

class function TWPToolsPDF.GerarPdfAssinado(const vpTexto: TWPRichText;
  const vpCaminhoDestino: string): Boolean;
var
  viAssinarPdf: TAssinarPDF;
begin
  Result := False;
  viAssinarPdf := nil;

  try
    viAssinarPdf := TAssinarPDF.Create(TTipoAssinatura.taPADES);
    if not viAssinarPdf.SelecionarCertificadoDigital then
      Exit;

    //D - Direto Wptools | R - FastReport
    if dtmControles.BuscarParametroOutroSistema(
      'GERARDOR_PDF_PADRAO',
      'PDF',
      'PRINCIPAL',
      '5') = 'D' then
    begin
      if not GerarPdfDireto(
        vpTexto,
        vpCaminhoDestino,
        viAssinarPdf) then
        Exit;
    end
    else
      if not GerarPdfComRelatorio(
        vpTexto,
        vpCaminhoDestino,
        viAssinarPdf) then
        Exit;

    Result := True;
  finally
    FreeAndNil(viAssinarPdf);
  end;
end;

class function TWPToolsPDF.GerarPdfAssinado(
  const vpTexto: TWPRichText): Boolean;
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
      vpTexto,
      viCaminhoDestino);

    if not Result then
      Exit;

    Rotinas.OpenFileInExplorer(
      viCaminhoDestino);
  finally
    FreeAndNil(viSaveDialog);
  end;
end;

end.
