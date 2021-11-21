import 'package:drawer/src/pages/alert_page.dart';
import 'package:drawer/src/pages/avatar_page.dart';
import 'package:drawer/src/pages/card_page.dart';
import 'package:drawer/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'src/pages/home_page.dart';

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
      //home: MyHomePage(),
      initialRoute: '/',
      routes: _crearRutas(context),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => MyAlertPage());
      },
    );
  }

  Map<String, WidgetBuilder> _crearRutas(context) {
    return <String, WidgetBuilder>{
      '/': (context) => LoginPage(),
      'home': (context) => MyHomePage(),
      'alert': (context) => MyAlertPage(),
      'avatar': (context) => AvatarPage(),
      'card': (context) => CardPage()
    };
  }
}
