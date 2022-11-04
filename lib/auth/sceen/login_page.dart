import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_online/constants/theme_custom.dart';
import 'package:library_online/order/screens/order_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  bool isMessage = false;
  var width = Get.width;
  var headerHeight = Get.height / 3;
  var topBox = Get.height / 4 - 32;
  var boxHeight = 400.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primaryColor,
        body: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 90,
                      width: 90,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    Text(
                      'Thư viện online'.tr.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.4
                      ),
                    ),
                    const SizedBox(height: 40,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              hintText: "Tài khoản",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              filled: true,
                              fillColor: Color(0xFFF6F6F6),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Hãy nhập tài khoản đăng nhập';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                hintText: "Mật khẩu",
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                filled: true,
                                fillColor: const Color(0xFFF6F6F6),
                                suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: _obscureText
                                        ? const Icon(Icons.visibility_off, color: Colors.black,)
                                        : const Icon(Icons.remove_red_eye, color: Colors.black,)
                                )
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Hãy nhập mật khẩu của bạn';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Text(
                          isMessage ? "Đăng nhập không thành công. Bạn đã sai mật khẩu hoặc tài khoản" : "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Get.theme.colorScheme.thirdColor,
                            fontSize: 13,
                          )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: ()async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isMessage = false;
                              });

                              bool status = true;
                              await Future.delayed(const Duration(seconds: 2),);
                              if(status){
                                Get.to(()=>const OrderPage());
                              }
                              // else{
                              //   // setState(() {
                              //   //   isMessage = true;
                              //   // });
                              // }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color:  const Color(0xFFF6F6F6),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text(
                              "Đăng nhập".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        )
    );
  }
}
