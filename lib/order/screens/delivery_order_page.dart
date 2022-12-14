import 'package:flutter/material.dart';
import 'package:library_online/order/model/delivery_model.dart';
import 'package:library_online/order/repositories/order_controller.dart';
import 'package:library_online/widgets/delivery_widget.dart';

class DeliveryOrderPage extends StatefulWidget {
  const DeliveryOrderPage({Key? key}) : super(key: key);

  @override
  State<DeliveryOrderPage> createState() => _DeliveryOrderPageState();
}

class _DeliveryOrderPageState extends State<DeliveryOrderPage> {
  OrderController orderController = OrderController();
  bool isSuccess = true;
  bool isLoading = false;
  List<DeliveryModel> listItem = [];

  layDSDonDat() async {
    setState(() {
      isLoading = true;
    });
    var temp = await orderController.layDanhSachDonDat();
    setState(() {
      isLoading = false;
      if (temp.isNotEmpty){
        listItem = temp;        
      }
    });
  }

  @override
  void initState() {
    layDSDonDat();
    super.initState();
  }

  refreshData() async {
    await layDSDonDat();
    // await Future.delayed(const Duration(seconds: 2), () {});
    print("===========================> dat ======> $listItem");
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
            return DeliveryWidget(itemOrder: listItem[index], refreshDS: refreshData,);
          }
      ),
    );
  }
}

