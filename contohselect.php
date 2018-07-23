<?php  include "master.php";?>
<form>
<select name="id_pelanggan">

<?php
	$sql = "select * from pelanggan";
	$res = mysqli_query($kon, $sql) or die("Gagal Query");
	while($r = mysqli_fetch_assoc($res)){
		echo "<option value='{$r['id_pelanggan']}'>{$r['nama_pelanggan']} | {$r['alamat']}</option>";
	}
?>

</select>