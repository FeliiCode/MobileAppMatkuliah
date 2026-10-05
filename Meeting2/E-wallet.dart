// Abstraction

enum JenisTransaksi {
  TopUp,
  Transfer,
}

enum EWalletStatus {
  success,
  invalidNominal,
  saldoTidakCukup,
}

class EWallet {
  final String nama;
  double saldo;
  final JenisTransaksi jenis;

 EWallet({
  required this.nama,
  required this.saldo,
  required this.jenis,
});
}

// Data

const double biayaAdmin = 2500;

final List<EWallet> ewallets = [];

// Decomposition

bool isValidNominal(double nominal) {
  return nominal > 0;
}

double hitungTopUp(double saldo, double nominal) {
  return saldo + nominal;
}

bool isSaldoCukup(double saldo, double nominal) {
  return saldo >= nominal + biayaAdmin;
}

double hitungTransfer(double saldo, double nominal) {
  return saldo - nominal - biayaAdmin;
}

// Algorithm
EWalletStatus prosesTransaksi(EWallet akun, double nominal) {

  if (!isValidNominal(nominal)) {
    return EWalletStatus.invalidNominal;
  }

  if (akun.jenis == JenisTransaksi.TopUp) {
    akun.saldo = hitungTopUp(akun.saldo, nominal);
    ewallets.add(akun);
    return EWalletStatus.success;
  }

  if (akun.jenis == JenisTransaksi.Transfer) {

    if (!isSaldoCukup(akun.saldo, nominal)) {
      return EWalletStatus.saldoTidakCukup;
    }

    akun.saldo = hitungTransfer(akun.saldo, nominal);
    ewallets.add(akun);
    return EWalletStatus.success;
  }

  return EWalletStatus.success;
}

// status message

String tampilkanHasil(EWalletStatus status) {

  if (status == EWalletStatus.success) {
    return 'Transaksi berhasil';
  }

  if (status == EWalletStatus.invalidNominal) {
    return 'Nominal tidak valid';
  }

  if (status == EWalletStatus.saldoTidakCukup) {
    return 'Saldo tidak mencukupi';
  }

  return '';
}



void main() {

  final akun1  = EWallet( // ini nanti keluarnya 'Transaksi Berhasil'
    nama: 'Feli',
    saldo: 100000,
    jenis: JenisTransaksi.TopUp,
  );

  final hasil1 = prosesTransaksi(akun1, 40000);

  print('Nama        : ${akun1.nama}');
  print('Saldo       : Rp${akun1.saldo}');
  print('Status      : ${tampilkanHasil(hasil1)}');

  final akun2  = EWallet( // ini nanti keluarnya 'Invalid'
    nama: 'Feli',
    saldo: 100000,
    jenis: JenisTransaksi.Transfer,
  );

  final hasil2 = prosesTransaksi(akun1, 0);

  print('Nama        : ${akun2.nama}');
  print('Saldo       : Rp${akun2.saldo}');
  print('Status      : ${tampilkanHasil(hasil2)}');

  final akun3  = EWallet( // ini nanti keluarnya 'Saldo tidak mencukupi'
    nama: 'Feli',
    saldo: 100000,
    jenis: JenisTransaksi.Transfer,
  );

  final hasil3 = prosesTransaksi(akun3, 1000000000000000);

  print('Nama        : ${akun3.nama}');
  print('Saldo       : Rp${akun3.saldo}');
  print('Status      : ${tampilkanHasil(hasil3)}');
}