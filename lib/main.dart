import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detaills_screen.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: MainSccreen(),
      initialRoute: MainSccreen.routeName,
      routes: {
        '/':(context) => MainSccreen(),
         '/details':(context) => DetailSccreen(),
      },
    );
  }
}
