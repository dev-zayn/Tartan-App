import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/controller/password_controller.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';
import 'package:tartan/utils/txt_field_widget.dart';

class EditPaswordPage extends StatefulWidget {
  const EditPaswordPage({Key? key}) : super(key: key);

  @override
  State<EditPaswordPage> createState() => _EditPaswordPageState();
}

class _EditPaswordPageState extends State<EditPaswordPage> {
  final PasswordController passwordController = Get.put(PasswordController());

  late final TextEditingController _currentPassTextController =
      TextEditingController(text: '');
  late final TextEditingController _passTextController =
      TextEditingController(text: '');
  late final TextEditingController _repPassTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.025),
                          child: Textsax(
                              text: 'تعديل كلمة المرور',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      width: size.width,
                      height: size.height * 0.89,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          txtFormField(
                            hint: 'كلمة المرور الحالية',
                            prefixIcon: Iconsax.key,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            controller: _currentPassTextController,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          txtFormField(
                            hint: 'كلمة المرور الجديده',
                            prefixIcon: Iconsax.password_check,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            controller: _passTextController,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          txtFormField(
                            hint: 'تأكيد كلمة المرور',
                            prefixIcon: Iconsax.password_check,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            controller: _repPassTextController,
                          ),
                          SizedBox(
                            height: size.height * 0.12,
                          ),
                          MaterialButton(
                            onPressed: () {
                              passwordController.passwordChange(
                                  oldPassword: _currentPassTextController.text,
                                  newPassword1: _passTextController.text,
                                  newPassword2: _repPassTextController.text);
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.025),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide.none),
                            color: Colurs.green,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Textsax(
                                      text: 'تعديل',
                                      fontSize: 14,
                                      color: Colurs.white,
                                      fontWeight: FontWeight.bold),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.025),
                      width: size.width * 0.1,
                      height: size.width * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colurs.white),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
