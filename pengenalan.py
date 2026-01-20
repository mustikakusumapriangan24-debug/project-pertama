
nama = input("Masukkan nama Anda: ")
umur = int(input("Masukkan umur Anda: "))


print(f"Halo {nama}, umur Anda {umur} tahun.")

sisa_tahun = 100 - umur
print(f"Anda akan berusia 100 tahun lagi {sisa_tahun} tahun.\n")


nilai = int(input("Masukkan nilai Anda (0–100): "))


if 90 <= nilai <= 100:
    kategori = "A (Sangat Baik)"
elif 75 <= nilai < 90:
    kategori = "B (Baik)"
elif 60 <= nilai < 75:
    kategori = "C (Cukup)"
else:
    kategori = "D (Kurang)"

print(f"Nilai Anda: {nilai} termasuk kategori {kategori}\n")


batas = int(input("Masukkan angka: "))

print("Deret ganjil:", end=" ")
for i in range(1, batas + 1):
    if i % 2 != 0:
        print(i, end=" ")

print()  
