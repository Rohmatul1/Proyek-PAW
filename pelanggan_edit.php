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
	$id_pelanggan = $_GET["id_pelanggan"] ;
	include "master.php";
	$sql_cek = "select * from pelanggan where id_pelanggan = '$id_pelanggan'";
	$hasil = mysqli_query($kon, $sql_cek);
	if(!$hasil) die("Gagal query..");

	$data=mysqli_fetch_array($hasil);
	$nama_pelanggan= $data["nama_pelanggan"];
	$alamat= $data["alamat"];
	$no_telp_pelanggan= $data["no_telp_pelanggan"];
?>
<center>
<br/><br/><br/><br/><br/>
<h2>EDIT PELANGGAN</h2>
<form action="pelanggan_edit_simpan.php" method="post">
<input type="hidden" name="id_pelanggan" value="<?php echo $id_pelanggan;?>" />
	<table border="1">
	<tr>
		<td>Nama Pelanggan</td>
		<td><input type="text" name="nama_pelanggan" value="<?php echo $nama_pelanggan;?>" /></td>
	</tr>
	
	<tr>
		<td>Alamat</td>
		<td><input type="text" name="alamat" value="<?php echo $alamat;?>" /></td>
	</tr>
	
	<tr>
		<td>No Telp</td>
		<td><input type="text" name="no_telp_pelanggan" value="<?php echo $no_telp_pelanggan;?>" /></td>
	</tr>

	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="Simpan" name="proses" />
			<input type="reset" value="Reset" name="reset" />
		</td>
	</tr>
	</table>
</form>
</center>