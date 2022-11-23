import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:library_online/constants/constant.dart';


class LoginController extends GetxController {
  GetStorage user = GetStorage();

  Future<bool> loginUser({required String username, required String password}) async {
    try{

      var request = http.Request('POST', Uri.parse( ApiPath.API_BASE + "login?username=$username&password=$password"));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        var rs = json.decode(data);
        if(rs["success"]){
          return true;   
        }
        return false;    
      }
      else {
        print("=========================> Dang nhap: 22y7");
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } catch(e){
      print("=========================> Dang nhap: 2 $e");
      return false;
    }
  }
}