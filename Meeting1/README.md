<!--    Nama   : Felissa Vivian Margaretha
        Nim    : 1124160036
        Kelas  : TI 24 SE SH
 -->

# E-Wallet

## Deskripsi
Program ini merupakan program sederhana untuk mengelola transaksi E-Wallet.
Program memiliki dua jenis transaksi, yaitu Top Up dan Transfer.

## Fitur
- Top Up saldo
- Transfer saldo
- Validasi nominal transaksi
- Cek saldo
- Biaya admin transfer
- Menampilkan status transaksi

## Konsep yang Digunakan
### Abstraction
Menggunakan class `EWallet` dan enum `JenisTransaksi` serta `EWalletStatus`.

### Decomposition
Program dibagi menjadi beberapa fungsi:
- `isValidNominal()`
- `hitungTopUp()`
- `isSaldoCukup()`
- `hitungTransfer()`

### Algorithm
Program mengecek nominal terlebih dahulu.
Jika nominal valid, program akan mengecek jenis transaksi.
Top Up akan menambah saldo, sedangkan Transfer akan mengecek saldo sebelum mengurangi saldo.

## Status
Program memiliki 3 status:
1. Transaksi berhasil
2. Nominal tidak valid
3. Saldo tidak mencukupi

## Cara Menjalankan
1. Buka file Dart.
2. Jalankan program.
3. Program akan menampilkan hasil transaksi pada terminal.

## Contoh Output

Nama        : Feli
Saldo       : Rp150000.0
Status      : Transaksi berhasil