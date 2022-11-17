import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_online/constants/theme_custom.dart';
import 'package:library_online/order/model/item_model.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key? key,
    required this.isSuccess, required this.itemOrder,
  }) : super(key: key);

  final bool isSuccess;
  final ItemModel itemOrder; 

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
                children: const [
                  Text(
                    "Moi",
                     style: TextStyle(
                      color: Colors.red,
                      fontSize: 18
                  ),
                  ),
                ]
              ),
            ),
            ExpansionTile(
              title: const Text(
                '29/10/2022: Số 1C, Trần Hoàng Na,  Hưng Lợi, Ninh Kiều, Cần thơ',
                style: TextStyle(
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
                      Text(itemOrder.dgTen),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      const Text("SĐT:"),
                      Text(itemOrder.dgSdt),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      Text("Sách mượn:"),
                      Text("Những con chim hót trong bụi mận gai:"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      Text("Tình trạng:"),
                      Text("Chờ xác nhận"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
                children:[
                  Expanded(child: Container()),
                  Container(
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
                  const SizedBox(width: 10,),
                  Container(
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
                  const SizedBox(width: 10,),
                ]
            ),
          ],
        ),
      ),
    );
  }
}