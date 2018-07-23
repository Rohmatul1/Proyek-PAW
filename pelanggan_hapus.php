<html lang="en">
<head>
<title>GHRATAMA LAUNDRY</title>
		<style type="text/css">
			header, section, footer, aside, nav, article, figure, figcaption {
				display: block;}
			body {
				color: #666666;
				background-color: #f9f8f6;
				background-image: url("w.jpg");
				background-position: center;
				font-family: Georgia, Times, serif;
				line-height: 1.4em;
				margin: 0px;}
		</style>
</head>
</html>
<?php
	$id_pelanggan = $_GET['id_pelanggan'] ;
	include "master.php" ;
	$sql = "select * from pelanggan where id_pelanggan = '$id_pelanggan' ";
	$hasil = mysqli_query($kon,$sql) ;
	if (!$hasil) die ('Gagal query ....');
	
	$data = mysqli_fetch_array($hasil);
	$nama_pelanggan = $data['nama_pelanggan'];
	$alamat = $data['alamat'];
	$no_telp_pelanggan = $data['no_telp_pelanggan'];
	
	echo "<center><br/><br/><br/><br/><br/><h2>Konfirmasi Hapus</h2>" ;
	echo "Id Pelanggan : ".$id_pelanggan."<br/>" ;
	echo "Nama Pelanggan : ".$nama_pelanggan."<br/>" ;
	echo "Alamat : ".$alamat."<br/>" ;
	echo "No telp Pelanggan : ".$no_telp_pelanggan."<br/>" ;
	echo "APAKAH DATA INI AKAN DI HAPUS ?? <br/>";
	echo "<a href='pelanggan_hapus.php?id_pelanggan=$id_pelanggan&hapus=1'> YA </a>";
	echo "&nbsp;&nbsp;" ;
	echo "<a href='pelanggan_t.php'> TIDAK </a> <br/><br/></center>" ;
	
	if (isset($_GET['hapus'])) {
		$sql = "delete from pelanggan where id_pelanggan = '$id_pelanggan'";
		$hasil = mysqli_query($kon,$sql);
		if (!$hasil){
			echo "Gagal Hapus Pelanggan : $nama_pelanggan ....<br/> ";
			echo "<a href='pelanggan_t.php'>Kembali ke Tampilan Pelanggan</a>";
		} else {
			header('location:pelanggan_t.php');
		}
	}
?>
