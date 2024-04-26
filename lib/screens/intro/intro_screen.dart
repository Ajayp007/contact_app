import 'package:contact_app/utiles/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  GlobalKey<IntroductionScreenState> introkey = GlobalKey();

  void onIntroEnd() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          key: introkey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          pages: [
            PageViewModel(
              title: "Add Your Contacts",
              body:
                  "Back up and sync your contacts across all your devices • Keep your contacts safely backed up to your Google Account • Access your contacts from anywhere ...",
              image: Image.asset("assets/images/splesh1.webp"),
            ),
            PageViewModel(
              title: "Start Calling",
              body:
                  "You can use Call Screen to find out who's calling and why before you pick up a call. Call Screen works on your device and doesn't use Wi-Fi or mobile data.",
              image: Image.asset(
                "assets/images/call.png",
                fit: BoxFit.cover,
              ),
            ),
            PageViewModel(
              title: "Send Messages",
              body:
                  "Find out more about sending and receiving text messages, photos, personal effects and more with the Messages app on your Android Phone ,iPhone, iPad, Apple Watch and Mac.",
              image: Image.asset("assets/images/msg.webp"),
            ),
          ],
          onDone: onIntroEnd,
          onSkip: onIntroEnd,
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          back: const Icon(Icons.arrow_back),
          skip:
              const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(15),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
