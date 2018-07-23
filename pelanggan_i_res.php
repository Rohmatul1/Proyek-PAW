<?php
 include "master.php";

 $nama_pelanggan		= $_POST['nama_pelanggan'];
 $alamat				= $_POST['alamat'];
 $no_telp_pelanggan		= $_POST['no_telp_pelanggan'];

 $sql_cek = "insert into pelanggan values('$id_pelanggan','$nama_pelanggan','$alamat', '$no_telp_pelanggan')";   
$hasil = $kon->query($sql_cek);
if (!$hasil) {
    echo "Gagal Simpan, silakan diulangi! <br /> ".mysqli_error($koneksidb);
    echo "<input type='button' value='Kembali'
    onClick='self.history.back()'>";
    exit;
} else {
    header("location:pelanggan_t.php");
} 
?>