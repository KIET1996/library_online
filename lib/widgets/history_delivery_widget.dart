import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_online/constants/theme_custom.dart';
import 'package:library_online/history/model/history_order_model.dart';
import 'package:library_online/order/model/item_model.dart';

class HistoryDeliveryWidget extends StatefulWidget {
  const HistoryDeliveryWidget({
    Key? key,
    required this.itemHistory,
  }) : super(key: key);
  final HistoryOrderModel itemHistory;

  @override
  State<HistoryDeliveryWidget> createState() => _HistoryDeliveryWidgetState();
}

class _HistoryDeliveryWidgetState extends State<HistoryDeliveryWidget> {
  String strDate = '';
  String dsSach = '';

  @override
  void initState() {
    strDate = DateFormat("dd/MM/yyyy").format(widget.itemHistory.ngayMuon);
    if(widget.itemHistory.sach.isNotEmpty){
      for (var x in widget.itemHistory.sach){
        if(x.isNotEmpty){
          dsSach = dsSach + x + ",";
        }
      }
}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.thirdAccentColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  strDate + ": " + widget.itemHistory.diaChi,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(widget.itemHistory.docGia),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Text("SĐT:"),
                  Text(widget.itemHistory.sDt),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Text("Sách mượn:"),
                  Text(dsSach),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Text("Lý do:"),
                  Text(widget.itemHistory.lyDo),
                ],
              ),
            ),
            // ExpansionTile(
            //   title: Text(
            //     strDate + ": " + widget.itemHistory.diaChi,
            //     style: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 18
            //     ),
            //   ),
            //   tilePadding: const EdgeInsets.all(8),
            //   trailing: const SizedBox(),
            //   children:[
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           Text(widget.itemHistory.docGia),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           const Text("SĐT:"),
            //           Text(widget.itemHistory.sDt),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           const Text("Sách mượn:"),
            //           Text(dsSach),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           const Text("Lý do:"),
            //           Text(widget.itemHistory.lyDo),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Row(
                children:[
                  Expanded(child: Container()),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color: widget.itemHistory.tinhTrang == "Đã hủy" ? Colors.redAccent : Colors.green,
                        )
                    ),
                    child: widget.itemHistory.tinhTrang ==  "Đã hủy"
                        ? const Text(
                      "Thất bại",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    )
                        : const Text(
                      "Thành công",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.green
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                ]
            ),
          ],
        ),
      ),
    );
  }
}