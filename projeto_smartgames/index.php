<?php

  include('config/db_connect.php');
  include('dao/dao.php');

?>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Eduardo Galvão">
    <meta name="copyright" content="© 2019 Primi"/>
    <meta name="description" content="Jogos disponíveis para venda na SmartGames."/>

    <title>SmartGames | Jogos</title>
    <link rel="icon" href="img/smartgames_symbol.png">

    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="css/style.css" rel="stylesheet">

  </head>

  <body>
    <div id="container">

      <?php include('templates/header.php');?>

      <!--Conteúdo-->
      <main>

        <div id="conteudo_principal">

          <div class="container div_jogos">
            <?php
              $jogos = buscar_jogos($conn);
              foreach($jogos as $jogo):
            ?>
            <div class="jogo_individual">
              <img class="imagem_capa_jogo" src="img/<?php echo $jogo['endereco_imagem'] ?>" id="jogo<?php echo  $jogo['codigo'] ?>" data-toggle="modal" data-target="#myModal<?php echo $jogo['codigo']?>" title="Clique para mais informações" alt="<?php echo $jogo['nome'] . " - " . $jogo['plataforma']; ?>"/>
              <h1 class="identificacao_jogo"><?php echo $jogo['nome'] . " - " . $jogo['plataforma'];?></h1>
              <p class="preco_jogo"><?php echo "R$ " . $jogo['preco']?></p>

              <!-- Modal -->
              <div class="modal fade" id="myModal<?php echo $jogo['codigo']?>" role="dialog">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">

                    <div class="modal-header">
                      <h3><?php echo $jogo['nome'] . " - " . $jogo['plataforma']?></h3>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div><!--end .modal-header-->

                    <div class="modal-body">
                      <div class="modal_jogos_lojas">

                        <div class="informacoes_jogo">
                          <?php
                            $codigoJogo = $jogo['codigo'];
                            $quantidade = buscar_quantidade_total_estoque($conn, $codigoJogo);
                          ?>
                          <img src="img/<?php echo $jogo['endereco_imagem'] ?>" title="<?php echo $jogo['nome']?>" alt="<?php echo $jogo['nome'] . " - " . $jogo['plataforma']; ?>">
                          <div class="descricao_jogo">
                            <p class="preco_jogo quantidade_estoque"><?php echo "R$ ". $jogo['preco']?></p>
                            <p class="item_descricao"><?php echo "Total em Estoque: ". $quantidade['total_estoque'] . " unidades"?></p>
                            <p class="item_descricao"><?php echo "Código de Barras: ". $jogo['codigo_barras']?></p>
                            <p class="item_descricao"><?php echo "Gênero: ". $jogo['genero']?></p>
                            <p class="item_descricao"><?php echo "Classificação Indicativa: ". $jogo['classificacao_indicativa']?></p>
                            <p class="item_descricao"><?php echo "Idioma de Áudio: ". $jogo['idioma_audio']?></p>
                            <p class="item_descricao"><?php echo "Idioma de Legenda: ". $jogo['idioma_legenda']?></p>
                            <p class="item_descricao"><?php echo "Plataforma: ". $jogo['plataforma']?></p>
                            <p class="item_descricao"><?php echo "Marca: ". $jogo['marca']?></p>
                            <p class="item_descricao"><?php echo "Garantia: ". $jogo['garantia']?></p>
                            <p class="item_descricao"><?php echo "Tipo de Mídia: ". $jogo['tipo_midia']?></p>
                          </div><!--end .descricao_jogo-->
                        </div><!--end .informacoes_jogo-->

                        <div class="localizacao">
                          <h2>Visite a Smart Games mais próxima de você!</h2>
                          <div class="lojas_mapa">
                            <div class="lojas">
                              <div class="informacoes_lojas">
                                <?php  
                                  $lojas = buscar_lojas($conn, $codigoJogo);
                                  foreach($lojas as $loja): 
                                    $codigoLoja = $loja['codigo'];
                                    $estoque_loja = buscar_estoque_por_loja($conn, $codigoLoja, $codigoJogo );
                                ?>
                                <div class="loja_individual">
                                  <h3 id="loja<?php echo $loja['codigo']?>-jogo<?php echo $jogo['codigo']?>"><?php echo $loja['nome']?></h3>
                                  <p><?php echo $loja['endereco']?></p>
                                  <p><?php echo $loja['bairro'] . " | " . $loja['cidade'] . " - " . $loja['estado']?></p>
                                  <p><?php echo "CEP: " . $loja['cep']?></p>
                                  <p><?php echo "Tel.: " . $loja['telefone']?></p>
                                  <p><?php echo "Quantidade em Estoque: " . $estoque_loja['estoque']?></p>
                                </div>
                                <?php endforeach; ?>
                              </div><!--end .informacoes_lojas-->
                            </div><!--end .lojas-->

                            <div class="mapa">
                              <iframe id="iframe_google<?php echo $jogo['codigo']?>" src="img/imagem_padrao_mapa.png" allowfullscreen></iframe>
                            </div><!--end .mapa-->
            
                          </div><!-- end.lojas_mapa-->
                        </div><!-- end.localizacao-->

                      </div><!--end .modal_jogos_lojas--> 
                    </div><!--end .modal-body-->
                  </div><!--end .modal-content-->
                </div><!--end .modal-dialog modal-lg-->
              </div><!--end .modal-fade-->

            </div><!--end .jogo_individual-->

            <?php endforeach; ?>

          </div> <!--end #div_jogos-->
          
        </div> <!--end #conteudo_principal-->
        
      </main>

      <?php include('templates/footer.php'); ?>

    </div><!--end #container-->

    <!--Arquivos JS-->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/action.js"></script>
  </body>

</html>