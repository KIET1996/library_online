import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_online/auth/sceen/login_page.dart';
import 'package:library_online/constants/theme_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_home.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.5),
                child: Container(
                  constraints: const BoxConstraints(
                      maxHeight: 180,
                      maxWidth: 280
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/title.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: ()=>Get.to(()=>const LoginPage()),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primaryColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      constraints: const BoxConstraints(
                        minHeight: 40
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
