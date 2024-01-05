unit VincularPessoasExpostasPoliticamente;

interface

uses
  Controles,
  Rotinas,
  System.SysUtils,
  I9Connection,
  I9Query,
  Winapi.Windows,
  Vcl.Forms,
  Data.DB,
  System.Variants;

type
  TVincularPessoasExpostasPoliticamente = class
    private
    public
      class procedure AtualizarCPFPessoaExposta(
        const vpPessoaExpostaId: Integer;
        const vpCPF: string
      ); Overload;

      class procedure AtualizarCPFPessoaExposta(
        const vpPessoaExpostaId: Integer;
        const vpDataInicio: TDateTime;
        const vpUsuarioId: Integer;
        const vpCPF: string;
        const vpTipoRegistro: string
      ); Overload;

      class procedure RemoverVinculoCPFPessoaExposta(
        const vpPessoaExpostaId: Integer
      );

      class procedure AtualizarDataCarencia(
        const vpPessoaExpostaId: Integer;
        const vpDataAtual: TDateTime
      );

      class procedure AdicionarPessoaExposta(
        const vpNome: string;
        const vpDataInicio: TDateTime;
        const vpDataRegistro: TDateTime;
        const vpUsuarioId: Integer;
        const vpCPF: string;
        const vpTipoRegistro: string
      ); Overload;

      class procedure AdicionarPessoaExposta(
        const vpNome: string;
        const vpDataInicio: TDateTime;
        const vpDataRegistro: TDateTime;
        const vpDataCarencia: TDateTime;
        const vpUsuarioId: Integer;
        const vpCPF: string;
        const vpTipoRegistro: string
      ); Overload;

      class function CarregarPessoasExposta(
        const vpNome: string;
        const vpCpfAuxiliar: string;
        const vpTipoSistema: Integer;
        const vpDataIniRegistro: string;
        const vpDataFimRegistro: string
      ): TI9Query; Overload;

      class function CarregarPessoasExposta(
        const vpDataIniRegistro: string;
        const vpDataFimRegistro: string
      ): TI9Query; Overload;

      class function PessoaExpostaComAMaiorDataCarencia(
        const vpCPF: string;
        const vpDataAtual: TDateTime): TI9Query;
  end;

implementation

{ TVincularPessoasExpostasPoliticamente }

class function TVincularPessoasExpostasPoliticamente.CarregarPessoasExposta(
  const vpNome: string;
  const vpCpfAuxiliar: string;
  const vpTipoSistema: Integer;
  const vpDataIniRegistro: string;
  const vpDataFimRegistro: string): TI9Query;
{$REGION 'Variáveis'}
var
  viSql: string;
  viQry: TI9Query;
{$ENDREGION}
begin
  viSql :=
    'SELECT ' +
    '  PEX.* ' +
    ' FROM ' +
    '  G_PESSOA_EXPOSTA PEX ' +
    ' WHERE ' +
    '  PEX.NOME = ' + QuotedStr(vpNome) +
    '  AND PEX.CPF_AUXILIAR = ' + QuotedStr(vpCpfAuxiliar);

    {$REGION 'Data de Registro'}
    if (Length(Trim(vpDataIniRegistro)) > 4) and (Length(Trim(vpDataFimRegistro)) > 4) then
      viSql := viSql + ' AND PEX.DATA_REGISTRO ' +
        MontarSqlData(StrToDate(vpDataIniRegistro), StrToDate(vpDataFimRegistro));
    {$ENDREGION}

    viSql := viSql +
      ' ORDER BY ' +
      '  PEX.DATA_FIM_CARENCIA DESC';

  viQry := TI9Query.Create(nil);
  viQry.Connection := dtmControles.DB;
  viQry.SQL.Clear;
  viQry.SQL.Text := viSql;
  viQry.Open;
  Result := viQry;
end;

