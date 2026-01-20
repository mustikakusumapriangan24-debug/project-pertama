from datetime import datetime, timedelta

def main():

    try:
        jam = int(input("Masukkan jam: "))
        menit = int(input("Masukkan menit: "))
        detik = int(input("Masukkan detik: "))
    except ValueError:
        print("Input harus berupa angka!")
        return

    if not (0 <= jam <= 23 and 0 <= menit <= 59 and 0 <= detik <= 59):
        print("Nilai waktu tidak valid!")
        return

    waktu_awal = datetime(2025, 1, 1, jam, menit, detik)  

    waktu_baru = waktu_awal + timedelta(seconds=1)

    print(f"{waktu_baru.strftime('%H : %M : %S')}")

if __name__ == "__main__":
    main()
