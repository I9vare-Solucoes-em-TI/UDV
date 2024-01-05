unit Geral.Model.Entity.Impl.DataSet;

interface

uses
  Geral.Model.Entity.Spec.DataSet,
  Data.DB,
  Geral.Model.Entity.AnonymousMethods;

type
  TDataSetAPI<T: TDataSet> = class(TInterfacedObject, IDataSetAPI<T>)
  private
    FDataSet: T;
    FAutoClose: Boolean;
    FAutoDestroy: Boolean;
    FBookmark: TBookmark;
  public
    constructor Create(
      const vpDataSet: T); reintroduce;

    function DataSet: T;
    function AutoClose: IDataSetAPI<T>;
    function AutoDestroy: IDataSetAPI<T>;
    function ManualClose: IDataSetAPI<T>;
    function ManualDestroy: IDataSetAPI<T>;
    function Open: IDataSetAPI<T>;
    function Close: IDataSetAPI<T>;
    function BeginFieldCreation: IFieldCreation<T>;
    function Append: IDataSetAPI<T>;
    function Insert: IDataSetAPI<T>;
    function Edit: IDataSetAPI<T>;
    function Delete: IDataSetAPI<T>;
    function Cancel: IDataSetAPI<T>;
    function Post: IDataSetAPI<T>;
    function Refresh: IDataSetAPI<T>;
    function SaveBookmark: IDataSetAPI<T>;
    function GoToBookmark: IDataSetAPI<T>;

    function ExecuteAction(
      const vpAction: TAction): IDataSetAPI<T>; overload;

    function ExecuteAction(
      const vpAction: TAction<T>): IDataSetAPI<T>; overload;

    function ForEach(
      const vpAction: TAction): IDataSetAPI<T>; overload;

    function ForEach(
      const vpAction: TAction<T>): IDataSetAPI<T>; overload;

    function CopyFields(
      const vpDataSetAPI: IDataSetAPI<TDataSet>): IDataSetAPI<T>;

    function CopyDataSet(
      const vpDataSetAPI: IDataSetAPI<TDataSet>): IDataSetAPI<T>;

    function DisableControls: IDataSetAPI<T>;
    function EnableControls: IDataSetAPI<T>;
    function First: IDataSetAPI<T>;

    function IsEmpty(
      const vpAction: TAction<Boolean>): IDataSetAPI<T>;

    function Last: IDataSetAPI<T>;
    function Next: IDataSetAPI<T>;
    function Prior: IDataSetAPI<T>;

    function RecordCount(
      const vpAction: TAction<Integer>): IDataSetAPI<T>;

    function WhileNotEof(
      const vpAction: TAction): IDataSetAPI<T>; overload;

    function WhileNotEof(
      const vpAction: TAction<T>): IDataSetAPI<T>; overload;

    function FieldByName(
      const vpFieldName: string;
      const vpAction: TAction<TField>): IDataSetAPI<T>;

    class function New(
      const vpDataSet: T): IDataSetAPI<T>;

    destructor Destroy; override;
  end;

  TFieldCreation<T: TDataset> = class(TInterfacedObject, IFieldCreation<T>)
  private
    FDataSetAPI: IDataSetAPI<T>;
  public
    constructor Create(
      const vpDataSetAPI: IDataSetAPI<T>); reintroduce;

    function DataSetAPI: IDataSetAPI<T>;

    function CreateField(
      const vpFieldName: string;
      const vpFieldType: TFieldType;
      const vpSize: Integer = 0): IFieldCreation<T>;

    function CreateIntegerField(
      const vpFieldName: string): IFieldCreation<T>;

    function CreateStringField(
      const vpFieldName: string;
      const vpSize: Integer): IFieldCreation<T>;

    function CreateDateTimeField(
      const vpFieldName: string): IFieldCreation<T>;

    function CreateCurrencyField(
      const vpFieldName: string): IFieldCreation<T>;

    function CreateDataSetField(
      const vpFieldName: string): IFieldCreation<T>;

    function CreateBlobField(
      const vpFieldName: string): IFieldCreation<T>;

    function CreateFloatField(
      const vpFieldName: string): IFieldCreation<T>;

    function CreateBooleanField(
      const vpFieldName: string): IFieldCreation<T>;

    function EndFieldCreation: IDataSetAPI<T>;

    class function New(
      const vpDataSetAPI: IDataSetAPI<T>): IFieldCreation<T>;
  end;