class procedure TVincularPessoasExpostasPoliticamente.AdicionarPessoaExposta(
  const vpNome: string;
  const vpDataInicio: TDateTime;
  const vpDataRegistro: TDateTime;
  const vpUsuarioId: Integer;
  const vpCPF: string;
  const vpTipoRegistro: string);
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
  viChaveId: Integer;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    viChaveId := dtmControles.GerarSequencia('G_PESSOA_EXPOSTA');

    viQry := TI9Query.Create(nil);
    try
      viQry.Connection := dtmControles.DB;
      viQry.SQL.Clear;
      viQry.SQL.Text :=
      {$REGION 'SQL'}
      'INSERT INTO G_PESSOA_EXPOSTA ( ' +
      '  PESSOA_EXPOSTA_ID, ' +
      '  NOME, ' +
      '  DATA_INICIO_EXERCICIO, ' +
      '  USUARIO_ID, ' +
      '  DATA_REGISTRO, ' +
      '  CPF, ' +
      '  TIPO_REGISTRO ' +
      ') VALUES ( ' +
      '  :PESSOA_EXPOSTA_ID, ' +
      '  :NOME, ' +
      '  :DATA_INICIO_EXERCICIO, ' +
      '  :USUARIO_ID, ' +
      '  :DATA_REGISTRO, ' +
      '  :CPF, ' +
      '  :TIPO_REGISTRO)';
      {$ENDREGION}

      viQry.ParamByName('PESSOA_EXPOSTA_ID').AsInteger := viChaveId;
      viQry.ParamByName('NOME').AsString               := vpNome;
      viQry.ParamByName('DATA_INICIO_EXERCICIO').Value := vpDataInicio;
      viQry.ParamByName('DATA_REGISTRO').Value         := vpDataRegistro;
      viQry.ParamByName('USUARIO_ID').AsInteger        := vpUsuarioId;
      viQry.ParamByName('CPF').AsString                := vpCPF;
      viQry.ParamByName('TIPO_REGISTRO').AsString      := vpTipoRegistro;
      viQry.ExecSQL;
    finally
      FreeAndNil(viQry);
    end;
    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar(
        'Falha ao adicionar pessoa exposta ' + sLineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

class procedure TVincularPessoasExpostasPoliticamente.AdicionarPessoaExposta(
  const vpNome: string;
  const vpDataInicio: TDateTime;
  const vpDataRegistro: TDateTime;
  const vpDataCarencia: TDateTime;
  const vpUsuarioId: Integer;
  const vpCPF: string;
  const vpTipoRegistro: string);
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
  viChaveId: Integer;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    viChaveId := dtmControles.GerarSequencia('G_PESSOA_EXPOSTA');

    viQry := TI9Query.Create(nil);
    try
      viQry.Connection := dtmControles.DB;
      viQry.SQL.Clear;
      viQry.SQL.Text :=
      {$REGION 'SQL'}
      'INSERT INTO G_PESSOA_EXPOSTA ( ' +
      '  PESSOA_EXPOSTA_ID, ' +
      '  NOME, ' +
      '  DATA_INICIO_EXERCICIO, ' +
      '  DATA_FIM_CARENCIA, ' +
      '  USUARIO_ID, ' +
      '  DATA_REGISTRO, ' +
      '  CPF, ' +
      '  TIPO_REGISTRO ' +
      ') VALUES ( ' +
      '  :PESSOA_EXPOSTA_ID, ' +
      '  :NOME, ' +
      '  :DATA_INICIO_EXERCICIO, ' +
      '  :DATA_FIM_CARENCIA, ' +
      '  :USUARIO_ID, ' +
      '  :DATA_REGISTRO, ' +
      '  :CPF, ' +
      '  :TIPO_REGISTRO)';
      {$ENDREGION}

      viQry.ParamByName('PESSOA_EXPOSTA_ID').AsInteger := viChaveId;
      viQry.ParamByName('NOME').AsString               := vpNome;
      viQry.ParamByName('DATA_INICIO_EXERCICIO').Value := vpDataInicio;
      viQry.ParamByName('DATA_FIM_CARENCIA').Value     := vpDataCarencia;
      viQry.ParamByName('DATA_REGISTRO').Value         := vpDataRegistro;
      viQry.ParamByName('USUARIO_ID').AsInteger        := vpUsuarioId;
      viQry.ParamByName('CPF').AsString                := vpCPF;
      viQry.ParamByName('TIPO_REGISTRO').AsString      := vpTipoRegistro;
      viQry.ExecSQL;
    finally
      FreeAndNil(viQry);
    end;
    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar(
        'Falha ao adicionar pessoa exposta ' + sLineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

class procedure TVincularPessoasExpostasPoliticamente.AtualizarCPFPessoaExposta(
  const vpPessoaExpostaId: Integer;
  const vpCPF: string);
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    viQry := TI9Query.Create(nil);
    try
      viQry.Connection := dtmControles.DB;
      viQry.SQL.Clear;
      viQry.SQL.Text :=
        'UPDATE G_PESSOA_EXPOSTA SET CPF = ' + QuotedStr(vpCPF) +
        ' WHERE PESSOA_EXPOSTA_ID = :PESSOA_EXPOSTA_ID';

      viQry.ParamByName('PESSOA_EXPOSTA_ID').AsInteger := vpPessoaExpostaId;
      viQry.ExecSQL;
    finally
      FreeAndNil(viQry);
    end;
    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar(
        'Falha ao atualizar CPF pessoa exposta ' + sLineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

class procedure TVincularPessoasExpostasPoliticamente.AtualizarCPFPessoaExposta(
  const vpPessoaExpostaId: Integer;
  const vpDataInicio: TDateTime;
  const vpUsuarioId: Integer;
  const vpCPF: string;
  const vpTipoRegistro: string);
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    viQry := TI9Query.Create(nil);
    try
      viQry.Connection := dtmControles.DB;
      viQry.SQL.Clear;
      viQry.SQL.Text :=
      {$REGION 'SQL'}
        'UPDATE G_PESSOA_EXPOSTA SET ' +
        '   DATA_INICIO_EXERCICIO = :DATA_INICIO_EXERCICIO, ' +
        '   DATA_REGISTRO = :DATA_REGISTRO, ' +
        '   USUARIO_ID = :USUARIO_ID, ' +
        '   CPF = :CPF, ' +
        '   TIPO_REGISTRO = :TIPO_REGISTRO ' +
        ' WHERE ' +
        '   PESSOA_EXPOSTA_ID = :PESSOA_EXPOSTA_ID';
      {$ENDREGION}

      viQry.ParamByName('PESSOA_EXPOSTA_ID').AsInteger      := vpPessoaExpostaId;
      viQry.ParamByName('DATA_INICIO_EXERCICIO').AsDateTime := vpDataInicio;
      viQry.ParamByName('DATA_REGISTRO').AsDateTime         := vpDataInicio;
      viQry.ParamByName('USUARIO_ID').AsInteger             := vpUsuarioId;
      viQry.ParamByName('CPF').AsString                     := vpCPF;
      viQry.ParamByName('TIPO_REGISTRO').AsString           := vpTipoRegistro;

      viQry.ExecSQL;
    finally
      FreeAndNil(viQry);
    end;
    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar(
        'Falha ao atualizar CPF pessoa exposta ' + sLineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

class procedure TVincularPessoasExpostasPoliticamente.AtualizarDataCarencia(
  const vpPessoaExpostaId: Integer;
  const vpDataAtual: TDateTime);
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    viQry := TI9Query.Create(nil);
    try
      viQry.Connection := dtmControles.DB;
      viQry.SQL.Clear;
      viQry.SQL.Text :=
      {$REGION 'SQL'}
        'UPDATE G_PESSOA_EXPOSTA SET ' +
        '   DATA_FIM_CARENCIA = :DATA_FIM_CARENCIA ' +
        ' WHERE ' +
        '   PESSOA_EXPOSTA_ID = :PESSOA_EXPOSTA_ID';
      {$ENDREGION}

      viQry.ParamByName('PESSOA_EXPOSTA_ID').AsInteger  := vpPessoaExpostaId;
      viQry.ParamByName('DATA_FIM_CARENCIA').AsDateTime := vpDataAtual;

      viQry.ExecSQL;
    finally
      FreeAndNil(viQry);
    end;
    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar(
        'Falha ao atualizar data de carência da pessoa exposta ' + sLineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

class function TVincularPessoasExpostasPoliticamente.CarregarPessoasExposta(
  const vpDataIniRegistro: string;
  const vpDataFimRegistro: string): TI9Query;
{$REGION 'Variáveis'}
var
  viSql: string;
  viQry: TI9Query;
{$ENDREGION}
begin
  viSql :=
    'SELECT ' +
    '  PEX.* ' +
    ' FROM ' +
    '  G_PESSOA_EXPOSTA PEX ' +

    ' WHERE ' +
    '  PEX.CPF IS NULL ';

    {$REGION 'Data de Registro'}
    if (Length(Trim(vpDataIniRegistro)) > 4) and (Length(Trim(vpDataFimRegistro)) > 4) then
      viSql := viSql + ' AND PEX.DATA_REGISTRO ' +
        MontarSqlData(StrToDate(vpDataIniRegistro), StrToDate(vpDataFimRegistro));
    {$ENDREGION}

    viSql := viSql +
      ' ORDER BY ' +
      '  PEX.DATA_FIM_CARENCIA DESC';

  viQry := TI9Query.Create(nil);
  viQry.Connection := dtmControles.DB;
  viQry.SQL.Clear;
  viQry.SQL.Text := viSql;
  viQry.Open;
  Result := viQry;
end;

class function TVincularPessoasExpostasPoliticamente.PessoaExpostaComAMaiorDataCarencia(
  const vpCPF: string;
  const vpDataAtual: TDateTime): TI9Query;
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
{$ENDREGION}
begin
  viQry := TI9Query.Create(nil);
  viQry.Connection := dtmControles.DB;
  viQry.SQL.Clear;
  viQry.SQL.Text :=
    'SELECT ' +
    '  FIRST 1 ' +
    '  PE.PESSOA_EXPOSTA_ID, ' +
    '  MAX(PE.DATA_FIM_CARENCIA) DATA_CARENCIA ' +
    ' FROM ' +
    '   G_PESSOA_EXPOSTA PE ' +
    ' WHERE ' +
    '  PE.CPF = ' + QuotedStr(vpCPF) +
    '  AND (PE.DATA_FIM_CARENCIA >= ' + QuotedStr(FormatDateTime('YYYY.MM.DD HH:MM:SS', vpDataAtual)) +
    '  OR (PE.DATA_FIM_CARENCIA IS NULL)) ' +
    ' GROUP BY ' +
    '  PE.PESSOA_EXPOSTA_ID ';
  viQry.Open;
  Result := viQry;
end;

class procedure TVincularPessoasExpostasPoliticamente.RemoverVinculoCPFPessoaExposta(
  const vpPessoaExpostaId: Integer);
{$REGION 'Variáveis'}
var
  viQry: TI9Query;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    viQry := TI9Query.Create(nil);
    try
      viQry.Connection := dtmControles.DB;
      viQry.SQL.Clear;
      viQry.SQL.Text :=
        'UPDATE G_PESSOA_EXPOSTA SET CPF = NULL ' +
        ' WHERE PESSOA_EXPOSTA_ID = :PESSOA_EXPOSTA_ID';

      viQry.ParamByName('PESSOA_EXPOSTA_ID').AsInteger := vpPessoaExpostaId;
      viQry.ExecSQL;
    finally
      FreeAndNil(viQry);
    end;
    dtmControles.Commit;
  except on E: Exception do
    begin
      dtmControles.Rollback;
      Application.MessageBox(Pchar(
        'Falha ao atualizar CPF pessoa exposta ' + sLineBreak +
        '[' + E.Message + ']'), 'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

end.
