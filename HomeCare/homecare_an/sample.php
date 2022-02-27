<?php 
include 'db2.php';
session_start();
if($_SESSION['login_admin']==""){
    header("location:index.php");
}

$result=mysqli_query($con,"SELECT * FROM `service_type`");
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="stylesheet.css" rel="stylesheet">
    <link rel="icon" href="favicon.png" type="image/png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <style>
        h3{
            font-family: "Raleway", Helvetica, sans-serif;
        }
        a{
          text-decoration:none;
        }
        .column{
            
  float: left;
  width: 17%;
  padding: 10px;
  height: 150px;
  margin-bottom: 20px;
        }
        .row:after {
            content: "";
            display: table;
            margin-left: 200px;
            clear: both;
            width: 100%;
}


        </style>
</head>
<body>
<?php include 'side.php';?>
<div class="common-div">
<h3>Services</h3>
<div id="block_container">
    <div class="row">
<?php
    while ($row=mysqli_fetch_assoc($result)) { ?>
<a href="service_detail.php?s_id=<?php echo $row['type_id'];?>" class="column">
<div class="card-div-red">
<?php echo $row['type']; ?>
    <h4 class=card-div></h4>
</div></a>
<?php } ?>
</div>
</body>
</html>