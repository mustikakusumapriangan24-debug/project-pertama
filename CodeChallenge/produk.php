<?php
$conn = mysqli_connect("localhost", "root", "", "toko");

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

if (isset($_POST['simpan'])) {

    $nama_produk   = $_POST['nama_produk'];
    $kategori      = $_POST['kategori'];
    $harga_produk  = $_POST['harga_produk'];
    $tipe_diskon   = $_POST['tipe_diskon'];
    $nilai_diskon  = $_POST['nilai_diskon'];

    if ($tipe_diskon == "persen") {
        $harga_diskon = $harga_produk * ($nilai_diskon / 100);
    } else {
        $harga_diskon = $nilai_diskon;
    }

    $harga_jual = $harga_produk - $harga_diskon;

    $query = "INSERT INTO produk 
             (nama_produk, kategori, harga_produk, tipe_diskon, nilai_diskon, harga_jual)
             VALUES 
             ('$nama_produk', '$kategori', '$harga_produk', '$tipe_diskon', '$nilai_diskon', '$harga_jual')";

    mysqli_query($conn, $query);

    echo "Produk berhasil disimpan!";
}
?>
