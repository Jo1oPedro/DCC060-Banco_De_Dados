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
        <h3 class="mb-4">Cadastro de delivery</h3>
        <form>
          <div class="container text-start">
            <div class="row mb-4">
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Status</label>
                <div>
                  <select class="form-select" aria-label="Default select example" name="status">
                    <option selected>Selecione o status</option>
                    <option value="1">WAITING</option>
                    <option value="2">ON THE WAY</option>
                    <option value="3">DELIVERED</option>
                  </select>
                </div>
              </div>
              <div class="col-4">
                <label for="exampleInputEmail1" class="form-label">Motoboy</label>
                <div>
                  <select class="form-select" aria-label="Default select example" name="id_motoboy">
                    <option selected>Selecione o motoboy</option>
                    <option value="1">Cliente</option>
                    <option value="2">Administrador</option>
                    <option value="3">Dono de restaurante</option>
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