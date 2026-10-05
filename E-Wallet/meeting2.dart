String getGrade(int nilai) {
  if (nilai >= 80) {
    return "A";
  } else if (nilai >= 70) {
    return "B";
  } else if (nilai >= 60) {
    return "C";
  }
  return "D";
}

void main() {
  print("Hdfhr");
  print("Hdfhr");
  print(getGrade(95));
  // print(greet("Junaedy"));
  cetakJadwalHari("Sabtu");
}

void cetakJadwalHari(String hari) {
  switch (hari) {
    case 'Sabtu':
    case 'Minggu':
      print('Libur');
    default:
      print('Hari kuliah');
  }
}
