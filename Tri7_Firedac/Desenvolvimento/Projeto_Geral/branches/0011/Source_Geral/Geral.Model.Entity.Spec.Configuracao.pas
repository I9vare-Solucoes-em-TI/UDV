unit Geral.Model.Entity.Spec.Configuracao;

interface

uses
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.TipoValorConfiguracao,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.Blob;

type
  ICaminhoConfiguracao = interface
    ['{84FD5F06-490F-455B-8C68-297D353DC0E5}']

    function ConfiguracaoGrupo: IConfiguracaoGrupo;
    function Secao: string;
    function Nome: string;
  end;

  IDescricaoConfiguracao = interface
    ['{818B3228-9CC0-4F97-BD71-881290748512}']

    function Descricao: string;
    function TipoValor: ITipoValorConfiguracao;
    function Terminal: string;
  end;

  IValorConfiguracao = interface
    ['{4BFBB7AF-D724-4A4B-8B96-1377040F491B}']

    function Valor: string;
    function Texto: IMaybe<IBlob>;
    function Atualizado: Boolean;
    function Obrigatorio: Boolean;
  end;

  IConfiguracao = interface
    ['{8B70E68F-E218-4480-A79A-85E39A8A1CD7}']

    function ID: Integer;
    function Caminho: ICaminhoConfiguracao;
    function Descricao: IDescricaoConfiguracao;
    function Valor: IValorConfiguracao;
  end;

implementation

end.
