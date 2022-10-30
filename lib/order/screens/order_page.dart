import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_online/constants/theme_custom.dart';
import 'package:library_online/order/screens/delivery_order_page.dart';
import 'package:library_online/order/screens/receive_order_page.dart';
import 'package:library_online/widgets/drawer_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DeliveryOrderPage(),
    ReceiveOrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(numberPage: 0,),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Get.theme.colorScheme.secondaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu, size: 30, color: Colors.black,)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Phạm Thị Phụng",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50
                        ),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0 ? Get.theme.colorScheme.thirdAccentColor : const Color(0xFFEDEDED),
                        ),
                        child: const Center(
                          child: Text(
                            "Đơn đặt sách",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Container(
                        constraints: const BoxConstraints(
                            minHeight: 50
                        ),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1 ? Get.theme.colorScheme.thirdAccentColor : const Color(0xFFEDEDED),
                        ),
                        child: const Center(
                          child: Text(
                            "Đơn trả sách",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
