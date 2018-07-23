<?php
	$id = $_GET['id'];
	$nama = $_GET['nama'];
	$harga = $_GET['harga'];
?>
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
		<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
</head>
<body>
<table>
      <div class="header">
        <div class="header_isi">
          <div class="gambar">
            <form action="pembayaran_res.php" method="POST">
			<br/>
			<br/>
			<br/>
              <p><center class="center"><h2>PEMBAYARAN</h2></center></p>
			  <pre>
              <input type="hidden" name="id_jasa" value='<?=$id;?>'> <br /> </center>
				<center>Nama Pelanggan: <select name="id_pelanggan">
											<?php
												include "master.php";
												$sql = "select * from pelanggan";
												$res = mysqli_query($kon, $sql) or die("Gagal Query");
												while($r = mysqli_fetch_assoc($res)){
												echo "<option value='{$r['id_pelanggan']}'>{$r['nama_pelanggan']} | {$r['alamat']}</option>";
												}
											?>
</select>
</center>
              <center>Nama Barang	: <input type="text" name="nama" value="<?=$nama;?>" class="ukuran"> <br /> </center>
              <center>Tanggal Transaksi	: <input type="text" name="tgl_transaksi" class="ukuran"> <br /> </center>
              <center>Berat		: <input type="text" name="berat" placeholder="Berat" class="ukuran" onBlur="total.value=berat.value * harga.value"> <br /> </center>
			  <center>Harga perkilo	: <input type="text" name="harga" placeholder="Kilo" value="<?=$harga;?>" readonly class="ukuran"> <br /> </center>
			  <center>Total Harga	: <input type="text" name="total" placeholder="0" class="ukuran"> <br /> </center>
			</pre>
			<center><input type="Submit" name="simpan" value="Simpan"></a>
            </form>
				<a href="tampilan_baju.php" onClick='self.history()'>
				<input type="Submit" name="kembali" value="Kembali"></a></center>
        </div>
      </div>
    </div>
</table>
</body>
</html>