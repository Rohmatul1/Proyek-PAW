<?php
error_reporting(E_ALL ^ E_DEPRECATED);
	$host = "localhost";
	$user = "root";
	$pass = "";
	$dbName = "laundry";
	
	$kon = mysqli_connect($host, $user, $pass);
	if(!$kon)
		die("Gagal Koneksi...");
		
	$hasil = mysqli_select_db($kon, $dbName);
	if(!$hasil){
		$hasil = mysqli_query($kon, "CREATE DATABASE $dbName");
		if(!$hasil)
			die("Gagal Buat Database");
		else
			$hasil = mysqli_select_db($kon, $dbName);
			if(!$hasil) die ("Gagal Konek Database");
	}
	
	$sqlTabelKasir = "create table if not exists kasir(
			kd_kasir int auto_increment not null primary key,
			user varchar(25) not null,
			password varchar(50) not null
			)";
	mysqli_query ($kon, $sqlTabelKasir) or die("Gagal Buat Tabel Kasir");
	
	$sqlTabelPelanggan = "create table if not exists pelanggan(
			id_pelanggan int auto_increment not null primary key,
			nama_pelanggan varchar(50) not null,
			alamat varchar(10) not null,
			no_telp_pelanggan varchar(11) not null
			)";
	mysqli_query ($kon, $sqlTabelPelanggan) or die("Gagal Buat Tabel Pelanggan");
	
	$sqlTabelPembayaran = "create table if not exists pembayaran(
						id_bayar int auto_increment not null primary key,
						id_pelanggan int not null,
						id_jasa int not null,
						nama varchar(50) not null,
						berat int(10) not null,
						harga_perkilo int not null,
						total int not null
						)";
	mysqli_query ($kon, $sqlTabelPembayaran) or die("Gagal Buat Tabel Pembayaran");

	$sqlTabelHarga_Cuci_Laundry = "create table if not exists harga(
						id_jasa int auto_increment not null primary key,
						harga_perkilo int not null
						)";
	mysqli_query ($kon, $sqlTabelHarga_Cuci_Laundry) or die("Gagal Buat Tabel Harga Laundry");
	
	$sql="select*from kasir";
	$hasil=mysqli_query($kon,$sql);
	$jumlah=mysqli_num_rows($hasil);
	if($jumlah==0){
		$sql="insert into kasir(user, password)
		values('admin',md5('admin'))";
		mysqli_query($kon,$sql);
	}
?>
