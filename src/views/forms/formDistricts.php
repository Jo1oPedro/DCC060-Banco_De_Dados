<?php
require_once __DIR__ . "/../../../vendor/autoload.php";

$sql = "SELECT * FROM cities";

$statement = $pdo->prepare($sql);
$statement->execute();

$cities = $statement->fetchAll();

if (isset($_POST) && !empty($_POST)) {
  $name = $_POST["name"];
  $id_city = $_POST["id_city"];

  $sql = "INSERT INTO districts (name, id_city) VALUES (:name, :id_city)";

  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('name', 'id_city')
  );
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
        <h3 class="mb-4">Cadastro de bairro</h3>
        <form action="formDistricts.php" method="POST">
          <div class="container text-start">
            <div class="row mb-4">
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Cidade</label>
                <div>
                  <select class="form-select" aria-label="Default select example" name="id_city">
                    <option selected>Selecione a cidade</option>
                    <?php foreach ($cities as $city) : ?>
                      <option value="<?= $city->id ?>"><?= $city->name ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Nome</label>
                <input type="text" class="form-control" name="name">
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