<?php
session_start();
if($_SESSION['login_admin']==""){
    header("location:index.php");
}
include 'db2.php';

$result=mysqli_query($con,"SELECT * FROM `services_db` ");
$sql2=mysqli_query($con,"SELECT * FROM `role_db` join `users` on role_db.role_id=users.role_id");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="favicon.png" type="image/png">
    <link href="stylesheet.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
              h3{
            font-family: "Raleway", Helvetica, sans-serif;
        }
        a{
          text-decoration:none;
        }
        table, th, td {
            color: aliceblue;
            
            border: 1px solid white;
        }   
        table{
            margin-left: auto;
            margin-right: auto;
           
        }
</style>
</head>
<body>
<?php include 'side.php';?>

<div class="common-div">
<h3 >Dashboard</h3>
<div id="block_container">
<a href="services.php">
<div class="card-div-red">
    Services
    <h4 class=card-div></h4>
</div></a>
<a href="users.php">
<div class="card-div-blue">
    Users
    <h4 class=card-div></h4>
</div></a>
<a href="workers.php">
<div class="card-div-green">
    Workers
    <h4 class=card-div></h4>
</div></a>
<a href="complaints.php">
<div class="card-div-yellow">
    Complaints
    <h4 class=card-div></h4>
</div></a>
</div>
<div class="dash-table">

</div>
</div>

<div class="common-div">
        <h3>Recent Users</h3>
    </div>

<table style="width:800px" style="background-color:grey">
                    <tbody>
                        
                        <tr>
                            <th>
                            Name
                            </th>
                            <th>
                            Email
                            </th>
                            <th>
                            User Type
                            </th>
                        </tr>
                        <?php while ($row = mysqli_fetch_assoc($sql2)) { ?>
                        <tr>
                            <td>
                                <h4><?php echo $row['fname']?></h4>
                            </td>
                            <td>
                                <h4><?php echo $row['email']?></h4>
                            </td>
                            <td>
                                <h4><?php echo $row['role']?></h4>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
</body>
</html>