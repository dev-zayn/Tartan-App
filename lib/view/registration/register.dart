import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/controller/register_controller.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';
import 'package:tartan/view/registration/login_page.dart';

class PhoneRegister extends StatefulWidget {
  const PhoneRegister({Key? key}) : super(key: key);

  @override
  State<PhoneRegister> createState() => _PhoneRegisterState();
}

class _PhoneRegisterState extends State<PhoneRegister> {
  late final TextEditingController _firstnameTextController =
      TextEditingController(text: '');
  late final TextEditingController _phoneTextController =
      TextEditingController(text: '');
  late final TextEditingController _ageTextController =
      TextEditingController(text: '');
  late final TextEditingController _passwordTextController =
      TextEditingController(text: '');
  final MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/ob_background.png'),
                fit: BoxFit.cover,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  right: size.width * 0.09,
                  left: size.width * 0.09),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Text(
                    'مرحبا بك في',
                    style: TextStyle(fontSize: 36),
                  ),
                  const Text(
                    'تارتان',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    children: [
                      Textsax(text: 'هل لديك حساب؟ ', fontSize: 18),
                      InkWell(
                          onTap: () {
                            Get.to(const LoginPage());
                          },
                          child: Textsax(
                              text: 'تسجيل دخول',
                              fontSize: 18,
                              color: Colurs.green,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: _firstnameTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                        prefixIcon: Icon(
                          Iconsax.frame_1,
                          color: Colurs.lightGreen,
                        ),
                        hintText: 'الاسم الكامل',
                        hintStyle: TextStyle(color: Colurs.grey, fontSize: 18)),
                    style: TextStyle(
                        color: Colurs.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    maxLength: 25,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 8,
                        child: TextFormField(
                          controller: _phoneTextController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              // hintTextDirection: TextDirection.ltr,
                              fillColor: Colors.white,
                              counterText: '',
                              prefixIcon: Icon(
                                Iconsax.call,
                                color: Colurs.lightGreen,
                              ),
                              hintText: 'رقم الهاتف',
                              hintStyle:
                                  TextStyle(color: Colurs.grey, fontSize: 18)),
                          style: TextStyle(
                              color: Colurs.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.phone,
                          maxLength: 11,
                          maxLines: 1,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: size.width * 0.14,
                          height: size.height * 0.074,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Image.asset(
                            'assets/images/iq_flag.png',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: _ageTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                        prefixIcon: Icon(
                          Iconsax.cake,
                          color: Colurs.lightGreen,
                        ),
                        hintText: 'العمر',
                        hintStyle: TextStyle(color: Colurs.grey, fontSize: 18)),
                    style: TextStyle(
                        color: Colurs.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 25,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                        prefixIcon: Icon(
                          Iconsax.key,
                          color: Colurs.lightGreen,
                        ),
                        hintText: 'كلمة المرور',
                        hintStyle: TextStyle(color: Colurs.grey, fontSize: 18)),
                    style: TextStyle(
                        color: Colurs.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.visiblePassword,
                    // autofocus: true,
                    maxLength: 25,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Container(
                    width: size.width * 0.82,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          stops: [-20, 20],
                          colors: [Colurs.blue, Colurs.green],
                          begin: const Alignment(-1, -2),
                          end: const Alignment(2, 1),
                        )),
                    child: TextButton(
                        onPressed: () {
                          mainController.registerUser(
                            fullName: _firstnameTextController.text,
                            age: int.parse(_ageTextController.text),
                            phoneNumber: _phoneTextController.text,
                            password1: _passwordTextController.text,
                            password2: _passwordTextController.text,
                          );
                        },
                        child: const Text('تسجيل',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24))),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
            Positioned(
                top: size.height * 0.08,
                right: size.width * 0.085,
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 50,
                ))
          ],
        ),
      ),
    );
  }
}
