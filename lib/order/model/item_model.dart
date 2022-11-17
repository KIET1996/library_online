import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
    ItemModel({
        required this.pmolId,
        required this.pmolNgaymuon,
        required this.pmolHantra,
        required this.pmolSdt,
        required this.pmolDiachi,
        required this.pmolGhichu,
        required this.pmolTrangthai,
        required this.dgId,
        required this.createdAt,
        required this.updatedAt,
        required this.pmolLydothatbai,
        required this.dgTen,
        required this.dgSdt,
        required this.dgDiachi,
        required this.dgGioitinh,
        required this.dgEmail,
        required this.dgNgaymo,
        this.dgHinhanh,
        required this.username,
        required this.password,
    });

    int pmolId;
    DateTime pmolNgaymuon;
    DateTime pmolHantra;
    String pmolSdt;
    String pmolDiachi;
    String pmolGhichu;
    int pmolTrangthai;
    int dgId;
    DateTime createdAt;
    DateTime updatedAt;
    String pmolLydothatbai;
    String dgTen;
    String dgSdt;
    String dgDiachi;
    int dgGioitinh;
    String dgEmail;
    DateTime dgNgaymo;
    dynamic dgHinhanh;
    String username;
    String password;

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        pmolId: json["pmol_id"],
        pmolNgaymuon: DateTime.parse(json["pmol_ngaymuon"]),
        pmolHantra: DateTime.parse(json["pmol_hantra"]),
        pmolSdt: json["pmol_sdt"],
        pmolDiachi: json["pmol_diachi"],
        pmolGhichu: json["pmol_ghichu"],
        pmolTrangthai: json["pmol_trangthai"],
        dgId: json["dg_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pmolLydothatbai: json["pmol_lydothatbai"],
        dgTen: json["dg_ten"],
        dgSdt: json["dg_sdt"],
        dgDiachi: json["dg_diachi"],
        dgGioitinh: json["dg_gioitinh"],
        dgEmail: json["dg_email"],
        dgNgaymo: DateTime.parse(json["dg_ngaymo"]),
        dgHinhanh: json["dg_hinhanh"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "pmol_id": pmolId,
        "pmol_ngaymuon": "${pmolNgaymuon.year.toString().padLeft(4, '0')}-${pmolNgaymuon.month.toString().padLeft(2, '0')}-${pmolNgaymuon.day.toString().padLeft(2, '0')}",
        "pmol_hantra": "${pmolHantra.year.toString().padLeft(4, '0')}-${pmolHantra.month.toString().padLeft(2, '0')}-${pmolHantra.day.toString().padLeft(2, '0')}",
        "pmol_sdt": pmolSdt,
        "pmol_diachi": pmolDiachi,
        "pmol_ghichu": pmolGhichu,
        "pmol_trangthai": pmolTrangthai,
        "dg_id": dgId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pmol_lydothatbai": pmolLydothatbai,
        "dg_ten": dgTen,
        "dg_sdt": dgSdt,
        "dg_diachi": dgDiachi,
        "dg_gioitinh": dgGioitinh,
        "dg_email": dgEmail,
        "dg_ngaymo": "${dgNgaymo.year.toString().padLeft(4, '0')}-${dgNgaymo.month.toString().padLeft(2, '0')}-${dgNgaymo.day.toString().padLeft(2, '0')}",
        "dg_hinhanh": dgHinhanh,
        "username": username,
        "password": password,
    };
}
