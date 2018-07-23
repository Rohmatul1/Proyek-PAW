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
                                <?php  
                                        $sql_cek="SELECT pembayaran.id_bayar, pembayaran.tgl_transaksi, harga.nama,
												pelanggan.nama_pelanggan, pelanggan.alamat, pembayaran.berat, harga.harga_perkilo,
												pembayaran.total
												FROM pembayaran JOIN harga ON
												pembayaran.id_jasa = harga.id_jasa
												JOIN pelanggan ON
												pembayaran.id_pelanggan = pelanggan.id_pelanggan ORDER BY id_bayar asc";
                                        $query_cek = $kon->query($sql_cek);
                                        $result_cek = $query_cek->num_rows;
                                        if($result_cek=='0'){
                                        echo "<center>Maaf Data Yang anda cari tidak ada <br> Silahkan Masukkan Data Terlebih Dahulu</center>";
                                         }
                                ?>

								<br/>
                              <center>  <h2>LAPORAN PEMBAYARAN</h2></center> 
							  <br/>
							  <br/>
                                  <center>  <table width="500" border="3" height="150">
                                        <thead>
                                            <th>Id Pembayaran</th>
                                            <th>Tanggal Transaksi</th>
											<th>Nama Barang</th>
											<th>Nama Pelanggan</th>
											<th>Alamat</th>
											<th>Berat</th>
                                            <th>Harga per Kilo</th>
                                            <th>Jumlah Pembayaran</th>
									</tr>
                                        </thead>
                                        <tbody>
										<?php
										while ($data = $query_cek->fetch_array()) {
										?>
                                            <tr>
                                                <td><?php echo $data['id_bayar']; ?></td>
                                                <td><?php echo $data['tgl_transaksi']; ?></td>
												<td><?php echo $data['nama']; ?></td>
                                                <td><?php echo $data['nama_pelanggan']; ?></td>
                                                <td><?php echo $data['alamat']; ?></td>
												<td><?php echo $data['berat']; ?></td>
												<td><?php echo $data['harga_perkilo']; ?></td>
												<td><?php echo $data['total']; ?></td>
                                            </tr>
										 <?php 
                                         }
                                    ?>
                                        </tbody>
                                    </table>
									<br/>
									<br/>
									<a href="tampilan_baju.php" onClick='self.history()'>
									<input type="Submit" name="kembali" value="Kembali"></a>
									<button onClick="window.print()"> Print </button>
									</center>
</body>
</html>