import 'package:flutter/material.dart';
import 'package:library_online/order/model/receive_model.dart';
import 'package:library_online/order/repositories/order_controller.dart';
import 'package:library_online/widgets/receive_widget.dart';

class ReceiveOrderPage extends StatefulWidget {
  const ReceiveOrderPage({Key? key}) : super(key: key);

  @override
  State<ReceiveOrderPage> createState() => _ReceiveOrderPageState();
}

class _ReceiveOrderPageState extends State<ReceiveOrderPage> {
  OrderController orderController = OrderController();
  bool isSuccess = true;
  bool isLoading = false;
  List<ReceiveModel> listItem = [];

  layDSDonTra() async {
    setState(() {
      isLoading = true;
    });
    var temp = await orderController.layDanhSachDonTra();
    setState(() {
      isLoading = false;
      if (temp.isNotEmpty){
        listItem = temp;
      }
    });
  }

  refreshDataR() async{
    await layDSDonTra();
    // await Future.delayed(const Duration(seconds: 2), () {});
    print("===========================>tra =========> $listItem");
  }

  @override
  void initState() {
    layDSDonTra();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return isLoading
    ? const Center(
      child: CircularProgressIndicator(color: Colors.black,),
    )
    : Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, index){
            return ReceiveWidget(itemOrder: listItem[index], refreshDSR: refreshDataR,);
          }
      ),
    );
  }
}

