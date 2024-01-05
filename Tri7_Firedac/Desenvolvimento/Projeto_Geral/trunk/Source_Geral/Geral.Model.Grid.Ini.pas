unit Geral.Model.Grid.Ini;

interface

uses cxGridDBTableView, cxGridTableView, cxGrid, cxGridCustomView, cxGridStyleSheetsPreview,
     cxStyleSheetEditor, Cxstyles;

type
  TSistemaIni = (siRegistroImovel, siTabelionato, siProtesto, siRTD,
    siRegistroCivil, siAdministrativo, siFinanceiro, siCaixa);

  TGridIni = class abstract
  private
    FSistemaIni: TSistemaIni;

    function GetFileName: string;
    function GetDiretorio: string;
    function GetCaminhoArquivo: string;
  public
    constructor Create(
      const vpSistema: TSistemaIni); reintroduce;

    procedure StoreIni(const vpGridTableView: TcxGridDBTableView);
    procedure RestoreIni(const vpGridTableView: TcxGridDBTableView);
  end;

implementation

uses
  System.SysUtils,
  Controles;

{ TGridIni }

constructor TGridIni.Create(const vpSistema: TSistemaIni);
begin
  FSistemaIni := vpSistema;
end;

function TGridIni.GetCaminhoArquivo: string;
begin
  Result := GetDiretorio + GetFileName;
end;

function TGridIni.GetDiretorio: string;
begin
  Result := IncludeTrailingPathDelimiter(vgDiretorioCorrente);
end;

function TGridIni.GetFileName: string;
begin
  case FSistemaIni of
    siRegistroImovel: Result := 'GrdsRegistroImovel.ini';
    siTabelionato: Result := 'GrdsTabelionato.ini';
    siProtesto: Result := 'GrdsProtesto.ini';
    siRTD: Result := 'GrdsRTD.ini';
    siRegistroCivil: Result := 'GrdsRegistroCivil.ini';
    siAdministrativo: Result := 'GrdsAdministrativo.ini';
    siFinanceiro: Result := 'GrdsFinanceiro.ini';
    siCaixa: Result := 'GrdsCaixa.ini';
  end;
end;

procedure TGridIni.RestoreIni(const vpGridTableView: TcxGridDBTableView);
begin
  if FileExists(GetCaminhoArquivo) then
    vpGridTableView.RestoreFromIniFile(GetCaminhoArquivo, False, False, []);
end;

procedure TGridIni.StoreIni(const vpGridTableView: TcxGridDBTableView);
begin
  vpGridTableView.StoreToIniFile(GetCaminhoArquivo, True, []);
end;

end.
