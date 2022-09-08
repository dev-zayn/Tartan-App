import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:tartan/controller/booking_controller.dart';
import 'package:tartan/controller/field_controller.dart';
import 'package:tartan/model/fields.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';

import 'widget/field_card.dart';

class FieldDetails extends StatefulWidget {
  const FieldDetails({Key? key, required this.field}) : super(key: key);
  final Fields field;

  @override
  State<FieldDetails> createState() => _FieldDetailsState();
}

class _FieldDetailsState extends State<FieldDetails> {
  final FieldController fieldController = Get.find();
  final BookingController bookingController = Get.put(BookingController());
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    fieldController.fieldImagesList = [];
    fieldController.getFieldImages(widget.field.id);
    fieldController.getFavField(widget.field.id);
    GetStorage().write(widget.field.id, false);
    Size size = MediaQuery.of(context).size;
    String dateFormated =
        DateFormat("hh:mm yyyy-MM-dd").format(_selectedValue).toString();

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colurs.backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              width: size.width,
              height: size.height * 0.25,
              child: GetBuilder<FieldController>(builder: (fieldController) {
                return CarouselSlider(
                  options: CarouselOptions(
                      disableCenter: false,
                      autoPlay: true,
                      viewportFraction: 1),
                  items: fieldController.fieldImagesList
                      .map((item) => Image.network(
                            'https://iamm0stafamoh.pythonanywhere.com${item.yardimage}',
                            width: size.width,
                            fit: BoxFit.fill,
                          ))
                      .toList(),
                );
              }),
            ),
            Positioned(
              top: size.height * 0.2,
              left: size.width * 0.05,
              width: size.width * 0.9,
              height: size.height * 0.9,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.height * 0.02),
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textsax(
                                text: widget.field.name,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            InkWell(
                              onTap: () {
                                fieldController.setFieldFav(widget.field.id);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colurs.lightGrey,
                                ),
                                child: GetBuilder<FieldController>(
                                    builder: (controller) {
                                  return Icon(Icons.favorite,
                                      color: GetStorage().read(widget.field.id)
                                          ? Colurs.green
                                          : Colurs.lightGreen);
                                }),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Row(
                          children: [
                            Textsax(
                              text: '${widget.field.address.neighborhood} - ',
                              fontSize: 15,
                              color: Colurs.grey,
                            ),
                            Textsax(
                              text: widget.field.address.nearestPoint,
                              fontSize: 15,
                              color: Colurs.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colurs.lightGrey),
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Textsax(
                                            text: 'k.m ',
                                            fontSize: 14,
                                            color: Colurs.blue),
                                        Textsax(
                                            text: '${widget.field.yardsNumber}',
                                            color: Colurs.blue,
                                            fontSize: 14),
                                      ],
                                    )),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colurs.lightGreen),
                                    padding: const EdgeInsets.all(7),
                                    child: Textsax(
                                        text: '10:00 am - 12:00 pm',

                                        // '${widget.field.worktime.closeTime} - ${widget.field.worktime.openTime}',
                                        color: Colurs.black,
                                        fontSize: 14))
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colurs.lightGrey),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Textsax(
                                        text: '${widget.field.bookingPrice} ',
                                        color: Colurs.black,
                                        fontSize: 14),
                                    Textsax(
                                        text: 'د.ع',
                                        fontSize: 14,
                                        color: Colurs.blue),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Textsax(text: 'الخدمات', fontSize: 15),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.09,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (_context, index) {
                        return ServicesCard(
                          field: widget.field.services.services[index],
                        );
                      },
                      itemCount: widget.field.services.services.length,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Textsax(text: 'الوصف', fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.02),
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colurs.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Textsax(
                        text: widget.field.description,
                        fontSize: 13,
                        height: 1.4,
                        textDirection: ui.TextDirection.rtl,
                        textAlign: TextAlign.justify),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ListTile(
                    tileColor: Colurs.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: Icon(Iconsax.calendar),
                    title: Textsax(
                        text: dateFormated,
                        textDirection: ui.TextDirection.rtl,
                        fontSize: 15),
                    trailing: Icon(Iconsax.arrow_square_down),
                    onTap: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(), onChanged: (date) {
                        _selectedValue = date;
                      }, onConfirm: (date) {
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                          currentTime: DateTime.now(),
                          theme: DatePickerTheme(
                              cancelStyle: TextStyle(color: Colurs.black),
                              backgroundColor: Colors.white),
                          locale: LocaleType.ar);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: size.height * 0.04,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: size.width * 0.4,
                    child: MaterialButton(
                      onPressed: () {
                        bookingController.setBooking(
                            widget.field.id, _selectedValue.toString());
                      },
                      color: Colurs.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide.none),
                      child: Textsax(
                          text: 'حجز',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
