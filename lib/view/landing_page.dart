import 'package:flutter/material.dart';
import 'package:tartan/utils/custom_page_route.dart';

import 'structure.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
                        'خدمات ',
                        style: TextStyle(fontSize: 36),
                      ),
                      Text(
                        'تارتان',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          EnterExitRoute(
                              enterPage: const StructurePage(),
                              exitPage: const LandingPage()));
                    },
                    child: Container(
                        width: size.width * 0.8,
                        height: size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          'assets/images/schedule_tab.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Container(
                      width: size.width * 0.8,
                      height: size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/academy_tab.png',
                        fit: BoxFit.fill,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
