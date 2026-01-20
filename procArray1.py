deret = input("Masukkan deret angka (pisahkan dengan spasi): ").split()

deret = [int(x) for x in deret]

cari = int(input("Masukkan angka yang ingin dicari: "))

indeks_ditemukan = []

for i in range(len(deret)):
    if deret[i] == cari:
        indeks_ditemukan.append(i)

if len(indeks_ditemukan) > 0:
    
    indeks_str = ", ".join(str(i) for i in indeks_ditemukan)
    print(f"Angka {cari} ditemukan pada indeks: {indeks_str}")
else:
    print(f"Angka {cari} tidak ditemukan dalam deret.")
