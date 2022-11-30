import 'dart:convert';

HistoryDeliveryModel historyDeliveryModelFromJson(String str) => HistoryDeliveryModel.fromJson(json.decode(str));

String historyDeliveryModelToJson(HistoryDeliveryModel data) => json.encode(data.toJson());

class HistoryDeliveryModel {
  HistoryDeliveryModel({
    required this.idPm,
    required this.ngayMuon,
    required this.diaChi,
    required this.sDt,
    required this.docGia,
    required this.ghiChu,
    required this.tinhTrang,
    required this.lyDo,
    required this.sach,
  });

  int idPm;
  DateTime ngayMuon;
  String diaChi;
  String sDt;
  String docGia;
  String ghiChu;
  String tinhTrang;
  String lyDo;
  List<String> sach;

  factory HistoryDeliveryModel.fromJson(Map<String, dynamic> json) => HistoryDeliveryModel(
    idPm: json["idPM"],
    ngayMuon: DateTime.parse(json["ngayMuon"]),
    diaChi: json["diaChi"],
    sDt: json["sDT"],
    docGia: json["docGia"],
    ghiChu: json["ghiChu"] ?? "",
    tinhTrang: json["tinhTrang"],
    lyDo: json["lyDo"] ?? "",
    sach: List<String>.from(json["sach"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "idPM": idPm,
    "ngayMuon": "${ngayMuon.year.toString().padLeft(4, '0')}-${ngayMuon.month.toString().padLeft(2, '0')}-${ngayMuon.day.toString().padLeft(2, '0')}",
    "diaChi": diaChi,
    "sDT": sDt,
    "docGia": docGia,
    "ghiChu": ghiChu,
    "tinhTrang": tinhTrang,
    "lyDo": lyDo,
    "sach": List<dynamic>.from(sach.map((x) => x)),
  };
}
