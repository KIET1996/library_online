import 'package:flutter/material.dart';
import 'package:library_online/widgets/order_widget.dart';

class ReceiveOrderPage extends StatefulWidget {
  const ReceiveOrderPage({Key? key}) : super(key: key);

  @override
  State<ReceiveOrderPage> createState() => _ReceiveOrderPageState();
}

class _ReceiveOrderPageState extends State<ReceiveOrderPage> {
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

