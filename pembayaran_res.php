<?php
 include "master.php";

 print_r($_POST);

 $id_jasa		= $_POST['id_jasa'];
 $id_pelanggan		= $_POST['id_pelanggan'];
 $tgl_transaksi    = $_POST['tgl_transaksi'];
 $nama				= $_POST['nama'];
 $berat		= $_POST['berat'];
 $harga_perkilo		= $_POST['harga'];
 $total		= $_POST['total'];
 
$sql = "insert into pembayaran values('$id_bayar','$id_jasa','$id_pelanggan','$tgl_transaksi', 
				'$nama','$berat','$harga_perkilo', '$total')";   
		
$hasil = $kon->query($sql);
if (!$hasil) {
    echo "Gagal Simpan, silakan diulangi! <br /> ".mysqli_error($koneksidb);
    echo "<input type='button' value='Kembali'
    onClick='self.history.back()'>";
    exit;
} else {
    header("location:pembayaran_t.php");
} 
?>