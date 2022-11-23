import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_online/constants/theme_custom.dart';
import 'package:library_online/order/model/item_model.dart';
import 'package:library_online/order/repositories/order_controller.dart';
import 'package:library_online/widgets/message_popup.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({
    Key? key,
    required this.isSuccess, required this.itemOrder,
  }) : super(key: key);

  final bool isSuccess;
  final ItemModel itemOrder; 

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  OrderController orderController = OrderController();
  String strDate = '';
  String dsSach = '';

  @override
  void initState() {
    strDate = DateFormat("dd/MM/yyyy hh:mm").format(widget.itemOrder.ngayMuon);
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
            ExpansionTile(
              title: Text(
                strDate + ": " + widget.itemOrder.diaChi,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              ),
              tilePadding: const EdgeInsets.all(8),
              trailing: const SizedBox(),
              children:[
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
                    children: [
                      const Text("Sách mượn: "),
                      Text(dsSach),
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
              ],
            ),
            Row(
                children:[
                  Expanded(child: Container()),
                  InkWell(
                    onTap:()async{
                      bool status = await orderController.tuChoiDon(widget.itemOrder.idPm.toString(), "Tu choi");
                      if(status){
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackAlert.showSnackBar("Từ chối thành công"));     
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(CustomSnackAlert.showSnackBar("Từ chối không thành công"));
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Icon(Icons.clear, color: Colors.red,),
                            SizedBox(width: 5,),
                            Text(
                              "Từ chối",
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
                  InkWell(
                    onTap: () async {
                      bool status = await orderController.xacNhanDon(widget.itemOrder.idPm.toString());
                      if(status){
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