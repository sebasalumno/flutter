import 'dart:async';

import 'package:drawer/src/pages/config_page.dart';
import 'package:drawer/src/pages/confirmation_page.dart';

import 'package:drawer/src/pages/position_page.dart';
import 'package:drawer/src/pages/profile_page.dart';

import '/src/pages/alert_page.dart';
import 'package:drawer/src/pages/avatar_page.dart';
import 'package:drawer/src/pages/card_page.dart';
import 'package:drawer/src/pages/login_page.dart';
import 'package:drawer/src/pages/register_page.dart';
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
      debugShowCheckedModeBanner: false,
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

/*
Este metodo permite la navegacion entre las distintas pages de nuestra aplicacion
*/
  Map<String, WidgetBuilder> _crearRutas(context) {
    return <String, WidgetBuilder>{
      '/': (context) => LoginPage(),
      'register': (context) => RegisterPage(),
      'home': (context) => MyHomePage(),
      'alert': (context) => MyAlertPage(),
      'avatar': (context) => AvatarPage(),
      'card': (context) => CardPage(),
      'settings': (context) => MyConfigPage(),
      'position': (context) => PositionPage(),
      'profile': (context) => ProfilePage(),
      'confirmation': (context) => ConfirmationPage()
    };
  }
}
