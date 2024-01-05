unit SeloLivroDAO;

interface

uses
  DAO,
  SeloLivro,
  SeloLivroList,
  SeloSituacao,
  SeloGrupo,
  IntervaloDatas,
  CampoOrdenacaoList;

type
  ISeloLivroDAO = interface(IDAO<ISeloLivro, TSeloLivroList>)
    ['{63122F95-57E3-4B94-AB57-76CBB8CCA580}']

    function GetListByTabelaECampoID(
      const vpTabela: string;
      const vpCampoID: Integer): TSeloLivroList;

    function GetList(
      const vpSeloSituacao: ISeloSituacao;
      const vpSeloGrupo: ISeloGrupo;
      const vpIntervaloDatas: IIntervaloDatas;
      const vpDataExportacaoIsNull: Boolean;
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
      TSeloLivroList; overload;

    function GetList(
      const vpSeloSituacao: ISeloSituacao;
      const vpSeloGrupo: ISeloGrupo;
      const vpMenorIgualData: TDateTime;
      const vpDataExportacaoIsNull: Boolean;
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
      TSeloLivroList; overload;

    procedure AlterarExportacao(
      const vpValue: TSeloLivroList;
      const vpDataExportacao: TDateTime;
      const vpCodigoExportacao: Integer);

    procedure AlterarValidado(
      const vpValue: ISeloLivro);
  end;

implementation

end.