import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/controller/field_controller.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/view/widget/field_card.dart';

class FeedPage extends StatelessWidget {
  FeedPage({Key? key}) : super(key: key);
  final FieldController fieldController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colurs.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.all(15),
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //       decoration: BoxDecoration(
            //           color: Colurs.white,
            //           borderRadius: BorderRadius.circular(15)),
            //       child: Row(
            //         children: [
            //           Icon(
            //             Iconsax.location,
            //             color: Colurs.green,
            //           ),
            //           const Text(
            //             ' بغداد - الشعب',
            //             style: TextStyle(fontSize: 18),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                  color: Colurs.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Container(
                      width: size.width * 0.8,
                      height: 70,
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'بحث عن ملعب',
                            hintStyle: TextStyle(fontSize: 14, height: 3),
                            prefixIcon: Icon(
                              Iconsax.search_normal,
                              color: Colurs.lightGreen,
                            ),
                            filled: true,
                            fillColor: Colurs.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent),
                            ),
                            errorMaxLines: 1,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.22,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CarouselCard(size),
                  CarouselCard(size),
                  CarouselCard(size),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(7),
                  child: const Text(
                    'الملاعب القريبة',
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            GetBuilder<FieldController>(builder: (fieldController) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (_context, index) {
                  return FieldCard(
                    field: fieldController.fieldList[index],
                  );
                },
                itemCount: fieldController.fieldList.length,
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> refresh() {
    fieldController.fieldList = [];
    return fieldController.getFields();
  }
}
