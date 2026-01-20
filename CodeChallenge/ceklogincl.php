<?php
include "koneksicl.php";
$username = $_POST['username'];
$password = md5($_POST['password']);

$query = mysqli_query($con, "SELECT * FROM tbl_user WHERE username='$username' 
    AND password='$password'");
$hasilquery = mysqli_num_rows($query);

if($hasilquery == 1){
    session_start();
    while($row = mysqli_fetch_assoc($query)){
        $_SESSION['username'] = $row['username'];
        $_SESSION['hak_akses'] = $row['hak_akses'];
        header("Location: dashboardcl.php");
    }
}else{
    header("Location: logincl.php");
}
?>
