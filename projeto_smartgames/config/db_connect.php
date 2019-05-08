<?php

	//Definindo constantes 
	define("BD_SERVIDOR", "127.0.0.1");
	define("BD_USUARIO", "root"); 
	define("BD_SENHA", ""); 
	define("BD_BANCO", "db_smartgames");

	//Conectando com banco de dados (host, user, password, database)
	$conn = mysqli_connect(BD_SERVIDOR, BD_USUARIO, BD_SENHA, BD_BANCO);

	//Definindo conjunto de caracteres na exportação de dados
	mysqli_set_charset( $conn, 'utf8');

	//Checando conexão
	if(!$conn){
		echo 'Connection error: ' . mysqli_connect_error();
		die();
	}

?>