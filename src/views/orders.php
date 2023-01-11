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
      <h3 class="mb-4">Pedidos</h3>
      <div class="d-flex justify-content-end mb-4">
        <a href="/src/views/forms/formOrders.php"><button class="btn btn-primary">Cadastrar</button></a>
      </div>
      <table class="table table-light table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Data</th>
            <th scope="col">Status</th>
            <th scope="col">Valor total</th>
            <th scope="col">Nota</th>
            <th scope="col">Cliente</th>
            <th scope="col">Delivery</th>
            <th scope="col">Ações</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>TESTE</td>
            <td>TESTE</td>
            <td>TESTE</td>
            <td>TESTE</td>
            <td>TESTE</td>
            <td>TESTE</td>
            <td>
              <button type="submit" class="btn btn-info">E</button>
              <button type="submit" class="btn btn-danger">X</button>
            </td>
          </tr>
        </tbody>
      </table>

    </div>
  </div>

  <?php include 'includes/scripts.php' ?>
</body>

</html>