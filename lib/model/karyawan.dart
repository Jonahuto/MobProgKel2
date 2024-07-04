class Karyawan{
  String? id;
  String namaKaryawan;
  String nip;
  String tgllahir;
  String tanggal;
  String jammasuk;
  String jamkeluar;

  Karyawan({this.id, 
  required this.namaKaryawan, 
  required this.nip, 
  required this.tgllahir,
  required this.tanggal,
  required this.jammasuk,
  required this.jamkeluar

  });
  factory Karyawan.fromJson(Map<String, dynamic> json) =>
    Karyawan(id: json["id"], 
    namaKaryawan: json["nama"], 
    nip: json["nip"], 
    tgllahir: json["tgllahir"], 
    tanggal: json["tanggal"],
    jammasuk: json["jammasuk"],
    jamkeluar: json["jamkeluar"]
    );
  Map<String, dynamic> toJson() => {
    "nama": namaKaryawan,
    "nip": nip,
    "tgllahir": tgllahir, 
    "tanggal": tanggal,
    "jammasuk":jammasuk,
    "jamkeluar": jamkeluar
   }; 
}