kata = input("Masukkan sebuah kata: ")

kata_lower = kata.lower()

kata_reversed = kata_lower[::-1]

if kata_lower == kata_reversed:
    print(f'Kata "{kata}" adalah palindrom.')
else:
    print(f'Kata "{kata}" bukan palindrom.')
