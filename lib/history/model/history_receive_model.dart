import 'dart:convert';

HistoryReceiveModel historyReceiveModelFromJson(String str) => HistoryReceiveModel.fromJson(json.decode(str));

String historyReceiveModelToJson(HistoryReceiveModel data) => json.encode(data.toJson());

class HistoryReceiveModel {
  HistoryReceiveModel({
    required this.idPt,
    required this.ngayTra,
    required this.diaChi,
    required this.sDt,
    required this.docGia,
    required this.ghiChu,
    required this.tinhTrang,
    this.lyDo,
    required this.sach,
  });

  int idPt;
  DateTime ngayTra;
  String diaChi;
  String sDt;
  String docGia;
  String ghiChu;
  String tinhTrang;
  dynamic lyDo;
  List<String> sach;

  factory HistoryReceiveModel.fromJson(Map<String, dynamic> json) => HistoryReceiveModel(
    idPt: json["idPT"],
    ngayTra: DateTime.parse(json["ngayTra"]),
    diaChi: json["diaChi"],
    sDt: json["sDT"],
    docGia: json["docGia"],
    ghiChu: json["ghiChu"] ?? "",
    tinhTrang: json["tinhTrang"],
    lyDo: json["lyDo"] ?? "",
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
    "lyDo": lyDo,
    "sach": List<dynamic>.from(sach.map((x) => x)),
  };
}