implementation

{ TFieldCreation<T> }

constructor TFieldCreation<T>.Create(
  const vpDataSetAPI: IDataSetAPI<T>);
begin
  inherited Create;
  FDataSetAPI := vpDataSetAPI;
end;

function TFieldCreation<T>.CreateBlobField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftBlob);
end;

function TFieldCreation<T>.CreateBooleanField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftBoolean);
end;

function TFieldCreation<T>.CreateCurrencyField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftCurrency);
end;

function TFieldCreation<T>.CreateDataSetField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftDataSet);
end;

function TFieldCreation<T>.CreateDateTimeField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftDateTime);
end;

function TFieldCreation<T>.CreateField(
  const vpFieldName: string;
  const vpFieldType: TFieldType;
  const vpSize: Integer): IFieldCreation<T>;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := Self;

  viField := DefaultFieldClasses[vpFieldType].Create(
    DataSetAPI.DataSet);

  viField.FieldName := vpFieldName;
  viField.DataSet := DataSetAPI.DataSet;
  viField.Size := vpSize;
end;

function TFieldCreation<T>.CreateFloatField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftFloat);
end;

function TFieldCreation<T>.CreateIntegerField(
  const vpFieldName: string): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftInteger);
end;

function TFieldCreation<T>.CreateStringField(
  const vpFieldName: string;
  const vpSize: Integer): IFieldCreation<T>;
begin
  Result := CreateField(
    vpFieldName,
    TFieldType.ftString,
    vpSize)
end;

function TFieldCreation<T>.DataSetAPI: IDataSetAPI<T>;
begin
  Result := FDataSetAPI;
end;

function TFieldCreation<T>.EndFieldCreation: IDataSetAPI<T>;
begin
  Result := DataSetAPI;
end;

class function TFieldCreation<T>.New(
  const vpDataSetAPI: IDataSetAPI<T>): IFieldCreation<T>;
begin
  Result := Create(
    vpDataSetAPI);
end;

{ TDataSetAPI<T> }

function TDataSetAPI<T>.Append: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Append;
end;

function TDataSetAPI<T>.AutoClose: IDataSetAPI<T>;
begin
  Result := Self;
  FAutoClose := True;
end;

function TDataSetAPI<T>.AutoDestroy: IDataSetAPI<T>;
begin
  Result := Self;
  FAutoDestroy := True;
end;

function TDataSetAPI<T>.BeginFieldCreation: IFieldCreation<T>;
begin
  Result := TFieldCreation<T>.New(
    Self);
end;

function TDataSetAPI<T>.Cancel: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Cancel;
end;

function TDataSetAPI<T>.Close: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Close;
end;

function TDataSetAPI<T>.CopyDataSet(
  const vpDataSetAPI: IDataSetAPI<TDataSet>): IDataSetAPI<T>;
begin
  Result := Self;

  vpDataSetAPI.ForEach(
    procedure(
      const vpDataSet: TDataSet)
    begin
      Append
      .CopyFields(
        vpDataSetAPI)
      .Post;
    end);
end;

function TDataSetAPI<T>.CopyFields(
  const vpDataSetAPI: IDataSetAPI<TDataSet>): IDataSetAPI<T>;
begin
  Result := Self;

  DataSet.CopyFields(
    vpDataSetAPI.DataSet);
end;

constructor TDataSetAPI<T>.Create(
  const vpDataSet: T);
begin
  inherited Create;
  FDataSet := vpDataSet;
  ManualClose;
  ManualDestroy;
