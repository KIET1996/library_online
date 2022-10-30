import 'package:flutter/material.dart';
import 'package:library_online/widgets/history_widget.dart';

class DeliveryHistoryPage extends StatefulWidget {
  const DeliveryHistoryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryHistoryPage> createState() => _DeliveryHistoryPageState();
}

class _DeliveryHistoryPageState extends State<DeliveryHistoryPage> {
  bool isSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return HistoryWidget(isSuccess: isSuccess);
          }
      ),
    );
  }
}

