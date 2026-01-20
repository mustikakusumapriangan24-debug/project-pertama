<?php
$koneksi = mysqli_connect("localhost", "root", "", "bukutamu");
$result = mysqli_query($koneksi, "SELECT * FROM tamu");

while($row = mysqli_fetch_assoc($result)){
    echo "Nama: ".$row['nama']."<br>";
    echo "Jenis Kelamin: ".$row['jenis_kelamin']."<br>";
    echo "Hubungan: ".$row['hubungan']."<br>";
    echo "<img src='uploads/".$row['foto']."' width='100'><hr>";
}
?>
