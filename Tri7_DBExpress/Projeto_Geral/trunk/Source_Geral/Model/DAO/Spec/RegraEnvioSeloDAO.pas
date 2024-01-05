unit RegraEnvioSeloDAO;

interface

uses
  DAO,
  RegraEnvioSelo,
  RegraEnvioSeloList,
  SeloGrupo;

type
  IRegraEnvioSeloDAO = interface(IDAO<IRegraEnvioSelo, TRegraEnvioSeloList>)
    ['{5E373C01-B4D1-439E-AD0D-A36B95D77263}']

    function Get(
      const vpValue: ISeloGrupo): IRegraEnvioSelo;

    procedure Excluir(
      const vpValue: ISeloGrupo);
  end;

implementation

end.
