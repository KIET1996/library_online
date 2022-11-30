import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_online/constants/constant.dart';
import 'package:library_online/history/model/history_delivery_model.dart';
import 'package:library_online/history/model/history_receive_model.dart';


class HistoryController extends GetxController {

  layLichSuDonDat () async {
    try{
      List<HistoryDeliveryModel> listItem = [];

      var request = http.Request('GET', Uri.parse(ApiPath.API_BASE + 'lichsudonsach'));
      http.StreamedResponse response = await request.send();
      print("Lich su don dat status : ${response.statusCode}");

      if (response.statusCode == 200) {
        var responeData = await response.stream.bytesToString();
        var data = await jsonDecode(responeData);
        for (var x in data) {
          listItem.add(HistoryDeliveryModel.fromJson(x));

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

  layLichSuDonTra () async {
    try{
      List<HistoryReceiveModel> listItem = [];

      var request = http.Request('GET', Uri.parse(ApiPath.API_BASE + 'lichsudontra'));
      http.StreamedResponse response = await request.send();
      print("Lich su don dat status : ${response.statusCode}");

      if (response.statusCode == 200) {
        var responeData = await response.stream.bytesToString();
        var data = await jsonDecode(responeData);
        for (var x in data) {
          print("Lich su donhbgvy hn dat status : ${x}");
          listItem.add(HistoryReceiveModel.fromJson(x));

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

 }