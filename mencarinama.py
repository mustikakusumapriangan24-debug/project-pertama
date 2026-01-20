deret = input("Masukkan deret nama (pisahkan dengan spasi): ").split()

deret = [str(x) for x in deret]

cari = str(input("Masukkan nama yang ingin dicari: "))

indeks_ditemukan = []

for i in range(len(deret)):
    if deret[i] == cari:
        indeks_ditemukan.append(i)

if len(indeks_ditemukan) > 0:
    
    indeks_str = ", ".join(str(i) for i in indeks_ditemukan)
    print(f"Nama {cari} ditemukan pada indeks: {indeks_str}")
else:
    print(f"Nama {cari} tidak ditemukan dalam deret.")
