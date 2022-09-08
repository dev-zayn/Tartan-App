import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tartan/controller/password_controller.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/text_widget.dart';
import 'package:tartan/utils/txt_field_widget.dart';

class EditAccountInfoPage extends StatefulWidget {
  const EditAccountInfoPage({Key? key}) : super(key: key);

  @override
  State<EditAccountInfoPage> createState() => _EditAccountInfoPageState();
}

class _EditAccountInfoPageState extends State<EditAccountInfoPage> {
  final box = GetStorage();

  late final TextEditingController _nameTextController =
      TextEditingController(text: box.read('full_name'));
  late final TextEditingController _phoneTextController =
      TextEditingController(text: box.read('phNumber'));
  late final TextEditingController _ageTextController =
      TextEditingController(text: '${box.read('age')}');
  late final TextEditingController _addressTextController =
      TextEditingController(text: box.read('address'));
  File? imageFile;
  final PasswordController passwordController = Get.put(PasswordController());
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
                              text: 'تعديل الحساب',
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
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: showImageDialog,
                              child: Container(
                                width: size.width * 0.3,
                                height: size.width * 0.3,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colurs.lightGreen),
                                child: imageFile == null
                                    ? Container(
                                        child: Icon(
                                        Iconsax.camera,
                                        color: Colurs.green,
                                        size: 35,
                                      ))
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                          imageFile!,
                                          fit: BoxFit.fill,
                                          width: size.width * 0.3,
                                          height: size.width * 0.3,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          txtFormField(
                            hint: 'الاسم الكامل',
                            prefixIcon: Iconsax.frame_1,
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            controller: _nameTextController,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          txtFormField(
                            hint: 'رقم الهاتف',
                            prefixIcon: Iconsax.call,
                            textInputType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            controller: _phoneTextController,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          txtFormField(
                              hint: 'العمر',
                              prefixIcon: Iconsax.cake,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              controller: _ageTextController),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          txtFormField(
                              hint: 'العنوان',
                              prefixIcon: Iconsax.location,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: _addressTextController),
                          SizedBox(
                            height: size.height * 0.12,
                          ),
                          MaterialButton(
                            onPressed: () {
                              passwordController.updateAccount(
                                fullName: _nameTextController.text,
                                phoneNumber: _phoneTextController.text,
                                age: int.parse(_ageTextController.text),
                                address: _addressTextController.text,
                              );
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.025),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide.none),
                            color: Colurs.green,
                            child: Textsax(
                                text: 'تعديل',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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

  void _cropImage(filePath) async {
    File? cropImage = await ImageCropper.cropImage(
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: AndroidUiSettings(
            backgroundColor: Colors.white,
            activeControlsWidgetColor: Colurs.green,
            toolbarTitle: 'قص الصورة',
            hideBottomControls: true,
            lockAspectRatio: true,
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colurs.green),
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080);
    try {
      setState(() {
        imageFile = cropImage;
      });
    } catch (e) {
      Get.snackbar('', "profile_picture_warning3".tr);
    }
  }

  //xx
  void _pickImageCamera() async {
    var cameraStatus = await Permission.camera.status;
    !cameraStatus.isGranted ? await Permission.camera.request() : null;

    if (cameraStatus.isGranted) {
      Navigator.pop(context);
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
      try {
        _cropImage(pickedFile!.path);
      } catch (e) {
        debugPrint('profile_picture_warning2'.tr);
      }
    } else {
      Get.snackbar('', "profile_picture_warning1".tr);
    }
  }

  //xx
  void _pickImageGallery() async {
    var galleryStatus = await Permission.storage.status;
    // ignore: unnecessary_statements
    !galleryStatus.isGranted ? await Permission.storage.request() : null;

    if (galleryStatus.isGranted) {
      Navigator.pop(context);
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
      try {
        _cropImage(pickedFile!.path);
      } catch (e) {
        debugPrint('profile_picture_warning2'.tr);
      }
    } else {
      Get.snackbar('', "profile_picture_warning".tr);
    }
  }

  //xx
  void showImageDialog() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;

          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: size.width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Textsax(text: 'اختيار صورة', fontSize: 13),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _pickImageCamera,
                      child: Column(
                        children: [
                          Icon(
                            Iconsax.camera,
                            color: Colurs.blue,
                            size: 30,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Textsax(text: 'الكاميرا', fontSize: 12)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _pickImageGallery,
                      child: Column(
                        children: [
                          Icon(
                            Iconsax.gallery,
                            color: Colurs.blue,
                            size: 30,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Textsax(text: 'الاستوديو', fontSize: 12)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
