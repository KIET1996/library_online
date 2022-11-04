import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_online/history/screens/histories_page.dart';
import 'package:library_online/home/home_page.dart';
import 'package:library_online/order/screens/order_page.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
    required this.numberPage
  }) : super(key: key);
  final int numberPage;

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
          leading: const Icon(Icons.account_circle_outlined, color: Colors.black, size: 30,),
          title: const Text(
            "Phạm Thị Phụng",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                InkWell(
                    onTap: (){
                      Get.to(()=>const OrderPage());
                    },
                    child: buildUnits("ĐƠN SÁCH", null, widget.numberPage == 0 ? true : false)
                ),
                InkWell(
                    onTap: (){
                      Get.to(()=>const HistoryPage());
                    },
                    child: buildUnits("LỊCH SỬ GIAO HÀNG", null, widget.numberPage == 1 ? true : false)
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>const HomePage());
                  },
                  child: buildUnits("ĐĂNG XUẤT", const Icon(Icons.logout), false)
                ),
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