import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';

import 'dashboard.dart';
import 'profile/component/edit_account.dart';
import 'route_checker.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colurs.white,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  'حسابي',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('الحساب'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(EditAccountPage());
                    },
                    title: Text(
                      box.read('full_name'),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      box.read('phNumber'),
                      style: TextStyle(fontSize: 18, color: Colurs.grey),
                    ),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colurs.lightGreen,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(Iconsax.frame_1),
                    ),
                    trailing: Icon(
                      Iconsax.arrow_left_24,
                      color: Colurs.lightGreen,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colurs.white,
                    contentPadding: const EdgeInsets.all(15),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('الاعدادات'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => const EditAccountPage());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colurs.white,
                    title: Text(
                      'الحجوزات السابقة',
                      style: TextStyle(fontSize: 18, color: Colurs.black),
                    ),
                    leading: Icon(
                      Iconsax.calendar_1,
                      color: Colurs.lightGreen,
                    ),
                    contentPadding: const EdgeInsets.all(5),
                  ),
                  if (box.read('isOwner') != null && box.read('isOwner'))
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const DashboardPage());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: Colurs.white,
                        title: Text(
                          'طلبات الحجز',
                          style: TextStyle(fontSize: 18, color: Colurs.black),
                        ),
                        leading: Icon(
                          Iconsax.calendar_1,
                          color: Colurs.lightGreen,
                        ),
                        contentPadding: const EdgeInsets.all(5),
                      ),
                    )
                  else
                    Container(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colurs.white,
                    title: Text(
                      'الاعدادات',
                      style: TextStyle(fontSize: 18, color: Colurs.black),
                    ),
                    leading: Icon(
                      Iconsax.setting,
                      color: Colurs.lightGreen,
                    ),
                    contentPadding: const EdgeInsets.all(5),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colurs.white,
                    title: Text(
                      'الابلاغ عن مشكلة',
                      style: TextStyle(fontSize: 18, color: Colurs.black),
                    ),
                    leading: Icon(
                      Iconsax.warning_2,
                      color: Colurs.lightGreen,
                    ),
                    contentPadding: const EdgeInsets.all(5),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.45,
                        height: 65,
                        decoration: BoxDecoration(
                            color: const Color(0xff3B5998),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Textsax(
                              text: 'TarTan - تارتان',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        width: size.width * 0.45,
                        height: 65,
                        decoration: BoxDecoration(
                            color: const Color(0xff8A3AB9),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Textsax(
                              text: '@tartan_iq',
                              fontSize: 20,
                              textDirection: TextDirection.ltr,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListTile(
                    onTap: () {
                      // box.remove('full_name');
                      // box.remove('phNumber');
                      // box.remove('age');
                      // box.remove('address');
                      // box.remove('yardID');
                      // box.remove('token');
                      box.erase();
                      Get.offAll(() => routeChecker());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colurs.white,
                    title: const Text(
                      'تسجيل خروج',
                      style: const TextStyle(fontSize: 18, color: Colors.pink),
                    ),
                    leading: const Icon(
                      Iconsax.logout,
                      color: Colors.pink,
                    ),
                    contentPadding: const EdgeInsets.all(5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
