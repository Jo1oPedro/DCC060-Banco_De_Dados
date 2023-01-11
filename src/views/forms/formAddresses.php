<?php
require_once __DIR__ . "/../../../vendor/autoload.php";

$sql = "SELECT * FROM districts";

$statement = $pdo->prepare($sql);
$statement->execute();

$districts = $statement->fetchAll();

if (isset($_POST) && !empty($_POST)) {
  $cep = $_POST["CEP"];
  $street = $_POST["street"];
  $number = $_POST["number"];
  $complement = $_POST["complement"];
  $id_district = $_POST["id_district"];

  $sql = "INSERT INTO addresses (street, complement, number, cep, id_district)
  VALUES (:street, :complement, :number, :cep, :id_district)";

  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('cep', 'street', 'number', 'complement', 'id_district')
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
        <h3 class="mb-4">Cadastro de endereço</h3>
        <form action="formAddresses.php" method="POST">
          <div class="container text-start">
            <div class="row mb-4">
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">CEP</label>
                <input type="text" class="form-control" name="CEP">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Rua</label>
                <input type="text" class="form-control" name="street">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Número</label>
                <input type="text" class="form-control" name="number">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Complemento</label>
                <input type="text" class="form-control" name="complement">
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Bairro</label>
                <div>
                  <select class="form-select" aria-label="Default select example" name="id_district">
                    <option selected>Selecione o bairro</option>
                    <?php foreach ($districts as $district) : ?>
                      <option value="<?= $district->id ?>"><?= $district->name ?></option>
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