class BinatangModel {
  final String nama;
  final String habitat;
  final int jumlah;

  BinatangModel({
    required this.nama,
    required this.habitat,
    required this.jumlah,
  });

  BinatangModel.fromJson(Map<String, dynamic> json)
      : this(
          nama: json["nama"] as String,
          habitat: json["habitat"] as String,
          jumlah: json["jumlah"] as int,
        );

  Map<String, dynamic> toJson() {
    return {
      "nama": nama,
      "habitat": habitat,
      "jumlah": jumlah,
    };
  }
}
