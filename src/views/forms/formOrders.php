<?php
require_once __DIR__ . "/../../../vendor/autoload.php";

$product = [];
if (isset($_GET['product']) && !empty($_GET['product'])) {
  $id_product = $_GET['product'];
  $sql = "SELECT * FROM products WHERE id = :id_product";
  $statement = $pdo->prepare($sql);
  $statement->execute(compact('id_product'));
  $product = $statement->fetchAll()[0];
}

if (isset($_POST) && !empty($_POST)) {
  // Busca motoboy
  $id_restaurant = $product->id_restaurant;
  $sql = "SELECT id FROM motoboys WHERE id_restaurant = :id_restaurant LIMIT 1";
  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('id_restaurant')
  );
  $id_motoboy = $statement->fetchAll()[0]->id;

  // Insert delivery
  $status = 'WAITING';
  $sql = "INSERT INTO deliveries (status, id_motoboy)
  VALUES (:status, :id_motoboy)";
  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('status', 'id_motoboy')
  );

  // Insert order
  $statement = $pdo->prepare("SELECT * FROM deliveries ORDER BY id DESC LIMIT 1");
  $statement->execute();
  $id_delivery = $statement->fetchAll()[0]->id;

  $note = $_POST["note"];
  $id_client = 1;
  $status = "PENDANT";
  $total_value = $product->price;
  $order_date = date('Y-m-d H:i:s');

  $sql = "INSERT INTO orders (order_date, status, total_value, note, id_client, id_delivery)
  VALUES (:order_date, :status, :total_value, :note, :id_client, :id_delivery)";
  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('order_date', 'status', 'total_value', 'note', 'id_client', 'id_delivery')
  );

  // Insert orders_products
  $statement = $pdo->prepare("SELECT * FROM orders ORDER BY id DESC LIMIT 1");
  $statement->execute();
  $id_order = $statement->fetchAll()[0]->id;

  $id_product = $product->id;
  $amount = 1;
  $sql = "INSERT INTO orders_products (id_order, id_product, amount)
  VALUES (:id_order, :id_product, :amount)";
  $statement = $pdo->prepare($sql);
  $statement->execute(
    compact('id_order', 'id_product', 'amount')
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
        <h3 class="mb-4">Cadastro de pedidos</h3>
        <h4>Informações do produto</h4>
        <ul>
          <li>Nome: <?= $product->name ?></li>
          <li>Preço: <?= $product->price ?></li>
          <li>Descrição: <?= $product->description ?></li>
        </ul>
        <form action="formOrders.php?product=<?= $product->id ?>" method="POST">
          <div class="container text-start">
            <div class="row mb-4">
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Observação</label>
                <input type="text" class="form-control" name="note">
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