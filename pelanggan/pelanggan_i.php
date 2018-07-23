<!doctype html>
<html lang="en">
<?php
include "koneksi.php";


    $sql="select MAX(id_pelanggan) from pelanggan";
    $hasil = $koneksidb->query($sql);
    $data = $hasil->fetch_array();

    $MaxID = $data[0];  //data kode perusahaan terakhir disimpan di variabel baru $MaxID

    $no_urut = (int) substr($MaxID,2,6);  //Memisahkan karakter dengan angka menggunakan fungsi substr
                        //string di $MaxID akan dipisahkan menjadi"PM" dan "000001"
                        //angka 0 pertama dimulai dari index ke-2 dengan panjang 6(sampaiangka 1).000001  dimasukkan ke variabel $no_urut
    $no_urut++;               //lalu variabel no_urut ditambah 1

    $new_ID = "P".sprintf("%06s","$no_urut");  //angka yang telah ditambah dengan dengan 1 kemudian  digabung kembali dengan "PM"
                          //sprintf digunakan untuk memanggil variabel dalam format yang sudah ditentukan
                          //%s merupakan format pemanggilan variabel yang bernilai string
?>

<body>
                        <a href="pelanggan_t.php">Daftar Pelanggan</a>
                        <a href="pelanggan_i.php">Input Pelanggan</a>
                                    <h4 class="title">Input Pemasok</h4>
                                    <form  action="pelanggan_i_res.php" method="post">
                                                <div>
                                                    <label class="control-label">ID Pelanggan</label>
                                                    <input type="text" class="form-control" value ="<?php echo $new_ID?>" name="id_pelanggan" readonly>
                                                </div>
											<div class="col-md-6">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Nama Pelanggan</label>
                                                    <input type="text" class="form-control"  name="nm_pelanggan" required>
                                                </div>
                                            </div>
											<div class="col-md-5">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Nomor Telepon</label>
                                                    <input type="number" class="form-control"  name="no_telp" required>
                                                </div>
                                            </div>
											<div class="col-md-6">
                                                <div class="form-group label-floating">
                                                    <label class="control-label">Alamat</label>
                                                    <input type="text" class="form-control"  name="alamat" required>
                                                </div>
                                            </div>
                                        <button type="submit" class="btn btn-primary pull-right">SIMPAN</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
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
</body>
</html>