<form action="proses_bukutamu.php" method="post" enctype="multipart/form-data">
    Nama: <input type="text" name="nama" required><br><br>

    Jenis Kelamin:
    <input type="radio" name="jenis_kelamin" value="Laki-laki" required> Laki-laki
    <input type="radio" name="jenis_kelamin" value="Perempuan"> Perempuan
    <br><br>

    Hubungan:
    <input type="checkbox" name="hubungan[]" value="Teman SD"> Teman SD
    <input type="checkbox" name="hubungan[]" value="Teman SMP"> Teman SMP
    <input type="checkbox" name="hubungan[]" value="Teman SMK"> Teman SMK
    <input type="checkbox" name="hubungan[]" value="Lainnya"> Lainnya
    <br><br>

    Upload Foto:
    <input type="file" name="foto" accept="image/*" required><br><br>

    <input type="submit" value="Simpan">
</form>
