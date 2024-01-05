<?php
$conexao = mysql_connect("localhost","tri7_versao","@704tri7"); // Mapeando o caminho do banco de dados
if (!$conexao)   // Verificando se existe conexão com o caminho mapeado
  {
  die("Erro ao conectar: " . mysql_error());    // Caso o caminho esteja errado, o usuário ou a senha esteja errado, irá mostrar esta mensagem
  }

mysql_select_db("tri7_cartorio_sistemas", $conexao);  // Selecionando o banco de dados

$idsistema = $_GET["idsistema"];   // Recebe o que foi digitado no campo nome do id do sistema.

$idcartorio = $_GET["idcartorio"];   // Recebe o que foi digitado no campo nome cartório.

$cartorio = $_GET["cartorio"];   // Recebe o que foi digitado no campo nome cartório.

$cidade = $_GET["cidade"];   // Recebe o que foi digitado no campo cidade.

$uf = $_GET["uf"];   // Recebe o que foi digitado no campo uf.

$versao = $_GET["versao"];   // Recebe o que foi digitado no campo versao.

// Valida cartorio
$consulta = mysql_query("select cartorio_id from cartorio where cartorio_id = $idcartorio"); 
$dados = mysql_fetch_array($consulta);

if (empty($dados["cartorio_id"])) 
{
  mysql_query("insert into cartorio (cartorio_id, nome_cartorio, cidade, uf) values ($idcartorio, '$cartorio', '$cidade', '$uf')") or die(mysql_error());    
}

// Valida cartorio
$consulta = mysql_query("select versao_id from versao where cartorio_id = $idcartorio and sistema_id = $idsistema"); 
$dados = mysql_fetch_array($consulta);

if (empty($dados["versao_id"])) 
{
   $query = mysql_query("insert into versao(sistema_id, cartorio_id, numero_versao) values ($idsistema, $idcartorio, '$versao')") or die(mysql_error());
   echo $query;
}
else
{
 $query = mysql_query("update versao set numero_versao_anterior = numero_versao, numero_versao = '$versao' where cartorio_id = $idcartorio and sistema_id = $idsistema") or die(mysql_error());
 echo $query;
}

//fecha a conexão com o banco
mysql_close($conexao);

?>