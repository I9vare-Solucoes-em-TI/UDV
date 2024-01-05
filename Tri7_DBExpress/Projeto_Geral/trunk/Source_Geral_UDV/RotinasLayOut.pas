unit RotinasLayOut;

interface

uses
  Forms, SysUtils, Classes, DB, DBClient, Variants, cxGridDBTableView;

  function RetornaTipoCampo(Tipo : Char) : TFieldType;
  procedure MontarQuery(var Qry: TClientDataSet; sqlLayout : TCustomClientDataSet; CriarValidar : Boolean = False);
  procedure MontarGrid(Grid: TcxGridDBTableView; sqlLayout : TCustomClientDataSet; ValidarExiste : Boolean = False);
  function GetCampo(Valor, Tipo, Mascara : String) : Variant;
  function SetCampo(Valor, Tipo, Mascara : String; Qtde : Integer = 0) : String;

  var vgRetornaErro : String;

implementation

uses Rotinas;

function RetornaTipoCampo(Tipo : Char): TFieldType;
begin
  if Tipo = 'I' then
     Result := ftInteger
  else
  if (Tipo = 'N') then
     Result := ftFloat
  else
  if (Tipo = 'M') then
     Result := ftCurrency
  else
  if Tipo = 'D' then
     Result := ftTimeStamp
  else
     Result := ftString;
end;

procedure MontarQuery(var Qry: TClientDataSet; sqlLayout : TCustomClientDataSet; CriarValidar : Boolean = False);
var Campo, CampoControle: String;
    Dt : TFieldType;
    Size : Integer;
begin
  if not sqlLayout.IsEmpty then
  begin
    CampoControle := '';
    sqlLayout.First;
    Qry.Close;
    Qry.FieldDefs.Clear;
    Qry.FieldDefs.Add('ID',ftInteger, 0, False);//Chave de Identificação
    if CriarValidar then
       Qry.FieldDefs.Add('VALIDAR',ftString, 1, False);//Validar
    while not sqlLayout.Eof do
    begin
      if CampoControle = '' then
         CampoControle := sqlLayout.FieldByName('CAMPO_TABELA').asString;
        Dt    := RetornaTipoCampo(sqlLayout.FieldByName('TIPO_CAMPO').asString[1]);
        Campo := sqlLayout.FieldByName('CAMPO_TABELA').asString;
        if Dt = ftString then
           Size := 120
        else Size := 0;
        try
          Qry.FieldDefs.Add(Campo,Dt, Size, False);
        Except
          Break;
        end;
      sqlLayout.Next;
      if sqlLayout.FieldByName('TABELA').asString = 'P' then
        if CampoControle = sqlLayout.FieldByName('CAMPO_TABELA').asString then
          Break;
    end;
    Qry.CreateDataSet;
  end;
end;

procedure MontarGrid(Grid: TcxGridDBTableView; sqlLayout : TCustomClientDataSet; ValidarExiste : Boolean = False);
var I, Inicio: Integer;
begin
  if not sqlLayout.IsEmpty then
  begin
    sqlLayout.First;
    Grid.Columns[0].Visible := False;
    if ValidarExiste then
    begin
      Grid.Columns[1].Visible := False;
      Inicio := 2;
    end
    else Inicio := 1;
    for I := Inicio to Grid.ColumnCount - 1 do
    begin
      Grid.Columns[I].Caption := sqlLayout.FieldByName('DESCRICAO').asString;
      Grid.Columns[I].Width := 30 + (length(Grid.Columns[I].Caption) * 20);
      Grid.Columns[I].Options.Editing  := False;
      Grid.Columns[I].Options.Focusing := False;
      sqlLayout.Next;
    end;
  end;
end;

function GetCampo(Valor, Tipo, Mascara : String) : Variant;
var i : Integer;
    viAux : String;
