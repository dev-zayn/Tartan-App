import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/utils/custom_page_route.dart';

import '../landing_page.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'اختر ',
                        style: TextStyle(fontSize: 36),
                      ),
                      Text(
                        'صورتك',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.13,
                  ),
                  Container(
                    width: size.width * 0.5,
                    height: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Iconsax.camera,
                        color: Colurs.grey,
                        size: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
                      stops: const [-20, 20],
                      colors: [Colurs.blue, Colurs.green],
                      begin: const Alignment(-1, -2),
                      end: const Alignment(2, 1),
                    )),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          EnterExitRoute(
                              enterPage: const LandingPage(),
                              exitPage: const ProfilePicture()));
                    },
                    child: const Text('تمام',
                        style: TextStyle(color: Colors.white, fontSize: 24))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
