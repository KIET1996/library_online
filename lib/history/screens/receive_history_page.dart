import 'package:flutter/material.dart';
import 'package:library_online/history/model/history_receive_model.dart';
import 'package:library_online/history/repository/history_controller.dart';
import 'package:library_online/widgets/history_receive_widget.dart';

class ReceiveHistoryPage extends StatefulWidget {
  const ReceiveHistoryPage({Key? key}) : super(key: key);

  @override
  State<ReceiveHistoryPage> createState() => _ReceiveHistoryPageState();
}

class _ReceiveHistoryPageState extends State<ReceiveHistoryPage> {
  HistoryController historyController = HistoryController();
  bool isSuccess = true;
  bool isLoading = false;

  List<HistoryReceiveModel> listItem = [];

  layLSDonTra() async {
    setState(() {
      isLoading = true;
    });
    var temp = await (historyController.layLichSuDonTra())!;
    setState(() {
      isLoading = false;
      if (temp.isNotEmpty){
        listItem = temp;
      }
    });
  }

  @override
  void initState() {
    layLSDonTra();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, index){
            // return Container();
            return HistoryReceiveWidget(itemHistory: listItem[index],);
          }
      ),
    );
  }
}