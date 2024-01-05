unit Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, System.StrUtils;

  function PesqUsuario:String;
  function PesqCadGeral(Caption, Tabela, Chave: String; UsaCondicao: Boolean):String;
  function PesqRotina:String;
  function PesqGrupoRelatorio:String;
  function PesqConfigRelatorio:String;
  function PesqPessoa:String;
  function PesqTextoModelo:String;
  function PesqPessoaRI:String;
  function PesqCartorioRI:String;
  function PesqApresentante:String;
  function PesqCaixasFechados(Where : String; vpTipoCaixa : String):String;

  var vgRetorno : TStringList;

implementation

uses PesquisaGeral, Controles;

function PesqUsuario:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Usu�rio',
                'G_USUARIO',
                'USUARIO_ID;NOME_COMPLETO;LOGIN',
                'C�digo;Nome;Login',
                'USUARIO_ID;NOME_COMPLETO;LOGIN',
                'C�digo;Nome;Login',
                'USUARIO_ID',
                vgRetorno);
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqCadGeral(Caption, Tabela, Chave: String; UsaCondicao: Boolean):String;
begin
  Result := '';
  MontaPesquisa('Pesquisar ' + Caption,
                Tabela,
                Chave + ';DESCRICAO',
                'C�digo;Descri��o',
                Chave + ';DESCRICAO',
                'C�digo;Descri��o',
                Chave,
                vgRetorno,
                '',
                ifThen(UsaCondicao,'SISTEMA_ID = ' + IntToStr(vgId), ''));

  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqRotina:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Rotina',
                'V_G_SISTEMA_ROTINA',
                'SISTEMA_ROTINA_ID;DESCRICAO',
                'C�digo;Descri��o',
                'SISTEMA_ROTINA_ID;DESCRICAO',
                'C�digo;Descri��o',
                'SISTEMA_ROTINA_ID',
                vgRetorno,
                '',
                ' SISTEMA_ID = ' + IntToStr(vgId));
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqGrupoRelatorio:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Grupo Relat�rio',
                'G_GRUPO_RELATORIO',
                'GRUPO_RELATORIO_ID;DESCRICAO',
                'C�digo;Descri��o',
                'GRUPO_RELATORIO_ID;DESCRICAO',
                'C�digo;Descri��o',
                'GRUPO_RELATORIO_ID',
                vgRetorno,
                '',
                ' SISTEMA_ID = ' + IntToStr(vgId));
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqConfigRelatorio:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Config. Relat�rio',
                'G_CONFIG_RELATORIO',
                'CONFIG_RELATORIO_ID;DESCRICAO',
                'C�digo;Descri��o',
                'CONFIG_RELATORIO_ID;DESCRICAO',
                'C�digo;Descri��o',
                'CONFIG_RELATORIO_ID',
                vgRetorno,
                '',
                ' SISTEMA_ID = ' + IntToStr(vgId));
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqPessoa:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Pessoa',
                'T_PESSOA',
                'NOME;PESSOA_ID;CPF_CNPJ',
                'Nome;C�digo;CPF/CNPJ',
                'NOME;PESSOA_ID;CPF_CNPJ',
                'Nome;C�digo;CPF/CNPJ',
                'PESSOA_ID',
                vgRetorno,
                '',
                '',
                ' Order by NOME');
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqTextoModelo:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Texto Modelo',
                'G_TEXTO_MODELO',
                'TEXTO_MODELO_ID;DESCRICAO',
                'C�digo;Descri��o',
                'TEXTO_MODELO_ID;DESCRICAO',
                'C�digo;Descri��o',
                'TEXTO_MODELO_ID',
                vgRetorno,
                '',
                ' SISTEMA_ID = ' + IntToStr(vgId));
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqPessoaRI:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Pessoa',
                'R_PESSOA',
                'NOME;PESSOA_ID;CPF_CNPJ',
                'Nome;C�digo;CPF/CNPJ',
                'NOME;PESSOA_ID;CPF_CNPJ',
                'Nome;C�digo;CPF/CNPJ',
                'PESSOA_ID',
                vgRetorno,
                '',
                '',
                ' Order by NOME',
                False);
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqCartorioRI:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Local de Origem',
                'R_TB_CARTORIO CAR LEFT JOIN G_MUNICIPIO MUN ON CAR.MUNICIPIO_ID = MUN.MUNICIPIO_ID',
                'MUNICIPIO;SIGLA;DESCRICAO',
                'Munic�pio;UF;Cart�rio',
                'MUNICIPIO;SIGLA;DESCRICAO',
                'Munic�pio;UF;Cart�rio',
                'TB_CARTORIO_ID',
                vgRetorno,
                '',
                '',
                ' ORDER BY MUNICIPIO, SIGLA, DESCRICAO');
  if vgRetorno.Text <> '' then
    Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqApresentante:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Apresentante',
                'R_APRESENTANTE',
                'NOME;APRESENTANTE_ID;CPF_CNPJ',
                'Nome;C�digo;CPF/CNPJ',
                'NOME;APRESENTANTE_ID;CPF_CNPJ',
                'Nome;C�digo;CPF/CNPJ',
                'APRESENTANTE_ID',
                vgRetorno,
                '',
                '',
                ' Order by NOME');
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqCaixasFechados(Where : String; vpTipoCaixa : String):String;
var
  viCampos : String;
begin
  Result := '';

  if vpTipoCaixa = '3' then
       viCampos := 'CAIXA_ITEM_ID;DESCRICAO;DATA_PAGAMENTO;TIPO_CAIXA'
  else viCampos := 'CAIXA_ITEM_ID;DESCRICAO;DATA_PAGAMENTO';

  MontaPesquisa('Pesquisar Caixas Fechados',
                'V_C_CAIXA_ITEM',
                'DATA_PAGAMENTO',
                'Data',
                viCampos,
                'C�digo;Descri��o;Data;Caixa',
                'CAIXA_ITEM_ID;DATA_PAGAMENTO',
                vgRetorno,
                '',
                Where);
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0] + ^I + vgRetorno.Strings[1];
  vgRetorno.Free;
  vgRetorno := nil;
end;

end.
