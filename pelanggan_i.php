<html lang="en">
<?php
include "master.php";
?>
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
            <form action="pelanggan_i_res.php" method="POST">
			<br/>
			<br/>
			<br/>
			<br/>
              <p><center class="center"><h2>INPUT PELANGGAN</h2></center></p>

			  <pre>
              <input type="hidden" name="id_pelanggan" value='<?=$id;?>'> <br /> </center>
              <center>Nama Pelanggan		: <input type="text" name="nama_pelanggan" placeholder="Nama Pelanggan" class="ukuran"> <br /> </center>
              <center>Alamat			: <input type="text" name="alamat" placeholder="Alamat" class="ukuran"> <br /> </center>
             <center>No Telp			: <input type="" name="no_telp_pelanggan" placeholder="No Telp" class="ukuran"> <br /> </center>
			</pre>
				<center><input type="Submit" name="simpan" value="Simpan"></a></center>
            </form>

        </div>
      </div>
    </div>
</table>
</body>
</html>
