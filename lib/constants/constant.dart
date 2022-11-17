import 'package:get/get.dart';

class AppConstants extends GetxController {
  var textScale = 1.0.obs;
  var pageSize = 20.obs;

}

class ApiPath {
  static const String API_BASE = 'http://localhost:8000/api/';
}
