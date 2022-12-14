import 'dart:convert';

DeliveryModel deliveryModelFromJson(String str) => DeliveryModel.fromJson(json.decode(str));

String deliveryModelToJson(DeliveryModel data) => json.encode(data.toJson());

class DeliveryModel {
    DeliveryModel({
        required this.idPm,
        required this.ngayMuon,
        required this.diaChi,
        required this.sDt,
        required this.docGia,
        this.ghiChu,
        required this.tinhTrang,
        required this.trangThai,
        required this.sach,
        required this.status,
    });

    int idPm;
    DateTime ngayMuon;
    String diaChi;
    String sDt;
    String docGia;
    dynamic ghiChu;
    String tinhTrang;
    String trangThai;
    List<String> sach;
    String status;

    factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        idPm: json["idPM"],
        ngayMuon: DateTime.parse(json["ngayMuon"]),
        diaChi: json["diaChi"],
        sDt: json["sDT"],
        docGia: json["docGia"],
        ghiChu: json["ghiChu"],
        tinhTrang: json["tinhTrang"],
        trangThai: json["trangThai"],
        sach: List<String>.from(json["sach"].map((x) => x)),
        status: json["status"]
    );

    Map<String, dynamic> toJson() => {
        "idPM": idPm,
        "ngayMuon": "${ngayMuon.year.toString().padLeft(4, '0')}-${ngayMuon.month.toString().padLeft(2, '0')}-${ngayMuon.day.toString().padLeft(2, '0')}",
        "diaChi": diaChi,
        "sDT": sDt,
        "docGia": docGia,
        "ghiChu": ghiChu,
        "tinhTrang": tinhTrang,
        "trangThai": trangThai,
        "sach": List<dynamic>.from(sach.map((x) => x)),
        "status": status
    };
}