end;

function TDataSetAPI<T>.DataSet: T;
begin
  Result := FDataSet;
end;

function TDataSetAPI<T>.Delete: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Delete;
end;

destructor TDataSetAPI<T>.Destroy;
begin
  if FAutoClose then
    Close;

  if FAutoDestroy then
    DataSet.Free;

  inherited;
end;

function TDataSetAPI<T>.DisableControls: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.DisableControls;
end;

function TDataSetAPI<T>.Edit: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Edit;
end;

function TDataSetAPI<T>.EnableControls: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.EnableControls;
end;

function TDataSetAPI<T>.ExecuteAction(
  const vpAction: TAction): IDataSetAPI<T>;
begin
  Result := Self;
  vpAction;
end;

function TDataSetAPI<T>.ExecuteAction(
  const vpAction: TAction<T>): IDataSetAPI<T>;
begin
  Result := Self;

  vpAction(
    DataSet);
end;

function TDataSetAPI<T>.FieldByName(
  const vpFieldName: string;
  const vpAction: TAction<TField>): IDataSetAPI<T>;
begin
  Result := Self;

  vpAction(
    DataSet.FieldByName(
      vpFieldName));
end;

function TDataSetAPI<T>.First: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.First;
end;

function TDataSetAPI<T>.ForEach(
  const vpAction: TAction): IDataSetAPI<T>;
begin
  Result := Self;

  First.WhileNotEof(
    vpAction);
end;

function TDataSetAPI<T>.ForEach(
  const vpAction: TAction<T>): IDataSetAPI<T>;
begin
  Result := Self;

  First.WhileNotEof(
    vpAction);
end;

function TDataSetAPI<T>.GoToBookmark: IDataSetAPI<T>;
begin
  Result := Self;

  DataSet.GoToBookmark(
    FBookmark);
end;

function TDataSetAPI<T>.Insert: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Insert;
end;

function TDataSetAPI<T>.IsEmpty(
  const vpAction: TAction<Boolean>): IDataSetAPI<T>;
begin
  Result := Self;

  vpAction(
    DataSet.IsEmpty);
end;

function TDataSetAPI<T>.Last: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Last;
end;

function TDataSetAPI<T>.ManualClose: IDataSetAPI<T>;
begin
  Result := Self;
  FAutoClose := False;
end;

function TDataSetAPI<T>.ManualDestroy: IDataSetAPI<T>;
begin
  Result := Self;
  FAutoDestroy := False;
end;

class function TDataSetAPI<T>.New(
  const vpDataSet: T): IDataSetAPI<T>;
begin
  Result := Create(
    vpDataSet);
end;

function TDataSetAPI<T>.Next: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Next;
end;

function TDataSetAPI<T>.Open: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Open;
end;

function TDataSetAPI<T>.Post: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Post;
end;

function TDataSetAPI<T>.Prior: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Prior;
end;

function TDataSetAPI<T>.RecordCount(
  const vpAction: TAction<Integer>): IDataSetAPI<T>;
begin
  Result := Self;

  vpAction(
    DataSet.RecordCount);
end;

function TDataSetAPI<T>.Refresh: IDataSetAPI<T>;
begin
  Result := Self;
  DataSet.Refresh;
end;

function TDataSetAPI<T>.SaveBookmark: IDataSetAPI<T>;
begin
  Result := Self;
  FBookmark := Dataset.Bookmark;
end;

function TDataSetAPI<T>.WhileNotEof(
  const vpAction: TAction): IDataSetAPI<T>;
begin
  Result := Self;

  while not DataSet.Eof do
    try
      ExecuteAction(
        vpAction);
    finally
      Next;
    end;
end;

function TDataSetAPI<T>.WhileNotEof(
  const vpAction: TAction<T>): IDataSetAPI<T>;
begin
  Result := Self;

  while not DataSet.Eof do
    try
      ExecuteAction(
        vpAction);
    finally
      Next;
    end;
end;

end.
