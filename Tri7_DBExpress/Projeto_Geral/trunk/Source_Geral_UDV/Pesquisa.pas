unit Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

  function PesqUsuario:String;
  function PesqCadGeral(Caption, Tabela, Chave: String):String;
  function PesqRotina:String;
  function PesqGrupoRelatorio:String;
  function PesqConfigRelatorio:String;
  function PesqPessoa:String;
  function PesqTextoModelo:String;

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

function PesqCadGeral(Caption, Tabela, Chave: String):String;
begin
  Result := '';
  MontaPesquisa('Pesquisar ' + Caption,
                Tabela,
                Chave + ';DESCRICAO',
                'C�digo;Descri��o',
                Chave + ';DESCRICAO',
                'C�digo;Descri��o',
                Chave,
                vgRetorno);
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

end.
