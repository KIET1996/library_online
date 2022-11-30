import 'dart:convert';

ReceiveModel receiveModelFromJson(String str) => ReceiveModel.fromJson(json.decode(str));

String receiveModelToJson(ReceiveModel data) => json.encode(data.toJson());

class ReceiveModel {
  ReceiveModel({
    required this.idPt,
    required this.ngayTra,
    required this.diaChi,
    required this.sDt,
    required this.docGia,
    required this.ghiChu,
    required this.tinhTrang,
    required this.trangThai,
    required this.status,
    required this.sach,
  });

  int idPt;
  DateTime ngayTra;
  String diaChi;
  String sDt;
  String docGia;
  String ghiChu;
  String tinhTrang;
  String trangThai;
  String status;
  List<String> sach;

  factory ReceiveModel.fromJson(Map<String, dynamic> json) => ReceiveModel(
    idPt: json["idPT"],
    ngayTra: DateTime.parse(json["ngayTra"]),
    diaChi: json["diaChi"],
    sDt: json["sDT"],
    docGia: json["docGia"],
    ghiChu: json["ghiChu"] ?? "",
    tinhTrang: json["tinhTrang"],
    trangThai: json["trangThai"],
    status: json["status"],
    sach: List<String>.from(json["sach"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "idPT": idPt,
    "ngayTra": "${ngayTra.year.toString().padLeft(4, '0')}-${ngayTra.month.toString().padLeft(2, '0')}-${ngayTra.day.toString().padLeft(2, '0')}",
    "diaChi": diaChi,
    "sDT": sDt,
    "docGia": docGia,
    "ghiChu": ghiChu,
    "tinhTrang": tinhTrang,
    "trangThai": trangThai,
    "status": status,
    "sach": List<dynamic>.from(sach.map((x) => x)),
  };
}
