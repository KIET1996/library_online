import 'package:flutter/material.dart';
import 'package:library_online/widgets/history_widget.dart';

class ReceiveHistoryPage extends StatefulWidget {
  const ReceiveHistoryPage({Key? key}) : super(key: key);

  @override
  State<ReceiveHistoryPage> createState() => _ReceiveHistoryPageState();
}

class _ReceiveHistoryPageState extends State<ReceiveHistoryPage> {
  bool isSuccess = false;
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