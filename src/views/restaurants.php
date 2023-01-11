<?php
require_once __DIR__ . "/../../vendor/autoload.php";

$sql = "SELECT * FROM restaurants";

$statement = $pdo->prepare($sql);
$statement->execute();

$restaurants = $statement->fetchAll();

?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title></title>

  <!-- Bootstrap CSS CDN -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <!-- Our Custom CSS -->
  <link rel="stylesheet" href="includes/style.css">

  <!-- Font Awesome JS -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>
  <div class="wrapper">

    <?php include 'includes/sidebar.php' ?>
    <!-- Page Content  -->
    <div id="content">
      <?php include 'includes/navbar.php' ?>
      <h3 class="mb-4">Restaurantes</h3>
      <div class="d-flex justify-content-end mb-4">
        <a href="/src/views/forms/formRestaurants.php"><button class="btn btn-primary">Cadastrar</button></a>
      </div>
      <table class="table table-light table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Nome</th>
            <th scope="col">valor mínimo</th>
            <th scope="col">descrição</th>
            <th scope="col">Média de avaliação</th>
            <th scope="col">Nº avaliações</th>
            <th scope="col">cnpj</th>
            <th scope="col">id_endereço</th>
            <th scope="col">Ações</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach($restaurants as $restaurant): ?>
          <tr>
            <th scope="row"><?= $restaurant->id ?></th>
            <td><?= $restaurant->name ?></td>
            <td><?= $restaurant->minimal_value ?></td>
            <td><?= $restaurant->description ?></td>
            <td><?= $restaurant->rating_average ?></td>
            <td><?= $restaurant->rating_count ?></td>
            <td><?= $restaurant->cnpj ?></td>
            <td><?= $restaurant->id_address ?></td>
            <td>
              <button class="btn btn-info" onclick="window.location.href = 'http://localhost:8000/src/views/products.php?restaurant=<?=$restaurant->id?>'">Produtos</button>
            </td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>

    </div>
  </div>

  <?php include 'includes/scripts.php' ?>
</body>

</html>