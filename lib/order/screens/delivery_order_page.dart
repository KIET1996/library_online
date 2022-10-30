import 'package:flutter/material.dart';
import 'package:library_online/widgets/order_widget.dart';

class DeliveryOrderPage extends StatefulWidget {
  const DeliveryOrderPage({Key? key}) : super(key: key);

  @override
  State<DeliveryOrderPage> createState() => _DeliveryOrderPageState();
}

class _DeliveryOrderPageState extends State<DeliveryOrderPage> {
  bool isSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return OrderWidget(isSuccess: isSuccess);
          }
      ),
    );
  }
}

