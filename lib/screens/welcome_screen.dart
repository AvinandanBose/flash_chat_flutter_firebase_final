import 'package:flash_chat_flutter_firebase/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller1;
  AnimationController? controller2;
  Animation? animation;
  Animation? animation2;

  void update() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller?.forward();
    controller?.addListener(
      () {
        setState(() {});
        print(controller?.value);
      },
    );
  }

  void update2() {
    controller2 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    controller2?.forward();
    animation =
        ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller2!);

    animation2 =  CurvedAnimation(parent: controller2!, curve: Curves.easeInCirc);

    controller2?.addListener(
      () {
        setState(() {});
        print(animation?.value);
        print(animation2?.value);
      },
    );
  }

  void update3() {
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
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    update();
    update2();
    update3();
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
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
