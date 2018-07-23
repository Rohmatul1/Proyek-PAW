<?php
	if (isset($_POST['id_pelanggan'])){
		$id_pelanggan = $_POST['id_pelanggan'] ;
		$simpan = "EDIT" ;
	} else {
		$simpan = "BARU" ;
	}
	$nama_pelanggan = $_POST['nama_pelanggan'];
	$alamat = $_POST['alamat'];
	$no_telp_pelanggan = $_POST['no_telp_pelanggan'];
	
	include "master.php";
	
	if($simpan == "EDIT"){
		$sql = "update pelanggan set
				nama_pelanggan = '$nama_pelanggan' ,
				alamat = '$alamat' ,
				no_telp_pelanggan = $no_telp_pelanggan
				where id_pelanggan = $id_pelanggan ";
	} else {
		$sql = "insert into pelanggan
				(nama_pelanggan,alamat,no_telp_pelanggan)
				values
				('$nama_pelanggan','$alamat',$no_telp_pelanggan) ";
	}
	
	$hasil = mysqli_query($kon, $sql);
		
	if (!$hasil) {
		echo "Gagal Simpan, silahkan diulangi! <br /> ";
		echo mysqli_error($kon);
		echo "<br/> <input type='button' value='Kembali'
		onClick='self.history.back()'>";
		exit;
	} else {
		echo "Simpan Data Berhasil" ;
			header("location:pelanggan_t.php");
	}
?>
<hr/>
<a href="pelanggan_t.php" />DAFTAR PELANGGAN</a>
