<?php

$barang   = $_POST['barang'];
$satuan  = $_POST['satuan'];
$harga  = $_POST['harga'];

include "master.php";
//menghitung nilai dari yang tadi kita input
$hitung = $satuan * $harga;
echo "Jumlah Harga : ".$hitung
?>