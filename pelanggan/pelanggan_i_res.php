<?php
 include "koneksi.php";
 echo("<pre>");
 print_r($_POST);

 $id_pelanggan			= $_POST['id_pelanggan'];
 $nm_pelanggan			= $_POST['nm_pelanggan'];
 $no_telp				= $_POST['no_telp'];
 $alamat				= $_POST['alamat'];

$sql = "insert into pelanggan values('$id_pelanggan','$nm_pelanggan', '$no_telp','$alamat')";   
$hasil = $koneksidb->query($sql);
if (!$hasil) {
    echo "Gagal Simpan, silakan diulangi! <br /> ".mysqli_error($koneksidb);
    echo "<input type='button' value='Kembali'
    onClick='self.history.back()'>";
    exit;
} else {
    header("location:pelanggan_t.php");
} 
?>