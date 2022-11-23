import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_online/constants/constant.dart';
import 'package:library_online/order/model/item_model.dart';


class OrderController extends GetxController {
  layDanhSachDonDat () async {
    try{
      List<ItemModel> listItem = [];

      var request = http.Request('GET', Uri.parse(ApiPath.API_BASE + 'danhsachdonsach'));
      http.StreamedResponse response = await request.send();
      print("Danh sach don dat status : ${response.statusCode}");

      if (response.statusCode == 200) {
        var responeData = await response.stream.bytesToString();
        var data = await jsonDecode(responeData);

        for (var x in data) {
          listItem.add(ItemModel.fromJson(x));
        }

        return listItem;
      }
      else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return [];
      }
    } catch(e){
      return [];
    }
  }

  xacNhanDon (String id) async {
    try{
      var request = http.Request('PUT', Uri.parse(ApiPath.API_BASE + 'xacnhan/$id'));
      http.StreamedResponse response = await request.send();
      print("Xac nhan don dat status : ${response.statusCode}");

      if (response.statusCode == 200) {
        var responeData = await response.stream.bytesToString();
        var data = await jsonDecode(responeData);
        if(data["success"]){
          return true;
        } else {
          return false;
        }
      }
      else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } catch(e){
      return false;
    }
  }

  tuChoiDon (String id, String message) async {
    try{
      var request = http.Request('PUT', Uri.parse(ApiPath.API_BASE + 'xacnhan/$id'));
      http.StreamedResponse response = await request.send();
      print("Xac nhan don dat status : ${response.statusCode}");

      if (response.statusCode == 200) {
        var responeData = await response.stream.bytesToString();
        var data = await jsonDecode(responeData);
        if(data["success"]){
          return true;
        } else {
          return false;
        }
      }
      else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } catch(e){
      return false;
    }
  }

}