begin
  vgRetornaErro := '';
  if Trim(Valor) <> ''  then
  begin
    try
      if Trim(Mascara) <> '' then
      begin
        viAux := Valor;
        Valor := RetornaNumerico(Valor);
        if Mascara = 'dmy' then
           Valor := Copy(Valor,1,2) + '/' + Copy(Valor,3,2) + '/' + Copy(Valor,5,4)
        else
        if Mascara = 'mdy' then
           Valor := Copy(Valor,3,2) + '/' + Copy(Valor,1,2) + '/' + Copy(Valor,5,4)
        else
        if Mascara = 'ymd' then
           Valor := Copy(Valor,7,2) + '/' + Copy(Valor,5,2) + '/' + Copy(Valor,1,4)
        else
        if Mascara = '000' then
           Valor := RetZeros(Valor, 3)
        else
        if Mascara = 'vvv' then
        begin
          Valor := RetornaNumerico(Valor);
          Insert(',', Valor, length(Valor)- 1);
          Valor := FormatFloat('0.00', StrToFloat(Valor));
        end
        else
        if Mascara = 'ppp' then
        begin
          Valor := FormatFloat('0.00', StrToFloat(viAux));
          Valor := TrocaVirgPPto(Valor);
        end
        else
        if Mascara = 'cgm' then
        begin
          if valor[1] = '0' then
            Valor := copy(Valor,3 , (Length(Valor) - 4))
          else
          if valor[1] = '9' then
             Valor := copy(Valor,5 , Length(Valor));
        end
        else
        if Mascara = 'x/x' then
          Insert('/', Valor, 3)
        else
        if Mascara = 'xvx' then
        begin
          if Length(Valor) > 2 then
          begin
            viAux := '';
            for i := 1 to Length(Valor) do
               if (i mod 2) = 0 then
                 viAux := viAux + copy(Valor,i - 1, 2) + ',';
            Valor := copy(viAux,1 ,(Length(viAux)-1));
          end;
        end;
      end;

      if Tipo = 'I' then
      begin
        try
          Valor := RetornaNumerico(Valor);
          Result := RetiraZerosEsquerda(Result);
          Result := StrToInt(Valor);
        Except
          vgRetornaErro := 'Erro ao tentar converter "' + Valor + '" em um valor Inteiro.';
        end
      end
      else
      if (Tipo = 'N') then
      begin
        try
          Valor := RetornaNumerico(Valor);
          Insert(',', Valor, length(Valor)- 1);
          Result := StrToFloat(Valor);
        Except
          vgRetornaErro := 'Erro ao tentar converter "' + Valor + '" em um valor Numerico.';
        end
      end
      else
      if (Tipo = 'M') then
      begin
        try
          Valor := RetornaNumerico(Valor);
          Insert(',', Valor, length(Valor)- 1);
          Result := StrToCurr(Valor);
        Except
          vgRetornaErro := 'Erro ao tentar converter "' + Valor + '" em um valor Moeda.';
        end
      end
      else
      if Tipo = 'D' then
      begin
         try
           Result := StrToDate(Valor)
         Except
           vgRetornaErro := 'Erro ao tentar converter "' + Valor + '" em um Data.';
        end
      end
      else
         Result := Valor;
    except
       Result := null;
    end;
  end;
end;

function SetCampo(Valor, Tipo, Mascara : String; Qtde : Integer = 0) : String;
begin
  Result := '';
  if Trim(Mascara) <> '' then
  begin
    if Mascara = 'cpy' then
      Valor := Copy(Valor,1,Pos('/', Valor) - 1)
    else
    if Mascara = 'dm2' then
      Valor := FormatDateTime('dd/mm/yy', StrToDate(Valor))
    else
    if Mascara = 'vdm' then
      Valor := Valor + FormatDateTime('ddmm', Date)
    else
    if Mascara = '00n' then
    begin
      Valor := RetornaNumerico(Valor);
      Result := RetZeros(Valor, Qtde);
      Exit;
    end
    else
    if Mascara = 'vvv' then
    begin
      Result := FormatFloat('0.00', StrToFloat(Valor));
      Result := RetBrancos(Result, Qtde);
      Exit;
    end
    else
    if Mascara = 'ppp' then
    begin
      Result := FormatFloat('0.00', StrToFloat(Valor));
      Result := TrocaVirgPPto(Result);
      Result := RetBrancos(Result, Qtde);
      Exit;
    end
    else
    begin
      Valor := RetornaNumerico(Valor);
      if Mascara = 'mdy' then
        Valor := Copy(Valor,3,2) + '/' + Copy(Valor,1,2) + '/' + Copy(Valor,5,4)
      else
      if Mascara = 'ymd' then
        Valor := Copy(Valor,5,4) + '/' + Copy(Valor,3,2) + '/' + Copy(Valor,1,2)
      else
      if Mascara = 'num' then
        Result := RetZeros(Valor, Qtde);
    end;
  end;

  if (Tipo = 'I') or (Tipo = 'N') then
  begin
    Valor := RetornaNumerico(Valor);
    Result := RetZeros(Valor, Qtde)
  end
  else
  if (Tipo = 'M') then
  begin
    if Trim(Valor) <> '' then
      Valor := FormatFloat('0.00', StrToFloat(Valor));
    Valor := RetornaNumerico(Valor);
    Result := RetZeros(Valor, Qtde)
  end
  else
  if (Tipo = 'D') then
  begin
    Valor := RetornaNumerico(Valor);
    Result := RetBrancos(Valor, Qtde)
  end
  else Result := RetBrancos(Valor, Qtde);

  if Qtde <> 0 then
    Result := copy(Result, 1, Qtde);
end;

end.
