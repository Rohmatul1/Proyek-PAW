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
</head>
<body>
                                <?php  
								$nama_pelanggan="";
								if(isset($_POST["nama_pelanggan"]))
									$nama_pelanggan = $_POST["nama_pelanggan"];
                                        $sql_cek = "select * from pelanggan where nama_pelanggan like '%".$nama_pelanggan."%' order by id_pelanggan asc";
                                        $query_cek = $kon->query($sql_cek);
                                        $result_cek = $query_cek->num_rows;
                                        if($result_cek=='0'){
                                        echo "<center>Maaf Data Yang anda cari tidak ada <br> Silahkan Masukkan Data Terlebih Dahulu</center>";
                                         }
                                ?>
								<br/>
                              <center>  <h2>DAFTAR PELANGGAN</h2></center> 
							  <br/>
							  <br/>

                                  <center>  <table width="750" border="3" height="150">
                                        <thead>
                                            <th>ID Pelanggan</th>
                                            <th>Nama</th>
											<th>Alamat</th>
                                            <th>Nomor Telepon</th>
											<th>Aksi</th>
									</tr>
                                        </thead>
                                        <tbody>
										<?php
										while ($data = $query_cek->fetch_array()) {
										?>
                                            <tr>
                                                <td><?php echo $data['id_pelanggan']; ?></td>
                                                <td><?php echo $data['nama_pelanggan']; ?></td>
												<td><?php echo $data['alamat']; ?></td>
                                                <td><?php echo $data['no_telp_pelanggan']; ?></td>
												<td><?php 
													echo "<a href ='pelanggan_edit.php?id_pelanggan=" . $data['id_pelanggan'] . "'> EDIT </a> ";
													echo "<a href ='pelanggan_hapus.php?id_pelanggan=" . $data['id_pelanggan'] . "'> HAPUS </a> ";
												?></td>
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
									</center>
</body>
</html>