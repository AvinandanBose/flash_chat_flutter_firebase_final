import 'package:flash_chat_flutter_firebase/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:flash_chat_flutter_firebase/components/rounded_button.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller1;
  Animation? animation;
  Animation? animation2;

  // void update() {
  //   controller = AnimationController(
  //     duration: const Duration(seconds: 1),
  //     vsync: this,
  //   );
  //   controller?.forward();
  //   controller?.addListener(
  //     () {
  //       setState(() {});
  //       print(controller?.value);
  //     },
  //   );
  // }

  void update() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    controller?.forward();
    animation =
        ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller!);

    animation2 =  CurvedAnimation(parent: controller!, curve: Curves.easeInCirc);

    controller?.addListener(
      () {
        setState(() {});
        print(animation?.value);
        print(animation2?.value);
      },
    );
  }

  void update1() {
    controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      upperBound: 100,
    );
    controller1?.forward();
    controller1?.addListener(
      () {
        setState(() {});
        print(controller1?.value);
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    controller1?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    update();
    update1();
  }
  // AnimationController controller = AnimationController(
  //   duration: const Duration(seconds: 1),
  //     vsync: this,
  // );
  // controller.forward();
  // controller.addListener(()
  // {
  //   print(controller.value);
  // },
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation2!.value*100,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(color:Colors.blueAccent,title:'log in',onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundButton(color:Colors.blueAccent,title:'Registration',onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
            SizedBox(
              height: 48.0,
            ),
            Container(
              child: Center(
                child: Text(
                  'Loading : ${controller1!.value.toInt()}%',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
