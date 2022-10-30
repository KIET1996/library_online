import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_online/constants/theme_custom.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFCEB8B8),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "THƯ VIỆN ONLINE",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          automaticallyImplyLeading: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.menu, size: 30, color: Colors.black,),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                buildUnits("ĐƠN SÁCH", null, true),
                buildUnits("LỊCH SỬ GIAO HÀNG", null, false),
                buildUnits("ĐĂNG XUẤT", const Icon(Icons.logout), false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildUnits(title, icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border:Border(
                    bottom: !isActive ? BorderSide.none : const BorderSide(
                        width: 1,
                        color: Colors.black
                    )
                )

            ),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black
              ),
            ),
          ),
          const SizedBox(width: 5,),
          icon ?? Container(),
        ],
      ),
    );
  }
}