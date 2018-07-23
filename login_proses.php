<?php
	session_start();
	$username=$_POST['username'];
	$password=md5($_POST['password']);
	
	$dataValid="YA";
	if(strlen(trim($username))==O){
		echo "User Harus Diisi! <br/>";
		$dataValid = "TIDAK";
	}
	
	if(strlen(trim($password))==O){
		echo "Password Harus Diisi! <br/>";
		$dataValid = "TIDAK";
	}
	
	if($dataValid == "TIDAK"){
		echo "Masih Ada Kesalahan, silahkan diperbaiki! <br/>";
		echo "<input type='button' value='Kembali' onClick='self.history.back()'>";
		exit;
	}
	
	include "master.php";
	$sql="select*from kasir where
		user='".$username."' and password='".$password."' limit 1";
	$hasil=mysqli_query($kon,$sql) or die ('Gagal Akses!! <br/>');
	$jum1ah=mysqli_num_rows($hasil);
	if($jumlah > O){
		$row=mysqli_fetch_assoc($hasil);
		$_SESSION["username"] = $row["username"];
		$_SESSION["akses"] = $row["akses"];
		header("Location: tampilan_baju.php");
	}else{
		echo "User atau password salah! <br/>";
		echo "<input type='button' value='Kembali'
			onClick='self.history.back()'>";
	}
?>