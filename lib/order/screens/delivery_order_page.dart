import 'package:flutter/material.dart';
import 'package:library_online/order/model/item_model.dart';
import 'package:library_online/order/repositories/order_controller.dart';
import 'package:library_online/widgets/order_widget.dart';

class DeliveryOrderPage extends StatefulWidget {
  const DeliveryOrderPage({Key? key}) : super(key: key);

  @override
  State<DeliveryOrderPage> createState() => _DeliveryOrderPageState();
}

class _DeliveryOrderPageState extends State<DeliveryOrderPage> {
  OrderController orderController = OrderController();
  bool isSuccess = true;
  bool isLoading = false;
  List<ItemModel> listItem = [];

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
            return OrderWidget(isSuccess: isSuccess, itemOrder: listItem[index],);
          }
      ),
    );
  }
}

