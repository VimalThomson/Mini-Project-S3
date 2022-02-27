<?php
	$db = mysqli_connect('localhost','root','','home_care_db');
	if (!$db) {
		echo "Database connection failed";
	}


	$fname = $_POST['fname'];
    $phone = $_POST['phone'];
    $place=$_POST['place'];
    $email= $_POST['email'];
    $status=1;
	$password = $_POST['password'];
    $type=1;



	$sql = "SELECT email FROM `role_db` WHERE email = '".$email."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{

        $insertlog = "INSERT INTO `role_db` (`email`, `password`, `role`, `status`) VALUES ('".$email."','".$password."','".$type."','".$status."')";
        $sql = mysqli_query($db,$insertlog);
        $logid = mysqli_insert_id($db);
		$insert = "INSERT INTO `users` (`fname`, `phone`, `place`,`role_id`) VALUES('".$fname."','".$phone."','".$place."','".$logid."')";
		$query = mysqli_query($db,$insert);
		if ($query) {

			echo json.encode("Success");
		}
	}

?>