import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_online/constants/constant.dart';
import 'package:library_online/constants/route.dart';
import 'package:library_online/constants/theme_custom.dart';

void main() async {
  await GetStorage.init();
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  GetStorage config = GetStorage();

  final constantController = Get.put(AppConstants());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ThemeData theme = customTheme;


    String initialRoute = '/';

    return GetMaterialApp(
        title: 'appName'.tr,
        theme: theme,
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        initialRoute: initialRoute,
        getPages: routerPage
    );
  }
}