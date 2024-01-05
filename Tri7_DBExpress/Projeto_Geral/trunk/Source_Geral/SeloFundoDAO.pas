unit SeloFundoDAO;

interface

uses
  SeloFundo,
  System.Classes;

type
  TSeloFundoDAO = class
  public
    procedure Inserir(
      const vpSeloFundo: TSeloFundo);

    procedure Excluir(
      const vpSeloLivroID: Integer); overload;

    procedure Excluir(
      const vpSeloFundo: TSeloFundo); overload;

    procedure Excluir(
      const vpItemServico: Integer;
      const vpTabela: string); overload;

    function Get(
      const vpSeloLivroID: Integer): TSeloFundos; overload;

    function Get(
      const vpItemServico: Integer;
      const vpTabela: string): TSeloFundos; overload;

    function Get(
      const vpSelosLivroID: TStrings): TSeloFundos; overload;

    function GetCount(
      const vpItemServico: Integer;
      const vpTabela: string): Integer;
  end;

implementation

uses
  Data.DB,
  Data.SqlExpr,
  Controles,
  System.SysUtils;

{ TSeloFundoDAO }


procedure TSeloFundoDAO.Excluir(
  const vpItemServico: Integer;
  const vpTabela: string);
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL DELETE'}
      CommandText :=
        'DELETE ' +

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO '+
        'AND TABELA = :P_TABELA;';
        {$ENDREGION}


      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpItemServico;
      ParamByName('P_TABELA').AsString := vpTabela;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TSeloFundoDAO.Excluir(
  const vpSeloLivroID: Integer);
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL DELETE'}
      CommandText :=
        'DELETE ' +

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'SELO_LIVRO_ID = :P_SELO_LIVRO_ID;';
        {$ENDREGION}


      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      ParamByName('P_SELO_LIVRO_ID').AsInteger := vpSeloLivroID;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.Get(
  const vpSeloLivroID: Integer): TSeloFundos;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := TSeloFundos.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_FUNDO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'SELO_LIVRO_ID = :P_SELO_LIVRO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      ParamByName('P_SELO_LIVRO_ID').AsInteger := vpSeloLivroID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while not Eof do
        begin
          Result.Add(TSeloFundo.Create(
            FieldByName('SELO_FUNDO_ID').AsInteger,
            vpSeloLivroID,
            vgFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
            FieldByName('VALOR').AsCurrency));

          Next;
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.Get(
  const vpItemServico: Integer;
  const vpTabela: string): TSeloFundos;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := TSeloFundos.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_FUNDO_ID, ' +
        'SELO_LIVRO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO AND ' +
        'TABELA = :P_TABELA;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpItemServico;
      ParamByName('P_TABELA').AsString  := vpTabela;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while not Eof do
        begin
          Result.Add(TSeloFundo.Create(
            FieldByName('SELO_FUNDO_ID').AsInteger,
            FieldByName('SELO_LIVRO_ID').AsInteger,
            vgFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
            FieldByName('VALOR').AsCurrency));

          Next;
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TSeloFundoDAO.Excluir(
  const vpSeloFundo: TSeloFundo);
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL DELETE'}
      CommandText :=
        'DELETE ' +

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO ' +
        'AND TABELA = :P_TABELA ' +
        'AND FUNDO_TIPO_ID = :P_FUNDO_TIPO_ID;';
        {$ENDREGION}


      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpSeloFundo.ItemServico;
      ParamByName('P_TABELA').AsString := vpSeloFundo.Tabela;
      ParamByName('P_FUNDO_TIPO_ID').AsInteger := vpSeloFundo.FundoTipo.FundoTipoID;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.Get(
  const vpSelosLivroID: TStrings): TSeloFundos;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := TSeloFundos.Create;

  if vpSelosLivroID.Count = 0 then
    Exit;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_FUNDO_ID, ' +
        'SELO_LIVRO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'SELO_LIVRO_ID IN (' + string.Join(', ',
          vpSelosLivroID.ToStringArray) + ');';
        {$ENDREGION}

      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while not Eof do
        begin
          Result.Add(TSeloFundo.Create(
            FieldByName('SELO_FUNDO_ID').AsInteger,
            FieldByName('SELO_LIVRO_ID').AsInteger,
            vgFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
            FieldByName('VALOR').AsCurrency));

          Next;
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.GetCount(
  const vpItemServico: Integer;
  const vpTabela: string): Integer;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := 0;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'COUNT(*) ' +
        {$ENDREGION}

        {$REGION 'FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'WHERE e Par�metros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO AND ' +
        'TABELA = :P_TABELA;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpItemServico;
      ParamByName('P_TABELA').AsString := vpTabela;

      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := FieldByName('COUNT').AsInteger;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TSeloFundoDAO.Inserir(
  const vpSeloFundo: TSeloFundo);
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL INSERT'}
      CommandText :=
        'INSERT ' +

        {$REGION 'Cl�usula INTO'}
        'INTO ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'SELO_FUNDO_ID, ' +
        'SELO_LIVRO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR, ' +
        'TABELA, ' +
        'ITEM_SERVICO ' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cl�usula VALUES e Par�metros'}
        'VALUES ' +
        '(' +
        ':P_SELO_FUNDO_ID, ' +
        ':P_SELO_LIVRO_ID, ' +
        ':P_FUNDO_TIPO_ID, ' +
        ':P_VALOR, ' +
        ':P_TABELA, ' +
        ':P_ITEM_SERVICO ' +
        ');';
        {$ENDREGION}


      {$ENDREGION}

      with vpSeloFundo do
      begin
        {$REGION 'Preencher valores dos par�metros'}
        ParamByName('P_SELO_FUNDO_ID').AsInteger := 0;

        with ParamByName('P_SELO_LIVRO_ID') do
          if SeloLivroID > 0 then
            AsInteger := SeloLivroID
          else
          begin
            DataType := ftInteger;
            Clear;
            Bound := True;
          end;

        ParamByName('P_FUNDO_TIPO_ID').AsInteger := FundoTipo.FundoTipoID;
        ParamByName('P_VALOR').AsCurrency := Valor;

        with ParamByName('P_TABELA') do
          if Tabela.IsEmpty then
          begin
            DataType := ftString;
            Clear;
            Bound := True;
          end
          else
            AsString := Tabela;

        with ParamByName('P_ITEM_SERVICO') do
          if ItemServico > 0 then
            AsInteger := ItemServico
          else
          begin
            DataType := ftInteger;
            Clear;
            Bound := True;
          end;
        {$ENDREGION}

        ExecSQL;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
