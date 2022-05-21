import 'package:flash_chat_flutter_firebase/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_firebase/components/rounded_button.dart';
import 'package:flash_chat_flutter_firebase/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner, ///Here we call the bool value (initially it is false)
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundButton(title: 'Log In' , color: Colors.blueAccent, onPressed: (){
                setState((){ ///before signIn with Email and Password  state changed and it spins
                  showSpinner = true;
                });
                try {
                  final user = _auth.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState((){ ///After signIn with Email and Password  state changed and it stops spins
                    showSpinner = false;
                  });
                }on Error catch(e){
                  print(e);
                }

              })
            ],
          ),
        ),
      ),
    );
  }
}
