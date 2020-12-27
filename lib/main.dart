import 'package:flutter/material.dart';
import 'package:test_flutter_messenger/Components/colors.dart';
import 'package:test_flutter_messenger/Screens/chat_screen.dart';
import 'package:test_flutter_messenger/Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Messenger',      
      theme: ThemeData(
        primaryColor: kPrimaryColor ,
        accentColor: kPrimaryLightColor,
        fontFamily: 'Cairo' ,
      ),
      home: HomeScreen(),

      routes: {
        '/home': (_) => HomeScreen(),
        '/chat': (_) => ChatScreen(),
        }
    );
  }
  
}
