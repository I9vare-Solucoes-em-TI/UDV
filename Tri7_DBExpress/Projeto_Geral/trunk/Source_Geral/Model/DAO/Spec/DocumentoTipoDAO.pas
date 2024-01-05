unit DocumentoTipoDAO;

interface

uses
  DAO,
  DocumentoTipo,
  DocumentoTipoList;

type
  IDocumentoTipoDAO = interface(IDAO<IDocumentoTipo, TDocumentoTipoList>)
    ['{3023DA90-0841-4AE6-B9CE-BC39DF118096}']
  end;

implementation

end.
