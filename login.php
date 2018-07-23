<!DOCTYPE html>
<form method="post" action="login_proses.php">
<html lang="en">
<?php
include "master.php";
?>
  <head>
    <title> Login Laundry </title>
    <link href="style1.css" rel="stylesheet" type="text/css" >
  </head>

  <body>
    <div id="utama">
	<br/>
    <p><center class="title"><h1>SELAMAT DATANG</h1></center></p>
	
      <div class="header">
        <div class="header_isi">
          <div class="gambar">
            <form action="login.php" method="POST">
			<br/>
              <p><center class="center"><h2>GHRATAMA LAUNDRY</h2></center></p>
			  <br/>
              <input type="text" name="username" placeholder="Username" class="login_regis">     <br />
              <input type="password" name="password" placeholder="Password" class="login_regis"> <br />
            <div class="chexbox">
              <input type="checkbox" name="chek" > Remember me <br />
            </div>
              <input type="Submit" name="login" value="LOGIN" class="tombol_login">
            </form>
        </div>
      </div>
    </div>
  </body> 
</html> 