unit Geral.Model.Entity.Spec.List;

interface

uses
  Geral.Model.Entity.Spec.Enumerator;

type
  TPredicate<T> = reference to function(
    const vpValue: T): Boolean;

  TAction<T> = reference to procedure(
    const vpValue: T);

  TComparison<T> = reference to function(
    const vpLeft: T;
    const vpRight: T): Integer;

  TEqualityComparison<T> = reference to function(
    const vpLeft: T;
    const vpRight: T): Boolean;

  IList<T> = interface
    ['{42AA7D18-91E8-4FBF-BAE6-CE65334FCD83}']

    function Add(
      const vpValue: T): IList<T>;

    function AddRange(
      const vpValue: IList<T>): IList<T>; overload;

    function AddRange(
      const vpValue: TArray<T>): IList<T>; overload;

    function Count: Integer;
    function GetEnumerator: IEnumerator<T>;

    function Where(
      const vpValue: TPredicate<T>): IList<T>;

    function Any: Boolean; overload;

    function Any(
      const vpValue: TPredicate<T>): Boolean; overload;

    function Single: T; overload;

    function Single(
      const vpValue: TPredicate<T>): T; overload;

    function ToArray: TArray<T>;

    function Contains(
      const vpValue: T): Boolean; overload;

    function Contains(
      const vpValue: T;
      const vpComparer: TEqualityComparison<T>): Boolean; overload;

    function IsEmpty: Boolean;

    function GetItem(
      vpIndex: Integer): T;

    function All(
      const vpValue: TPredicate<T>): Boolean;

    function First: T; overload;

    function First(
      const vpValue: TPredicate<T>): T; overload;

    function FirstOrDefault: T; overload;

    function FirstOrDefault(
      const vpValue: TPredicate<T>): T; overload;

    function Last: T; overload;

    function Last(
      const vpValue: TPredicate<T>): T; overload;

    function Max(
      const vpValue: TComparison<T>): T;

    function Min(
      const vpValue: TComparison<T>): T;

    function Ordered(
      const vpValue: TComparison<T>): IList<T>;

    function Reversed: IList<T>;

    function SkipWhile(
      const vpValue: TPredicate<T>): IList<T>;

    function TakeWhile(
      const vpValue: TPredicate<T>): IList<T>;

    function IndexOf(
      const vpValue: T): Integer;

    function RemoveDuplicates(
      const vpEqualityComparison: TEqualityComparison<T>): IList<T>;

    function EqualsTo(
      const vpList: IList<T>;
      const vpComparer: TEqualityComparison<T>): Boolean;

    procedure ForEach(
      const vpValue: TAction<T>);

    procedure SetItem(
      vpIndex: Integer;
      const vpValue: T);

    procedure Clear;

    procedure RemoveAll(
      const vpValue: TPredicate<T>);

    procedure TrimExcess;

    property Items[index: Integer]: T read GetItem write SetItem; default;
  end;

implementation

end.
