import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/list_tile.dart';
import 'package:tartan/utils/text_widget.dart';

import 'edit_account_info.dart';
import 'edit_password.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
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
                              text: 'اعدادات الحساب',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Tilesax(
                        context: context,
                        title: 'تعديل الحساب',
                        subtitle:
                            'تعديل الاسم الكامل, رقم الهاتف, صورة المستخدم',
                        leading: Container(
                          child: Icon(
                            Iconsax.user_edit,
                            color: Colurs.green,
                          ),
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                              color: Colurs.lightGreen, shape: BoxShape.circle),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colurs.green,
                        ),
                        navigateTo: const EditAccountInfoPage()),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Tilesax(
                        context: context,
                        title: 'تعديل كلمة المرور',
                        subtitle: 'تغيير كلمة مرور حسابك',
                        leading: Container(
                          child: Icon(
                            Iconsax.key,
                            color: Colurs.green,
                          ),
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                              color: Colurs.lightGreen, shape: BoxShape.circle),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colurs.green,
                        ),
                        navigateTo: const EditPaswordPage()),
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
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.025),
                      width: size.width * 0.1,
                      height: size.width * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
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
