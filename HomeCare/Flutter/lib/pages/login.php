// <?php
// 	$db = mysqli_connect("localhost","root","","home_care_db");
//
// 	$email = $_POST['email'];
// 	$password = $_POST['password'];
//
// 	$sql = "SELECT * FROM login WHERE email = '".$email."' AND password = '".$password."'";
//
// 	$result = mysqli_query($db,$sql);
//
// 	$count = mysqli_num_rows($result);
//
// 	echo $count;
//
// 	if ($count == 1) {
//         $row = mysqli_fetch_array($result);
//         $typeid=$row['role'];
//         if($typeid==1){
// 		echo json_encode("Success1");
//         }else{
//             echo json_encode("Success2");
//         }
//     }else{
// 		echo json_encode("Error");
// 	}
//
//?>

<?php
//headers : {"Accept":"application/json"}
	$db = mysqli_connect("localhost","root","","home_care_db");

	$email = $_POST['email'];
	$password = $_POST['password'];
	$status = 1;

	$queryResult=$db->query("SELECT * FROM role_db WHERE email='".$email."' and password='".$password."' and status='".$status."'");

	$result=array();

	while($fetchData=$queryResult->fetch_assoc()){
	    $result[]=$fetchData;
	}

	echo json_encode($result);



?>
