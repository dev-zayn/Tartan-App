import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/model/fields.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';

import '../field_details.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({Key? key, required this.field}) : super(key: key);
  final Fields field;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.to(() => FieldDetails(
              field: field,
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colurs.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colurs.white,
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://iamm0stafamoh.pythonanywhere.com/${field.image}',
                    placeholder: (context, url) => Container(
                        width: size.width,
                        height: size.height * 0.25,
                        child:
                            const Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    field.name,
                    style: TextStyle(color: Colurs.black, fontSize: 24),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colurs.backgroundColor,
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '${field.yardsNumber} ' 'k.m',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colurs.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.45,
                    child: Text(
                      '${field.address.neighborhood} - ${field.address.nearestPoint}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(color: Colurs.grey, fontSize: 15),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colurs.lightGreen,
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      '10:00 am - 12:00 pm',
                      // '${field.worktime.openTime} - ${field.worktime.closeTime}',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colurs.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesCard extends StatelessWidget {
  ServicesCard({Key? key, required this.field}) : super(key: key);
  final String field;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.2,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Iconsax.star,
            color: Colurs.lightGreen,
          ),
          Textsax(text: field, fontSize: 13, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

Widget CarouselCard(Size size) {
  return Container(
      margin: const EdgeInsets.all(10),
      width: size.width * 0.7,
      height: size.height * 0.1,
      decoration: BoxDecoration(
          color: Colurs.white, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Image.network(
          'https://image.freepik.com/free-vector/realistic-abstract-football-background_52683-66954.jpg',
          fit: BoxFit.cover,
        ),
      ));
}
