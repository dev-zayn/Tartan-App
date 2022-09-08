import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tartan/utils/colours.dart';
import 'package:tartan/view/registration/login_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key, required this.initial_page})
      : super(key: key);
  final int initial_page;

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final box = GetStorage();
  void _onIntroEnd(context) {
    box.write('onboarding', 1);
    Get.to(() => const LoginPage());
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/ob_background.png'),
            fit: BoxFit.cover,
          )),
        ),
        IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          key: introKey,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: _buildImage('icon.png', size.width * 0.13),
              ),
            ),
          ),

          pages: [
            PageViewModel(
              title: "مرحبا بك في تارتان",
              body:
                  "تطبيق رائع, مصمم خصيصا لحجز الملاعب الخماسية, يحتوي على العديد من الخدمات",
              image: _buildImage('ob1.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "جااهزز",
              body: "يسعدنا ان تكون احد عملائنا",
              image: _buildImage('ob2.png'),
              decoration: pageDecoration,
            ),
          ],
          initialPage: widget.initial_page,
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          rtl: true,
          skip: Container(),
          next: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colurs.green, borderRadius: BorderRadius.circular(25)),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          done: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colurs.blue, borderRadius: BorderRadius.circular(15)),
              child: const Text('اِبدأ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 19))),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: DotsDecorator(
            size: const Size(10.0, 10.0),
            color: Colurs.green,
            activeColor: Colurs.blue,
            activeSize: const Size(22.0, 10.0),
            activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          // dotsContainerDecorator:  const ShapeDecoration(
          //   color: Colors.transparent,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //   ),
          // ),
        )
      ],
    );
  }
}
