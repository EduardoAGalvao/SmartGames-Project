<?php

function buscar_lojas($conexao, $codigo) {

    if ($conexao->connect_errno) {
        die('Could not connect: ' . $conn->connect_error);
    }

    $lojas = array();

    $stmt = $conexao->prepare('SELECT codigo, nome, endereco, bairro, cidade, estado, telefone, cep FROM tbl_lojas 
                INNER JOIN tbl_estoque
                ON tbl_lojas.codigo = tbl_estoque.codigo_loja WHERE codigo_jogo = ? AND estoque > 0');

    $stmt->bind_param('i', $codigo);
    $stmt->execute();
    $result = $stmt->get_result();

    while ($loja = mysqli_fetch_assoc($result)) {
        array_push($lojas, $loja);
    }

    $stmt->close();        

    return $lojas;
}

function buscar_quantidade_total_estoque($conexao, $codigo) {

    if ($conexao->connect_errno) {
        die('Could not connect: ' . $conn->connect_error);
    }

    $stmt = $conexao->prepare("SELECT SUM(estoque) AS total_estoque FROM tbl_estoque WHERE codigo_jogo = ?");
    
    $stmt->bind_param('i', $codigo);
    $stmt->execute();
    $result = $stmt->get_result();

    $quantidade = $result->fetch_assoc(); 

    $stmt->close();        

    return $quantidade;
}

function buscar_jogos($conexao){
    if ($conexao->connect_errno) {
        die('Could not connect: ' . $conn->connect_error);
    }

    $jogos = array();

    $stmt = $conexao->prepare("SELECT * FROM tbl_jogos");
    $stmt->execute();

    $result = $stmt->get_result();  

    while ($jogo = $result->fetch_assoc()) {
        $jogos[] = $jogo;
    }

    $stmt->close();        

    return $jogos;  
}

function buscar_estoque_por_loja($conexao, $codigoLoja, $codigoJogo){
    if ($conexao->connect_errno) {
        die('Could not connect: ' . $conn->connect_error);
    }

    $stmt = $conexao->prepare("SELECT estoque FROM tbl_estoque WHERE codigo_loja = $codigoLoja AND codigo_jogo = $codigoJogo;");
    $stmt->execute();

    $result = $stmt->get_result();  

    $estoqueLoja = $result->fetch_assoc();

    $stmt->close();        

    return $estoqueLoja;    
}

   
?>

