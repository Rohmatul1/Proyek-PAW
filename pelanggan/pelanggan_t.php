<!doctype html>
<html lang="en">
<?php
session_start();
include_once "session.php";
include "menu.php";
include "koneksi.php";
?>

<body>
    <div class="wrapper">
        
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                      <div class="navbar-header">
                        <a class="navbar-brand" href="pelanggan_t.php"><i class="material-icons">library_books</i> Daftar Pelanggan</a>
                        <a class="navbar-brand" href="pelanggan_i.php"> <i class="material-icons">content_paste</i>Input Pelanggan</a>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-header" data-background-color="purple">
                                   <h4 class="title">Daftar Pemasok</h4>
                                </div>
                                <?php  
                                        $sql_cek="select * from pelanggan ORDER BY id_pelanggan ASC";
                                        $query_cek = $koneksidb->query($sql_cek);
                                        $result_cek = $query_cek->num_rows;
                                        if($result_cek=='0'){
                                        echo "<center>Maaf Data Yang anda cari tidak ada <br> Silahkan Masukkan Data Terlebih Dahulu</center>";
                                         }

                                         else{
                                ?>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-primary">
                                            <th>No</th>
                                            <th>ID Pelanggan</th>
                                            <th>Nama</th>
                                            <th>Nomor Telepon</th>
                                            <th>Alamat</th>
                                        </thead>
                                        <tbody>
                                    <?php 
                                        $no=0;
                                        $jumlah_desimal = "0";
                                        $pemisah_desimal = ",";
                                        $pemisah_ribuan = ".";
                                         while ($data = $query_cek->fetch_array()) {
                                            $no ++;
                                    ?>
                                            <tr>
                                                <td><?php echo $no; ?></td>
                                                <td><?php echo $data['id_pelanggan']; ?></td>
                                                <td><?php echo $data['nm_pelanggan']; ?></td>
                                                <td><?php echo $data['no_telp']; ?></td>
                                                <td><?php echo $data['alamat']; ?></td>
                                            </tr>
                                    <?php 
                                         }
                                        }
                                    ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../assets/img/faces/marc.png" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h6 class="category text-gray"><?php echo $_SESSION['username'];?></h6>
                                    <h4 class="card-title">CV JAYA ABADI</h4>
                                    <a href="logout.php" class="btn btn-primary btn-round">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                             Sistem Informasi Akuntansi 
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                       CV. Jaya Abadi
                    </p>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>