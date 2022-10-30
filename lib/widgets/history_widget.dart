import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_online/constants/theme_custom.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
    required this.isSuccess,
  }) : super(key: key);

  final bool isSuccess;

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
                    children: const [
                      Text("Châu Nhựt Minh"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      Text("SĐT:"),
                      Text("0123456789:"),
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
                      Text("Lý do:"),
                      Text("Những con chim hót trong bụi mận gai:"),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color: isSuccess ? Colors.green : const Color(0xFFF69F4E),
                        )
                    ),
                    child: isSuccess
                        ? const Text(
                      "Thành công",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    )
                        : const Text(
                      "Thất bại",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF69F4E)
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