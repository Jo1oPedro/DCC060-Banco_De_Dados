<?php
require_once __DIR__ . "/../../../vendor/autoload.php";

$sql = "SELECT * FROM restaurants";
$statement = $pdo->prepare($sql);
$statement->execute();
$restaurants = $statement->fetchAll();

if (isset($_POST) && !empty($_POST)) {
  // Insert phone
  $country = $_POST["country"];
  $ddd = $_POST["ddd"];
  $phone_number = $_POST["phone_number"];

  $sql = "INSERT INTO phones (country, ddd, phone_number)
  VALUES (:country, :ddd, :phone_number)";

  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('country', 'ddd', 'phone_number')
  );

  // Insert motoboy
  $statement = $pdo->prepare("SELECT * FROM phones ORDER BY id DESC LIMIT 1");
  $statement->execute();
  $id_phone = $statement->fetchAll()[0]->id;

  $name = $_POST["name"];
  $license_plate = $_POST["license_plate"];
  $CPF = $_POST["CPF"];
  $id_restaurant = $_POST["id_restaurant"];

  $sql = "INSERT INTO motoboys (name, license_plate, CPF, id_restaurant, id_phone)
  VALUES (:name, :license_plate, :CPF, :id_restaurant, :id_phone)";

  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('name', 'license_plate', 'CPF', 'id_restaurant', 'id_phone')
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
        <h3 class="mb-4">Cadastro de motoboys</h3>
        <form action="formMotoboys.php" method="POST">
          <div class="container text-start">
            <div class="row mb-4">
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Nome</label>
                <input type="text" class="form-control" name="name">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Placa da moto</label>
                <input type="text" class="form-control" name="license_plate">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">CPF</label>
                <input type="text" class="form-control" name="CPF">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Restaurante</label>
                <div>
                  <select class="form-select" aria-label="Default select example" name="id_restaurant">
                    <option selected>Selecione o restaurante</option>
                    <?php foreach ($restaurants as $restaurant) : ?>
                      <option value="<?= $restaurant->id ?>"><?= $restaurant->name ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
            </div>
            <p>Cadastrar telefone</p>
            <div class="row mb-4">
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">País</label>
                <input type="text" class="form-control" name="country">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">DDD</label>
                <input type="text" class="form-control" name="ddd">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Número</label>
                <input type="text" class="form-control" name="phone_number">
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