class WishModel {
  final int id;
  final String nama;
  final String notel;
  final String kehadiran;

  const WishModel({
    required this.id,
    required this.nama,
    required this.notel,
    required this.kehadiran,
  });

  factory WishModel.fromJson(Map<String, dynamic> json) {
    return WishModel(
      id: json['id'],
      nama: json['nama'],
      notel: json['no_tel'],
      kehadiran: json['kehadiran'],
    );
  }
}
