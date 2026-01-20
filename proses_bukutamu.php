<?php
// koneksi ke database
$koneksi = mysqli_connect("localhost", "root", "", "bukutamu");

// Ambil data dari form
$nama = $_POST['nama'];
$jenis_kelamin = $_POST['jenis_kelamin'];
$hubungan = isset($_POST['hubungan']) ? implode(", ", $_POST['hubungan']) : "";
$foto = $_FILES['foto']['name'];
$tmp = $_FILES['foto']['tmp_name'];

// Pindahkan file ke folder uploads/
$folder = "uploads/";
move_uploaded_file($tmp, $folder.$foto);

// Simpan data ke database
$sql = "INSERT INTO tamu (nama, jenis_kelamin, hubungan, foto) 
        VALUES ('$nama', '$jenis_kelamin', '$hubungan', '$foto')";

if(mysqli_query($koneksi, $sql)){
    echo "Data berhasil disimpan!";
} else {
    echo "Error: " . mysqli_error($koneksi);
}
?>
