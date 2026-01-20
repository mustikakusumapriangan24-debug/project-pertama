def hitung_hari_berikutnya(tanggal, bulan, tahun):
    
    hari_per_bulan = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    
    if (tahun % 400 == 0) or (tahun % 4 == 0 and tahun % 100 != 0):
        hari_per_bulan[1] = 29 

    
    if tanggal < hari_per_bulan[bulan - 1]:
        tanggal += 1
    elif tanggal == hari_per_bulan[bulan - 1] and bulan < 12:
        tanggal = 1
        bulan += 1
    else:
        tanggal = 1
        bulan = 1
        tahun += 1

    return tanggal, bulan, tahun


def input_tanggal_valid():
    try:
        tanggal = int(input("Masukkan tanggal: "))
        bulan = int(input("Masukkan bulan: "))
        tahun = int(input("Masukkan tahun: "))

        if not (1 <= bulan <= 12):
            print("Bulan harus antara 1 dan 12!")
            return None

        hari_per_bulan = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        if (tahun % 400 == 0) or (tahun % 4 == 0 and tahun % 100 != 0):
            hari_per_bulan[1] = 29

        if not (1 <= tanggal <= hari_per_bulan[bulan - 1]):
            print(f"Tanggal tidak valid! Bulan {bulan} hanya sampai {hari_per_bulan[bulan - 1]} hari.")
            return None

        return tanggal, bulan, tahun

    except ValueError:
        print("Input harus berupa angka! Coba lagi.")
        return None


data = input_tanggal_valid()
if data:
    tanggal, bulan, tahun = data
    tgl_baru, bln_baru, thn_baru = hitung_hari_berikutnya(tanggal, bulan, tahun)
    print(f"\nHari berikutnya adalah: {tgl_baru}-{bln_baru}-{thn_baru}")
