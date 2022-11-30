import 'package:flutter/material.dart';
import 'package:library_online/history/model/history_delivery_model.dart';
import 'package:library_online/history/repository/history_controller.dart';
import 'package:library_online/order/model/delivery_model.dart';
import 'package:library_online/widgets/history_delivery_widget.dart';

class DeliveryHistoryPage extends StatefulWidget {
  const DeliveryHistoryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryHistoryPage> createState() => _DeliveryHistoryPageState();
}

class _DeliveryHistoryPageState extends State<DeliveryHistoryPage> {
  HistoryController historyController = HistoryController();
  bool isSuccess = true;
  bool isLoading = false;
  List<HistoryDeliveryModel> listItem = [];

  layLSDonDat() async {
    setState(() {
      isLoading = true;
    });
    var temp = await historyController.layLichSuDonDat();
    setState(() {
      isLoading = false;
      if (temp.isNotEmpty){
        listItem = temp;
      }
    });
  }

  @override
  void initState() {
    layLSDonDat();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, index){
            return HistoryDeliveryWidget(itemHistory: listItem[index],);
          }
      ),
    );
  }
}

