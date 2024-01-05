unit Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

  function PesqUsuario:String;
  function PesqCadGeral(Caption, Tabela, Chave : String; UsaCondicao : Boolean):String;
  function PesqRotina:String;
  function PesqGrupoRelatorio:String;
  function PesqConfigRelatorio:String;
  function PesqCaixasFechados(Where : String):String;
  function PesqPessoa:String;

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

function PesqPessoa:String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Pessoa',
                'J_PESSOA',
                'NOME;CPFCNPJ;IDENTIFICACAO',
                'Nome;CPF/CNPJ;Identifica��o',
                'PESSOA_ID;NOME;CPFCNPJ;IDENTIFICACAO',
                'C�digo;Nome;CPF/CNPJ;Identifica��o',
                'PESSOA_ID',
                vgRetorno);
  if vgRetorno.Text <> '' then
     Result := vgRetorno.Strings[0];
  vgRetorno.Free;
  vgRetorno := nil;
end;

function PesqCadGeral(Caption, Tabela, Chave: String; UsaCondicao : Boolean):String;
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

function PesqCaixasFechados(Where : String):String;
begin
  Result := '';
  MontaPesquisa('Pesquisar Caixas Fechados',
                'V_C_CAIXA_ITEM',
                'DATA_PAGAMENTO',
                'Data',
                'CAIXA_ITEM_ID;DESCRICAO;DATA_PAGAMENTO;HORA_PAGAMENTO',
                'C�digo;Descri��o;Data;Hora',
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
