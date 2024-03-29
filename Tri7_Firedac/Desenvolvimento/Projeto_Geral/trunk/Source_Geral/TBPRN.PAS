{
  Autor........: Daniel Pereira Guimar�es
  E-Mail.......: tecnobyte@ulbrajp.com.br
  Web..........: www.ulbrajp.com.br/usuarios/tecnobyte
  Modificado em: 12 - Maio - 1999.

  Pode distribuir. Apenas deixe as informa��es acima.
}


unit tbPrn;

{ Como usar?

  - Adicione esta unit ao seu projeto;
  - Coloque no uses da unit onde for us�-la: tbPrn;
  - Siga o exemplo abaixo para contruir seus relat�rios.

procedure TForm1.Button1Click(Sender: TObject);
var
  Papel: TtbPrnPaper;
begin
  Papel.Size := 256; // 256 � o tam. personalizado
  Papel.Width := 2100; // 21 cm
  Papel.Height := 1000; // 10 cm
  Papel := tbPrnSetPaperSize(Papel);
  try
    Printer.BeginDoc;
    try
      // coloque aqui os comandos para impress�o
    finally
      Printer.EndDoc;
    end;
  finally
    tbPrnSetPaperSize(Papel); // Restaura o tamanho
  end;
end;

 Paper.Size refere-se ao tamanho do papel. Veja alguns:
    0 - Default
    1 - Letter
    5 - Legal
    8 - A3
    9 - A4
   11 - A5
  256 - Custom (personalizado)


S� ser� necess�rio informar Papel.Height e Papel.Width
quando Papel.Size for 256.

}

interface
  uses Windows, Printers, SysUtils;

type
  TtbPrnPaper = record
    Size: SmallInt;
    Width: SmallInt;
    Height: SmallInt;
  end;

function tbPrnSetPaperSize(const Paper: TtbPrnPaper; const Orientacao : smallint = 1): TtbPrnPaper;

implementation

function tbPrnSetPaperSize(const Paper: TtbPrnPaper; const Orientacao : smallint = 1): TtbPrnPaper;
var
  S: string;
  HDevMode: THandle;
  DevMode: PDeviceMode;
  Device, Driver, Port: PChar;
begin
  { Bug VCL - A Impressora selecionada �s vezes falha. Com
    esta instru��o funciona adequadamente. }
  S := Printer.Printers[Printer.PrinterIndex];

  { Aloca mem�ria para as vari�veis PChar }
  GetMem(Device, 255);
  GetMem(Driver, 255);
  GetMem(Port, 255);
  try
    { Obt�m dados da impressora atual }
    Printer.GetPrinter(Device, Driver, Port, HDevMode);

    { Aloca ponteiro }
    DevMode := GlobalLock(HDevMode);
    try
      if DevMode <> nil then begin
        with DevMode^ do begin

          { Salva tamanho atual }
//          Result.Size := dmPaperSize;
          Result.Size := Paper.Size;

          Result.Width := dmPaperWidth;
          Result.Height := dmPaperLength;
          dmOrientation := Orientacao;

          { Define o novo tamanho }
//          dmPaperSize := Paper.Size;
          dmPaperSize := Paper.Size;
          dmFields := dmFields or DM_PAPERSIZE;

          { Se for tamanho personalizado... }
{          if Paper.Size = DMPAPER_USER then begin

            { Define altura }
{            dmPaperLength := Paper.Height;
            dmFields := dmFields or DM_PAPERLENGTH;}

//            dmPaperLength := 3370;
            dmPaperLength := 3100;
            dmFields := dmFields or DM_PAPERLENGTH;

            dmPaperWidth := 2100;
            dmFields := dmFields or DM_PAPERWIDTH;

            { Define largura }
 {           dmPaperWidth := Paper.Width;
            dmFields := dmFields or DM_PAPERWIDTH;
          end;                                    }

        end;

        { Aplica as modifica��es }
        Printer.SetPrinter(Device, Driver, Port, HDevMode);
      end else
        raise Exception.Create('Erro ao definir tamanho de papel.');
    finally
      { Desaloca ponteiro }
      GlobalUnlock(HDevMode)
    end;
  finally
    { Desaloca a mem�ria das vari�veis PChar }
    FreeMem(Device, 255);
    FreeMem(Driver, 255);
    FreeMem(Port, 255);
  end;
end;

end.
