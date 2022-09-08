import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tartan/controller/field_controller.dart';
import 'package:tartan/utils/colours.dart';

import 'widget/fav_card.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);
  final FieldController fieldController = Get.find();

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                      'مفضلاتي',
                      style: TextStyle(fontSize: 18),
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
                    return FavFieldCard(
                      field: fieldController.favList[index],
                    );
                  },
                  itemCount: fieldController.favList.length,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> refresh() {
    fieldController.favList = [];
    return fieldController.getFavFields();
  }
}
