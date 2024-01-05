<?php
$key = $_GET["key"];  // chave para pesquisa

if ($key == '57401A01317B70492A')
{
	$conexao = mysql_connect("localhost","tri7_versao","@704tri7"); // Mapeando o caminho do banco de dados
	if (!$conexao)   // Verificando se existe conexão com o caminho mapeado
	{
		die("Erro ao conectar: " . mysql_error());    // Caso o caminho esteja errado, o usuário ou a senha esteja errado, irá mostrar esta mensagem
	}

	mysql_select_db("tri7_cartorio_sistemas", $conexao);  // Selecionando o banco de dados

	// Valida cartorio
	$consulta = mysql_query("select c.nome_cartorio, s.nome_sistema, v.numero_versao from versao v left join sistema s on v.sistema_id = s.sistema_id left join cartorio c on v.cartorio_id = c.cartorio_id order by c.nome_cartorio, s.nome_sistema"); 
	
	$bodyxml = '';
	
	while($row = mysql_fetch_array($consulta)) {
	$bodyxml .= ' 	<nome_cartorio>' . $row['nome_cartorio'] . '</nome_cartorio>';
	$bodyxml .= ' 	<nome_sistema>' . $row['nome_sistema'] . '</nome_sistema>';			
	$bodyxml .= ' 	<numero_versao>' . $row['numero_versao'] . '</numero_versao>';				
	}
	
	$xml = '<?xml version="1.0" encoding="UTF-8"?>';
	$xml .= ' <tri7>';   
	$xml .= $bodyxml;	
	$xml .= ' </tri7>';
    
	echo $xml;

	//fecha a conexão com o banco
	mysql_close($conexao);
}
?>