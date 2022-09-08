import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/custom_page_route.dart';

import 'profile_picture.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key, required this.autofocus})
      : super(key: key);
  final bool autofocus;

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  bool _onEditing = true;
  late String _code;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  top: size.height * 0.16,
                  right: size.width * 0.09,
                  left: size.width * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'ادخل ',
                        style: TextStyle(fontSize: 36),
                      ),
                      Text(
                        'رمز التحقق',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.13,
                  ),
                  Text(
                    'تم ارسال رمز التحقق برساله الى رقمك',
                    style: TextStyle(
                        color: Colurs.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      VerificationCode(
                        itemSize: 60,
                        textStyle: TextStyle(fontSize: 30, color: Colurs.green),
                        keyboardType: TextInputType.number,
                        fillColor: Colors.white,
                        // in case underline color is null it will use primaryColor: Colors.red from Theme
                        underlineColor: Colurs.green,
                        underlineWidth: 2,
                        autofocus: widget.autofocus,
                        underlineUnfocusedColor: Colors.transparent,
                        length: 4,
                        // clearAll is NOT required, you can delete it
                        // takes any widget, so you can implement your design

                        onCompleted: (String value) {
                          setState(() {
                            _code = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.refresh,
                              size: 18,
                              color: Colurs.green,
                            ),
                            Text(
                              ' اعد الارسال',
                              style: TextStyle(
                                  color: Colurs.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: size.height * 0.15,
              left: size.width * 0.09,
              child: Container(
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
                      Navigator.push(
                          context,
                          EnterExitRoute(
                              enterPage: const ProfilePicture(),
                              exitPage: const PhoneVerification(
                                autofocus: false,
                              )));
                    },
                    child: const Text('تأكيد',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
