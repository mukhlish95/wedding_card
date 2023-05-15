class WishModel {
  final int id;
  final String nama;
  final String komen;

  const WishModel({
    required this.id,
    required this.nama,
    required this.komen,
  });

  factory WishModel.fromJson(Map<String, dynamic> json) {
    return WishModel(
      id: json['id'],
      nama: json['nama'],
      komen: json['komen'],
    );
  }
}
