import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_online/constants/theme_custom.dart';
import 'package:library_online/order/model/receive_model.dart';
import 'package:library_online/order/repositories/order_controller.dart';
import 'package:library_online/order/screens/receive_order_page.dart';
import 'package:library_online/widgets/message_popup.dart';

class ReceiveWidget extends StatefulWidget {
  const ReceiveWidget({
    Key? key,
   required this.itemOrder, required this.refreshDSR,
  }) : super(key: key);

  final ReceiveModel itemOrder;
  final VoidCallback refreshDSR;

  @override
  State<ReceiveWidget> createState() => _ReceiveWidgetState();
}

class _ReceiveWidgetState extends State<ReceiveWidget> {
  OrderController orderController = OrderController();
  TextEditingController ghichuController = TextEditingController();
  String strDate = '';
  String dsSach = '';

  typeOrder(String s) {
    switch (s) {
      case "dalaysach":
        return "Đã giao";
      case "choxacnhan":
        return "Xác nhận";
      case "daxacnhan":
        return "Lấy sách";
      default:
        return "Xác nhận";
    }
  }

  typeCancle(String s) {
    switch (s) {
      case "dalaysach":
        return "Hủy";
      case "choxacnhan":
        return "Từ chối";
      case "daxacnhan":
        return "Hủy";
      default:
        return "Từ chối";
    }
  }


  @override
  void initState() {
    strDate = DateFormat("dd/MM/yyyy").format(widget.itemOrder.ngayTra);
    for (var x in widget.itemOrder.sach){
      dsSach = dsSach + x + ",";
    }
    print("==========> ${dsSach}");
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
              child: Row(
                  children: [
                    Text(
                      widget.itemOrder.tinhTrang,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18
                      ),
                    ),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      strDate + ": " + widget.itemOrder.diaChi,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children:  [
                  Text(widget.itemOrder.docGia),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Text("SĐT: "),
                  Text(widget.itemOrder.sDt),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sách mượn: "),
                  Expanded(child: Text(dsSach)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Text("Tình trạng: "),
                  Text(widget.itemOrder.trangThai),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ghichuController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lý do: ',
                    isDense: true
                ),
              ),
            ),
            // ExpansionTile(
            //   title: Text(
            //     strDate + ": " + widget.itemOrder.diaChi,
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
            //         children:  [
            //           Text(widget.itemOrder.docGia),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           const Text("SĐT: "),
            //           Text(widget.itemOrder.sDt),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           const Text("Sách mượn: "),
            //           Text(dsSach),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: Row(
            //         children: [
            //           const Text("Tình trạng: "),
            //           Text(widget.itemOrder.trangThai),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Row(
                children:[
                  Expanded(child: Container()),
                  InkWell(
                    onTap:()async{
                      bool status = await orderController.tuChoiDonTra(widget.itemOrder.idPt.toString(), ghichuController.text.trim());
                      ghichuController.text = "";
                      if(status){
                        widget.refreshDSR();
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackAlert.showSnackBar("Từ chối thành công"));

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackAlert.showSnackBar("Từ chối không thành công"));
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(Icons.clear, color: Colors.red,),
                            const SizedBox(width: 5,),
                            Text(
                              typeCancle(widget.itemOrder.status),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () async {
                      bool status = await orderController.xacNhanDonTra(widget.itemOrder.idPt.toString());
                      if(status){
                        widget.refreshDSR();
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackAlert.showSnackBar("Xác nhận thành công"));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackAlert.showSnackBar("Xác nhận không thành công"));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: const [
                          Icon(Icons.check, color: Colors.green,),
                          SizedBox(width: 5,),
                          Text(
                            "Xác nhận",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          )

                        ],
                      )
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