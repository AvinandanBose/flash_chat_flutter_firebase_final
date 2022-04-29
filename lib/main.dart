import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_firebase/screens/welcome_screen.dart';
import 'package:flash_chat_flutter_firebase/screens/login_screen.dart';
import 'package:flash_chat_flutter_firebase/screens/registration_screen.dart';
import 'package:flash_chat_flutter_firebase/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id : (context)=> LoginScreen(),
        RegistrationScreen.id : (context)=> RegistrationScreen(),
        ChatScreen.id : (context)=>ChatScreen(),

      }

    );
  }
}
