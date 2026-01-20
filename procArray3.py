def input_nilai():
    nilai_list = []

    while True:
        try:
            jumlah = int(input("Masukan jumlah siswa (1-50): "))
            if 1 <= jumlah <= 50:
                break
            else:
                print("Jumlah siswa harus antara 1 sampai 50.")
        except ValueError:
            print("Input harus berupa angka!")

    for i in range(1, jumlah + 1):
        while True:
            try:
                nilai = float(input(f"Masukkan nilai siswa ke-{i} (0–100): "))
                if 0 <= nilai <= 100:
                    nilai_list.append(nilai)
                    break
                else:
                    print("Nilai harus antara 0–100.")
            except ValueError:
                print("Input harus berupa angka!")

    return nilai_list


def hitung_rata_rata(nilai_list):
    return sum(nilai_list) / len(nilai_list)


def cari_nilai_tertinggi(nilai_list):
    return max(nilai_list)


def cari_nilai_terendah(nilai_list):
    return min(nilai_list)


def tentukan_kategori(rata):
    if rata >= 90:
        return "Sangat Baik"
    elif rata >= 75:
        return "Baik"
    elif rata >= 60:
        return "Cukup"
    else:
        return "Perlu Bimbingan"



def tampilkan_hasil(nilai_list, rata, tertinggi, terendah, kategori):
    print("\n===== HASIL ANALISIS NILAI =====")
    print(f"Nilai siswa       : {[int(n) if n.is_integer() else n for n in nilai_list]}")
    print(f"Nilai tertinggi   : {int(tertinggi)}")
    print(f"Nilai terendah    : {int(terendah)}")
    print(f"Rata-rata kelas   : {rata:.2f}")
    print(f"Kategori kelas    : {kategori}")
    print("================================")

    


def main():

    nilai_list = input_nilai()


    rata = hitung_rata_rata(nilai_list)
    tertinggi = cari_nilai_tertinggi(nilai_list)
    terendah = cari_nilai_terendah(nilai_list)
    kategori = tentukan_kategori(rata)

    tampilkan_hasil(nilai_list, rata, tertinggi, terendah, kategori)


main()
