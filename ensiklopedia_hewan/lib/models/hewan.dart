
class Hewan {
  final int id;
  final String nama;
  final String habitat;
  final String makanan;
  final String faktaUnik;

  Hewan({
    required this.id,
    required this.nama,
    required this.habitat,
    required this.makanan,
    required this.faktaUnik,
  });

  factory Hewan.fromJson(Map<String, dynamic> json) {
    return Hewan(
      id: json['id'],
      nama: json['nama'],
      habitat: json['habitat'],
      makanan: json['makanan'],
      faktaUnik: json['faktaUnik'],
    );
  }
}
