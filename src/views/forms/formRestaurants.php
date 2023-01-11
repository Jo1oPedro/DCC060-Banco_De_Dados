<?php
require_once __DIR__ . "/../../../vendor/autoload.php";

$sql = "SELECT * FROM addresses";
$statement = $pdo->prepare($sql);
$statement->execute();
$addresses = $statement->fetchAll();

$sql = "SELECT * FROM restaurant_categories";
$statement = $pdo->prepare($sql);
$statement->execute();
$restaurant_categories = $statement->fetchAll();

if (isset($_POST) && !empty($_POST)) {
  $name = $_POST["name"];
  $minimal_value = $_POST["minimal_value"];
  $description = $_POST["description"];
  $cnpj = $_POST["cnpj"];
  $id_address = $_POST["id_address"];
  $id_categories = $_POST["id_category"];

  $sql = "INSERT INTO restaurants (name, minimal_value, description, cnpj, id_address)
  VALUES (:name, :minimal_value, :description, :cnpj, :id_address)";

  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('name', 'minimal_value', 'description', 'cnpj', 'id_address')
  );

  $statement = $pdo->prepare("SELECT * FROM restaurants ORDER BY id DESC LIMIT 1");
  $statement->execute();
  $id_restaurant = $statement->fetchAll()[0]->id;

  foreach ($id_categories as $id_restaurant_category) {
    $sql = "INSERT INTO restaurants_restaurant_categories (id_restaurant, id_restaurant_category)
    VALUES (:id_restaurant, :id_restaurant_category)";

    $statement = $pdo->prepare($sql);
    $statement->execute(
      compact('id_restaurant', 'id_restaurant_category')
    );
  }
}
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
  <link rel="stylesheet" href="../includes/style.css">

  <!-- Font Awesome JS -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>
  <div class="wrapper">

  <?php include './src/views/includes/sidebar.php' ?>
    <!-- Page Content  -->
    <div id="content">
    <?php include './src/views/includes/navbar.php' ?>
      <div class="mb-4">
      <h3 class="mb-4">Cadastro de restaurante</h3>
        <form action="formRestaurants.php" method="POST">
          <div class="container text-start">
            <div class="row mb-4">
            <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Nome</label>
                <input type="text" class="form-control" name="name">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Preço mínimo</label>
                <input type="text" class="form-control" name="minimal_value">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Descrição</label>
                <input type="text" class="form-control" name="description">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">CNPJ</label>
                <input type="text" class="form-control" name="cnpj">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Endereço</label>
                <div>
                  <select class="form-select" aria-label="Default select example" name="id_address">
                    <option selected>Selecione o endereço</option>
                    <?php foreach ($addresses as $address) : ?>
                      <option value="<?= $address->id ?>"><?= $address->street ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Categorias</label>
                <div>
                  <select multiple class="form-select" aria-label="Default select example" name="id_category[]">
                    <option selected>Selecione as categorias</option>
                    <?php foreach ($restaurant_categories as $restaurant_category) : ?>
                      <option value="<?= $restaurant_category->id ?>"><?= $restaurant_category->name ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <?php include './src/views/includes/scripts.php' ?>
</body>

</html>