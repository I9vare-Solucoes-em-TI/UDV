unit Geral.Model.Entity.Spec.DataSet;

interface

uses
  Data.DB,
  Geral.Model.Entity.AnonymousMethods;

type
  IFieldCreation<T: TDataSet> = interface;

  IDataSetAPI<T: TDataSet> = interface
    ['{01B33105-1276-4364-8090-14D606B55A37}']

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
  end;

  IFieldCreation<T: TDataSet> = interface
    ['{3CAF6B92-F212-489C-BB98-07D24F63B6C0}']

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
  end;

implementation

end.
