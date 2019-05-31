import 'package:flutter/material.dart';
import 'viewmodel/MainViewModel.dart';
import 'view/screen/SplashScreen.dart';
import 'view/screen/HomeScreen.dart';
import 'remote/service/ApiService.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': (BuildContext content) => HomeScreen()
        },
        debugShowCheckedModeBanner: false);
  }
}
