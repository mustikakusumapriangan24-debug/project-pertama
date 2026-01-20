<?php
include 'koneksi.php';

parse_str(file_get_contents("php://input"), $data);

$id = $data['id'];
$nama = $data['nama'];

$sql = "UPDATE siswa SET nama='$nama' WHERE id='$id'";

if ($conn->query($sql)) {
    echo json_encode(["status" => "updated"]);
}