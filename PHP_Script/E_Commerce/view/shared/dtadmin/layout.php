<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Template</title>

    <link rel="stylesheet" href="assets/dtadmin/styles/bootstrap.css">
    <link rel="stylesheet" href="assets/dtadmin/styles/dataTables.bootstrap.css">
    <link rel="stylesheet" href="assets/dtadmin/styles/font-awesome.css">
    <link rel="stylesheet" href="assets/dtadmin/styles/dt-sidebar.css">
    <link rel="stylesheet" href="assets/dtadmin/styles/dt-gradients.css">
    <link rel="stylesheet" href="assets/dtadmin/styles/dt-theme.css">
    <link rel="stylesheet" href="assets/dtadmin/styles/dt-styles.css">
    <!-- <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">  -->

    <script src="assets/dtadmin/scripts/jquery-3.2.1.js"></script>
    <script src="assets/dtadmin/scripts/bootstrap.min.js"></script>
    <script src="assets/dtadmin/scripts/jquery.dataTables.js"></script>
    <script src="assets/dtadmin/scripts/dataTables.bootstrap.js"></script>
    <script src="assets/dtadmin/scripts/underscore.js"></script>

</head>

<body>
  <div id="wrapper" class="toggled">
    <?php include('_sidebar.php'); ?>
    <div id="page-content-wrapper">
      <?php include('_navbar.php'); ?>
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <?=$MASTER_CONTENT?>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="assets/dtadmin/scripts/simple-sidebar.js"></script>
  <script src="assets/dtadmin/scripts/plugins.js"></script>
  
</body>

</html>