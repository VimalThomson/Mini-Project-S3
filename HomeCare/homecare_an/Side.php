<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    /* Style the sidebar - fixed full height */
.sidebar {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 16px;
}

/* Style sidebar links */
.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

/* Style links on mouse-over */
.sidebar a:hover {
  color: #f1f1f1;
}

/* Style the main content */
.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

  img{
      margin-left:65px;
      margin-bottom:10px;
  }  
  b{
      margin-left: 40px;
      margin-bottom:20px;
      color:white;
  }
  div{
    margin-bottom:30px;
  }
    </style>
    </head>
<body>
    <!-- Load an icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- The sidebar -->
<div class="sidebar">
     <div class="image">
         <img src="favicon.png" width="60" height="60" alt="User" /><br>
         <b>Home Care 24x7</b>
     </div>

  <a href="dashboard.php"><i class="fa fa-home"></i> Home</a>
  <a href="add_services.php"><i class="fa fa-wrench"></i>Add Services</a>
  <a href="add_workers.php"><i class="fa fa-user"></i> Add Workers</a>
  <a href="requests.php"><i class="fa fa-user-plus"></i> Requests</a>
  <a href="rejected.php"><i class="fa fa-user-times"></i> Rejected</a>
  <a href="logout.php"><i class="fa fa-envelope"></i> Log out</a>
</div>
</body>
</html>